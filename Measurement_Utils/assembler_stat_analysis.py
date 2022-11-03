
import argparse
from curses.ascii import isdigit
import hashlib
import pickle
import sys
from typing import Dict, Any

import pandas as pd
import numpy as np
import os

import json

from pickle_to_plot import print_data_to_table
from pickle_merge import datatypes_to_pickle


def find_assembly(pkl_folder_path:str, follow_subdirectories:bool=True, suffix:str=".s") -> list[str]:
    # Find only .pkl files
    pickle_files = []
    if follow_subdirectories:
        for path, subdirs, files in os.walk(pkl_folder_path):
            for name in files:
                pickle_file_path = os.path.join(path, name)
                if suffix in pickle_file_path:
                    pickle_files.append(pickle_file_path)
    else:
        for file in os.listdir(pkl_folder_path):
            if suffix in file:
                pickle_files.append(pkl_folder_path + file)
    return pickle_files

DOUBLE_BRANCHES = ["	bl	__aeabi_dmul", "	bl	__aeabi_ddiv", "	bl	__aeabi_dsub", "	bl	__aeabi_dadd", "	bl	__aeabi_dcmpeq"]
FLOAT_BRANCHES = ["	bl	__aeabi_f2d", "	bl	__aeabi_fmul", "	bl	__aeabi_fdiv", "	bl	__aeabi_fsub", "	bl	__aeabi_fadd", "	bl	__aeabi_fcmpeq"]

def main():
    # Minimum Arguments
    p = argparse.ArgumentParser()
    p.add_argument("-p", "--path",        type=str, help="path to the folder/file (.s)", required=True, metavar=('PATH'))


    mut_group = p.add_mutually_exclusive_group(required=True)
    mut_group.add_argument("-tbl", "--table",               type=int, nargs=1, metavar=("FULL_PRINT_0_or_1"), help="show pickle-data as table in console", choices=[0, 1])
    mut_group.add_argument("-o", "--out", nargs="+", help="PATH to save the merged data", metavar=('PATH', 'NAME'))

    p.add_argument("-bnp", "--bench-name-prefix", type=str, help="PATH to save the merged data", metavar=('NAME'))

    # Additional arguments

    args = p.parse_args()

    
    print("[ASSEMBLER_TO_INSTRUCTIONLEN]")


    # Check wehther input pickle is folder or single pickle path

    path = [args.path]
    if path[0][-1] == "/":
        path = find_assembly(args.path, False, ".s")

    assembly_lengths = {"BENCH": [], "INSTRUCTION_LEN":[], "WORD_LEN":[], "ASCII_LEN":[], "FLOAT_LEN":[], "DOUBLE_LEN":[], "FLOAT_DOUBLE_LEN":[]}
    for path in path:
        file = open(path, 'r')
        instr_lengths = 0
        word_lengths = 0
        ascii_lengths = 0
        float_lengths = 0
        double_lengths = 0
        do_not_count_instr:bool = False
        for line in file.readlines():
            
            # Ignore function comments
            if line[:2] in ["	@"]:
                continue

            line = line.replace("\n", "")

            # Find function or Jump Adress beginnings
            if len(line) > 0 and line[-1] == ":":
                do_not_count_instr = False

            # Remove complete verify functions
            if "_verify_" in line:
                do_not_count_instr = True

            # word point
            if not do_not_count_instr and "	.word	" in line:
                if line.replace("	.word	", "").isdigit():
                    word_lengths += 1
                continue

            if not do_not_count_instr and "	.ascii	" in line:
                ascii_lengths += 1

                continue

            if not do_not_count_instr and any(branch in line for branch in FLOAT_BRANCHES):
                float_lengths += 1

                continue

            if not do_not_count_instr and any(branch in line for branch in DOUBLE_BRANCHES):
                double_lengths += 1

                continue
            
            # Imnstruction counting
            if not do_not_count_instr:
                instr_lengths += 1
        
        bench_name = os.path.basename(path)
        bench_name = bench_name.replace(".s", "")
        bench_name = bench_name.replace("-", "_")

        if args.bench_name_prefix is not None:
            bench_name = args.bench_name_prefix + bench_name
        
        assembly_lengths["BENCH"].append(bench_name)
        assembly_lengths["INSTRUCTION_LEN"].append(instr_lengths)
        assembly_lengths["WORD_LEN"].append(word_lengths)
        assembly_lengths["ASCII_LEN"].append(ascii_lengths)
        assembly_lengths["FLOAT_LEN"].append(float_lengths)
        assembly_lengths["DOUBLE_LEN"].append(double_lengths)
        assembly_lengths["FLOAT_DOUBLE_LEN"].append(float_lengths + double_lengths)
        

    data = pd.DataFrame.from_dict(assembly_lengths)
        
    
    # ARGUMENT HANDLE

    # Quick table viewing
    if args.table is not None:
        print("[TABLE]")
        print_data_to_table(metadata={}, dataframe=data, full=args.table[0])
    # Save merged/manipulated data to pickle
    elif args.out is not None:
        print("[SAVE]")
        if len(args.out) == 2:
           name = args.out[1]
        else:
           print("SAVE: NO NAME GIVEN")
        datatypes_to_pickle(args.out[0], name, None, data) # TODO Metadata
        print("Saving ... ", name, " to ", args.out[0])
    
    return

if __name__ == "__main__":
    main()