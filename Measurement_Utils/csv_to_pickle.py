#!/usr/bin/env python3

# Copyright (C) 2022 Tobias Westphal <tobias.westphal@haw-hamburg.de>
#
# This file is subject to the terms and conditions of the GNU Lesser
# General Public License v2.1. See the file LICENSE in the top level
# directory for more details.


import argparse
import hashlib
import pickle
import sys
from typing import Dict, Any

import pandas as pd
import numpy as np
import os

import json

from experiment_to_pickle_constants import COL_NAME_BENCH_REPETITION, COL_NAME_ENERGY_BENCH_CURRENT, COL_NAME_TRACE_DELAY_DELAY, COL_NAME_TRACE_SAMPLES_WAVE, BENCHMARK_TYPES, SWO_BENCH_INDEX_TO_CNTTYPE, DVS_POL_INDEX_TO_STRING, METADATA_MODFICATION_KEY

from pickle_to_plot import DEFAULT_ERROR, REPETITION_STATISTICS_COL_NAMES, meta_to_benchmark_type, parse_argument_list, pickle_folders_to_datatypes, meta_get_workload_params, dataframe_create_column, data_find_outliers, dataframe_repetition_statistics, dataframe_proportion_column, dataframe_column_idxval_to_strval, dataframe_merge_column_to_row, dataframe_merge_energy_swo_data, parse_arguments_feature_selection, dataframe_select_features, dataframe_remove_rows_with_outliers, dataframe_remove_features, dataframe_calculate_with_col, parse_arguments_proportion, parse_arguments_column_labels, print_data_to_table, pickle_to_datatypes, dataframe_flatten, ARGUMENT_PROPORTION_OPERATIONS

from pickle_merge import datatypes_to_pickle


def main():
    # Minimum Arguments
    p = argparse.ArgumentParser()
    p.add_argument("-c", "--csv",        type=str, nargs=2, help="path to the file (.csv)", required=True, metavar=('PATH', "ROW-TO-USE-AS-LABELS"))


    mut_group = p.add_mutually_exclusive_group(required=True)
    mut_group.add_argument("-tbl", "--table",               type=int, nargs=1, metavar=("FULL_PRINT_0_or_1"), help="show pickle-data as table in console", choices=[0, 1])
    mut_group.add_argument("-o", "--out", nargs="+", help="PATH to save the merged data", metavar=('PATH', 'NAME'))

    # Additional arguments

    ## Data Manipulation
    p.add_argument("-csc", "--column-scale", nargs=3, metavar=("COLUMN-NAME", "SCALE-FACTOR", "SCALE-OPERATION"), help="scale a given column with a given operation by a given scale factor")
    p.add_argument("-prop", "--proportion", nargs=4, metavar=("[DIV/SUB]", "PROP_COL_NAME", "REFERENCE_FEATURE_COL_VAL", "SAME_FEATURE_LIST"), help="calculate the proportion between values of the same column. SAME_FEATURE_LIST: eg. operation:storage or None")
    p.add_argument("-repst", "--repetition-statistics", nargs=2, type=str, metavar=("COL-NAME-TO-STAT-LIST", "DIFF-COL-NAME-LIST"), help="calculate mean, std and var between the repetition on the given column name by grouping the data by DIFF_COL_NAME_LIST eg. FREQ:COL1:COL2 . The column name values should be int or float.")
    p.add_argument("-erepst", "--energy-repetition-statistics", action=argparse.BooleanOptionalAction, help="calculate mean, std and var between the repetition on the current data")
    p.add_argument("-dr", "--drop",         nargs="+", help="drop the given column type before plotting", metavar=('COLUMN_NAME'))
    p.add_argument("-fs", "--feature-selection", nargs='+', help="select a value of a column to decrease the dimension of plotting. eg. DVS_POL:0 FWSA:0", metavar=('COLUMN_VALUE_PAIR'))
    p.add_argument("-fr", "--feature-removal", nargs='+', help="select a value of a column that should be removed for plotting. eg. DVS_POL:0 FWSA:0", metavar=('COLUMN_VALUE_PAIR'))

    p.add_argument("-do", "--drop-outliers", nargs='+', help="select a columns to run a outlier removal on.", metavar=('COLUMN'))

    p.add_argument("-rc", "--rename-column", nargs=2, help="select a columns to rename to RENAME", metavar=('COLUMN', "RENAME"))

    p.add_argument("-cc", "--create-column", nargs=4, help="Create a new colum that is based on the combination of other columns.", metavar=('NAME', 'COLUMN-1', 'COLUMN-2', 'OPERATION'))
    p.add_argument("-fl", "--flatten-ucol", action=argparse.BooleanOptionalAction, help="Flatten the benchmark dataframe by ")

    p.add_argument("-num", "--numeric", type=str, help="Flatten the benchmark dataframe by ", metavar=("COL-LIST"))

    ## Plot Labeling and saving Labeling

    p.add_argument("-cl", "--column-labels", nargs="+", metavar=("COLNAME-STR-DICT"), help="Rename index based labels to human-readable labels. Input convention: COLNAME?INDEX:LABEL[?INDEX:LABEL] eg. swo_mode?0:REF?1:DEMCR?2:DEMCR_SWOPIN")

    args = p.parse_args()

    
    print("[CSV-TO-PICKLE]")


    # Check wehther input pickle is folder or single pickle path
    if args.csv[-1] == "/":
        return 1

    
        
    # DATA MANIPULATION
    # csv to DataFrame 
    column_label_row = 'infer'
    if (args.csv[1] != "None"):
        column_label_row = pd.to_numeric(args.csv[1])
    data:pd.DataFrame = pd.read_csv(args.csv[0], sep=";", header=column_label_row)
    m_columns = list(data.columns)
    for i, col in enumerate(m_columns):
        if " " in col:
            m_columns[i] = m_columns[i].replace(" ", "")
        if "#" in col:
            m_columns[i] = m_columns[i].replace("#", "")
    data.columns = m_columns

    if args.numeric is not None:
        cols = parse_argument_list(args.numeric)
        print("[NUMERIC WITH {}".format(cols))
        data[cols] = data[cols].apply(pd.to_numeric, errors='ignore')
        print("New DTypes:")
        print(data.dtypes)
        print()
    
    if args.rename_column is not None:
        data.rename(columns={args.rename_column[0]: args.rename_column[1]}, inplace=True)
    
    if args.feature_selection is not None:
        features = parse_arguments_feature_selection(args.feature_selection)
        #print(data.head(23))
        data = dataframe_select_features(data, features)
        #print(data.head(1))
        #return

    if args.feature_removal is not None:
        features = parse_arguments_feature_selection(args.feature_removal)
        #print(data.head(23))
        data = dataframe_remove_features(data, features)
        #print(data.head(1))
        #return

    # Drop a column that is special to the taskname but not interesing for plotting purposes
    if args.drop is not None:#
        columns = data.columns
        for dr in args.drop:
            if dr in columns:
                del data[dr]

    if args.column_scale is not None:
        # Apply value_col scale
        data = dataframe_calculate_with_col(data, args.column_scale[0], pd.to_numeric(args.column_scale[1]), args.column_scale[2])
       

    if args.create_column is not None:
        data = dataframe_create_column(data, args.create_column[0], args.create_column[1:-1], args.create_column[3])
    
    if args.proportion is not None:
        (col_feature, reference_feature_tuple, same_features) = parse_arguments_proportion(args.proportion[1:])
        operation = args.proportion[0].lower()
        if operation in ARGUMENT_PROPORTION_OPERATIONS:
            data = dataframe_proportion_column(data, operation, col_name_to_prop=col_feature, same_features=same_features, reference_feature=reference_feature_tuple)
    
    # Argument col value rename
    if args.column_labels is not None:
        labels = parse_arguments_column_labels(args.column_labels)
        for key, value in labels.items():
            data = dataframe_column_idxval_to_strval(data, key, value)

    # ARGUMENT HANDLE

    # Quick table viewing
    if args.table is not None:
        print("[TABLE]")
        #print(args.table[0])
        print_data_to_table(metadata=None, dataframe=data, full=args.table[0]) # TODO Metadata
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