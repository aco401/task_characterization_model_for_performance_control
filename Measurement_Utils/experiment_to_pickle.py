#!/usr/bin/env python3

# Copyright (C) 2020 Michel Rottleuthner <michel.rottleuthner@haw-hamburg.de>
#               2022 Tobias Westphal <tobias.westphal@haw-hamburg.de>
#
# This file is subject to the terms and conditions of the GNU Lesser
# General Public License v2.1. See the file LICENSE in the top level
# directory for more details.#

from experiment_to_pickle_constants import *
from pickle_to_plot import pickle_to_datatypes, meta_get_workload_params, find_pickle_in_path, data_find_outliers
from copy import deepcopy
import json
import time
import os
import pickle
import pandas as pd
import numpy as np
import argparse
import serial
import subprocess
import os
import functools
import itertools
from pathlib import Path
import sys


import dmm_control
from rigol_ds1054z import rigol_ds1054z, rigol_lan_dev

# // TODO ADD flash return code feature to avoid running further when a flashing error occurs

def nucleo_cmd_progress_print(nucleo_cmd:str, total_configurations:int, cur_configuration:int, total_repetitions:int, cur_repetition:int):
    print("[{}/{}, ITER: {}/{}] sending cmd: ".format(cur_configuration, total_configurations, cur_repetition, total_repetitions) + nucleo_cmd[:-1])

def task_name_to_filename(outfolder:str, taskname:str, file_addon:str):
    if file_addon != ""  and type(file_addon) == str:
        file_addon = "_" + file_addon
    else:
        file_addon = ""
    #print(outfolder + "/" + taskname + file_addon + ".pkl")
    return outfolder + "/" + taskname + file_addon + ".pkl"

def is_NaN_None(val):
    if val is None or val!=val:
        return True
    return False
GET_TASK_WORG_ARG_NAMES_MAX_TIMEOUT = 100
def get_task_work_arg_names(dut, taskname:str) -> list | int | None:
    """ 
    @return -1      - if task is not flashed
    @return None    - if task has no arguments
    @return list    - if task has minimum one argument 
    """
    if (taskname == "" or is_NaN_None(taskname)):
        return -1

    prompt_sync(dut)

    work_args:dict = None
    #print(taskname)
    cmd = "work_params {}\n".format(taskname)

    print("sending cmd: " + cmd)
    dut['serial'].write(bytes(cmd, 'ASCII'))
    timeout_cnt = 0
    while True:
        try:
            line = dut['serial'].readline().decode('ASCII')
            if dut['serial'].timeout:
                #print("TIMOUT-CNT: ", timeout_cnt)
                timeout_cnt = timeout_cnt + 1
                if timeout_cnt > GET_TASK_WORG_ARG_NAMES_MAX_TIMEOUT:
                    print("[{}: TIMEOUT]".format("WORK_PARAMS"))
                    return SERIAL_DECODE_TIMEOUT
            if line:
                #print(line)
                line = line[:-1] # cut off \n
                line = line.replace(" ", "")
            else:
                continue

            if serial_line_has_error(line):
                return -1
            elif line[0] == "*":
                (name, work_args) = serial_line_to_dict(line)
                #print(work_args)
                if len(work_args) == 0:
                    return None
                return list(work_args.values())
        except ValueError:
            #print(line)
            continue
    return -1

def serial_line_has_error(line:str) -> bool:
    ret = False
    if line[0] == "!":
        ret = True
    else:
        for err in SERIAL_DECODE_ERROR_DUMP:
            if err in line:
                print(err)
                ret = True
                break
    if ret:
        print("\n[ERROR]:")
        print("\t",line)
    return ret

def serial_line_to_list(line:str) -> list:
    line = line[1:] # Remove symbolic symbol
    line = line.split(";") # Make list by seperating string at ;
    for i in range(len(line)): # Convert elements to integer if possible
        try:
            line[i] = int(line[i])
        except ValueError:
            continue
    #print(line)
    return line

def serial_line_to_dict(line:str) -> tuple[str, dict]:
    line = line[1:] # Remove symbolic symbol
    line = line.split("=") # Seperate Name from KEY/VALUES parts string
    dict_name:str = line[0]

    pairs = {}
    if not line[1].isspace() and len(line[1]) > 0:
        line = line[1].split(";") # Seperate KEY/VALUE pairs
        pairs = []
        for pair in line:
            pairs.append(pair.split(":"))
        pairs = dict(pairs)

    return (dict_name, pairs)

def dict_get_argument(dict:dict, name:str, default=None):
    ret = None
    argument = dict.get(name)
    if not is_NaN_None(argument):
        ret = argument
    if ret == None:
        ret = default
    return ret

def build_cmd_arguments(arg_dict:dict, name:str, num:int=0, args=None, default=""):
    argument = arg_dict.get(name)
    ret_str:str = ""
    if not is_NaN_None(argument):
        if (type(args) != type(None)) and ((type(args) == list and args[0] != None) or (type(args) != list)):
            argument = args
            if num == 1 and type(args) == tuple: # TODO UGLY 
                argument, = args
        if num == 0:
            ret_str = " -{}".format(name)
        elif num == 1:
            ret_str = " -{} {}".format(name, argument)
        elif num > 1:
            ret_str = " -{}".format(name)
            for i in range(num):
                ret_str = ret_str + " {}".format(argument[i])
    if ret_str == "":
        ret_str = default
    return ret_str

# TODO Check df_data
def REPEAT_EXPERIMENT_ERROR(ret):
    print("REPEAT_EXPERIMENT_ERROR: {}".format(ret))
    return ("ERROR", ret)

REPEAT_EXPERIMENT_DEFAULT_TIMEOUT = None
def repeat_experiment_configuration(dut, cmd:str, experiment_progress:list, df_data:pd.DataFrame, repetitions:int=BENCH_REPETITION_DEFAULT, timeout=REPEAT_EXPERIMENT_DEFAULT_TIMEOUT):
    config = {}
    for i in range(repetitions):

        # Nucleo: Reset for every different configuration
        reset_dut(dut)
        prompt_sync(dut)

        # Nucleo: Start workload
        nucleo_cmd_progress_print(cmd, experiment_progress[0], experiment_progress[1], repetitions, i + 1)
        dut['serial'].write(bytes(cmd, 'ASCII'))

        temp_serial_csv_header = []
        temp_serial_csv_data = []
        temp_serial_csv_config = {}

        # Poll for finished experiment
        ret = serial_decode(dut, timeout, temp_serial_csv_header, temp_serial_csv_data, temp_serial_csv_config)

        if ret < 0:
            return REPEAT_EXPERIMENT_ERROR(ret)
        
        if len(temp_serial_csv_header) > 1 or len(temp_serial_csv_data) > 1 or len(temp_serial_csv_config) > 1:
            print("[serial decode list bigger than one not handled yet]")
            return REPEAT_EXPERIMENT_ERROR("decode list bigger than one handled yet")

        # Set config
        if len(config) == 0:
            config = temp_serial_csv_config
        elif config != temp_serial_csv_config:
            print("[config changed]")

        # Unpack list wrap
        temp_serial_csv_header = temp_serial_csv_header[0]
        temp_serial_csv_data = temp_serial_csv_data[0]

        # Add iteration colum/ data
        temp_serial_csv_header.append(COL_NAME_BENCH_REPETITION)
        temp_serial_csv_data.append(i)

        #print(temp_serial_csv_header)
        #print(temp_serial_csv_data)
        
        if type(df_data) != pd.DataFrame:
            df_data = pd.DataFrame(data=[temp_serial_csv_data], columns=temp_serial_csv_header)
        else:
            new_row = pd.DataFrame(data=[temp_serial_csv_data], columns=temp_serial_csv_header)
            #print(df_data)
            #print(new_row)
            df_data = pd.concat([df_data, new_row], ignore_index=True)
    return (config, df_data)

def serial_decode(dut:dict, timeout_after:int | None, csv_header:list, csv_data:list, csv_config:dict):
    timeout_cnt = 0
    while True:
        try:
            line = dut['serial'].readline().decode('ASCII')
            if timeout_after is not None and dut['serial'].timeout:
                #print("TIMOUT-CNT: ", timeout_cnt)
                timeout_cnt = timeout_cnt + 1
                if timeout_cnt > timeout_after:
                    print("[TIMEOUT]")
                    return SERIAL_DECODE_TIMEOUT
            # TODO TEST not timeout
            if line:
                timeout_cnt = 0
                #print(line)
                line = line[:-1] # cut off \n
                line = line.replace(" ", "") # Remove whitespace
            else:
                continue
            # below ifs match some markers to identify the line of interest
            if serial_line_has_error(line):
                return SERIAL_DECODE_ERROR
            
            elif line[0] == "*": # Config info line
                #print(line)
                (name, dictionary) = serial_line_to_dict(line)
                csv_config[name] = dictionary
                continue
            elif line[0] == "$": # Column name line
                header_list = serial_line_to_list(line)
                if len(csv_header) == 0 or csv_header[0] != header_list:
                    csv_header.append(header_list)
                continue
            elif line[0] == "&": # Row data line
                csv_data.append(serial_line_to_list(line))
                continue
            elif line[0] == "~": # Experiment finished
                break
        except ValueError:
            #print("garbage output..")
            continue
    return 0

def measure_perf_util_test(dut, shell_args:dict): # TODO UPDATE like swo_bench
    # Get task argument names for the dataframe and pickle output
    lst_work_arg_names = get_task_work_arg_names(dut, shell_args.get("cmd_name"))
    if lst_work_arg_names == -1:
        print("WORK ARGS NAME ERROR")
        return BENCH_ERROR

    # CHECK perf_util_test arguments use default if not existent
    perf_util_args = shell_args.get("perf_util_args")
    if perf_util_args is None:
        print("[MEASURE PERF UTIL: NO BENCHMARK ARGS GIVEN - USING DEFAULT]")
        perf_util_args = PERF_UTIL_DEFAULT_ARGS
    

    work_args:list = shell_args.get("work_args")

    # Check whether task has inner loop and needs to be appended to work_args
    if not is_NaN_None(shell_args.get("iter_idx", None)):
        #print("iter_idx ", shell_args.get("iter_idx"))
        iter = dict_get_argument(shell_args, "iter", 1)
        #print("iter: ", iter)
        if work_args is not None:
            work_args.append([int(iter)])
        else:
            work_args = [[int(iter)]]

    # Data Definition
    df_data = None
    serial_csv_config = {}

    all_configs = []
    if not is_NaN_None(work_args):
        all_configs = itertools.product(*work_args, )
    
    if type(all_configs) == list:
        all_configs = [(perf_util_args[0], perf_util_args[1])]
    total_conf = len(list(deepcopy(all_configs)))
    cnt_conf = -1
    for elem in all_configs:
        cnt_conf += 1
        cmd_dyn = "perf_util_test {} {} quiet {}".format(perf_util_args[0], perf_util_args[1], shell_args.get("cmd_name"))

        cmd_dyn += build_cmd_arguments(shell_args, "work_args", len(elem), elem)
        cmd_dyn += "\n"

        # METADATA: Add one cmd example to pickle metadata
        if cnt_conf == 0:
            serial_csv_config["EXAMPLE_NUCLEO_CMD"] = cmd_dyn


        
        repetitions = dict_get_argument(shell_args, "bench_repetition" ,default=BENCH_REPETITION_DEFAULT)
        (ret_serial_csv_config, df_data) = repeat_experiment_configuration(dut, cmd_dyn, [cnt_conf, total_conf], df_data, repetitions)
        serial_csv_config.update(ret_serial_csv_config)
    # Add workload param names to conf
    print(df_data.to_string())
    serial_csv_config["WORKLOAD_PARAMS"] = lst_work_arg_names #TODO handle via line to dict
    return {"conf":serial_csv_config, "data":df_data}

def measure_other_character(dut, shell_args:dict): # TODO UPDATE like swo_bench
    # Get task argument names for the dataframe and pickle output
    lst_work_arg_names:list = get_task_work_arg_names(dut, shell_args.get("cmd_name"))
    if lst_work_arg_names == -1:
        print("WORK ARGS NAME ERROR")
        return BENCH_ERROR

    # Remove iteration param name
    if not is_NaN_None(shell_args.get("iter_idx")):
        lst_work_arg_names.pop(-1)

    # Select freq[4] by default when no input is given
    freqs = [4] # freq_index
    if not is_NaN_None(shell_args.get("freq")):
        freqs = shell_args.get("freq")
    
    df_data = None
    serial_csv_config = {}

    work_args = shell_args.get("work_args")

    all_configs = itertools.product(freqs)
    if not is_NaN_None(work_args):
        all_configs = itertools.product(freqs, *work_args, )

    
    cmd = "other_character_bench {} -i ".format(shell_args.get("cmd_name"))
    cmd += build_cmd_arguments(shell_args, "iter", 1)
    cmd += build_cmd_arguments(shell_args, "iter_mode", 1)
    cmd += build_cmd_arguments(shell_args, "iter_idx", 1)

    for elem in all_configs:
        cmd_dyn = cmd
        cmd_dyn += build_cmd_arguments(shell_args, "fwsa", 0) 
        # TODO BOOL  and shell_args.get("fwsa"):
        cmd_dyn += build_cmd_arguments(shell_args, "dvs_pol", 1) 
        # str of [ffpol, lvpol]

        cmd_dyn += "-freq {}".format(elem[0])
        cmd_dyn += build_cmd_arguments(shell_args, "work_args", len(elem)-1, elem[2:])
        cmd_dyn += "\n"

        print("sending cmd: " + cmd_dyn[:-1])

        repetitions = dict_get_argument(shell_args, "bench_repetition" ,default=BENCH_REPETITION_DEFAULT)
        (ret_serial_csv_config, df_data) = repeat_experiment_configuration(dut, cmd_dyn, "OTHER_CHARACTER_BENCH", df_data, serial_csv_config, repetitions)
        serial_csv_config.update(ret_serial_csv_config)

    # Add workload param names to conf
    serial_csv_config["WORKLOAD_PARAMS"] = lst_work_arg_names
    return {"conf":serial_csv_config, "data":df_data}
    
def pickle_get_iterations_per_work_arg(folder_path:str, task_name:str, work_args:list):
    if folder_path[-1] != "/":
        folder_path += "/"
    
    # Read pickle
    di = {}
    try:
        di = pickle_to_datatypes(folder_path + task_name + ".pkl")
    except FileNotFoundError:
        # Search for File in subfolder
        other_path = find_pickle_in_path(folder_path, task_name)
        if other_path is not None:
            di = pickle_to_datatypes(other_path)
        else:
            return {}


    data = di.get("data", None)
    meta = di.get("metadata", None)

    assert meta is not None and data is not None
    pickle_work_args = meta_get_workload_params(meta)

    if work_args is None:
        work_args = []

    #print("pickle: ", pickle_work_args)
    #print("script: ", work_args)

    # Test for same work arg
    assert len(pickle_work_args) == 0 and len(work_args) == 0 or all(elem in pickle_work_args for elem in work_args), "Work Args - Expected: {}; Found: {}".format(work_args, pickle_work_args)

    # Return dict for iteration per work_arg
    ret_dict = {}
    if len(pickle_work_args) > 0:
        data = data.groupby(pickle_work_args)
    else:
        data = [(None, data)]
    for name, gr in data:
        iterations = gr["ITERATIONS"].unique()
        #print("ITERATIONS: ", iterations)
        assert len(iterations) == 1
        if name is not None:
            name = str(name)
        else:
            name = str((None, ))
        ret_dict[name] = iterations[0]

    return ret_dict


def measure_swo_bench(dut, shell_args:dict):
    # Get task argument names for the dataframe and pickle output
    lst_work_arg_names:list = get_task_work_arg_names(dut, shell_args.get("cmd_name"))
    #print(lst_work_arg_names)
    if lst_work_arg_names == -1:
        print("WORK ARGS NAME ERROR")
        return BENCH_ERROR

    # Remove iteration param name
    if not is_NaN_None(shell_args.get("iter_idx")):
        lst_work_arg_names.pop(-1)

    # Get iterations per work_arg for iter synchronisation
    json_sync_iterations = {}
    if not is_NaN_None(shell_args.get("json_sync_iter_path")) and shell_args.get("cmd_name", None) is not None:
        json_sync_iterations = pickle_get_iterations_per_work_arg(shell_args.get("json_sync_iter_path"), shell_args.get("cmd_name"), lst_work_arg_names)
        if len(json_sync_iterations) > 0:
            print("ITERATIONS FOUND TO SYNCHRONIZE: ", json_sync_iterations)

    # Data definition
    serial_csv_config = {}
    df_data = None

    # Construct config combinations of changing arguments
    prf_cnt = dict_get_argument(shell_args, "prf_cnt") 
    freqs = dict_get_argument(shell_args, "freq", [4]) 
    dvs_pol = dict_get_argument(shell_args, "dvs_pol", [None])
    fwsa = dict_get_argument(shell_args, "fwsa", [None])
    dvs = dict_get_argument(shell_args, "dvs", [None])
    cache = dict_get_argument(shell_args, "cache", [None])
    work_args = dict_get_argument(shell_args, "work_args", [[None]])
    #print(work_args)
    all_configs = itertools.product(prf_cnt, freqs, dvs_pol, fwsa, dvs, cache, *work_args, )

    # Construct cmd with not changing arguments
    cmd = "swo_bench {} -i".format(shell_args.get("cmd_name"))
    cmd += build_cmd_arguments(shell_args, "iter_idx", 1)
    cmd += build_cmd_arguments(shell_args, "config_id", 1)

    # UNIQUE_SAME_ITER: For the most efficient frequency setting calculation - the iterations per unique work_args should be the same
    # Therefore the iteration amount for the highest freq for each unique work_arg is firstly measured, saved and then applied for every frequency
    unique_same_iter_dict = json_sync_iterations
    unique_same_iter_process = False
    if shell_args.get("unique_same_iter", None) is not None and shell_args.get("unique_same_iter"):
        unique_same_iter_process = True
    else:
        cmd += build_cmd_arguments(shell_args, "iter", 1)
        cmd += build_cmd_arguments(shell_args, "iter_mode", 1)



    total_conf = len(list(deepcopy(all_configs)))
    cnt_conf = -1
    for elem in all_configs:
        cnt_conf += 1
        cmd_dyn = cmd
        cmd_dyn += build_cmd_arguments(shell_args, "prf_cnt", 1, elem[0])
        cmd_dyn += build_cmd_arguments(shell_args, "freq", 1, elem[1])
        cmd_dyn += build_cmd_arguments(shell_args, "dvs_pol", 1, elem[2])
        cmd_dyn += build_cmd_arguments(shell_args, "fwsa", 1, elem[3])
        cmd_dyn += build_cmd_arguments(shell_args, "dvs", 1, elem[4])
        cmd_dyn += build_cmd_arguments(shell_args, "cache", 1, elem[5])
        work_arg_offset = 6
        cmd_dyn += build_cmd_arguments(shell_args, "work_args", len(elem) - work_arg_offset, elem[work_arg_offset:])

        # UNIQUE_SAME_ITER: Measure amount of iterations with passed iter_mode 2 so its minium 100 Iterations and lasts minimum 1 second
        work_arg_string = str(elem[work_arg_offset:])
        if unique_same_iter_process and work_arg_string not in unique_same_iter_dict.keys():

            unique_same_iter_cmd = cmd_dyn + build_cmd_arguments(shell_args, "iter", 1) + " -iter_mode 2\n"

            unique_same_iter_header = []
            unique_same_iter_data = []
            unique_same_iter_config = {}

            # Nucleo: Reset for every different configuration
            reset_dut(dut)
            prompt_sync(dut, timeout=False)

            # Nucleo: Start workload and trigger energy measurement
            dut['serial'].write(bytes(unique_same_iter_cmd, 'ASCII'))

            ret = serial_decode(dut, None, unique_same_iter_header, unique_same_iter_data, unique_same_iter_config)
            assert ret != SERIAL_DECODE_ERROR

            unique_same_iter_iteration = unique_same_iter_data[0][unique_same_iter_header[0].index("ITERATIONS")]
            if unique_same_iter_iteration <= 0:
                return BENCH_ERROR
            unique_same_iter_dict[work_arg_string] = unique_same_iter_iteration
        
        #print(unique_same_iter_dict)
        # UNIQUE_SAME_ITER: Apply Unique iteration amount to command
        if unique_same_iter_process and work_arg_string in unique_same_iter_dict.keys():
            cmd_dyn += " -iter_mode 0 -iter {}".format(unique_same_iter_dict.get(work_arg_string))

        cmd_dyn += "\n"

        # METADATA: Add one cmd example to pickle metadata
        if cnt_conf == 0:
            serial_csv_config["EXAMPLE_NUCLEO_CMD"] = cmd_dyn

        repetitions = dict_get_argument(shell_args, "bench_repetition" ,default=BENCH_REPETITION_DEFAULT)
        (ret_serial_csv_config, df_data) = repeat_experiment_configuration(dut, cmd_dyn, [cnt_conf, total_conf], df_data, repetitions, timeout=SWO_BENCH_SERIAL_MAX_TIMEOUT)
        #print(ret_serial_csv_config)
        if ret_serial_csv_config != "ERROR":
            serial_csv_config.update(ret_serial_csv_config)
        else:
            return BENCH_ERROR

    # Add workload param names to conf
    #print(df_data.to_string())
    serial_csv_config["WORKLOAD_PARAMS"] = lst_work_arg_names #TODO handle via line to dict
    return {"conf":serial_csv_config, "data":df_data}

def dmm_configure_digitize_trigger(dmm, function="current", range=DMM_MEASURE_RANGE,
                                    samplerate=DMM_SAMPLERATE, aperture="default",
                                    buffername = "defbuffer1", bufsize=6000000,
                                    start_pin = 2, stop_pin = 3, rising_trigger:bool=True):
    # select measurement. default current
    dmm.write_cmd("sense:digitize:function:on \"{0}\"".format(function))
    # select measurement range. default 100mA
    dmm.write_cmd("dig:{}:range {}".format(function, range))
    # select max. sampling rate. default 1Ms
    dmm.write_cmd("sense:digitize:{}:srate {}".format(function, samplerate))
    # selext aperture. default/auto
    dmm.write_cmd("sense:digitize:{}:aperture {}".format(function, aperture))
    # setup buffer. default buffer defbuffer1 in INF mode. this doesn't block -> wee
    # need it in order to reach the event logs. in INF acts as ringbuffer *but* our
    # measurement time isn't that long and we stop that mode at the end. shouldn't be aprobelm.
    dmm.write_cmd("trace:points {}, \"{}\"".format(bufsize, buffername))

    # load empty, clear buffer
    dmm.write_cmd("trig:load \"Empty\"")
    dmm.write_cmd("trig:block:buffer:clear 1, \"{}\"".format(buffername))

    # configure triggers
    # Trigger for starting the measurement
    dmm.write_cmd("dig:line{}:mode trig, in".format(start_pin))
    dmm.write_cmd("trig:dig{}:in:edge {}".format(start_pin, "ris" if rising_trigger else "fall"))
    # Trigger for stopping the measurement
    dmm.write_cmd("dig:line{}:mode trig, in".format(stop_pin))
    dmm.write_cmd("trig:dig{}:in:edge {}".format(stop_pin, "ris" if rising_trigger else "fall"))


    # wait for start trigger and record
    dmm.write_cmd("trig:block:wait 2, dig{}".format(start_pin))
    dmm.write_cmd("trigger:block:digitize 3, \"{}\", INF".format(buffername))
    dmm.write_cmd("trig:block:wait 4, dig{}".format(stop_pin))
    dmm.write_cmd("trigger:block:digitize 5, \"{}\", {}".format(buffername, 0))

    dmm.write_cmd("trig:block:log:event 6, info1, 'EVENTENDE'")

DMM_MCU_SYNC_PIN = 4
def dmm_setup(samplerate=DMM_SAMPLERATE, measure_range=DMM_MEASURE_RANGE):
    if DMM_DONT_START_TRACE:
        return None
    dmm = None
    try:
        dmm = dmm_control.DMMControl(tmc_dev="USB::0x05e6::0x7510::INSTR")
    except:
        raise
    dmm.reset()
    #dmm.fan_quiet()
    dmm.event_log_clear()

    #dmm.beep(1000, 100)

    # this pin is used to reset the MCU via the DMM
    # (connect to the red wire of the DMM breakout cable)
    reset_pin = 1
    dmm.pin_config(reset_pin, 'digital', 'out')
    dmm.pin_write(reset_pin, 0)
    time.sleep(0.1)
    dmm.pin_write(reset_pin, 1)
    dmm.pin_config(reset_pin, 'digital', 'in')

    dmm.pin_config(DMM_MCU_SYNC_PIN, 'digital', 'out')
    # block MCU from continuing execution after first iteration
    dmm.pin_write(DMM_MCU_SYNC_PIN, 1)

    dmm_configure_digitize_trigger(dmm=dmm, rising_trigger=False, samplerate=samplerate, range=measure_range)

    return dmm

def dmm_enable_trigger_wait(dmm):
    if DMM_DONT_START_TRACE:
        return

    state = dmm.get_trigger_state()
    while (state == "IDLE" or state == "BUILDING"):
        # start trigger that will automatically start measuring once the MCU is ready
        dmm.start_digitize_current()

        time.sleep(0.1)
        state = dmm.get_trigger_state()
    
def dmm_sync_with_mcu(dmm):
    # tell MCU to continue execution...
    dmm.pin_write(DMM_MCU_SYNC_PIN, 0)
    # ...and block it again ...
    dmm.pin_write(DMM_MCU_SYNC_PIN, 1)

def dmm_recv_readings(dmm):
    if DMM_DONT_START_TRACE:
        return []
    active = True
    # a list that will hold one dataframe per iteration
    data = None
    while active:
        state = dmm.get_trigger_state()

        if state == "IDLE":
            #print("finished measurement cycle!")

            readings = dmm.buf_get_num_readings()
            #print("got {} readings".format(readings))

            #print("reading buffer...")
            tmp_buf = dmm.buf_get_data(1, readings, buffername = "defbuffer1")
            tmp_buf = tmp_buf.split(",")
            #print(tmp_buf)
            #print("done!")
            active = False

            data = tmp_buf

            # # tell MCU to continue execution...
            # dmm.pin_write(mcu_sync_pin, 0)
            # # ...and block it again ...
            # dmm.pin_write(mcu_sync_pin, 1)
        else:
            time.sleep(0.1)
        
    return data

def dmm_stop_measurement(dmm):
    if DMM_DONT_START_TRACE:
        return []
    dmm.abort_digitize()
    dmm.event_log_clear()

def measure_energy_bench(dut, shell_args:dict):
    dmm = None
    if not is_NaN_None(shell_args.get("dmm")):
        dmm = shell_args.get("dmm")

    # Whether to iterate over work_args last - for swo_prf_overhead_phases
    work_args_last:bool =  shell_args.get("work_args_last", False)

    # Get task argument names for the dataframe and pickle output
    lst_work_arg_names:list = get_task_work_arg_names(dut, shell_args.get("cmd_name"))
    #print(lst_work_arg_names)
    if lst_work_arg_names == -1:
        print("WORK ARGS NAME ERROR")
        return BENCH_ERROR

    # Remove iteration param name
    if not is_NaN_None(shell_args.get("iter_idx")):
        lst_work_arg_names.pop(-1)

    # Get iterations per work_arg for iter synchronisation
    json_sync_iterations = {}
    if not is_NaN_None(shell_args.get("json_sync_iter_path")) and shell_args.get("cmd_name", None) is not None:
        json_sync_iterations = pickle_get_iterations_per_work_arg(shell_args.get("json_sync_iter_path"), shell_args.get("cmd_name"), lst_work_arg_names)
        if len(json_sync_iterations) > 0:
            print("ITERATIONS FOUND TO SYNCHRONIZE: ", json_sync_iterations)

    # Data definition
    serial_csv_config = {}
    df_data = [] # Is going to be the main Dataframe

    # if is_NaN_None(shell_args.get("iter")):
    #     print("ITER ARGS NOT GIVEN")
    #     return MEASURE_BENCHMARK_ERROR

    # Construct config combinations of changing arguments
    freqs = dict_get_argument(shell_args, "freq", [4]) 
    dvs_pol = dict_get_argument(shell_args, "dvs_pol", [None])
    fwsa = dict_get_argument(shell_args, "fwsa", [None])
    dvs = dict_get_argument(shell_args, "dvs", [None])
    cache = dict_get_argument(shell_args, "cache", [None])
    work_args = dict_get_argument(shell_args, "work_args", [[None]])
 
    all_configs:itertools.product = None
    if work_args_last:
        all_configs = itertools.product(*work_args, freqs, dvs_pol, fwsa, dvs, cache)
    else:
         all_configs = itertools.product(freqs, dvs_pol, fwsa, dvs, cache, *work_args, )

    #print(list(deepcopy(all_configs)))
    # return MEASURE_BENCHMARK_ERROR

    # Construct cmd with not changing arguments
    cmd = "energy_bench {}".format(shell_args.get("cmd_name"))
    cmd += " " + dict_get_argument(shell_args, "constant_cmd_arg", "")
    cmd += build_cmd_arguments(shell_args, "trigger_dmm", 1)
    cmd += build_cmd_arguments(shell_args, "iter_idx", 1)

    # UNIQUE_SAME_ITER: For the most efficient frequency setting calculation - the iterations per unique work_args should be the same
    # Therefore the iteration amount for the highest freq for each unique work_arg is firstly measured, saved and then applied for every frequency
    unique_same_iter_dict = json_sync_iterations
    unique_same_iter_process = False
    if shell_args.get("unique_same_iter", None) is not None and shell_args.get("unique_same_iter"):
        unique_same_iter_process = True
    else:
        cmd += build_cmd_arguments(shell_args, "iter", 1)
        cmd += build_cmd_arguments(shell_args, "iter_mode", 1)

    total_conf = len(list(deepcopy(all_configs)))
    cnt_conf = -1
    for elem in all_configs:
        cnt_conf += 1
        # Append cmd with changing arguments
        cmd_dyn = cmd
        work_arg_offset = 5
        if not work_args_last:
            cmd_dyn += build_cmd_arguments(shell_args, "freq", 1, elem[0])
            cmd_dyn += build_cmd_arguments(shell_args, "dvs_pol", 1, elem[1])
            cmd_dyn += build_cmd_arguments(shell_args, "fwsa", 1, elem[2])
            cmd_dyn += build_cmd_arguments(shell_args, "dvs", 1, elem[3])
            cmd_dyn += build_cmd_arguments(shell_args, "cache", 1, elem[4])
            
            cmd_dyn += build_cmd_arguments(shell_args, "work_args", len(elem) - work_arg_offset, elem[work_arg_offset:])
        else:
            cmd_dyn += build_cmd_arguments(shell_args, "freq", 1, elem[len(work_args)])
            cmd_dyn += build_cmd_arguments(shell_args, "dvs_pol", 1, elem[len(work_args) + 1])
            cmd_dyn += build_cmd_arguments(shell_args, "fwsa", 1, elem[len(work_args) + 2])
            cmd_dyn += build_cmd_arguments(shell_args, "dvs", 1, elem[len(work_args) + 3])
            cmd_dyn += build_cmd_arguments(shell_args, "cache", 1, elem[len(work_args) + 4])
            
            cmd_dyn += build_cmd_arguments(shell_args, "work_args", len(work_args), elem[:len(work_args)])

        # UNIQUE_SAME_ITER: Measure amount of iterations with passed iter_mode 2 so its minium 100 Iterations and lasts minimum 1 second
        work_arg_string = str(elem[work_arg_offset:])
        if work_args_last:
            work_arg_string = str(elem[:len(work_args)])
        if unique_same_iter_process and work_arg_string not in unique_same_iter_dict.keys():

            unique_same_iter_cmd = cmd_dyn + build_cmd_arguments(shell_args, "iter", 1) + " -iter_mode 2\n"
            #(unique_same_iter_ret_config, unique_same_iter_data) = repeat_experiment_configuration(dut, unique_same_iter_cmd, [cnt_conf, total_conf], None, 1, timeout=None)

            unique_same_iter_header = []
            unique_same_iter_data = []
            unique_same_iter_config = {}

            # Nucleo: Reset for every different configuration
            reset_dut(dut)
            prompt_sync(dut, timeout=False)

            # DMM: activate energy measurement trigger
            # dmm_enable_trigger_wait(dmm) # TODO if this solution does not satisfy

            # Nucleo: Start workload and trigger energy measurement
            dut['serial'].write(bytes(unique_same_iter_cmd, 'ASCII'))

            ret = serial_decode(dut, None, unique_same_iter_header, unique_same_iter_data, unique_same_iter_config)

            # Poll for finished measurement
            # print(len(dmm_recv_readings(dmm))) # TODO if this solution does not satisfy


            #print(work_arg_string)
            #print(unique_same_iter_header)
            #print(unique_same_iter_data)

            unique_same_iter_iteration = unique_same_iter_data[0][unique_same_iter_header[0].index("ITERATIONS")]
            if unique_same_iter_iteration <= 0:
                return BENCH_ERROR
            unique_same_iter_dict[work_arg_string] = unique_same_iter_iteration
            

        if unique_same_iter_process and work_arg_string in unique_same_iter_dict.keys():
            cmd_dyn += " -iter_mode 0 -iter {}".format(unique_same_iter_dict.get(work_arg_string))

        # Finalize cmd
        cmd_dyn += "\n"

        # METADATA: Add one cmd example to pickle metadata
        if cnt_conf == 0:
            serial_csv_config["EXAMPLE_NUCLEO_CMD"] = cmd_dyn

        #return MEASURE_BENCHMARK_ERROR

        repetitions = dict_get_argument(shell_args, "bench_repetition", default=BENCH_REPETITION_DEFAULT)
        
        energy_repetition_len = []
        energy_repetition_data = []
        outlier_ids = []
        # To get repetition amount of data samples without any outliers
        while len(energy_repetition_len) < repetitions:
            curr_repetitions:int = repetitions - len(energy_repetition_len)
            energy_repetition(dut, dmm, cmd_dyn, energy_repetition_len, energy_repetition_data, curr_repetitions, total_conf, cnt_conf, serial_csv_config)
            print(energy_repetition_len)
            outliers = data_find_outliers(energy_repetition_len, 1, "iqr")
            if len(outliers) > 0:
                for index in sorted(outliers, reverse=True): # To not delete index that would alter the correct index of the next indices
                    del energy_repetition_len[index]
                    del energy_repetition_data[index]
                
                # Get the removed id that are now missing in the data
                if len(outlier_ids) == 0:
                    outlier_ids.extend(outliers)
        
        #assert False, "CHECK CORRECTNESS"
        # Rename some Repetition IDs as of Error prevention
        if len(outlier_ids) > 0:
            #print(outlier_ids)
            outlier_begin_index = len(energy_repetition_data) - len(outlier_ids) # // TODO check correctness
            #print(outlier_begin_index)
            for enum_i, outlier_index_value in enumerate(outlier_ids):
                #print(energy_repetition_data[outlier_begin_index + enum_i].to_string())
                energy_repetition_data[outlier_begin_index + enum_i].at[0, COL_NAME_BENCH_REPETITION] = outlier_index_value
                #print(outlier_index_value)
            
            energy_repetition_data

        df_data.extend(energy_repetition_data)
    
    df_data = pd.concat(df_data, ignore_index=True)

    # Add workload param names to conf
    #print(df_data.to_string())
    serial_csv_config["WORKLOAD_PARAMS"] = lst_work_arg_names #TODO handle via line to dict
    return {"conf":serial_csv_config, "data":df_data}


def energy_repetition(dut, dmm, cmd_dyn:str, energy_len:list, energy_data:list, repetitions:int, total_conf:int, cnt_conf:int, serial_csv_config:dict) -> list[pd.DataFrame]:
    assert type(serial_csv_config) is dict
    assert type(energy_len) is list
    assert type(energy_data) is list

    for i in range(repetitions):
        # RESET TEMPORARY DATAHOLDERS
        temp_serial_csv_header = []
        temp_serial_csv_data = []
        temp_serial_csv_config = {}

        # Nucleo: Reset for every different configuration
        reset_dut(dut)
        prompt_sync(dut, timeout=False)

        # DMM: activate energy measurement trigger
        dmm_enable_trigger_wait(dmm)

        # Nucleo: Start workload and trigger energy measurement
        nucleo_cmd_progress_print(cmd_dyn, total_conf, cnt_conf, repetitions, i)
        dut['serial'].write(bytes(cmd_dyn, 'ASCII'))

        # DMM: Trigger sync pins
        # Nucleo: 
        #dmm_sync_with_mcu(dmm) # problem: mcu might not be ready

        # Poll for finished experiment
        timeout = ENERGY_BENCH_SERIAL_MAX_TIMEOUT
        if not ENERGY_BENCH_BREAK_TIMEOUT:
            timeout = None
        ret = serial_decode(dut, timeout, temp_serial_csv_header, temp_serial_csv_data, temp_serial_csv_config)

        # Poll for finished measurement
        energy_mm = dmm_recv_readings(dmm)

        print("LEN Current MM: ", len(energy_mm))
        energy_len.append(len(energy_mm))

        if ENERGY_BENCH_BREAK_LEN_DMM and (ret < 0 or (len(energy_mm) < ENERGY_BENCH_MIN_MEASURMENTS)):
            print("RET:", ret, " Energy-Measurements: ", len(energy_mm))
            return BENCH_ERROR
        
        if (len(temp_serial_csv_header) > 1 or len(temp_serial_csv_data) > 1 or len(temp_serial_csv_config) > 1):
            print("[serial decode list bigger than one not handled yet]")
            #return BENCH_ERROR

        # Set config
        if serial_csv_config != temp_serial_csv_config:
            serial_csv_config.update(temp_serial_csv_config)

        # Unpack list wrap
        if temp_serial_csv_header != []:
            temp_serial_csv_header = temp_serial_csv_header[0]
        if temp_serial_csv_data != []:
            temp_serial_csv_data = temp_serial_csv_data[0]

        # Add iteration colum/ data
        temp_serial_csv_header.append(COL_NAME_BENCH_REPETITION)
        temp_serial_csv_data.append(i)

        # Add energy measurement data
        temp_serial_csv_header.append(COL_NAME_ENERGY_BENCH_CURRENT)
        temp_serial_csv_data.append(energy_mm)

        #print(temp_serial_csv_header)
        #print(temp_serial_csv_data)

        energy_data.append(pd.DataFrame(data=[temp_serial_csv_data], columns=temp_serial_csv_header))

#RIGOL_IP = "141.22.28.155"
RIGOL_IP = "192.168.1.150"
RIGOL_PORT = 5555
RIGOL_EXPERIMENT_SAMPLERATE_COLUMN = "RIGOL_SAMPLERATE"
RIGOL_EXPERIMENT_TIMEBASESCALE_COLUMN = "RIGOL_TIMEBASE"

RIGOL_LAN_DEV = {"type": "lan", "ip":RIGOL_IP, "port": RIGOL_PORT}

def measure_trace_delay(dut, shell_args:dict): # TODO Add work_params
    rigol = rigol_ds1054z(RIGOL_LAN_DEV, False)
    rigol_setup_exp:dict = shell_args.get("rigol_setup_exp")
    rigol_measure:dict = shell_args.get("rigol_measure")
    
    # Data definition
    serial_csv_config = {}
    df_data = None # Is going to be the main Dataframe

    # Construct config combinations of changing arguments
    freqs = dict_get_argument(shell_args, "freq", [4]) 
    dvs_pol = dict_get_argument(shell_args, "dvs_pol", [None])
    fwsa = dict_get_argument(shell_args, "fwsa", [None])
    dvs = dict_get_argument(shell_args, "dvs", [None])
    mode = dict_get_argument(shell_args, "mode", [[None]])
    prescaler = dict_get_argument(shell_args, "conf_psc", [None])
    prf_cnt = dict_get_argument(shell_args, "prf_cnt", [None])
    #print(work_args)
    rising_flank = dict_get_argument(shell_args, "rising_flank", [None])
    all_configs = itertools.product(freqs, dvs_pol, fwsa, dvs, mode, prescaler, prf_cnt, rising_flank)
    
    
    cmd_name = dict_get_argument(shell_args, "cmd_name", None)

    # Construct cmd with not changing arguments
    cmd = cmd_name
    if cmd == None:
        return BENCH_ERROR
    cmd += " "
    cmd += dict_get_argument(shell_args, "constant_cmd_arg", "") 
    cmd += build_cmd_arguments(shell_args, "iter", 1)

    # METADATA: RIGOL: initialize experiment settings and append retuns to experiment config file
    serial_csv_config.update(rigol.json_experiment(rigol_setup_exp.get("path"), rigol_setup_exp.get("name")))

    # METADATA: RIGOL: Get Memory depth and acquisition mode (SAFETY)
    serial_csv_config["RIGOL_MDEPTH"] = rigol.send_scpi(":ACQuire:MDEPth?", rigol.SEND_SCPI_RETURN_FULL).decode()
    serial_csv_config["RIGOL_AQUISITION_MODE"] = rigol.send_scpi(":ACQuire:TYPE?", rigol.SEND_SCPI_RETURN_FULL).decode()


    # Get information for progress display
    total_conf = len(list(deepcopy(all_configs)))
    cnt_conf = -1
    for elem in all_configs:
        cnt_conf += 1
        # Append cmd with changing arguments
        cmd_dyn = cmd
        elem_freq_idx = 0
        cmd_dyn += build_cmd_arguments(shell_args, "freq", 1, elem[elem_freq_idx])
        cmd_dyn += build_cmd_arguments(shell_args, "dvs_pol", 1, elem[1])
        cmd_dyn += build_cmd_arguments(shell_args, "fwsa", 1, elem[2])
        cmd_dyn += build_cmd_arguments(shell_args, "dvs", 1, elem[3])
        elem_mode_idx = 4
        cmd_dyn += build_cmd_arguments(shell_args, "mode", 1, elem[elem_mode_idx])
        cmd_dyn += build_cmd_arguments(shell_args, "conf_psc", 1, elem[5])
        cmd_dyn += build_cmd_arguments(shell_args, "prf_cnt", 1, elem[6])
        elem_rising_flank_idx = 7
        cmd_dyn += build_cmd_arguments(shell_args, "rising_flank", 1, elem[elem_rising_flank_idx])
        cmd_dyn += "\n"

        # METADATA: Add one cmd example to pickle metadata
        if cnt_conf == 0:
            serial_csv_config["EXAMPLE_NUCLEO_CMD"] = cmd_dyn
        
        # Workload specific settings for the oszi (timescale and statistic measurement)

        if cmd_name == "oszi_trace_duration":
            if elem[elem_freq_idx] in [4]: # 80MHz
                if elem[elem_mode_idx] in [0, 3]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_500ns")
                elif elem[elem_mode_idx] in [7, 8, 9]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_5µs")
                elif elem[elem_mode_idx] in [1, 2, 11, 12, 10, 6, 14]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_1µs")
                elif elem[elem_mode_idx] in [4, 5]:
                     rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_50µs")
                elif elem[elem_mode_idx] in [13]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_2µs")
            elif elem[elem_freq_idx] in [0]: # 13 MHz
                if elem[elem_mode_idx] in [0]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_500ns")
                elif elem[elem_mode_idx] in [7, 8, 9, 10]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_5µs")
                elif elem[elem_mode_idx] in [1, 2, 11, 3, 12]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_1µs")
                elif elem[elem_mode_idx] in [6]:
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_5µs")
                elif elem[elem_mode_idx] in [4, 5]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_200µs")

                elif elem[elem_mode_idx] in [14]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_2µs")
                elif elem[elem_mode_idx] in [13]: # MODE
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_10µs")
                
                # freq 0: mode 3 




        elif cmd_name == "oszi_ecp_delay":
            if elem[elem_freq_idx] == 0:
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_500ns")
            elif elem[elem_freq_idx] < 4:
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_200ns")
            else:
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_100ns")

        
        elif cmd_name == "oszi_gpio_delay":
            if elem[elem_rising_flank_idx] == 0: # falling flank
                rigol.json_experiment(rigol_setup_exp.get("path"), "trigger_negative")
                if elem[elem_mode_idx] == 3: # mode 3
                    rigol.send_scpi(":CHANnel2:DISPlay ON")
                    rigol_measure["cmd"] = ":MEASure:ITEM? fdelay"
                elif elem[elem_mode_idx] == 4: # mode 4
                    rigol.send_scpi(":CHANnel2:DISPlay OFF")
                    rigol_measure["cmd"] = ":MEASure:ITEM? nwidth, channel1"
            elif elem[elem_rising_flank_idx] == 1: # rising flank
                rigol.json_experiment(rigol_setup_exp.get("path"), "trigger_positive")
                if elem[elem_mode_idx] == 3: # mode 3
                    rigol.send_scpi(":CHANnel2:DISPlay ON")
                    rigol_measure["cmd"] = ":MEASure:ITEM? rdelay"
                elif elem[elem_mode_idx] == 4: # mode 4
                    rigol.send_scpi(":CHANnel2:DISPlay OFF")
                    rigol_measure["cmd"] = ":MEASure:ITEM? pwidth, channel1"

            if  elem[elem_freq_idx] < 2: # Frequency
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_200ns")
            else:
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_100ns")
        
        elif cmd_name == "oszi_trace_stop":
            if elem[elem_freq_idx] in [0]:
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_2µs")
            elif elem[elem_freq_idx] in [1, 2]:
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_1µs")
            elif elem[elem_freq_idx] in [3, 4]:
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_500ns")
        
        elif cmd_name == "oszi_trace_phases":
            if elem[elem_mode_idx] in [0, 1]: # MODE
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_500ns")
            elif elem[elem_mode_idx] in [2]: # MODE
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_200µs")
            elif elem[elem_mode_idx] in [3]: # MODE
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_5µs")
            elif elem[elem_mode_idx] in [4]: # MODE
                rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_2µs")

        
        # RIGOL: Initialize per command rigol data holder
        rigol_samplerate = 0
        rigol_timebase = 0

        repetitions = dict_get_argument(shell_args, "bench_repetition", default=BENCH_REPETITION_DEFAULT)
        for i in range(repetitions):

            # RESET TEMPORARY DATAHOLDERS
            temp_serial_csv_header = []
            temp_serial_csv_data = []
            temp_serial_csv_config = {}

            # Nucleo: Reset for every different configuration
            tries = 5
            while True:
                reset_dut(dut)
                sync_ret = prompt_sync(dut, timeout=PROMPT_SYNC_TIMEOUT)
                if sync_ret:
                    break
                tries -= 1
                if tries <= 0:
                    serial_csv_config["EARLY_STOP"] = True
                    return {"conf":serial_csv_config, "data":df_data}
            
            # RIGOL: Lock Trigger
            rigol.send_scpi(":SINGLE")

            # wait for a oszi trigger condition WAIT
            try:
                rigol.wait_for_trigger_status(status_id=rigol_ds1054z.TRIGGER_STATUS.WAIT, wait_steps_secs=1, timeout=10)
            except TimeoutError:
                rigol.send_scpi(":RUN")
                time.sleep(1)
                rigol.send_scpi(":SINGLE")
                rigol.wait_for_trigger_status(status_id=rigol_ds1054z.TRIGGER_STATUS.WAIT, wait_steps_secs=1, timeout=10)
                continue

            # Nucleo: Start workload and trigger energy measurement
            nucleo_cmd_progress_print(cmd_dyn, total_conf, cnt_conf, repetitions, i)
            dut['serial'].write(bytes(cmd_dyn, 'ASCII'))

            # Poll for finished experiment
            timeout = ENERGY_BENCH_SERIAL_MAX_TIMEOUT
            if not ENERGY_BENCH_BREAK_TIMEOUT:
                timeout = None
            ret = serial_decode(dut, timeout, temp_serial_csv_header, temp_serial_csv_data, temp_serial_csv_config)

            # wait for a oszi trigger condition STOP
            rigol.wait_for_trigger_status(status_id=rigol_ds1054z.TRIGGER_STATUS.STOP, wait_steps_secs=0.5)

            # Query delay measurement
            delay = rigol.send_scpi(rigol_measure.get("cmd"), rigol_measure.get("ret", rigol.SEND_SCPI_RETURN_NONE))

            if type(delay) is bytearray:
                delay = delay.decode()

            print("{} - Delay: ".format(rigol_measure.get("cmd")), delay)

            # Unpack list wrap
            if temp_serial_csv_header != []:
                temp_serial_csv_header = temp_serial_csv_header[0]
            if temp_serial_csv_data != []:
                temp_serial_csv_data = temp_serial_csv_data[0]

            
            # Add iteration colum/ data
            temp_serial_csv_header.append(COL_NAME_BENCH_REPETITION)
            temp_serial_csv_data.append(i)

            # Add delay colum/ data
            temp_serial_csv_header.append(COL_NAME_TRACE_DELAY_DELAY)
            temp_serial_csv_data.append(delay)

            # RIGOL: Get samplerate which is dependent on the amount of active channels
            # is only necesarry for the first repetition
            if i == 0:
                rigol_samplerate = rigol.send_scpi(":ACQuire:SRATe?", rigol.SEND_SCPI_RETURN_FULL).decode()
                rigol_timebase = rigol.send_scpi(":TIMebase:MAIN:SCALe?", rigol.SEND_SCPI_RETURN_FULL).decode()

            print(rigol_samplerate)
            print(rigol_timebase)

            # Add samplerate of repetition run - is equal for the same configuration of repetitions
            temp_serial_csv_header.append(RIGOL_EXPERIMENT_SAMPLERATE_COLUMN)
            temp_serial_csv_data.append(rigol_samplerate)

            # Add timebase of repetiotion run - is equal for the same configuration of repetitions
            temp_serial_csv_header.append(RIGOL_EXPERIMENT_TIMEBASESCALE_COLUMN)
            temp_serial_csv_data.append(rigol_timebase)

            
            if type(df_data) != pd.DataFrame:
                df_data = pd.DataFrame(data=[temp_serial_csv_data], columns=temp_serial_csv_header)
            else:
                new_row = pd.DataFrame(data=[temp_serial_csv_data], columns=temp_serial_csv_header)
                #print(df_data)
                #print(new_row)
                df_data = pd.concat([df_data, new_row], ignore_index=True)

    return {"conf":serial_csv_config, "data":df_data}

def measure_trace_wave(dut, shell_args:dict): # TODO Add work_params
    rigol = rigol_ds1054z(RIGOL_LAN_DEV, False)
    rigol_setup_exp:dict = shell_args.get("rigol_setup_exp")
    rigol_measure:dict = shell_args.get("rigol_measure")
    rigol_wave_channel = shell_args.get("rigol_wave_channel")
    rigol_wave_frames = int(shell_args.get("rigol_wave_frames"))
    rigol_wave_mode = shell_args.get("rigol_wave_mode")
    rigol_wave_format = shell_args.get("rigol_wave_format")
    
    # Data definition
    serial_csv_config = {}
    df_data = None # Is going to be the main Dataframe

    # Construct config combinations of changing arguments
    freqs = dict_get_argument(shell_args, "freq", [4]) 
    dvs_pol = dict_get_argument(shell_args, "dvs_pol", [None])
    fwsa = dict_get_argument(shell_args, "fwsa", [None])
    dvs = dict_get_argument(shell_args, "dvs", [None])
    mode = dict_get_argument(shell_args, "mode", [[None]])
    prescaler = dict_get_argument(shell_args, "conf_psc", [None])
    prf_cnt = dict_get_argument(shell_args, "prf_cnt", [None])
    #print(work_args)
    rising_flank = dict_get_argument(shell_args, "rising_flank", [None])
    all_configs = itertools.product(freqs, dvs_pol, fwsa, dvs, mode, prescaler, prf_cnt, rising_flank)
    
    
    cmd_name = dict_get_argument(shell_args, "cmd_name", None)

    # Construct cmd with not changing arguments
    cmd = cmd_name
    if cmd == None:
        return BENCH_ERROR
    cmd += " "
    cmd += dict_get_argument(shell_args, "constant_cmd_arg", "") 
    cmd += build_cmd_arguments(shell_args, "iter", 1)

    # RIGOL: initialize experiment settings and append retuns to experiment config file
    serial_csv_config.update(rigol.json_experiment(rigol_setup_exp.get("path"), rigol_setup_exp.get("name")))

    # RIGOL: Get Memory depth and acquisition mode (SAFETY)
    serial_csv_config["RIGOL_MDEPTH"] = rigol.send_scpi(":ACQuire:MDEPth?", rigol.SEND_SCPI_RETURN_FULL).decode()
    serial_csv_config["RIGOL_AQUISITION_MODE"] = rigol.send_scpi(":ACQuire:TYPE?", rigol.SEND_SCPI_RETURN_FULL).decode()


    # Get information for progress display
    total_conf = len(list(deepcopy(all_configs)))
    cnt_conf = -1
    for elem in all_configs:
        cnt_conf += 1
        # Append cmd with changing arguments
        cmd_dyn = cmd
        freq_elem_idx = 0
        cmd_dyn += build_cmd_arguments(shell_args, "freq", 1, elem[freq_elem_idx])
        cmd_dyn += build_cmd_arguments(shell_args, "dvs_pol", 1, elem[1])
        cmd_dyn += build_cmd_arguments(shell_args, "fwsa", 1, elem[2])
        cmd_dyn += build_cmd_arguments(shell_args, "dvs", 1, elem[3])
        cmd_dyn += build_cmd_arguments(shell_args, "mode", 1, elem[4])
        psc_elem_idx = 5
        cmd_dyn += build_cmd_arguments(shell_args, "conf_psc", 1, elem[psc_elem_idx])
        prf_cnt_elem_idx = 6
        cmd_dyn += build_cmd_arguments(shell_args, "prf_cnt", 1, elem[prf_cnt_elem_idx])
        cmd_dyn += build_cmd_arguments(shell_args, "rising_flank", 1, elem[7])
        cmd_dyn += "\n"

        # METADATA: Add one cmd example to pickle metadata
        if cnt_conf == 0:
            serial_csv_config["EXAMPLE_NUCLEO_CMD"] = cmd_dyn

        # Workload specific settings for the oszi (timescale and statistic measurement)

        if cmd_name == "oszi_ecp_delay": 
            if elem[freq_elem_idx] == 0:  #freq
                if elem[psc_elem_idx] < 1: #psc
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_200ns")
                else:
                    if elem[prf_cnt_elem_idx] == 100:
                        rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_1µs")
                    else:
                        rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_500ns")
            elif elem[freq_elem_idx] < 4: # freq
                if elem[psc_elem_idx] >= 3: # psc
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_500ns")
                elif elem[psc_elem_idx] < 1:
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_100ns")
                else:
                    if elem[prf_cnt_elem_idx] == 100:
                        rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_500ns")
                    else:
                        rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_200ns")
            else:
                if elem[psc_elem_idx] >= 3: #psc
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_200ns")
                elif elem[psc_elem_idx] < 1:
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_50ns")
                else:
                    rigol.json_experiment(rigol_setup_exp.get("path"), "timebase_100ns")

        

        # RIGOL: Initialize per command rigol data holder
        rigol_samplerate = 0
        rigol_timebase = 0

        repetitions = dict_get_argument(shell_args, "bench_repetition", default=BENCH_REPETITION_DEFAULT)
        for i in range(repetitions):

            # RESET TEMPORARY DATAHOLDERS
            temp_serial_csv_header = []
            temp_serial_csv_data = []
            temp_serial_csv_config = {}

            # Nucleo: Reset for every different configuration
            tries = 5
            while True:
                reset_dut(dut)
                sync_ret = prompt_sync(dut, timeout=PROMPT_SYNC_TIMEOUT)
                if sync_ret:
                    break
                tries -= 1
                if tries <= 0:
                    serial_csv_config["EARLY_STOP"] = True
                    return {"conf":serial_csv_config, "data":df_data}
            
            # RIGOL: Lock Trigger
            rigol.send_scpi(":SINGLE")

            # wait for a oszi trigger condition WAIT
            try:
                rigol.wait_for_trigger_status(status_id=rigol_ds1054z.TRIGGER_STATUS.WAIT, wait_steps_secs=1, timeout=10)
            except TimeoutError:
                rigol.send_scpi(":RUN")
                time.sleep(1)
                rigol.send_scpi(":SINGLE")
                rigol.wait_for_trigger_status(status_id=rigol_ds1054z.TRIGGER_STATUS.WAIT, wait_steps_secs=1, timeout=10)
                continue

            # Nucleo: Start workload and trigger energy measurement
            nucleo_cmd_progress_print(cmd_dyn, total_conf, cnt_conf, repetitions, i)
            dut['serial'].write(bytes(cmd_dyn, 'ASCII'))

            # Poll for finished experiment
            timeout = ENERGY_BENCH_SERIAL_MAX_TIMEOUT
            if not ENERGY_BENCH_BREAK_TIMEOUT:
                timeout = None
            ret = serial_decode(dut, timeout, temp_serial_csv_header, temp_serial_csv_data, temp_serial_csv_config) # TODO csv_config not used

            # wait for a oszi trigger condition STOP
            rigol.wait_for_trigger_status(status_id=rigol_ds1054z.TRIGGER_STATUS.STOP, wait_steps_secs=0.5)

            # Query delay measurement
            wave_data = rigol.wave(rigol.CHANNEL[rigol_wave_channel], rigol_wave_frames, rigol.WAVE_MODE[rigol_wave_mode], rigol.WAVE_FORMAT[rigol_wave_format])

            print("Wavedata: len: {} , [:10]: {}".format(len(wave_data[rigol.WAVE_RETURN_DATA_KEY]), wave_data[rigol.WAVE_RETURN_DATA_KEY][:10]))

            # Unpack list wrap
            if temp_serial_csv_header != []:
                temp_serial_csv_header = temp_serial_csv_header[0]
            if temp_serial_csv_data != []:
                temp_serial_csv_data = temp_serial_csv_data[0]

            
            # Add iteration colum/ data
            temp_serial_csv_header.append(COL_NAME_BENCH_REPETITION)
            temp_serial_csv_data.append(i)

            # Add delay colum/ data
            temp_serial_csv_header.append(COL_NAME_TRACE_SAMPLES_WAVE)
            temp_serial_csv_data.append(wave_data)

            # RIGOL: Get samplerate which is dependent on the amount of active channels
            # is only necesarry for the first repetition
            if i == 0:
                rigol_samplerate = rigol.send_scpi(":ACQuire:SRATe?", rigol.SEND_SCPI_RETURN_FULL).decode()
                rigol_timebase = rigol.send_scpi(":TIMebase:MAIN:SCALe?", rigol.SEND_SCPI_RETURN_FULL).decode()

            #print(rigol_samplerate)
            #print(rigol_timebase)

            # Add samplerate of repetition run - is equal for the same configuration of repetitions
            temp_serial_csv_header.append(RIGOL_EXPERIMENT_SAMPLERATE_COLUMN)
            temp_serial_csv_data.append(rigol_samplerate)

            # Add timebase of repetiotion run - is equal for the same configuration of repetitions
            temp_serial_csv_header.append(RIGOL_EXPERIMENT_TIMEBASESCALE_COLUMN)
            temp_serial_csv_data.append(rigol_timebase)

            
            if type(df_data) != pd.DataFrame:
                df_data = pd.DataFrame(data=[temp_serial_csv_data], columns=temp_serial_csv_header)
            else:
                new_row = pd.DataFrame(data=[temp_serial_csv_data], columns=temp_serial_csv_header)
                #print(df_data)
                #print(new_row)
                df_data = pd.concat([df_data, new_row], ignore_index=True)

    return {"conf":serial_csv_config, "data":df_data}

    print()

TRACE_MINIMAL_PRESCALER_TIMEOUT = None

def measure_trace_prescaler(dut, shell_args:dict):

    # Data definition
    serial_csv_config = {}
    df_data = None

    # Construct config combinations of changing arguments
    prf_cnt = dict_get_argument(shell_args, "prf_cnt", [None]) 
    freqs = dict_get_argument(shell_args, "freq", [4])
    dvs_pol = dict_get_argument(shell_args, "dvs_pol", [None])
    fwsa = dict_get_argument(shell_args, "fwsa", [None])
    dvs = dict_get_argument(shell_args, "dvs", [None])
    prescaler = dict_get_argument(shell_args, "conf_psc", [None])
    trace_mode = dict_get_argument(shell_args, "trace_mode", [None])
    sleep_mode = dict_get_argument(shell_args, "sleep_mode", [None])

    #print(work_args)
    all_configs = itertools.product(prf_cnt, freqs, dvs_pol, fwsa, dvs, prescaler, trace_mode, sleep_mode)

    # Construct cmd with not changing arguments
    cmd = dict_get_argument(shell_args, "cmd_name", None)
    if cmd == None:
        return BENCH_ERROR
    cmd += " "
    cmd += dict_get_argument(shell_args, "constant_cmd_arg", "") 
    cmd += build_cmd_arguments(shell_args, "iter", 1)

    total_conf = len(list(deepcopy(all_configs)))
    cnt_conf = -1
    for elem in all_configs:
        cnt_conf += 1
        cmd_dyn = cmd
        cmd_dyn += build_cmd_arguments(shell_args, "prf_cnt", 1, elem[0])
        cmd_dyn += build_cmd_arguments(shell_args, "freq", 1, elem[1])
        cmd_dyn += build_cmd_arguments(shell_args, "dvs_pol", 1, elem[2])
        cmd_dyn += build_cmd_arguments(shell_args, "fwsa", 1, elem[3])
        cmd_dyn += build_cmd_arguments(shell_args, "dvs", 1, elem[4])
        cmd_dyn += build_cmd_arguments(shell_args, "conf_psc", 1, elem[5])
        cmd_dyn += build_cmd_arguments(shell_args, "trace_mode", 1, elem[6])
        cmd_dyn += build_cmd_arguments(shell_args, "sleep_mode", 1, elem[7])
        cmd_dyn += "\n"

        # METADATA: Add one cmd example to pickle metadata
        if cnt_conf == 0:
            serial_csv_config["EXAMPLE_NUCLEO_CMD"] = cmd_dyn
        

        repetitions = dict_get_argument(shell_args, "bench_repetition" ,default=BENCH_REPETITION_DEFAULT)
        (ret_serial_csv_config, df_data) = repeat_experiment_configuration(dut, cmd_dyn, [cnt_conf, total_conf], df_data, repetitions, timeout=TRACE_MINIMAL_PRESCALER_TIMEOUT)
        serial_csv_config.update(ret_serial_csv_config)
    # Add workload param names to conf
    #print(df_data)
    return {"conf":serial_csv_config, "data":df_data}
PROMPT_SYNC_TIMEOUT = 100
def prompt_sync(dut, timeout:bool=True):
    #print("prompt sync...") 
    tty = dut['serial']
    while True:
       while True:
           preline = tty.readline()
           # ensure that any previous output was read before trying to sync
           if (not preline):
               break
       # write some invalid command to make the shell output the prompt'
       tty.write(bytes("sadlkfjdsf\n", 'ASCII'))
       # wait for the riot prompt
       cnt = 0
       while True:
           try:
               line = tty.readline().decode('ASCII')
               if line:
                   #print(line)
                   cnt = 0
                   #print("'" + line + "'")
                   if line == "> ":
                       return True
               elif timeout:
                   cnt += 1
                   if cnt > PROMPT_SYNC_TIMEOUT:
                       print("prompt sync timeout ...")      
                       return False
           except ValueError:
               #print("garbage output..")
               continue

def reset_dut(dut):
    print("reset dut")
    dut['serial'].write(bytes("reboot\n", 'ASCII'))

def run_task(outfolder, duts, task_spec, print_info:bool=False):
    dataframes = []
    task_name = '...'
    dut = None
    dutidx = 0

    if ('dutidx' in task_spec):
        dutidx = task_spec['dutidx']

    dut = duts[dutidx] 

    if 'cmd' in task_spec:
        print(task_spec['cmd'])
    if 'dut_cmd_only' in task_spec:
        print(task_spec['dut_cmd_only'])
    # if a task does no specifiy a name use a placeholder
    if ('taskname' in task_spec):
        task_name = task_spec['taskname']

    # reset the MCU if that is needed for the task
    if ('precmdreset' in task_spec and task_spec['precmdreset']):
        print(task_name + ' resetting MCU...')
        #print("Resetting MCU...")
        reset_dut(dut)
        if not prompt_sync(dut):
            print("[Task not runnable]")
            return False
        print("ready")

    if ('dut_cmd_only' in task_spec):
        if ('pre-resync' in task_spec):
            prompt_sync(dut)
        
        dut.write(bytes(task_spec['dut_cmd_only'], 'ASCII'))
                
        if ('post_cmd_wait_for_prompt' in task_spec and task_spec['post_cmd_wait_for_prompt']):
            while True:
                try:
                    line = dut.readline().decode('ASCII')
                    #print(line)
                    #if line:
                    #    print(line)
                    if line == "> ":
                        break
                except ValueError:
                    continue
       
        if ('post_cmd_pause_s' in task_spec):
            time.sleep(task_spec['post_cmd_pause_s'])
        
        if ('post-resync' in task_spec):
            print(task_name + ' syncing to the shell...')
            prompt_sync(dut)

    elif ('function' in task_spec):
        print(task_name + ' run multiple DUT operations with custom instrumentation...')
        task_return = task_spec['function']()
        data = task_return["data"]
        conf = task_return["conf"]
        if (data is None or conf is None):
            print("[Task not runnable]")
            return False
        dataframes.append(data)
        task_spec['bench_config'] = conf
        # dirty workaround for now to allow pickling of the full task spec (function cannot be pickled)
        task_spec['function'] = str(task_spec['function'])

    if (len(dataframes) > 0):
        filename = task_name_to_filename(outfolder, task_spec['taskname'], task_spec['filename_addon'])
        print("[SAVING] - {}".format(filename))
        outfile = open(filename ,"wb")
        if RUN_TASK_VERBOSE:
            print(task_spec)
            print(dataframes)
        measurement_data = { 'metadata': task_spec, 'dataframes' : dataframes }
        pickle.dump(measurement_data, outfile)
        outfile.close()
    return True
    print('[TASK TESTED]')

def test_script():
    # print("[TEST]")
    # # GET DUT ONLINE INFO
    duts = [{ 'ttyname': '/dev/ttyACM0', 'baud': 115200, 'addr': 'fe80::b8cc:eef:1077:d8e5', 'reset_dmm_pin' : None } ]

    for i, dut in enumerate(duts):
        s = serial.Serial(dut['ttyname'], dut['baud'], timeout=0.1)
        if(s.isOpen() is False):
            s.open()
        else:
            s.close()
            s.open()
        dut['serial'] = s
   
    #print("putting MCU into a clean defined state...")

    dmm = dmm_setup()
    time.sleep(10)

    # Get task argument names for the dataframe and pickle output
    lst_work_arg_names:list = get_task_work_arg_names(dut, "tci")
    #print(lst_work_arg_names)
    if lst_work_arg_names == -1:
        print("WORK ARGS NAME ERROR")
        return BENCH_ERROR

    reset_dut(duts[0])
    prompt_sync(duts[0])

    dmm_enable_trigger_wait(dmm)
    cmd_dyn = "energy_bench spi -iter 70 -iter_mode 2 -iter_idx 1.0 -freq 2 -dvs_pol lvpol -fwsa 1 -work_args 10000000\n"
    time.sleep(1)
    print(cmd_dyn[:-1])
    dut['serial'].write(bytes(cmd_dyn, 'ASCII'))
    """ dmm_sync_with_mcu(dmm) """
    print(serial_decode(duts[0], None ,[], [], []))

    # Poll for finished measurement
    energy_mm = dmm_recv_readings(dmm)

    print("LEN Energy MM: ", len(energy_mm))

    dmm_enable_trigger_wait(dmm)

    cmd_dyn = "energy_bench spi -iter 70 -iter_mode 2 -iter_idx 1.0 -freq 2 -dvs_pol ffpol -fwsa 1 -work_args 100000\n"


    print(cmd_dyn[:-1])
    dut['serial'].write(bytes(cmd_dyn, 'ASCII'))

    print(serial_decode(duts[0], None ,[], [], []))

    # Poll for finished measurement
    energy_mm = dmm_recv_readings(dmm)

    print("LEN Energy MM: ", len(energy_mm))

    # tell MCU to continue execution...
    # dmm.pin_write(DMM_MCU_SYNC_PIN, 0)
    # time.sleep(1)
    # # ...and block it again ...
    # dmm.pin_write(DMM_MCU_SYNC_PIN, 1)

    # freqs = [0, 1, 2, 3]
    # dvs_pol = ["lvpol", "ffpol"]
    # work_args = [[0, 4], ["bla"]]
    # none_tst = None

    # all_configs = itertools.product(freqs, dvs_pol, [none_tst], *work_args, )

    #(name, di) = serial_line_to_dict("*PARAM_NAMES=   iter:hi")
    #print(di)
    # if shell_args.get("work_args") != None:
    #     all_configs = itertools.product(freqs, *shell_args.get("work_args"), )

    #print(list(all_configs))
    return None

def git_info(path:str):
    cmd = "git -C {} show --oneline -s --no-color".format(path)
    #print("CMD: ", cmd)
    cmd = cmd.split(" ")
    #print("CMD: ", cmd)
    result = subprocess.run(cmd, stdout=subprocess.PIPE)
    return {"path": path, "GIT-SHOW" : result.stdout.decode("utf-8").replace("\n", "")}
    
def flash(path:str, board:str, benchmark_vars:list[str]):
    """ 
    Flash a RIOT board with a given application with given variables

    :param folder:          path to application that should be flashed
    :param board:           name of RIOT BOARD={board}
    :param benchmark_vars:  list of variables for makefile like ["WL_FFT=1", "WL_IONDB=1"]
    :return:                0 success, -1 failure
    """
    print("[FLASHING]")
    cmd = "make BUILD_IN_DOCKER=1 BOARD={} -j5 all flash -s -C {}".format(board, path)
    cmd = cmd.split(" ") # create list
    if benchmark_vars is not None:
        cmd.extend(benchmark_vars)
    print(" ".join(cmd))
    flash_process = subprocess.Popen(cmd, stdout= (subprocess.DEVNULL if not FLASH_VERBOSE else sys.stdout))
    flash_process.wait()
    if flash_process.returncode != 0:
        print("[FLASHING ERROR]")
        return -1
    print("[FLASHING SUCCESS]")
    return 0

BENCHMARK_TYPES = {"swo_bench": measure_swo_bench, "perf_util_test": measure_perf_util_test, "other_character_bench": measure_other_character, "energy_bench": measure_energy_bench, "trace_delay" : measure_trace_delay, "trace_prescaler" : measure_trace_prescaler, "trace_wave": measure_trace_wave}
def get_benchmark_func(name:str):
    if name in BENCHMARK_TYPES.keys():
        return BENCHMARK_TYPES.get(name)
    return None

# TODO Add flash argument to json_job
def main():
    p = argparse.ArgumentParser()
    # Minimal Arguments
    p.add_argument("-o", "--outfolder",  type=str,  help="output folder where measurement data will be saved (.pkl)", required=True)
    p.add_argument("-b", "--board",      type=str,  help="the RIOT board name of the target device to perform the measurements on (nucleo-l476rg or slstk3402a)", required=True)
    p.add_argument("-bm", "--benchmark",      type=str, nargs="+", metavar=("NAME", "JSON-PATH"),  help="the benchmark type NAME to perform the workload measurements with (swo_bench or perf_util_test). JSON-PATH path to json file wit benchmark specifc arguments that apply for every workload", required=True)
    p.add_argument("--flash_info",         type=str, help="Path to flashed application for later task reference", metavar=("PATH"), required=True)

    # XOR Arguments
    mut_group = p.add_mutually_exclusive_group(required=True)
    mut_group.add_argument("-js", "--json",      type=str, nargs="+", metavar=('PATH', 'JOB'), required=False, help="Execute workloads of given json file. Only execute given JOB names or all from file instead")
    mut_group.add_argument("-t", "--test",       action=argparse.BooleanOptionalAction)
    mut_group.add_argument("--flash",      nargs=2, type=str,  help="Flash the board with APP-PATH application and makefile arguments learned by JSON-PATH json file. Skip flashing when --json_skip is called and it is not necessary", required=False, metavar=("APP-PATH", "JSON-PATH"))

    # Additonal Arguments
    p.add_argument("--json_skip",         type=str, help="Addon for argument --json (enables skipping certain jobs if a job pickle file already exists in the result folder OUTFOLDER) and --flash (skips flashing when not necessary)")
    p.add_argument("--json_offset",         type=str, help="Addon for argument --json (enables to start running all jobs from given OFFSET_JOB_NAME and skips all jobs above in json files (given jobname will be executed)). Does not work if --json has more arguments besides the PATH argument", metavar=("OFFSET_JOB_NAME"))
    p.add_argument("--pre_cmd_reset", action=argparse.BooleanOptionalAction, required=False, help="Reset dut once before executing benchmark function")
    p.add_argument("--filename_addon",  type=str, required=False, help="Addon for file")
    p.add_argument("--folder_addon",  type=str, required=False, help="Addon for foldername")
    p.add_argument("--json_sync_iter",         type=str, metavar=("SWO_OR_ENERGY_PKL_FOLDER"), help="Addon for argument --json (enables synchronizing iterations of certain jobs if a job  pickle file of the contrary type (swo/energy) already exists in the folder SWO_OR_ENERGY_PKL_FOLDER)")

    # Additional bench specific arguments
    p.add_argument("--freq", type=int, nargs="+", metavar=('FREQ_IDX'), required=False, help="List of frequency indeces (0-5) the benchmark should be running with")
    p.add_argument("--fwsa", action=argparse.BooleanOptionalAction, required=False, help="Enable Flash Wait State Adaption")
    p.add_argument("--dvs_pol", type=str, metavar=('POLICY'), required=False, help="Select DVS Policy (ffpol or lvpol)")
    p.add_argument("--iter_mode", type=int, metavar=('MODE'), required=False, help="Select the iter_mode of the benchmarks, will only overwrite benchmarks that didnt selected an itermode or have an iter_mode of > 0")

    
    
   
    
    args = p.parse_args()

    # TEST 
    if args.test != None:
        test_script()
        return

    # GET BOARD
    board = args.board

    # Sync with DMM
    dmm = None
    dmm_samplerate = DMM_SAMPLERATE
    dmm_measure_range = DMM_MEASURE_RANGE

    # Check implemented benchmark type
    benchmark_func = get_benchmark_func(args.benchmark[0])
    if benchmark_func is None:
        print("[BENCHMARK TYPE NOT IMPLEMENTED]")
        return
    

    # Check DVS POL
    if args.dvs_pol is not None and (args.dvs_pol != "ffpol" and args.dvs_pol != "lvpol"):
        print("dvs_pol: ", args.dvs_pol, " is not a selectable policy")
        return
    
    # Check freq
    freqs = []
    if args.freq is not None:
        for f in args.freq:
            f = int(f)
            if f < 0 or f > 4:
                print("freq: ", str(f), " is not a selectable frequency index")
                return
        freqs = args.freq
    
    # CREATE RESULT FOLDER
    complete_result_path = args.outfolder + "/" + board + "/" + args.benchmark[0]
    if args.folder_addon is not None:
            complete_result_path += "/" + args.folder_addon

    if args.json is not None:
        Path(complete_result_path).mkdir(parents=True, exist_ok=True)

    # GET PICKLE INFO OF RESULT FOLDER
    job_pickles = []
    if args.json_skip is not None: # ADD skip feature
        # Find all existing pickle (.pkl) files and remove ".pkl" ending before appending to list[str]
        job_pickles = [f.replace(".pkl", "") for f in os.listdir(args.json_skip) if ".pkl" in f]

    

    # GET DUT ONLINE INFO
    duts = [{ 'ttyname': '/dev/ttyACM0', 'baud': 115200, 'addr': 'fe80::b8cc:eef:1077:d8e5', 'reset_dmm_pin' : None } ]

    for i, dut in enumerate(duts):
        s = serial.Serial(dut['ttyname'], dut['baud'], timeout=0.1)
        if(s.isOpen() is False):
            s.open()
        else:
            s.close()
            s.open()
        dut['serial'] = s
   
    #print("putting MCU into a clean defined state...")
    #reset_dut(duts[0])
    prompt_sync(duts[0])
    print("MCU ready for testing!")


    # FLASH APPLICATION
    # When Json_skip is called only flash when necessary, otherwise always flash
    if args.flash is not None:
        json_dataframe = pd.read_json(args.flash[1])
        flash_necessary = False
        makefile_deps = []
        if benchmark_func == measure_energy_bench:
            makefile_deps.append("ENERGY_MEASUREMENT=1")

        for _index, row in json_dataframe.iterrows():
            # Append Dependencies for next flash
            dependency = row.get("makefile_dep")
            if dependency is not None and dependency not in makefile_deps:
                makefile_deps.append(dependency)
            
            # Avoid calling flash_needed when pickle already exists
            if args.json_skip is not None and row.get("json_name") in job_pickles:
                continue 

            # Testing whether to flash is not necesarry if it is already clear
            if not flash_necessary: 
                flash_necessary |= (get_task_work_arg_names(duts[0], row.get("json_name") == -1))

        # Dont flash when json_skip is given and flash is not necessary
        if args.json_skip is None or (args.json_skip is not None and flash_necessary):
            flash(args.flash[0], board, makefile_deps)
        else:
            print("[FLASH NOT NEEDED AND SKIPPED]")
        return
    
    # JSON BENCHMARK WORKLOAD PARSE
    bm_args:dict = None
    if len(args.benchmark) == 2:
        bm_json:list[dict] = None
        with open(args.benchmark[1]) as f:
            bm_json = json.load(f)
        #print(bm_json)
        # Find benchmark
        for bm in bm_json:
            if bm.get("bm_name") == args.benchmark[0]:
                bm_args = bm.get("args")
                break
    else:
        print("[BENCHMARK JSON FILE NOT GIVEN]")

    # JSON WORKLOAD PARSE
    task_specs = []
    # // TODO ADD job argument parametrization (varl_ist, iter_mode, iter, iter_idx) via console
    if args.json is not None:
        if benchmark_func == measure_energy_bench:
            try:
                dmm = dmm_setup(samplerate=dmm_samplerate, measure_range=dmm_measure_range)
                time.sleep(2)
            except:
                raise
                print("[DMM not connected]")
                return

        json_path, *jobs = args.json
        # TODO USE json.load instead
        json_dataframe = pd.read_json(json_path)
        json_offset_reached = False
        for index, row in json_dataframe.iterrows():
            # when specific workload names given, only append those 
            if len(jobs) > 0 and row["json_name"] not in jobs:
                continue
            
            # Skip until the given job is found
            elif args.json_offset is not None and not json_offset_reached:
                if row["json_name"] == args.json_offset:
                    json_offset_reached = True
                else:
                    continue


            # only append workloads to be performed when no pickle found in pickle outfolder
            if args.json_skip is not None and row["json_name"] in job_pickles:
                continue

            # Apply bm json file
            if bm_args != None:
                for key, value in bm_args.items():
                    row[key] = value
            
            # ADD User Definable arguments to row - OVERWRITE
            if len(freqs) > 0:
                row["freq"] = freqs
            
            if args.dvs_pol is not None:
                row["dvs_pol"] = args.dvs_pol

            if args.fwsa is not None and args.fwsa:
                row["fwsa"] = True

            if dmm is not None:
                row["dmm"] = dmm

            if args.json_sync_iter is not None:
                row["json_sync_iter_path"] = args.json_sync_iter

            filename_addon = row.get("filename_addon", default="")
            if args.filename_addon != None:
                filename_addon = args.filename_addon
            
            if args.iter_mode is not None:
                if is_NaN_None(row["iter_mode"]) or int(row["iter_mode"]) > 0:
                    row["iter_mode"] = pd.to_numeric(args.iter_mode, errors='ignore')
            
            
            # Apply bash argument
            precmdreset = MAIN_ARGUMENT_PRECMDRESET_DEFAULT
            if args.pre_cmd_reset is not None:
                precmdreset = True

            task_specs.append({'taskname'          : row["cmd_name"],
                        'function'          : functools.partial(benchmark_func, duts[0], row.to_dict()),
                        'precmdreset'       : precmdreset,
                        'description'       : 'None',
                        'filename_addon'    : filename_addon,
                        })

    # Getting flash info for pickle
    flash_info = ""
    if args.flash_info is not None:
        flash_info = git_info(args.flash_info)

    if len(jobs) > 0 and len(task_specs) == 0:
        print("[workload not found in json file]")

    print("Executing measurement tasks...")
    not_runnable_tasks = []
    for task_spec in task_specs:
        if dmm != None:
            task_spec['dmm_config'] = {"samplerate": dmm_samplerate, "measure_range":dmm_measure_range}
        task_spec['git_flash_info'] = flash_info
        task_spec['board'] = board
        ret = run_task(complete_result_path, duts, task_spec, print_info=(args.json is not None))
        if (not ret):
            not_runnable_tasks.append(task_spec.get("taskname"))
    print("[EXPERIMENT FINISHED]")
    if (len(not_runnable_tasks) > 0):
        print("NOT RUNNABLE TASKS: ", str(not_runnable_tasks))


if __name__ == "__main__":
    main()

