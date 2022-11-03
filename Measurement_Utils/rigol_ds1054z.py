#!/usr/bin/env python3

# Copyright (C) 2022 Tobias Westphal <tobias.westphal@haw-hamburg.de>
#
# This file is subject to the terms and conditions of the GNU Lesser
# General Public License v2.1. See the file LICENSE in the top level
# directory for more details.

import argparse
from enum import Enum
import io
import json
import os
import pickle
import socket
import socket as skt
import subprocess as sp
import time
from argparse import BooleanOptionalAction
from matplotlib import pyplot as plt

import nclib as nc
import usbtmc

import PIL.Image as Image
import pandas as pd

def rigol_lan_dev(ip:int, port:int) -> dict:
    return {"type": "lan", "ip": ip, "port": port}

def rigol_usbtmc_dev(idVendor:int, idProduct:int) -> dict:
    return {"type": "usbtmc", "idProduct": idVendor, "port": idProduct}

class rigol_ds1054z:
    """ 
    A class to simplify the remote control of a Rigol DS1054Z oscilloscope via SCPI commands.

    Communicates with the oscilloscope via TCP/IP over the network. For that a Netcat wrapper by the module nclib (1.0.1) is used (for now).
    
    Simplifies the functionality of:
    - taking a display screenshot (display_screenshot()),
    - sending one (send_scpi()) or multiple (send_multiple_scpi() | json_experiment()) scpi commands,
    - getting the raw wave data (wave()),
    - querying the current trigger (query_trigger_status()) or operation finished (ready()) status and more ...
    """
    def __init__(self, dev:dict, verbose:bool=False) -> None:
        self.verbose = verbose
        assert dev is not None
        dev_type = dev.get("type", None)
        assert dev_type is not None and (dev_type == "lan" or dev_type == "usbtmc")

        
        if dev_type == "lan":
            assert dev.get("ip", None) is not None and dev.get("port", None) is not None
            self.itf = nc.Netcat((dev.get("ip"), dev.get("port")), udp=False, verbose=self.verbose)
            self.itf_type = "lan"

        elif dev_type == "usbtmc":
            assert dev.get("idVendor", None) is not None and dev.get("idProduct", None) is not None
            self.itf = usbtmc.Instrument(dev.get("idVendor"), dev.get("idProduct"))
            self.itf.rigol_quirk = True
            #self.itf.timeout = 10
            #print(dev.get("idVendor"), dev.get("idProduct"))
            #self.itf = usbtmc.Instrument("USB::{}::{}::INSTR".format(dev.get("idVendor"), dev.get("idProduct")))
            self.itf_type = "usbtmc"
            #self.itf.get_capabilities()
            #print("Connected: ", str(self.itf.connected))
            print(self.itf.write("*RST\r\n"))
            print(self.itf.ask("*OPC?\r\n"))
            print("[Not implemented yet]")
            

    def __del__(self):
        if hasattr(self, "itf"):
                self.itf.close()

    def __str_to_bytearray(self, cmd: str):
        return (cmd + "\n").encode()
    
    RIGOL_OPC_CMD = "*OPC?"

    def ready(self) -> bool:
        
        recv_buf = None
        if self.itf_type == "lan":
            scpi_byte_cmd = self.__str_to_bytearray(self.RIGOL_OPC_CMD)
            self.itf.send(scpi_byte_cmd)
            recv_buf = self.itf.read_line()
        elif self.itf_type == "usbtmc":
            recv_buf = self.itf.ask(self.RIGOL_OPC_CMD) # TODO
            print(recv_buf)
        if recv_buf == b'1\n':
            return True
        elif recv_buf == b'0\n':
            return False
        else:
            raise ConnectionError

    def log(self, string:str):
        if self.verbose:
            print(str(string))

    def query_trigger_status(self) -> str:
        ret = self.send_scpi(":TRIGger:STATus?", self.SEND_SCPI_RETURN_FULL)
        return ret

    class TRIGGER_STATUS(Enum):
        TD = "TD"
        WAIT = "WAIT"
        RUN = "RUN"
        AUTO = "AUTO"
        STOP = "STOP"

    def wait_for_trigger_status(self, status_id:TRIGGER_STATUS, wait_steps_secs:float, timeout:int=None):
        trigger_status:bytearray = self.query_trigger_status()
        timeout_cnt = 0
        while(trigger_status.decode() != status_id.value):
            time.sleep(wait_steps_secs)
            trigger_status = self.query_trigger_status()
            self.log("?Wait for : {} - TRIGGER STATUS: ".format(status_id.value) + str(trigger_status))
            # Timeout handle
            timeout_cnt += 1
            if timeout != None and timeout_cnt > timeout:
                raise TimeoutError
    

    SEND_SCPI_RETURN_NONE = None
    SEND_SCPI_RETURN_FULL = 0
    def SEND_SCPI_RETURN_BYTES(n:int):
        return n

    def send_scpi(self, cmd:str, ret: None | int = SEND_SCPI_RETURN_NONE) -> None | bytearray:
        """ 
        @param: ret - only necesarry with the lan interface usage
            SEND_SCPI_RETURN_NONE aka <None>- (default) expect no return value from osci \n
            SEND_SCPI_RETURN_FULL aka <0> - expect receiving line ending of "\\n" - is automatically before return removed\n
            SEND_SCPI_RETURN_BYTES(n) aka <bigger 0 > - expect receiving exactly <n> bytes (eg. SEND_SCPI_RETURN_BYTES(10) for 10 bytes)
        """
        while(not self.ready()):
            self.log("OSCI NOT READY YET")
            time.sleep(0.5)

        self.log("Sent: " + cmd)
        
        recv_buf = bytearray()
        if self.itf_type == "lan":
            scpi_byte_cmd = self.__str_to_bytearray(cmd)
            self.itf.send(scpi_byte_cmd)        

            
            if "?" in cmd and ret != self.SEND_SCPI_RETURN_NONE:
                if ret == self.SEND_SCPI_RETURN_FULL:
                    while(len(recv_buf) == 0 or recv_buf[-1] != 0x0A):
                        recv_buf.extend(self.itf.read_all(timeout=1))
                    # Remove \n
                    recv_buf = recv_buf[:-1]
                else:
                    recv_buf.extend(self.itf.recv_exactly(ret))
            else:
                recv_buf = None

        elif self.itf_type == "usbtmc":
                recv_buf = self.itf.ask(scpi_byte_cmd) # TODO might need to be encoded to be conform with lan output
        return recv_buf

    def json_experiment(self, path:str, experiment_name:str) -> dict[str, bytearray]:
    
        # Read json file
        exp:list = None
        with open(path) as f:
            exp = json.load(f)

        # Find experiment name
        for x in range(len(exp)):
            if exp[x].get("name") == experiment_name:
                exp = exp[x].get("cmds")
                break
            elif x == (len(exp) - 1):
                print("Experiment name not found")
                return

        return self.send_multiple_scpi(exp)
        

    def send_multiple_scpi(self, commands:list[dict[str, str]]) -> dict[str, bytearray]:
        # Send commands in order
        ret_dict = {}
        for cmd in commands:
            cmd_name = cmd.get("name")
            cmd_ret_mode = cmd.get("ret", None)
            ret:bytearray = self.send_scpi(cmd_name, cmd_ret_mode)
            if cmd_ret_mode != None and ret != None:
                self.log("{}:{}".format(cmd_name, ret))
                ret_dict[cmd_name] = ret

        return ret_dict
    
    RIGOL_PNG_CMD = ":DISPLAY:DATA? ON,OFF,PNG"

    def display_screenshot(self):
        # Send scpi command
        recv_buf = self.send_scpi(self.RIGOL_PNG_CMD, self.SEND_SCPI_RETURN_FULL)

        # Cutoff header and newline at the end
        recv_buf = recv_buf[11:]

        return recv_buf

    class CHANNEL(Enum):
        CH1 = 1
        CH2 = 2
        CH3 = 3
        CH4 = 4

    class WAVE_MODE(Enum):
        NORMAL = "NORMAL"
        MAXIMUM = "MAXIMUM"
        RAW = "RAW"

    class WAVE_FORMAT(Enum):
        WORD = "WORD"
        BYTE = "BYTE"
        ASCII = "ASCII"

    WAVE_VOLTAGE_TO_MILLIVOLTAGE_FACTOR = 1000
    WAVE_RETURN_METADATA_KEY = "metadata"
    WAVE_RETURN_DATA_KEY = "data"
    WAVE_FRAMES_SCREEN_DATA = 0
    def wave(self, channel:CHANNEL=CHANNEL.CH1, frames:int=WAVE_FRAMES_SCREEN_DATA, mode:WAVE_MODE=WAVE_MODE.NORMAL, format:WAVE_FORMAT=WAVE_FORMAT.ASCII) -> dict[dict, list[int]]:
        """ 
        Returns data as list of mV samples as data part of dict
        
        # Parameters
        - channel: CHANNEL.[CH1 | CH2 | CH3 | CH4] \n
        - frames: 
            - `WAVE_FRAMES_SCREEN_DATA` -> query screen waveform data also needs mode `WAVE_MODE.NORMAL`
            - > 0 -> query frames

        """
        assert type(channel) == self.CHANNEL, "channel type is {}".format(type(channel))
        assert type(mode) == self.WAVE_MODE, "mode type is {}".format(type(mode))
        assert type(format) == self.WAVE_FORMAT, "format type is {}".format(type(format))
        assert frames >= self.WAVE_FRAMES_SCREEN_DATA, "frames input not allowed"

        if frames == self.WAVE_FRAMES_SCREEN_DATA:
            assert mode == self.WAVE_MODE.NORMAL, "Query screen data needs mode WAVE_MODE.NORMAL"

        # Waveform aquisition setup
        self.send_scpi(":STOP")
        self.send_scpi(":WAV:SOUR CHAN{}".format(channel.value))
        self.send_scpi(":WAV:MODE {}".format(mode.value))
        self.send_scpi(":WAV:FORMAT {}".format(format.value))
        yincrement = pd.to_numeric(self.send_scpi(":WAV:YINCREMENT?", self.SEND_SCPI_RETURN_FULL).decode())
        yorigin = pd.to_numeric(self.send_scpi(":WAV:YORIGIN?", self.SEND_SCPI_RETURN_FULL).decode())
        yreference = pd.to_numeric(self.send_scpi(":WAV:YREFERENCE?", self.SEND_SCPI_RETURN_FULL).decode())

        xincrement = pd.to_numeric(self.send_scpi(":WAV:XINCREMENT?", self.SEND_SCPI_RETURN_FULL).decode())
        xorigin = pd.to_numeric(self.send_scpi(":WAV:XORIGIN?", self.SEND_SCPI_RETURN_FULL).decode())
        xreference = pd.to_numeric(self.send_scpi(":WAV:XREFERENCE?", self.SEND_SCPI_RETURN_FULL).decode())

        
        self.log("yincrement: {}".format(yincrement))
        self.log("yorigin: {}".format(yorigin))
        self.log("yreference: {}".format(yreference))
        self.log("xincrement: {}".format(xincrement))
        self.log("xorigin: {}".format(xorigin))
        self.log("xreference: {}".format(xreference))

        # Waveform aquisition - read batches
        recv_buf = bytearray()
        if frames == self.WAVE_FRAMES_SCREEN_DATA:
            recv_buf.extend(self.send_scpi(":WAV:DATA?", self.SEND_SCPI_RETURN_FULL)[11:])
        else:
            for batch in range(frames):
                start = 1 + 125000 * batch
                stop = 125000 + 125000 * batch
                self.send_scpi(":WAV:STAR {}".format(start))
                self.send_scpi(":WAV:STOP {}".format(stop))
                recv_buf.extend(self.send_scpi(":WAV:DATA?", self.SEND_SCPI_RETURN_FULL)[11:])

        # Waveform data tansform to mV samples
        transformed = []
        for b in recv_buf:
            transformed.append(int((b - yorigin - yreference) * yincrement * self.WAVE_VOLTAGE_TO_MILLIVOLTAGE_FACTOR))
        self.log(transformed)
        return {self.WAVE_RETURN_METADATA_KEY: {"yincrement":yincrement, "yorigin":yorigin, "yreference":yreference, "xincrement":xincrement, "xorigin": xorigin, "xreference":xreference}, self.WAVE_RETURN_DATA_KEY: transformed}

DEFAULT_LAN_IP = "141.22.28.141"
DEFAULT_LAN_PORT = 5555

DEFAULT_USB_ID_VENDOR = 0x1ab1
DEFAULT_USB_ID_PRODUCT = 0x04ce

def main():
    p = argparse.ArgumentParser()
    # Positional Arguments
    dev_mut_group = p.add_mutually_exclusive_group(required=True)
    dev_mut_group.add_argument("--ip",  type=str,  help="ip adress of the oscilloscope")
    dev_mut_group.add_argument("--usb",  action=argparse.BooleanOptionalAction,  help="ip adress of the oscilloscope")

    # Optional Arguments
    p.add_argument("--port",  type=int,  help="port of scpi", required=False)
    p.add_argument("-v", "--verbose", action=argparse.BooleanOptionalAction, help="log debug", required=False)

    # XOR Arguments
    mut_group = p.add_mutually_exclusive_group(required=True)
    mut_group.add_argument("--png",        nargs=2, type=str, metavar=("PATH", "NAME"),
                           help="save visible display to image at PATH")
    mut_group.add_argument("--scpi",       type=str, nargs="+", metavar=(
        "CMD", "RET"), default=None, help="send given scpi CMD and expect RET as return")
    mut_group.add_argument("--trigger",    action=argparse.BooleanOptionalAction,
                           help="Perform a single trigger setup - demonstrates the send_scpi_multiple command")
    mut_group.add_argument("--wave",       type=str, nargs=6, metavar=("CHANNEL", "FRAMES", "MODE", "FORMAT", "FILEPATH", "FILENAME"),
                           help="read the waveform data of channel CHANNEL for FRAMES frames. OPTIONS: --wave [CH1|CH2|CH3|CH4] [n] [NORMAL|MAXIMUM|RAW] [BYTE|WORD|ASCII] /home very_cool_wave")
    mut_group.add_argument("--exp",        type=str, nargs=2, metavar=("JSON-PATH",
                           "EXP_NAME"),  help="run oszi experiment EXP_NAME of json file at JSON_PATH")
    

    args = p.parse_args()

    verbose = False
    if args.verbose is not None:
        verbose = True

    # IP handle
    dev = None
    if args.ip is not None:
        dev = {"type": "lan" ,"ip":None, "port":DEFAULT_LAN_PORT}
        dev["ip"] = args.ip
        if dev["ip"] == "default":
            dev["ip"] = DEFAULT_LAN_IP

        if args.port is not None:
            dev["port"] = args.port
    elif args.usb is not None:
        dev = {"type": "usbtmc" ,"idVendor":None, "idProduct":DEFAULT_LAN_PORT}
        dev["idVendor"] = DEFAULT_USB_ID_VENDOR
        dev["idProduct"] = DEFAULT_USB_ID_PRODUCT
        print(usbtmc.list_devices())

    # Connect to Osci
    rigol = rigol_ds1054z(dev, verbose)

    if args.scpi != None:
        cmd_arg = args.scpi[0]
        if len(args.scpi) < 2:
            ret_arg = rigol.SEND_SCPI_RETURN_NONE
        else:
            ret_arg = args.scpi[1]

        if ret_arg == "None":
            ret_arg = rigol.SEND_SCPI_RETURN_NONE
        elif ret_arg == "FULL":
            ret_arg = rigol.SEND_SCPI_RETURN_FULL
        else:
            ret_arg = pd.to_numeric(ret_arg)
        
        print(ret_arg)
        print(type(ret_arg))
        # Send scpi command
        ret_cmd = rigol.send_scpi(cmd_arg, ret_arg)
        print("Send to {}:{} command: {}".format(dev, cmd_arg))
        if ret_cmd != None:
            print("RET CMD: " + str(ret_cmd))

    elif args.trigger != None:

        # Setup command list
        cmd_list = [
            {"name": ":CHANnel1:DISPlay ON"},
            {"name": ":CHANnel2:DISPlay ON"},
            {"name": ":TRIGger:EDGe:SOURce CHANnel1"},
            {"name": ":TRIGger:EDGe:SLOPe Negative"},
            {"name": ":TRIGger:EDGe:LEVel 2.0"},
            {"name": ":ACQuire:TYPE NORMAL"},
            {"name": ":ACQuire:MDEPth AUTO"},
            {"name": ":TIMebase:MAIN:SCALe 0.0000002"},
            {"name": ":TIMebase:MAIN:OFFSet 0.0000008"},
            {"name": ":channel1:scale 1"},
            {"name": ":channel2:scale 1"},
            {"name": ":channel1:OFFset -2.5"},
            {"name": ":channel2:OFFset -2.5"},
            {"name": ":MEASure:ITEM fdelay"},

            {"name" : ":SINGLE"}
            ]

        # Send scpi commands
        rigol.send_multiple_scpi(cmd_list)

    elif args.exp != None:
        rigol.json_experiment(args.exp[0], args.exp[1])

    elif args.png != None:
        ret_buff = rigol.display_screenshot()

        if args.png[1][:4] != ".png":
            args.png[1] += ".png"

        # Save image data to file
        with open(args.png[0] + "/" + args.png[1], "wb") as f:
            f.write(ret_buff)
        
        print("Image saved to: " + args.png[0] + " with name: " + args.png[1])

    elif args.wave != None:
        wave_channel = rigol.CHANNEL[args.wave[0]]
        wave_frames = pd.to_numeric(args.wave[1])
        wave_mode = rigol.WAVE_MODE[args.wave[2]]
        wave_format = rigol.WAVE_FORMAT[args.wave[3]]
        ret_wave = rigol.wave(wave_channel, wave_frames, wave_mode, wave_format)

        metadata = {"shell_channel":wave_channel, "shell_frames": wave_frames, "shell_mode": wave_mode, "shell_format": wave_format}
        metadata.update(ret_wave[rigol.WAVE_RETURN_METADATA_KEY])

        outfile = open(args.wave[4] + "/" + args.wave[5] + ".pkl", "wb")
        pickle.dump({ 'metadata': metadata, 'data' : ret_wave[rigol.WAVE_RETURN_DATA_KEY]}, outfile)
        outfile.close()

    return


if __name__ == "__main__":
    main()
