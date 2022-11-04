#!/usr/bin/env python3

# Copyright (C) 2022 Tobias Westphal <tobias.westphal@haw-hamburg.de>
#
# This file is subject to the terms and conditions of the GNU Lesser
# General Public License v2.1. See the file LICENSE in the top level
# directory for more details.

import argparse
from copy import deepcopy
from curses import meta
import itertools
import sys
from turtle import color
from weakref import ref
from matplotlib import ticker
import matplotlib
from matplotlib.lines import Line2D

import seaborn as sns;
import pandas as pd
import numpy as np
from scipy import stats
from scipy.optimize import curve_fit

import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.offsetbox import AnchoredText
import os

from minepy import MINE

import json

from experiment_to_pickle_constants import BENCH_NAME_GROUP_TO_NAME_LIST, COL_NAME_BENCH_REPETITION, COL_NAME_CURRENT_STAT_MEAN, COL_NAME_ENERGY_BENCH_CURRENT, COL_NAME_TRACE_DELAY_DELAY, COL_NAME_TRACE_SAMPLES_WAVE, BENCHMARK_TYPES, EMPIRIC_STAT_POWER, EMPIRIC_STAT_POWER_BEEBS, FLASH_CACHE_TO_STRING, SWO_BENCH_FLASH_CACHE_COL, SWO_BENCH_INDEX_TO_CNTTYPE, METADATA_MODFICATION_KEY, DVS_POL_INDEX_TO_STRING, COL_NAME_BENCH_CACHE, SWO_BENCH_CNT_TYPE_COL, COL_NAME_CURRENT_STAT_MEDIAN, COL_NAME_CURRENT_STAT_MODE, SWO_BENCH_DVS_POL_COL, EMPIRIC_STAT_POWER, COL_NAME_CURRENT_STAT_MIN, COL_NAME_CURRENT_STAT_MAX, SWO_BENCH_INDEX_TO_ENCODING, SWO_BENCH_INDEX_TO_FREQ, SWO_BENCH_FREQ_COL


from rigol_ds1054z import rigol_ds1054z


INDEX_TO_COLOR = {0:'g', 1:'r', 2:'b', 3:"y", 4:"m", 5:"k", 6:"c"}
INDEX_TO_COLOR_REVERSED = {6:'g', 5:'r', 4:'b', 3:"y", 2:"m", 1:"k", 0:"c"}
INDEX_TO_STYLE = {0:'-', 1:'--', 2:':', 3:"-.", 4:(0, (3, 10, 1, 10, 1, 10)), 5:(0, (3, 10, 1, 10))}
INDEX_TO_MARKER = {0:'o', 1:'v', 2:'1', 3:"s", 4:"X", 5:"D"}

SAVE_FILE_TYPE = ".pdf"


SWO_BENCH_DEFAULT_COL_SHOWED = "CNT_NORM"
SWO_BENCH_DEFAULT_IDX_SHOWED = "CNT_TYPE"
SWO_BENCH_DEFAULT_NOT_USED_COL = ["BENCH", "TIME_DIFF_US", "ITERATIONS", "CNT", "CYC_DIFF", "CNT_NORM"]
SWO_BENCH_DEFAULT_COL = ["BENCH", "CNT_TYPE", "TIME_DIFF_US", "ITERATIONS", "CNT", "CYC_DIFF", "CNT_NORM"]

DEFAULT_PLOT_META = {"bench_config" : "CONFIG-DVFS"}

EMPIRIC_STAT_POWER_DATAFRAME:pd.DataFrame = pd.DataFrame(columns=["FREQ", "DVS_MV", "POWER_STAT_CALC"], data=EMPIRIC_STAT_POWER)
EMPIRIC_STAT_POWER_BEEBS_DATAFRAME:pd.DataFrame = pd.DataFrame(columns=["DVS_MV", "POWER_STAT_CALC"], data=EMPIRIC_STAT_POWER_BEEBS)


DEFAULT_ERROR = -1

FIGSIZE_FULL = (12, 8)

ARGUMENT_PROPORTION_OPERATIONS = ["div", "sub"]

SWO_TIM_CNT_READING_TO_ACTUAL_CYCLES = 256 / 5

# Dataframe manipulation/ querying functions

def dataframe_column_idxval_to_strval(data:pd.DataFrame, col:str, map:dict[int, str]):
    if map is not None and col in data.columns:
        # Rename CNT_TYPE IDX to actual counter name
        data[col] = data[col].replace(map)

        # Sort dependent of the dict order of INDEX_TO_CNTTYPE for easier comparison
        data[col] = pd.CategoricalIndex(data[col], list(map.values()))
    return data

def data_find_outliers(data:pd.Series | list, std_deviations_border:int=3, method:str="iqr") -> list[int]:
    """ Return elements that are outliers 
    
    ## Parameters:
    method:[zscore | iqr | equal]"""
    ret_list = []
    if method == "zscore":
        ret_list = np.where(np.abs(stats.zscore(data)) > std_deviations_border)[0]
    elif method == "iqr":
        data_sorted = sorted(data)
        q1 = np.percentile(data_sorted, 25, interpolation="midpoint")
        q3 = np.percentile(data_sorted, 75, interpolation="midpoint")
        iqr = q3 - q1
        upper_bound = (q3 + (1.5*iqr))
        lower_bound = (q3 -(1.5*iqr))
        # print(upper_bound)
        # print(lower_bound)
        ret_list.extend(np.where(data > upper_bound + 1)[0])
        ret_list.extend(np.where(data < lower_bound - 1)[0])
        ret_list = list(dict.fromkeys(ret_list))
    elif method == "equal":
        data_list = data.to_list()
        counter = {i:data_list.count(i) for i in data_list}
        #print(counter)
        outliers = list(filter((sorted(counter, key=counter.get)[-1]).__ne__, data_list))
        #print(outliers)
        for lier in outliers:
            ret_list.extend(np.where( data == lier)[0])
        #print(data_list)
    
    #print(ret_list)
    #assert False
    return ret_list

def dataframe_remove_rows_with_outliers(data:pd.DataFrame, col:str, std_deviations_border:int=3, method:str="iqr", grouping_cols:list[str]=None) -> pd.DataFrame:
    grouping = [(None, data)]
    if grouping_cols is not None:
        grouping = data.groupby(grouping_cols, observed=True)
    ret_data_list = []
    for name, group in grouping:
        #print(group)
        group = group.reset_index(drop=True)
        outliers = data_find_outliers(group[col], std_deviations_border=std_deviations_border, method=method)
        if len(outliers) > 0:
            print("     [{}: AT {} VIA {} OUTLIERS FOUND {} - OTHERS: {}]".format(group["BENCH"].values[0] if "BENCH" in group.columns else None, name, col, list(group[col].iloc[outliers]), (list(group[col]))))
        #print(data.iloc[outliers])
        ret_data_list.append(group.drop(index=outliers))
    return pd.concat(ret_data_list, ignore_index=True)

def dataframe_remove_cols(data:pd.DataFrame, remove_except:list[str]=[None]):
    """ 
    Filter out all not used columns except those of the given filter_except(default=DEFAULT_COL_SHOWED) and DEFAULT_IDX_SHOWED.
     """
    for item in data.columns:
        if item not in remove_except:
            del data[item]

    return data

def dataframe_filter_swo_bench_cols(data:pd.DataFrame, filter_except:str=SWO_BENCH_DEFAULT_COL_SHOWED):
    """ 
    Filter out all not used columns except those of the given filter_except(default=DEFAULT_COL_SHOWED) and DEFAULT_IDX_SHOWED.
     """
    for item in SWO_BENCH_DEFAULT_NOT_USED_COL:
        if item != filter_except and item != SWO_BENCH_DEFAULT_IDX_SHOWED:
            del data[item]

    return data

def dataframe_append_benchname_with_filename(data:pd.DataFrame, filename:str, col:str) -> pd.DataFrame:
    task_name = data[col][0]
    if task_name != filename:
        name_length = len(task_name)
        filename = filename[:name_length] + '\n' + filename[name_length + 1:]
        data[col] = data[col].replace(task_name,filename)
    return data

REPETITION_STATISTICS_COL_NAMES = ["REP_NUM", "REP_MEAN", "REP_STD", "REP_VAR", "REP_MIN", "REP_MAX", "REP_MEDIAN", "REP_MODE", "REP_STD_ERR"]
def dataframe_repetition_statistics(data:pd.DataFrame, col_name_to_stat:list[str] | str, diff_features:list[str], repetition_necesarry:bool=True, prior_outlier_removal:bool=False) -> pd.DataFrame:
    col_name_to_stat_on_type = type(col_name_to_stat)
    assert col_name_to_stat_on_type is list or col_name_to_stat_on_type is str

    # To make further handling more uniform
    if col_name_to_stat_on_type is str:
        col_name_to_stat = [col_name_to_stat]

    repetitions = 0
    if repetition_necesarry:
        # Repetition statistics cant be calculated without repetition
        repetitions = len(data[COL_NAME_BENCH_REPETITION].unique())
        assert repetitions > 1, "[NO REPETITIONS FOUND]"

    repetition_groups = data.groupby(diff_features, as_index=False, observed=True)
    if repetition_necesarry:
        # Prevent unwanted results because of wrong grouping
        grouped_size = repetition_groups.size()["size"].iloc[0]
        assert grouped_size == repetitions or (prior_outlier_removal and grouped_size < repetitions), "[group size does not match repetition amount [ {} should be {}]]".format(grouped_size, repetitions) + "\n" + data.head(grouped_size).to_string()

    
    input_data_column_names = list(data.columns)
    stat_column_names = [REPETITION_STATISTICS_COL_NAMES[0]]
    # Adjust calculation column names to given column name
    for col in col_name_to_stat:
        stat_column_names.extend(list(map(lambda x : col + "_" + x, REPETITION_STATISTICS_COL_NAMES[1:])))
    

    #print(stat_column_names)
    #return

    ret_data_column_names = input_data_column_names
    ret_data_column_names.extend(stat_column_names)

    ret_data = pd.DataFrame(columns=ret_data_column_names)
    first_group_passed = False

    for name, group in repetition_groups:
        if not repetition_necesarry and not first_group_passed:
            first_group_passed = True
            repetitions = len(group) # Number of rows
        
        base_data_frame:pd.DataFrame = group.head(1).reset_index(drop=True)

        if repetition_necesarry:
            del base_data_frame[COL_NAME_BENCH_REPETITION]

        stat_dict:dict = {REPETITION_STATISTICS_COL_NAMES[0] : repetitions}
        for col in col_name_to_stat:
            del base_data_frame[col]

            stat_raw_data_list:list = group[col].tolist()
            
            # Calculate statistical data on the given column between repetion rows
            #stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[0]] = repetitions # rep_num
            stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[1]] = np.mean(stat_raw_data_list) # Mean
            stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[2]] = np.std(stat_raw_data_list) # Std
            stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[8]] = np.std(stat_raw_data_list) / np.sqrt(np.size(stat_raw_data_list)) # std_error
            stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[3]] = np.var(stat_raw_data_list) # Var
            stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[4]] = np.min(stat_raw_data_list) # min
            stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[5]] = np.max(stat_raw_data_list) # max
            stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[6]] = np.median(stat_raw_data_list) # median
            stat_dict[col + "_" + REPETITION_STATISTICS_COL_NAMES[7]] = stats.mode(stat_raw_data_list, nan_policy='omit') # mode - most common values

        # Join base and calculated data row to one row
        stat_dict = pd.DataFrame([stat_dict], columns=stat_column_names)
        base_data_frame = base_data_frame.join(stat_dict, rsuffix="REP_SECOND_" if "REP_NUM" in stat_dict.columns and not repetition_necesarry else "")
        
        # Concat joined data row to complete dataframe
        if ret_data.empty:
            ret_data = base_data_frame
        else:
            ret_data = pd.concat([ret_data, base_data_frame], ignore_index=True)

    #print(ret_data)
    return ret_data

def dataframe_proportion_column(data:pd.DataFrame, operation:str, col_name_to_prop:str, same_features:list[str]| None, reference_feature:tuple, new_col_name:str=None, other_col:str=None) -> pd.DataFrame:

    """ 
    If `other_col` is `None`, calculate the proportion for each row of column `col_name_to_prop` to the `col_name_to_prop` row with feature `reference_feature`.

    If `other_col` is not `None`, calculate the proportion for each row of column `col_name_to_prop` to the `other_col` row with feature `reference_feature`.

    ## Parameters

    operation : {"div", "sub"}
        operation of proportion

    col_name_to_prop :
        DataFrame Column that should be source of manipulation

    same_features :
        list of columns that the dataframe should be grouped by

    reference_feature:
        selects the row the proportion should be calculated to

    new_col_name: default= None
        if given, name of result column that is created by the proportion calculation
        if None, `col_name_to_prop` appended by proportion `operation`: `col_name_to_prop`_PROP_`operation`

    other_col : default= None
        reference col to do the operation with the column `col_name_to_prop`
        if other_col != None: `col_name_prop` `operation` by `other_col` (of reference feature row)
        if other_col == None: `col_name_prop` `operation` by `col_name_prop` (of reference feature row)
    
    ## Return

    DataFrame with new column of calculated proportion
    """
    
    if operation not in ARGUMENT_PROPORTION_OPERATIONS:
        return data
    suffix = "_PROP_" + operation.upper()
    if new_col_name is None:
        new_col_name = col_name_to_prop + suffix

    def do_prop_calculation(concat_frame:pd.DataFrame, group:pd.DataFrame, ref_feat:tuple, prop_col:str, ret_col_name:str, op:str, other_col:str):
        reference = group[group[ref_feat[0]] == ref_feat[1]][prop_col if other_col is None else other_col]
        if len(reference.index) > 1:
            arr = reference.to_numpy()
            assert np.all(arr == arr[0]), "dataframe_proportion_column: multiple reference_features found .. cant select value 0 as they are not all equal: {}".format(group[group[ref_feat[0]] == ref_feat[1]].to_string())
            reference = reference.values[0]
        if op == "div":
            group[ret_col_name] = group[prop_col].agg(lambda x : x / reference)
        elif op == "sub":
            group[ret_col_name] = group[prop_col].agg(lambda x : x - reference)
        return pd.concat([concat_frame, group])

    
    new_data = pd.DataFrame(columns=list(data.columns).append(new_col_name))
    if same_features != None and same_features != []:
        ## GROUP-BY Usage - by same_features
        groups = data.groupby(same_features, as_index=False, observed=True)
        for name, group in groups:
            new_data = do_prop_calculation(new_data, group, reference_feature, col_name_to_prop, new_col_name, operation, other_col)
    else:
        ## Data is already the group
        new_data = do_prop_calculation(new_data, data, reference_feature, col_name_to_prop, new_col_name, operation, other_col)

    return new_data

def dataframe_operation_row(data:pd.DataFrame, operation:str, cols_to_calculate_on:list[str], cols_group_by:list[str]| None, specific_row_features: dict[str, list[str]], element_name:str=None, remove_aggregated:bool=True) -> pd.DataFrame:
    """ 
    Calculates row-wise things appends the new calculated rows but keeps old data 
    
    ## Parameters

    element_name : str
        name of col rows that are calculated

    oepration : str[sum, diff, quot]
    """
    assert operation in ["sum", "diff", "quot"], operation
    assert all(col in data.columns for col in cols_to_calculate_on) and len(cols_to_calculate_on) > 0, cols_to_calculate_on
    assert cols_group_by is None or all(col in data.columns for col in cols_group_by), cols_group_by
    assert all(col in data.columns for col in specific_row_features.keys()), specific_row_features
    
    grouping = [(None, data)]
    if cols_group_by is not None and len(cols_group_by) > 0:
        grouping = data.groupby(cols_group_by, observed=True)
    
    concat_data = []

    for name, gr in grouping:
        f_gr:pd.DataFrame = dataframe_select_features(gr, {"equal":specific_row_features}, False)
        if f_gr.empty:
            continue

        ref_row = f_gr.head(1).copy()
        
        for key, _ in specific_row_features.items():
            if element_name is not None:
                ref_row[key] = element_name
            else:
                ref_row[key] = operation

        for col in cols_to_calculate_on:
            if operation == "sum":
                ref_row[col] = f_gr[col].sum()
            if operation == "diff":
                # print(list(specific_row_features.keys())[0])
                first_feature_key = list(specific_row_features.keys())[0]
                first_index_feature = {first_feature_key : [specific_row_features[first_feature_key][0]]}
                other_index_feature = {first_feature_key : specific_row_features[first_feature_key][1:]}
                first_feature_row = dataframe_select_features(f_gr, {"equal":first_index_feature}, False)
                other_feature_rows = dataframe_select_features(f_gr, {"equal":other_index_feature}, False)
                ref_row[col] = first_feature_row[col].iloc[0] - (other_feature_rows[col].sum())
            
            if operation == "quot":
                # print(list(specific_row_features.keys())[0])
                first_feature_key = list(specific_row_features.keys())[0]
                first_index_feature = {first_feature_key : [specific_row_features[first_feature_key][0]]}
                other_index_feature = {first_feature_key : specific_row_features[first_feature_key][1:]}
                first_feature_row = dataframe_select_features(f_gr, {"equal":first_index_feature}, False)
                other_feature_rows = dataframe_select_features(f_gr, {"equal":other_index_feature}, False)
                ref_row[col] = first_feature_row[col].iloc[0] / (other_feature_rows[col].sum())

        concat_data.append(ref_row)
    
    if remove_aggregated:
        data = dataframe_remove_features(data, {"equal" : specific_row_features})

    if len(concat_data) > 0:
        data =  pd.concat([data] + concat_data, ignore_index=True)
    return data

def dataframe_select_features_combinations(data:pd.DataFrame, features:list[list[dict[str, dict]]], reset_index:bool=True):

    """ 
    Select conditional column values of two dataframe columns.

    Example: All rows with Column Type 4 should be higher than 50
            [[ {"equal": {"CNT_TYPE": 4}}, {"bigger": {"CNT_NORM": 50}}]]
    
    # Parameters
    - data:pd.Dataframe
    - features:  Example: [[ {"equal": {"CNT_TYPE": 4}}, {"bigger": {"CNT_NORM": 50}}], ...]
    """

    for cond in features:
        assert len(cond) == 2

        work_on_data = dataframe_select_features(data, cond[0])
        remaining_data = dataframe_remove_features(data, cond[0])

        work_on_data = dataframe_select_features(data, cond[1])

        data = pd.concat([remaining_data, work_on_data], ignore_index=True)

    
    if reset_index:
        data = data.reset_index(drop=True) # IMPORTANT
    
    return data

def dataframe_select_features(data:pd.DataFrame, features:dict[str, int | str | list[int | str]], reset_index:bool=True):
    """ 
    Select one or multiple values of dataframe column.
    
    # Parameters
    - data:pd.Dataframe
    - features:dict["equal", dict[COLUMN-NAME, VALUE | list[VALUE]]; \n
                    "less", dict[COLUMN-NAME, VALUE | list[VALUE]]; \n
                    "bigger", dict[COLUMN-NAME, VALUE | list[VALUE]]]: \n
    """
    # Equal
    #print(features)
    if "equal" in features:
        for feature_k, feature_v in features['equal'].items():
                #data = data.loc[data[feature_k] == feature_v]
                if type(feature_v) is not list:
                    feature_v = [feature_v]

                

                bool_series:pd.Series = None
                for v in feature_v:
                    col_sel = data.index
                    if feature_k != "index":
                        col_sel = data[feature_k]
                
                    if bool_series is None:
                        bool_series = (col_sel == v)
                    else:
                        bool_series |= (col_sel == v)
                    

                data = data[bool_series]
    
    
    # Less
    if "less" in features:
        for feature_k, feature_v in features["less"].items():
                #data = data.loc[data[feature_k] == feature_v]
                if type(feature_v) is not list:
                    feature_v = [feature_v]

                bool_series:pd.Series = None
                for v in feature_v:
                    col_sel = data.index
                    if feature_k != "index":
                        col_sel = data[feature_k]

                    if bool_series is None:
                        bool_series = (col_sel < v)
                    else:
                        bool_series |= (col_sel < v)
                    
                data = data[bool_series]

    
    # Bigger
    if "bigger" in features:
        for feature_k, feature_v in features["bigger"].items():
                #data = data.loc[data[feature_k] == feature_v]
                if type(feature_v) is not list:
                    feature_v = [feature_v]

                bool_series:pd.Series = None
                for v in feature_v:

                    col_sel = data.index
                    if feature_k != "index":
                        col_sel = data[feature_k]
                    
                    if bool_series is None:
                        bool_series = (col_sel > v)
                    else:
                        bool_series |= (col_sel > v)
                   

                data = data[bool_series]
    
    if reset_index:
        data = data.reset_index(drop=True) # IMPORTANT
    
    return data

def dataframe_remove_features(data:pd.DataFrame, features:dict): # TODO does not really work
    # Equal
    if "equal" in features:
        for feature_k, feature_v in features["equal"].items():
            if type(feature_v) is not list:
                feature_v = [feature_v]

            for feature_v_i in feature_v:
                col_sel = data.index
                if feature_k != "index":
                    col_sel = data[feature_k]

                data = data[col_sel != feature_v_i]


    # Less
    if "less" in features:
        for feature_k, feature_v in features["less"].items():
                if type(feature_v) is not list:
                    feature_v = [feature_v]

                for feature_v_i in feature_v:
                    col_sel = data.index
                    if feature_k != "index":
                        col_sel = data[feature_k]

                    data = data[col_sel < feature_v_i]
    
    # Bigger
    if "bigger" in features:
        for feature_k, feature_v in features["bigger"].items():
                if type(feature_v) is not list:
                    feature_v = [feature_v]

                for feature_v_i in feature_v:
                    col_sel = data.index
                    if feature_k != "index":
                        col_sel = data[feature_k]

                    data = data[col_sel > feature_v_i]
                
    return data.reset_index(drop=True) # IMPORTANT

def dataframe_calculate_with_col(data:pd.DataFrame, col:list[str], scalar:int| pd.Series, operation:str="mul", new_col:list[str]=None):
    assert data is not None
    assert col is not None and type(col) is list, type(col)
    assert new_col is None or type(new_col) is list, new_col
    if new_col is not None:
        assert len(new_col) == len(col)

    data = data.copy()

    for idx, cl in enumerate(col):
        assign_col = cl
        if new_col is not None:
            assign_col = new_col[idx]
        # Apply col scale
        if operation == "mul":
            data[assign_col] = data[cl].mul(scalar)
        elif operation == "sub":
            data[assign_col] = data[cl].sub(scalar)
        elif operation == "div":
            data[assign_col] = data[cl].div(scalar)
        elif operation == "add":
            data[assign_col] = data[cl].add(scalar)
    return data

def dataframe_get_workload_params(data:pd.DataFrame, default_col:list[str]) -> list[str] | None:
    unique_wl_columns:list[str] = []
    for col in list(data.columns):
        if not col in default_col:
            unique_wl_columns.append(col)
    return unique_wl_columns

ENERGY_BENCH_MEASUREMENT_VOLTAGE = 3.3
ENERGY_BENCH_DEFAULT_COL_SHOWED = "ENERGY_PER_ITER"
ENERGY_BENCH_DEFAULT_IDX_SHOWED = "FREQ"
ENERGY_BENCH_ENERGY_SCALE_MICRO_JOULE = 10**6
ENERGY_BENCH_DEFAULT_FEATURE_SELECTION = {"DVS_POL": 1}

ENERGY_BENCH_CALCULATED_COLUMNS = ["REPETITION_NUM", "ENERGY_PER_ITER", "ENERGY_TOTAL", "POWER", "CURR_VAR", "CURR_STD", "CURR_MEAN", "CURR_SAMPLES", "TIME_SAMPLED"]
ENERGY_BENCH_REPETITION_COLUMN_PREFIX = "REP_"

def dataframe_energy_bench_current_data_to_mean(meta:dict, data:pd.DataFrame, diff_features:list[str]) -> pd.DataFrame:
    diff_features = diff_features.copy()
    # Repetitions are not merged together in this function
    if COL_NAME_BENCH_REPETITION not in diff_features and COL_NAME_BENCH_REPETITION in data.columns and len(data[COL_NAME_BENCH_REPETITION].unique()) > 1:
        diff_features.append(COL_NAME_BENCH_REPETITION)

    #print(diff_features)
    #print(data.dtypes)
    grouping = data.groupby(diff_features, as_index=False, observed=True)
    #print(grouping.count())
    #print(grouping.size())
    #print(data[data["FREQ"] == 13333333])
    # Prevent unwanted results because of wrong grouping
    grouped_unique = grouping.size()["size"].unique()
    assert len(grouped_unique) == 1, "[group size > 1. Grouping: {}, Group-Data: {}".format(diff_features, data.head(len(grouped_unique)).to_string())

    ret_data_list = []

    for _, group in grouping:
        
        # Calculate statistical data on the samples of the current measurement list
        current_list = pd.to_numeric(group[COL_NAME_ENERGY_BENCH_CURRENT].iloc[0])

        del group[COL_NAME_ENERGY_BENCH_CURRENT]
        #print(current_list)
        group[COL_NAME_CURRENT_STAT_MEAN] = np.mean(current_list)
        group[COL_NAME_CURRENT_STAT_MIN] = np.min(current_list)
        group[COL_NAME_CURRENT_STAT_MAX] = np.max(current_list)
        #group[COL_NAME_CURRENT_STAT_MODE] = stats.mode(current_list, nan_policy='omit')
        group[COL_NAME_CURRENT_STAT_MEDIAN] = np.median(current_list)
        group[ENERGY_BENCH_CALCULATED_COLUMNS[7]] = len(current_list)

        # Append data final datalist - generating the dataframe in the last step is fastest
        ret_data_list.append(group)

    return pd.concat(ret_data_list, ignore_index=True)

def dataframe_energy_bench_current_mean_to_energy(meta:dict, data:pd.DataFrame, diff_features:list[str], voltage:int=ENERGY_BENCH_MEASUREMENT_VOLTAGE) -> pd.DataFrame:
    diff_features = diff_features.copy()
    # Repetitions are not merged together in this function
    if COL_NAME_BENCH_REPETITION not in diff_features and COL_NAME_BENCH_REPETITION in data.columns and len(data[COL_NAME_BENCH_REPETITION].unique()) > 1:
        diff_features.append(COL_NAME_BENCH_REPETITION)

    grouping = data.groupby(diff_features, as_index=False, observed=True)

    # Generel meta data
    dmm_config = meta.get("dmm_config")
    sample_rate_per_sec = dmm_config.get("samplerate")

    # Prevent unwanted results because of wrong grouping
    grouped_size = grouping.size()["size"].iloc[0]
    assert grouped_size == 1, "[group size is bigger than 1\n" + data.head(grouped_size).to_string()

    ret_data_list = []

    for _, group in grouping:
        
        # Calculate statistical data on the samples of the current measurement list
        curr_mean = pd.to_numeric(group[ENERGY_BENCH_CALCULATED_COLUMNS[6]].iloc[0])
        curr_samples = pd.to_numeric(group[ENERGY_BENCH_CALCULATED_COLUMNS[7]].iloc[0])
        time_sampled = curr_samples / sample_rate_per_sec
        power = curr_mean * voltage
        energy = power * time_sampled

        # print(str(curr_samples) + " / " + str(sample_rate_per_sec) + " = " + str(time_sampled))

        group[ENERGY_BENCH_CALCULATED_COLUMNS[-1]] = time_sampled
        group[ENERGY_BENCH_CALCULATED_COLUMNS[3]] = power
        group[ENERGY_BENCH_CALCULATED_COLUMNS[2]] = energy

        # Append data final datalist - generating the dataframe in the last step is fastest
        ret_data_list.append(group)

    return pd.concat(ret_data_list, ignore_index=True)

TRACE_WAVE_DATA_TO_ECP_LENGTH_COLUMN_SUFIX = "_ECP_LEN"
def dataframe_trace_wave_data_to_ecp_length(meta:dict, data:pd.DataFrame):
    # Transform each WAVE_DATA Column in row to the ecp_length
    def row_apply(row:pd.Series):
        rigol_wave_data = row[COL_NAME_TRACE_SAMPLES_WAVE]
        row[COL_NAME_TRACE_SAMPLES_WAVE] = rigol_wave_data_to_ecp_length(rigol_wave_data)
        row.rename()
        return row
    data = data.apply(row_apply, axis=1)
    return data.rename(columns={COL_NAME_TRACE_SAMPLES_WAVE: COL_NAME_TRACE_SAMPLES_WAVE + TRACE_WAVE_DATA_TO_ECP_LENGTH_COLUMN_SUFIX})

def dataframe_prepare_for_stacked_clustered_barplot(data:pd.DataFrame, col:str, idx:str, cluster_group_col:str=None, stack_group_col:str=None):
    assert cluster_group_col != None
    assert stack_group_col != None

    data_idx_unq = data[idx].squeeze().unique()
    cluster_group_names = data[cluster_group_col].squeeze().unique()
    #print(data)
    #print([cluster_group_col, stack_group_col])
    groups = data.groupby([cluster_group_col, stack_group_col], as_index=False, observed=True)
    output_df = []
    stack_group_temp = {}
    last_name_fdim = None
    for name, group in groups:
        if last_name_fdim is not None and name[0] != last_name_fdim:
            output_df.append(pd.DataFrame(data=stack_group_temp, index=data_idx_unq))
            stack_group_temp = {}
            #print(stack_group_temp)
        stack_group_temp[name[1]] = group[col].to_numpy()
        
        last_name_fdim = name[0]

    # Is necesarry as the last loop wont append dataframe as it does not recognize a change in name[0]
    output_df.append(pd.DataFrame(data=stack_group_temp, index=data_idx_unq))

    return (output_df, cluster_group_names)

def dataframe_extract_seperated_columns(data:pd.DataFrame, idx_col:str|None, value_col:str, group_columns:list[str], suppress_full_col_name:bool=False):
    # Get Unique information
    unique_idx_col = [0]
    if idx_col != None:
        unique_idx_col = data.get(idx_col).unique() # From Series create a set

    seperated_column_dict = {}

    groups = data.groupby(group_columns, observed=True) # Important as with CNT_TYPE also PC_SAMPLE is shown
    for name, group in groups:
        col_name = name
        if not suppress_full_col_name:
            col_name = str(col_name) + "_" + str(value_col)
        seperated_column_dict[col_name] = list(group[value_col])
    
    return pd.DataFrame(seperated_column_dict, index=unique_idx_col)

def dataframe_merge_column_to_row(data:pd.DataFrame, value_cols:list[str], seperate_col:str, group_cols:list[str], suppress_full_col_name:bool=False):
    assert all(elem in data.columns for elem in value_cols)
    assert all(elem in data.columns for elem in group_cols)

    ret_dataframe:pd.DataFrame = None

    unique_seperators = data[seperate_col].unique()

    groups = data.groupby(group_cols, observed=True) # Important as with CNT_TYPE also PC_SAMPLE is shown
    for name, group in groups:
        ref_row = group.copy().head(1) # copy avoids error message
        ref_row.drop([seperate_col] + value_cols, axis=1,  inplace=True)
        #print(ref_row)
        for unq in unique_seperators:
            interest_row = group[group[seperate_col] == unq]
            #print(unq)
            #print(interest_row)
            for val_c in value_cols:
                #print(interest_row[val_c])
                ref_row[str(val_c) + "_" + str(unq)] = interest_row[val_c].values[0] if not interest_row.empty else np.NaN
            #print(ref_row)
        # Merge rows into new dataframe
        if ret_dataframe is None:
            ret_dataframe = ref_row
        else:
            ret_dataframe = pd.concat([ret_dataframe, ref_row])

    return ret_dataframe

def dataframe_create_column(data:pd.DataFrame, new_column_name:str, combine_columns:list[str], operation:str="div"):
    columns = data.columns
    for col in combine_columns:
        assert col in columns

    data[new_column_name] = dataframe_calculate_with_col(data, [combine_columns[0]], data[combine_columns[1]], operation)[combine_columns[0]]
    return data

def dataframe_create_column_per_group(data:pd.DataFrame, new_col:list[str], calc_on_col:list[str], grouping_col:list[str], operation:list[str]):
    assert data is not None
    # assert all(col not in data.columns for col in new_col)
    assert all(col in data.columns for col in calc_on_col), data.dtypes
    assert grouping_col is None or all(col in data.columns for col in grouping_col), data.dtypes
    assert all(op in ["min", "max", "mean"] for op in operation)
    assert len(new_col) == len(calc_on_col) and len(calc_on_col) == len(operation)

    grouping = [(None, data)]
    if grouping_col is not None:
        grouping = data.groupby(grouping_col, observed=True)
    
    calc_data:list[pd.DataFrame] = []
    for name_group, group in grouping:
        for index, _ in enumerate(new_col):
            if operation[index] == "min":
                group[new_col[index]] = group[calc_on_col[index]].min()
            if operation[index] == "max":
                group[new_col[index]] = group[calc_on_col[index]].max()
            if operation[index] == "mean":
                group[new_col[index]] = group[calc_on_col[index]].mean()
        #print(group)
        calc_data.append(group)

    
    return pd.concat(calc_data, ignore_index=True)

def dataframe_flatten(meta:dict, data:pd.DataFrame, id_group_columns:list[str]=None, suppress_name_append:bool=False, seperate:bool=True) -> list[tuple[str, dict, pd.DataFrame]]:

    assert "BENCH" in data.columns, "Columns are {}".format(data.columns)
    
    if id_group_columns is None:
        id_group_columns = meta_get_workload_params(meta)

    assert id_group_columns is not None
    assert type(id_group_columns) is list
    assert len(id_group_columns) > 0

    # Remove workload param from metadata
    meta["bench_config"]["WORKLOAD_PARAMS"] = []
    # Set Track Records in metadata
    if METADATA_MODFICATION_KEY not in meta:
        meta["MODS"] = []
    meta["MODS"].append({"flatten" : {"group_by":id_group_columns}})

    ret_seperated_data = []
    groups = data.groupby(id_group_columns, as_index=False, observed=True)
    for name, gr in groups:


        if not suppress_name_append:
            # Merge BENCH name and id group identifier
            if type(name) is int:
                name = str(name)
            else:
                name = '_'.join(map(str,name))
            
            # Rename BENCH name
            gr = gr.assign(BENCH=gr.BENCH + "_" + name)

        # Drop old workload param identifier
        gr = gr.drop(id_group_columns, axis=1)
        gr.reset_index(drop=True, inplace=True)

        if seperate:
            ret_seperated_data.append((name, meta, gr))
        else:
            if len(ret_seperated_data) == 0:
                ret_seperated_data = gr
            else:
                ret_seperated_data = pd.concat([ret_seperated_data, gr])

    if not seperate:
        ret_seperated_data = [(meta["taskname"], meta, ret_seperated_data)]

    return ret_seperated_data

DATAFRAME_MERGE_ENERGY_SWO_GROUP_COLUMNS = ["DVS_POL", "FREQ"] + ["BENCH", "ITERATIONS", "DVS_MV", "FWS"] # TODO Add second list or add parameter to delete columns with suffixes
def dataframe_merge_energy_swo_data(e_meta:dict, e_data:pd.DataFrame, swo_meta:dict, swo_data:pd.DataFrame, same_features_excluding_wl_params:list=DATAFRAME_MERGE_ENERGY_SWO_GROUP_COLUMNS) -> tuple[dict, pd.DataFrame]:
    assert e_meta is not None and len(e_meta) > 0
    assert swo_meta is not None and len(e_data) > 0
    assert e_data is not None 
    assert swo_data is not None

    # Datasets should only be merged after statistics on the repetitions have been calculated
    assert COL_NAME_BENCH_REPETITION not in e_data.columns
    assert COL_NAME_BENCH_REPETITION not in swo_data.columns

    # Get Workload params and check if they match up
    e_workload_params = meta_get_workload_params(e_meta)
    swo_workload_params = meta_get_workload_params(swo_meta)
    assert len(e_workload_params) == 0 and len(swo_workload_params) == 0 or all(elem in e_workload_params for elem in swo_workload_params)

    # Dataframe Merge
    columns_to_merge_on = same_features_excluding_wl_params + e_workload_params
    data_merge = swo_data.merge(e_data, how='left', on=columns_to_merge_on, suffixes=(None, "_y"))

    # Meta Merge
    meta_merge = swo_meta
    meta_merge["dmm_config"] = e_meta["dmm_config"]

    return (meta_merge, data_merge)

def correlate_two_dataframes(d_one:pd.DataFrame, d_two:pd.DataFrame):
    corrs = {}
    if type(d_one) is pd.Series:
        d_one = d_one.to_frame()
    if type(d_two) is pd.Series:
        d_two = d_two.to_frame()

    if d_one is not None and d_two is not None:
        for method in ["pearson", "kendall", "spearman"]:
            for b_col in d_one.columns:
                for l_col in d_two.columns:
                    name = b_col + "_&_" + l_col
                    if corrs.get(name, None) is None:
                        corrs[name] = [d_one[b_col].corr(d_two[l_col], method=method)]
                    else:
                        corrs[name].append(d_one[b_col].corr(d_two[l_col], method=method))
    return corrs

def dataframe_correlate_cols_ref(data:pd.DataFrame, cols:list[str], group_col:str=None, select_first_col:dict=None | dict, min_periods=1) -> dict:
    assert data is not None
    assert cols is not None and len(cols) == 2
    assert all(col_name in data.columns for col_name in cols)
    assert group_col is not None and group_col in data.columns

    ref_frame:pd.DataFrame = dataframe_select_features(data, {"equal": select_first_col})[cols[0]]
    #print(ref_frame)
    corrs = []
    grouping = data.groupby(group_col, observed=True)
    for name, group in grouping:
        for method in ["pearson", "kendall", "spearman"]:
            #print(group[cols[1]])
            correlation_res = group[cols[1]].corr(other=ref_frame, method=method, min_periods=min_periods)
            corrs.append(pd.DataFrame.from_dict({"COLS":[cols], "REF_SELECT_FIRST_COL":[select_first_col], str(group_col): [name], "METHOD": [method], "CORR":[correlation_res]}))

    return pd.concat(corrs, ignore_index=True)

def dataframe_correlate_cols(data:pd.DataFrame, cols:list[str], group_cols:list[str]=None, select_per_col:list[dict]=None | dict, min_periods=1) -> dict:
    assert data is not None
    assert cols is not None and len(cols) == 2
    assert all(col_name in data.columns for col_name in cols)
    assert group_cols is None or all(gr_col in data.columns for gr_col in group_cols)

    corrs = []
    grouping = [(None, data)]
    if group_cols is not None:
        grouping = data.groupby(group_cols, observed=True)
    for name, group in grouping:
        for method in ["pearson"]: #, "kendall", "spearman"]:

            col_0_group = group.copy()
            if select_per_col is not None and len(select_per_col) > 0:
                
                col_0_group = dataframe_select_features(col_0_group, {"equal": select_per_col[0]})
                print(col_0_group[cols[0]])

            col_1_group = group.copy()
            if select_per_col is not None and len(select_per_col) > 1:
                
                col_1_group = dataframe_select_features(col_1_group, {"equal": select_per_col[1]})
                print(col_1_group[cols[1]])
            
            correlation_res = col_0_group[cols[0]].corr(other=col_1_group[cols[1]], method=method, min_periods=min_periods)
            corrs.append(pd.DataFrame.from_dict({"COLS":[cols], "SLECT_PER_COL":[select_per_col], str(group_cols): [name], "METHOD": [method], "CORR":[correlation_res]}))

    return pd.concat(corrs, ignore_index=True)

MILLI_VOLT_TO_VOLT = 1000

def dataframe_energy_from_second_cycles(meta:dict, data:pd.DataFrame, diff_features:list[str]=None):
    assert all(col in data.columns for col in ["DVS_MV", "CYC_DIFF", "FREQ"])
    assert all(freq in data["FREQ"].unique() for freq in [80000000, 53333333, 40000000, 26666666, 13333333])
    assert diff_features is None or all(feature in data.columns for feature in diff_features)

    #data = pd.merge(data, EMPIRIC_STAT_POWER_DATAFRAME, on=["FREQ", "DVS_MV"])

    print("EMPIRIC_STAT_POWER_BEEBS_IS_USED")
    data = pd.merge(data, EMPIRIC_STAT_POWER_BEEBS_DATAFRAME, on=["DVS_MV"])

    data["ENERGY_STAT_CALC"] = data["POWER_STAT_CALC"] * (data["CYC_DIFF"] / data["FREQ"])

    grouping = [(None, data)]
    if diff_features is not None:
        diff_features = diff_features.copy()
        if "FREQ" in diff_features:
            diff_features.remove("FREQ")
        grouping = data.groupby(diff_features, observed=True)

    calc_data_frame_list = []
    for _, group in grouping:
        row_at_80_mhz = group[group["FREQ"] == 80000000]
        e_total_80_mhz = ((row_at_80_mhz["DVS_MV"].iloc[0] / MILLI_VOLT_TO_VOLT)**2 * row_at_80_mhz["CYC_DIFF"].iloc[0] + 
                         row_at_80_mhz["POWER_STAT_CALC"].iloc[0] * (row_at_80_mhz["CYC_DIFF"].iloc[0] / row_at_80_mhz["FREQ"].iloc[0]))
        e_total_other = ((group["DVS_MV"]/ MILLI_VOLT_TO_VOLT)**2 * group["CYC_DIFF"] + group["POWER_STAT_CALC"] * (group["CYC_DIFF"] / group["FREQ"]))
        group["ENERGY_TOTAL_CALC_PROP_DIV"] = e_total_other / e_total_80_mhz 
        
        
        calc_data_frame_list.append(group)
    data = pd.concat(calc_data_frame_list, ignore_index=True)
    return data


ALPHAC_MEAN_BEEBS = 3.876473 * 10**(-10) # test 5.576473
def dataframe_energy_from_second_cycles_only(meta:dict, data:pd.DataFrame, freq_ids:list, diff_features:list[str]=None, instructions_weight:bool=False):
    """
    Calculate all energy consumptions from only 2 points only 
    """
    FREQS = [13333333, 26666666, 40000000, 53333333, 80000000]
    assert freq_ids is not None and len(freq_ids) == 2
    assert all(col in data.columns for col in ["DVS_MV", "CYC_DIFF", "FREQ"])
    assert all(freq in data["FREQ"].unique() for freq in FREQS)
    assert diff_features is None or all(feature in data.columns for feature in diff_features)

    if instructions_weight:
        assert "CNT_TYPE" in data.columns
        assert "INSTRUCTIONS" in data["CNT_TYPE"].unique()
        data = dataframe_select_features(data, {"equal" : {"CNT_TYPE":"INSTRUCTIONS"}})
    
    # print("EMPIRIC_STAT_POWER_MICHEL_IS_USED")
    # data = pd.merge(data, EMPIRIC_STAT_POWER_DATAFRAME, on=["FREQ", "DVS_MV"])

    print("EMPIRIC_STAT_POWER_BEEBS_IS_USED")
    data = pd.merge(data, EMPIRIC_STAT_POWER_BEEBS_DATAFRAME, on=["DVS_MV"])

    data["ENERGY_STAT_CALC"] = data["POWER_STAT_CALC"] * (data["CYC_DIFF"] / data["FREQ"])
    # data["ALPHAC_CALC"] = (data["ENERGY_TOTAL_REP_MEAN"] - data["ENERGY_STAT_CALC"]) / ((data["DVS_MV"]/1000)**2 * data["CYC_DIFF"])

    grouping = [(None, data)]
    if diff_features is not None:
        diff_features = diff_features.copy()
        if "FREQ" in diff_features:
            diff_features.remove("FREQ")
        grouping = data.groupby(diff_features, observed=True)

    # Sort freqs in descending order to get highest freq_id at idx 0 the
    freq_ids.sort(reverse=True)

    calc_data_frame_list = []
    for _, group in grouping:
        
        rows = [group[group["FREQ"] == FREQS[freq_ids[0]]], group[group["FREQ"] == FREQS[freq_ids[1]]]]

        assert rows[0].shape[0] == 1, "Row selection does not only point to one row: {}".format(rows[0].shape[0])

        cycles_savable_per_fws = (rows[0]["CYC_DIFF"].iloc[0] - rows[1]["CYC_DIFF"].iloc[0]) / (rows[0]["FWS"].iloc[0] - rows[1]["FWS"].iloc[0])

        cycles_at_80MHz = rows[0]["CYC_DIFF"].iloc[0]
        if freq_ids[0] != 4:
            cycles_at_80MHz = (FWS_AT_80MHZ - rows[0]["FWS"].iloc[0]) * cycles_savable_per_fws + rows[0]["CYC_DIFF"].iloc[0]

        # If Instruction known - weight the static energy consumption higher with 1/ Instruction cnt_norm
        # The only cnt_norm is of cnt_type instructions # // TODO Needs to be added to FWS
        weight = 1
        if instructions_weight:
            weight = group["CNT_NORM"] / 4
            print(group["BENCH"].iloc[0], weight)

        group["CYC_DIFF_CALC"] =  cycles_at_80MHz - (FWS_AT_80MHZ - group["FWS"]) * cycles_savable_per_fws * weight
        
        group["ENERGY_TOTAL_CALC"] = ((group["DVS_MV"]/ MILLI_VOLT_TO_VOLT)**2 * group["CYC_DIFF_CALC"] * ALPHAC_MEAN_BEEBS + group["POWER_STAT_CALC"] * (group["CYC_DIFF_CALC"] / group["FREQ"]))

        #print((group["DVS_MV"]/ MILLI_VOLT_TO_VOLT)**2)
        #print((group["DVS_MV"]/ MILLI_VOLT_TO_VOLT)**2 * group["CYC_DIFF_CALC"])
        #print(group["POWER_STAT_CALC"] * (group["CYC_DIFF_CALC"] / group["FREQ"]))
        #print(group["CYC_DIFF_CALC"] / group["FREQ"])
        #exit(0)

        group["ENERGY_TOTAL_CALC_PROP_DIV"] = group["ENERGY_TOTAL_CALC"] / group[group["FREQ"] == 80000000]["ENERGY_TOTAL_CALC"].iloc[0]
        
        
        calc_data_frame_list.append(group)
    data = pd.concat(calc_data_frame_list, ignore_index=True)
    return data

CYCLES_PER_FLASH_ACCESS = 1
FLANKS_PER_COMP_PACKET = 8.47
FWS_AT_80MHZ = 4
def dataframe_energy_from_flash_calculation(meta:dict, data:pd.DataFrame, diff_features:list[str]=None):
    assert all(col in data.columns for col in ["DVS_MV", "CYC_DIFF", "FREQ", "CNT_REP_MEAN", "CNT_TYPE", "FWS"])
    assert 2 in data["CNT_TYPE"].unique()
    assert all(freq in data["FREQ"].unique() for freq in [80000000, 53333333, 40000000, 26666666, 13333333])
    assert diff_features is None or all(feature in data.columns for feature in diff_features)

    data = pd.merge(data, EMPIRIC_STAT_POWER_DATAFRAME, on=["FREQ", "DVS_MV"])

    data["ENERGY_STAT_CALC"] = data["POWER_STAT_CALC"] * (data["CYC_DIFF"] / data["FREQ"])

    grouping = [(None, data)]
    if diff_features is not None:
        diff_features = diff_features.copy()
        if "FREQ" in diff_features:
            diff_features.remove("FREQ")
        grouping = data.groupby(diff_features, observed=True)

    calc_data_frame_list = []
    for _, group in grouping:
        row_at_80_mhz = group[group["FREQ"] == 80000000]
        row_at_80_mhz_cycles = row_at_80_mhz["CYC_DIFF"].iloc[0] - ((row_at_80_mhz["CNT_REP_MEAN"].iloc[0] * CYCLES_PER_FLASH_ACCESS / FLANKS_PER_COMP_PACKET) * (FWS_AT_80MHZ - row_at_80_mhz["FWS"].iloc[0]))
        
        e_total_80_mhz = ((row_at_80_mhz["DVS_MV"].iloc[0] / MILLI_VOLT_TO_VOLT)**2 * row_at_80_mhz_cycles +
                         row_at_80_mhz["POWER_STAT_CALC"].iloc[0] * (row_at_80_mhz_cycles / row_at_80_mhz["FREQ"].iloc[0]))

        rows_other_cycles = row_at_80_mhz["CYC_DIFF"].iloc[0] - ((group["CNT_REP_MEAN"] * CYCLES_PER_FLASH_ACCESS / FLANKS_PER_COMP_PACKET) * (FWS_AT_80MHZ - group["FWS"]))
        e_total_other = ((group["DVS_MV"]/ MILLI_VOLT_TO_VOLT)**2 * rows_other_cycles + group["POWER_STAT_CALC"] * (rows_other_cycles / group["FREQ"]))
        group["ENERGY_TOTAL_FLASH_CALC_PROP_DIV"] = e_total_other / e_total_80_mhz 
        
        
        calc_data_frame_list.append(group)
    data = pd.concat(calc_data_frame_list, ignore_index=True)

    def flash_cnt_type_apply(row):
        if row["CNT_TYPE"] != 100:
            row["ENERGY_TOTAL_FLASH_CALC_PROP_DIV"] = 0
        return row


    data = data.apply(lambda x : flash_cnt_type_apply(x), axis=1)

    return data

def dataframe_instructions_from_profiling_counter(meta:dict, data:pd.DataFrame, diff_features:list[str]=None):
    columns_needed = ["CNT_REP_MEAN", "CNT_TYPE", "CYC_DIFF", "CNT_NORM"]
    cnt_types_needed = [1, 2, 3, 4, 5]
    new_cnt_type = "INSTRUCTIONS"
    assert meta is not None
    assert data is not None
    assert diff_features is None or all(col in data.columns for col in diff_features)
    assert all(col in data.columns for col in columns_needed)
    assert all(cnt_type in data[columns_needed[1]].unique() for cnt_type in cnt_types_needed)

    diff_features_without_cnt_type = None
    if diff_features is not None:
        diff_features_without_cnt_type = diff_features.copy()
        if columns_needed[1] in diff_features_without_cnt_type:
            diff_features_without_cnt_type.remove(columns_needed[1])
    input_data = data.copy()
    data = data.copy()
    #print(data)

    # Only filter needed CNT_TYPES
    data = dataframe_select_features(data, {"equal" : {columns_needed[1]:cnt_types_needed}})

    # Calculate CNT REP MEAN to Cycles
    data[columns_needed[0]] = data[columns_needed[0]].div(5)
    data[columns_needed[0]] = data[columns_needed[0]].mul(256)

    # Add CPI to LSU
    data = dataframe_operation_row(data, "sum", [columns_needed[0]], diff_features_without_cnt_type, {columns_needed[1]:cnt_types_needed[1:]}, new_cnt_type, False)
    #print(data)
    # SUB FOLD
    data = dataframe_operation_row(data, "diff", [columns_needed[0]], diff_features_without_cnt_type, {columns_needed[1]:[new_cnt_type, cnt_types_needed[0]]}, new_cnt_type, True)

    data = dataframe_select_features(data, {"equal" : {columns_needed[1]:[new_cnt_type]}})

    # Calculate CYC - Calculated
    data[columns_needed[0]] = data[columns_needed[2]].sub(data[columns_needed[0]])

    data[columns_needed[3]] = data[columns_needed[2]].div(data[columns_needed[0]])

    return pd.concat([input_data, data], ignore_index=True).reset_index(drop=True)

def dataframe_instruction_without_cpi_from_profiling_counter(meta:dict, data:pd.DataFrame, diff_features:list[str]=None):
    columns_needed = ["CNT_REP_MEAN", "CNT_TYPE", "CYC_DIFF", "CNT_NORM"]
    cnt_types_needed = [1, 2, 3, 4]
    new_cnt_type = "INSTRUCTIONS_NON_CPI"
    assert meta is not None
    assert data is not None
    assert diff_features is None or all(col in data.columns for col in diff_features)
    assert all(col in data.columns for col in columns_needed)
    assert all(cnt_type in data[columns_needed[1]].unique() for cnt_type in cnt_types_needed)

    diff_features_without_cnt_type = None
    if diff_features is not None:
        diff_features_without_cnt_type = diff_features.copy()
        if columns_needed[1] in diff_features_without_cnt_type:
            diff_features_without_cnt_type.remove(columns_needed[1])
    input_data = data.copy()
    data = data.copy()
    #print(data)

    # Only filter needed CNT_TYPES
    data = dataframe_select_features(data, {"equal" : {columns_needed[1]:cnt_types_needed}})

    # Calculate CNT REP MEAN to Cycles
    data[columns_needed[0]] = data[columns_needed[0]].div(5)
    data[columns_needed[0]] = data[columns_needed[0]].mul(256)

    # Add CPI to LSU - is not necesarry here
    #data = dataframe_operation_row(data, "sum", [columns_needed[0]], diff_features_without_cnt_type, {columns_needed[1]:cnt_types_needed[1:]}, new_cnt_type, False)
    #print(data)
    # SUB FOLD
    data = dataframe_operation_row(data, "diff", [columns_needed[0]], diff_features_without_cnt_type, {columns_needed[1]:[cnt_types_needed[1], cnt_types_needed[0]]}, new_cnt_type, True)

    data = dataframe_select_features(data, {"equal" : {columns_needed[1]:[new_cnt_type]}})

    # Calculate CYC - Calculated
    data[columns_needed[0]] = data[columns_needed[2]].sub(data[columns_needed[0]])

    data[columns_needed[3]] = data[columns_needed[2]].div(data[columns_needed[0]])

    return pd.concat([input_data, data], ignore_index=True).reset_index(drop=True)

def dataframe_lsu_without_ram_from_profiling_counter(meta:dict, data:pd.DataFrame, diff_features:list[str]=None):
    COLUMNS_NEEDED = ["CNT_REP_MEAN", "CNT_TYPE", "CYC_DIFF", "CNT_NORM"]
    CNT_TYPES_NEEDED = [2, 10]
    NEW_CNT_TYPE_NAME = "LSU_SUB_RAM"
    assert meta is not None
    assert data is not None
    assert diff_features is None or all(col in data.columns for col in diff_features)
    assert all(col in data.columns for col in COLUMNS_NEEDED)
    assert all(cnt_type in data[COLUMNS_NEEDED[1]].unique() for cnt_type in CNT_TYPES_NEEDED)

    diff_features_without_cnt_type = None
    if diff_features is not None:
        diff_features_without_cnt_type = diff_features.copy()
        if COLUMNS_NEEDED[1] in diff_features_without_cnt_type:
            diff_features_without_cnt_type.remove(COLUMNS_NEEDED[1])
    input_data = data.copy()
    data = data.copy()
    #print(data)

    merge_data = []
    # Only filter needed CNT_TYPES
    merge_data.append(dataframe_select_features(data, {"equal" : {COLUMNS_NEEDED[1]:[2]}}))
    merge_data.append(dataframe_select_features(data, {"equal" : {COLUMNS_NEEDED[1]:[10]}}))

    #print(merge_data[1][merge_data[1]["BENCH"] == "beebs_st"].iloc[:, 0:15])
    # Calculate CNT REP MEAN to Cycles
    merge_data[0][COLUMNS_NEEDED[0]] = merge_data[0][COLUMNS_NEEDED[0]].div(5)
    merge_data[0][COLUMNS_NEEDED[0]] = merge_data[0][COLUMNS_NEEDED[0]].mul(256)

    merge_data[1][COLUMNS_NEEDED[0]] = merge_data[1][COLUMNS_NEEDED[0]].div(8.25).mul(2)

    data = pd.concat(merge_data, ignore_index=True)

    # Add CPI to LSU - is not necesarry here
    #data = dataframe_operation_row(data, "sum", [columns_needed[0]], diff_features_without_cnt_type, {columns_needed[1]:cnt_types_needed[1:]}, new_cnt_type, False)
    #print(data)
    # SUB FOLD
    #print(data[data["BENCH"] == "beebs_st"].iloc[:, 0:15])
    data = dataframe_operation_row(data, "diff", [COLUMNS_NEEDED[0]], diff_features_without_cnt_type, {COLUMNS_NEEDED[1]:[2, 10]}, NEW_CNT_TYPE_NAME, True)
    #print(data[data["BENCH"] == "beebs_st"].iloc[:, 0:15])
    data = dataframe_select_features(data, {"equal" : {COLUMNS_NEEDED[1]:[NEW_CNT_TYPE_NAME]}})

    # Calculate LSU_SUB_RAM / CYC

    data[COLUMNS_NEEDED[3]] = data[COLUMNS_NEEDED[0]].div(data[COLUMNS_NEEDED[2]])
    print(data[data["BENCH"] == "beebs_st"].iloc[:, 0:15])

    return pd.concat([input_data, data], ignore_index=True).reset_index(drop=True)

def dataframe_flash_without_lsu_cache_difference(meta:dict, data:pd.DataFrame, diff_features:list[str]=None):
    COLUMNS_NEEDED = ["CNT_REP_MEAN", "CNT_TYPE", "CYC_DIFF", "CNT_NORM", "FLASH_CACHE"]
    CNT_TYPES_NEEDED = [2, 100]
    FLASH_CACHE_NEEDED = [3, 1]
    NEW_CNT_TYPE_NAME = "FLASH_SUB_LSU_CACHE"

    print(data[COLUMNS_NEEDED[1]].unique())

    assert meta is not None
    assert data is not None
    assert diff_features is None or all(col in data.columns for col in diff_features)
    assert all(col in data.columns for col in COLUMNS_NEEDED)
    assert all(cnt_type in data[COLUMNS_NEEDED[1]].unique() for cnt_type in CNT_TYPES_NEEDED)
    assert all(cnt_type in data[COLUMNS_NEEDED[4]].unique() for cnt_type in FLASH_CACHE_NEEDED)

    diff_features_without_cnt_type = None
    if diff_features is not None:
        diff_features_without_cnt_type = diff_features.copy()
        if COLUMNS_NEEDED[1] in diff_features_without_cnt_type:
            diff_features_without_cnt_type.remove(COLUMNS_NEEDED[1])
    input_data = data.copy()
    data = data.copy()
    #print(data)

    merge_data = []
    # Only filter needed CNT_TYPES
    merge_data.append(dataframe_select_features(data, {"equal" : {COLUMNS_NEEDED[1]:[2]}}))
    merge_data.append(dataframe_select_features(data, {"equal" : {COLUMNS_NEEDED[1]:[100]}}))

    #print(merge_data[1][merge_data[1]["BENCH"] == "beebs_st"].iloc[:, 0:15])

    print(merge_data[0])

    row_operation_features = diff_features
    if "FLASH_CACHE" in diff_features:
        row_operation_features.remove("FLASH_CACHE")
    merge_data[0] = dataframe_operation_row(merge_data[0], "diff", [COLUMNS_NEEDED[0]], row_operation_features, {"FLASH_CACHE":[1, 3]}, 4)
    merge_data[0] = dataframe_select_features(merge_data[0], {"equal" : {COLUMNS_NEEDED[4]:[4]}})


    print( merge_data[0])

    # Calculate CNT REP MEAN to Cycles
    merge_data[0][COLUMNS_NEEDED[0]] = merge_data[0][COLUMNS_NEEDED[0]].div(5)
    merge_data[0][COLUMNS_NEEDED[0]] = merge_data[0][COLUMNS_NEEDED[0]].mul(256)
    merge_data[0][COLUMNS_NEEDED[0]] = merge_data[0][COLUMNS_NEEDED[0]].div(4) # FWS

    merge_data[1][COLUMNS_NEEDED[0]] = merge_data[1][COLUMNS_NEEDED[0]].div(8.25)

    data = pd.concat(merge_data, ignore_index=True)

    # Add CPI to LSU - is not necesarry here
    #data = dataframe_operation_row(data, "sum", [columns_needed[0]], diff_features_without_cnt_type, {columns_needed[1]:cnt_types_needed[1:]}, new_cnt_type, False)
    print(data)
    # SUB FOLD
    #print(data[data["BENCH"] == "beebs_st"].iloc[:, 0:15])
    data = dataframe_operation_row(data, "diff", [COLUMNS_NEEDED[0]], diff_features_without_cnt_type, {COLUMNS_NEEDED[1]:[100, 2]}, NEW_CNT_TYPE_NAME, True)
    #print(data[data["BENCH"] == "beebs_st"].iloc[:, 0:15])
    data = dataframe_select_features(data, {"equal" : {COLUMNS_NEEDED[1]:[NEW_CNT_TYPE_NAME]}})

    # Calculate LSU_SUB_RAM / CYC

    data[COLUMNS_NEEDED[3]] = data[COLUMNS_NEEDED[0]].div(data[COLUMNS_NEEDED[2]])
    print(data[data["BENCH"] == "beebs_st"].iloc[:, 0:15])

    return pd.concat([input_data, data], ignore_index=True).reset_index(drop=True)

# List manipulation
def list_rotate(lst:list, sample_amount:int, dir:str='right'):
    if dir == 'right':
        sample_amount = -sample_amount
    
    return lst[sample_amount:] + lst[:sample_amount]

def list_string_elem_to_numeric(lst:list):
    """ 
    Try to convert each element of the list to a numeric with pd.to_numeric()
    Works in-place, but also returns the list
    """
    for string_idx, string in enumerate(lst):
        lst[string_idx] = pd.to_numeric(string, errors='ignore')
# Meta dict functions

def meta_to_canvas_description(meta:dict):
    if len(meta) == 0:
        return None

    func = meta.get("function")
    taskname = meta.get("taskname")
    index = func.find("filename_addon")
    if index == -1:
        return taskname
    addon = func[index:]
    # TODO did not handle no filename_addon
    return taskname + "_" + addon

def meta_to_taskname(meta:dict):
    return meta.get("taskname")

def meta_get_workload_params(meta:dict) -> list | None:
    assert meta is not None
    lst = None

    lst = meta.get("bench_config", {})
    lst = lst.get("WORKLOAD_PARAMS", DEFAULT_ERROR)
    
    if lst is None:
        lst = []
    return lst

def meta_to_filename(meta:dict, special_name:str):
    #return str(meta.get("taskname"))
    func = meta.get("function")
    taskname = meta.get("taskname")
    index = func.find(taskname) # index of first occurence with not exception raised when not found
    if index == -1:
        return taskname + "_" + special_name
    argstr = func[index + len(taskname) + 3:-1]
    index = argstr.find("], ")
    argstr = argstr[index + 3:].replace(", nan", "").replace(", ", "_").replace(".", "-")
    return taskname + "_" + special_name + "_" + argstr

def meta_to_benchmark_type(meta:dict) -> str | None:
    function = meta.get("function").split(",")[0].split(" ")[1]
    for bt in BENCHMARK_TYPES:
        if bt in function:
            return bt
    return None

# Pickle Reading/ Finding

def pickle_to_datatypes(pkl_path:str, key_meta:str="metadata", key_data:str="dataframes"):
    """
    Converts a pickle to a dict with meta as dict and data as dataframe 
    (tries to cast column to correct dtype). 
    """
    pk = pd.read_pickle(pkl_path)
    metadata = pk.get(key_meta)
    dataframe = pd.DataFrame(pk.get(key_data)[0])
    #print(dataframe.head(1))
    for column in dataframe:
        dataframe[column] = pd.to_numeric(dataframe[column], errors='ignore')
    #print(dataframe["DELAY"].head(1).get(0))
    return {"metadata":metadata, "data":dataframe}

def find_all_pickles(pkl_folder_path:str, follow_subdirectories:bool=True) -> list[str]:
    # Find only .pkl files
    pickle_files = []
    if follow_subdirectories:
        for path, subdirs, files in os.walk(pkl_folder_path):
            for name in files:
                pickle_file_path = os.path.join(path, name)
                if ".pkl" in pickle_file_path:
                    pickle_files.append(pickle_file_path)
    else:
        for file in os.listdir(pkl_folder_path):
            if ".pkl" in file:
                pickle_files.append(pkl_folder_path + file)
    return pickle_files

def find_pickle_in_path(pkl_folder_path:str, pickle_name: str) -> str | None:
    """ 
    Returns complete path if found """
    for path, subdirs, files in os.walk(pkl_folder_path):
        for name in files:
            pickle_file_path = os.path.join(path, name)
            if ".pkl" in pickle_file_path and pickle_name + ".pkl" in pickle_file_path:
                return pickle_file_path
    return None


def pickle_folder_to_datatypes(pkl_folder_path:str) -> list[list[str, dict]]:  #, filter:bool=True
    """ 
    Returns a list of dataframes with each dataframe beeing a converted pickle to only the data part
    """
    pickle_dataframes_list = []
    
    for pkl_path in find_all_pickles(pkl_folder_path):
        task = pickle_to_datatypes(pkl_path)
        file_name = pkl_path.split("/")[-1].replace(".pkl", "")
        
        pickle_dataframes_list.append([file_name, [task]])
        
    return pickle_dataframes_list

def pickle_folders_to_datatypes(folders:list[str], follow_subdirectories:bool=False) -> list[list[str, dict]]:  #, filter:bool=True
    """ 
    Returns a list of dataframes with each dataframe beeing a converted pickle. 
    Only returns pickles which names exist in all paths.
    """
    pickle_dataframes_list = []


    list_path_lists = []
    for fold in folders:
        assert fold[-1] == "/"
        list_path_lists.append(find_all_pickles(fold, follow_subdirectories))
    
    assert len(list_path_lists) > 0

    for ref_path in list_path_lists[0]:
        pickle_name = ref_path.split("/")[-1].replace(".pkl", "")
        pickle_paths = [ref_path]
        pickle_applicable = True # If only one folder path is given
        for paths_elem_index, paths_elem in enumerate(list_path_lists[1:]):
            pickle_applicable = False
            for path_index, path in enumerate(paths_elem):
                if (pickle_name + ".pkl") in path:
                    pickle_applicable = True
                    pickle_paths.append(path)
                    del list_path_lists[paths_elem_index + 1][path_index]
                    break

            if not pickle_applicable:
                break


        if pickle_applicable:
            datatypes = []
            for pp in pickle_paths:
                datatypes.append(pickle_to_datatypes(pp))

            assert len(datatypes) == len(folders)
            
            pickle_dataframes_list.append([pickle_name, datatypes])
    
    return pickle_dataframes_list

def rigol_wave_pickle_folder_to_datatypes(pkl_folder_path:str):
    """ 
    Returns a list of dataframes with each dataframe beeing a converted pickle to only the data part
    """
    pickle_list = []
    
    for pkl_path in find_all_pickles(pkl_folder_path):
        pkl_dict = pd.read_pickle(pkl_path)
        file_name = pkl_path.split("/")[-1].replace(".pkl", "")
        
        pickle_list.append([file_name, pkl_dict])
        
    return pickle_list

# Argument Parse functions

def parse_arguments_feature_selection(features_args:list[str]) -> dict[str, dict[str, str]]:
    """ 
    ## Parameter
    features_args:
      Includes Strings seperated by:
      - ":" - meaning equality
      - "<" - meaning less than
      - ">" - meaning bigger than
      Example: CNT_TYPE:4 CNT_NORM}50  - only  values with cnt_type 4 and a normalized counter that is higher than 50 
    
    ## Return 
    Dictionary of features parsed and seperated by groups of:
    - dict["equal"]  --> ":"
    - dict["less"]   --> "{"
    - dict["bigger"] --> "}"
    Example: {"equal": []}
    """
    ret_features:dict = {"equal": {}, "less": {}, "bigger": {}}

    for f_str in features_args:
        pair_lst = f_str.replace(" ", "")
        if ":" in pair_lst:
            pair_lst = pair_lst.split(':')
            vals = pd.to_numeric(pair_lst[1], errors='ignore')

            if len(pair_lst[1:]) > 1:
                vals = []
                for sel in pair_lst[1:]:
                    vals.append(pd.to_numeric(sel, errors='ignore'))
            
            ret_features["equal"].update({pair_lst[0] : vals})
        elif "{" in pair_lst:
            print(pair_lst)
            pair_lst = pair_lst.split('{')
            ret_features["less"].update({pair_lst[0] : pd.to_numeric(pair_lst[1], errors='ignore')})
        elif "}" in pair_lst:
            pair_lst = pair_lst.split('}')
            ret_features["bigger"].update({pair_lst[0] : pd.to_numeric(pair_lst[1], errors='ignore')})
    return ret_features

def parse_arguments_feature_selection_combinations(features_args:list[str]) -> dict[str, dict[str, str]]:
    """ 
    ## Parameter
    features_args:
      Includes Strings seperated by:
      - ":" - meaning equality
      - "<" - meaning less than
      - ">" - meaning bigger than
      - "?" - Cobination of KEY-VALUE-PAIRS
      Example: CNT_TYPE:4?CNT_NORM}50 - for values with cnt_type 4 the normalized counter should be higher than 50
    
    ## Return 
    Dictionary of features parsed and seperated by groups of:
    - dict["equal"]  --> ":"
    - dict["less"]   --> "{"
    - dict["bigger"] --> "}"

    Example: [[ {"equal": {"CNT_TYPE": 4}}, {"bigger": {"CNT_NORM": 50}}], ...]
    """
    #ret_features:dict = {"equal": {}, "less": {}, "bigger": {}}

    ret_features = []
    for f_str in features_args:
        pair_lst = f_str.replace(" ", "")
        assert "?" in f_str
        cond_pair = [] 
        for cond_feature in pair_lst.split("?"):
            if ":" in cond_feature:
                cond_feature = cond_feature.split(':')
                list_string_elem_to_numeric(cond_feature)
                cond_pair.append({"equal" : {cond_feature[0]:cond_feature[1]}})
            elif "{" in cond_feature:
                cond_feature = cond_feature.split('{')
                list_string_elem_to_numeric(cond_feature)
                
                cond_pair.append({"less" : {cond_feature[0]:cond_feature[1]}})
            elif "}" in cond_feature:
                cond_feature = cond_feature.split('}')
                list_string_elem_to_numeric(cond_feature)
                
                cond_pair.append({"bigger" : {cond_feature[0]:cond_feature[1]}})
        ret_features.append(cond_pair)
    return ret_features

def parse_argument_list(argument_list:str | None, seperator:str=":") -> list | None:
    """ Tries to convert to a list of strings. If argument_list is None returns None
    ## Parameters
    argument_list:
        `None`: Returns None
        `str` : list of strings """
    if argument_list is None:
        return None
    return argument_list.split(seperator) if seperator in argument_list else [argument_list]

def parse_argument_key_value(argument:str) -> tuple:
    keyval = argument.split(":")
    return (pd.to_numeric(keyval[0], errors='ignore'), pd.to_numeric(keyval[1], errors='ignore'))

def parse_argument_key_list(argument:str) -> dict[str, list[str]]:
    keylist = argument.split(":")
    return {keylist[0]: list(pd.to_numeric(keylist[1:], errors='ignore'))}

def parse_argument_list_key_value(argument:str) -> list[dict[str, list[str]]]:
    ret_list = []
    lst = argument.split("?")
    for key_val in lst:
        split = key_val.split(":")
        ret_list.append({split[0]: pd.to_numeric(split[1], errors='ignore')})
    return ret_list
    
def parse_arguments_proportion(proportion_args:list[str]):
    return (proportion_args[0], parse_argument_key_value(proportion_args[1]), parse_argument_list(proportion_args[2]) if proportion_args[2] != None and proportion_args[2] != "None" else None)

def parse_arguments_column_labels(proportion_args:list[str]) -> dict[str, dict]:
    """ CONVENTION: COLNAME?INDEX:LABEL[?INDEX:LABEL] """
    col_labels = {}
    for col in proportion_args:
        col = col.split("?")
        col_name = col[0]
        label_dict = {}
        for elem in col[1:]:
            elem = elem.split(":")
            label_dict[pd.to_numeric(elem[0], errors='ignore')] = pd.to_numeric(elem[1], errors='ignore')
        col_labels[col_name] = label_dict
    return col_labels

# Other

def argument_to_kwargs_dict(title_label:str=None, xaxis_label:list[str]=None, yaxis_label:list[str]=None, axis_label_size:list[str]=None, legend_label:list[str]=None, figure_size=None, legend_loc:list[list[int]]=None, axis_grid:list[int]=None, legend_visibility:list[str]=None, axis_yscale:list[str]=None, xaxis_lim:list[str]=None, yaxis_lim:list[str]=None, xaxis_tickrotation:list[int]=None, annotate:list[str]=None, separate_grouping:bool=None, legend_remove:str=None, switch_appearance:bool=False, x_tick_visible:str=None, ordering_display:int=None, separate_group_share_axis:str=None, sorting_activated:bool=False, same_color:bool=None, legend_axis_parent:int=None, x_axis_margins:list[str]=None, y_axis_margins:list[str]=None, x_axis_tick_top:bool=False, reversed_groupby:bool=False, unique_color_order:str=None):
    ret_dict = {}
    if title_label:
        ret_dict["title"] = title_label
    if xaxis_label:
        ret_dict["xlabel"] = xaxis_label
    if yaxis_label:
        ret_dict["ylabel"] = yaxis_label
    if axis_label_size:
        ret_dict["axis_label_size"] = axis_label_size
    if yaxis_lim:
        lims = []
        for lim in yaxis_lim:
            lims.append(list(pd.to_numeric(parse_argument_list(lim))))
        ret_dict["ylim"] = lims
    if xaxis_lim:
        lims = []
        for lim in xaxis_lim:
            lims.append(list(pd.to_numeric(parse_argument_list(lim))))
        ret_dict["xlim"] = lims
    if xaxis_tickrotation:
        ret_dict["xtickrot"] = xaxis_tickrotation
    if legend_label:
        ret_dict["legend"] = legend_label
    if figure_size:
        ret_dict["figuresize"] = tuple(figure_size) if figure_size != None else None
    if legend_loc:
        locs = []
        for loc in legend_loc:
            if ":" in loc:
                locs.append(list(pd.to_numeric(parse_argument_list(loc))))
            else:
                locs.append(loc)
        ret_dict["legend_loc"] = locs
    if legend_remove:
        
        ids = parse_argument_list(legend_remove)
        ret_dict["legend_remove"] = pd.to_numeric(ids, errors='ignore')
    if axis_grid:
        ret_dict["axis_grid"] = axis_grid
    if legend_visibility:
        ret_dict["legend_visibility"] = legend_visibility
    if axis_yscale:
        ret_dict["axis_yscale"] = axis_yscale
    if annotate:
        annots = []
        for an in annotate:
            annots.append(parse_argument_list(an))
        ret_dict["annotate"] = annots
    if separate_grouping:
        ret_dict["separate_grouping"] = pd.to_numeric(separate_grouping)
    if separate_group_share_axis:
        ret_dict["separate_group_share_axis"] = separate_group_share_axis
    if switch_appearance:
        ret_dict["switch_appearance"] = True
    if x_tick_visible:
        ret_dict["x_tick_visible"] = pd.to_numeric(x_tick_visible, errors='ignore')
    if sorting_activated:
        ret_dict["sorting_activated"] = True
    if ordering_display:
        ret_dict["ordering_display"] = ordering_display
    if same_color:
        ret_dict["same_color"] = same_color
    if x_axis_margins:
        ret_dict["x_axis_margins"] = pd.to_numeric(x_axis_margins, errors='ignore')
        print(ret_dict["x_axis_margins"])
    if y_axis_margins:
        
        ret_dict["y_axis_margins"] = pd.to_numeric(y_axis_margins, errors='ignore')
    
    if x_axis_tick_top:
        ret_dict["x_axis_tick_top"] = True
    if reversed_groupby:
        ret_dict["reversed_groupby"] = True
    if unique_color_order:
        ret_dict["unique_color_order"] = parse_argument_list(unique_color_order, "?")
        

    if legend_axis_parent:
        ret_dict["legend_axis_parent"] = legend_axis_parent
    return ret_dict

def alter_plot_appearance_post(labeling_dict:dict):
    print("[ALTER PLOT APPEARANCE POST] - {}".format(labeling_dict))
    if len(plt.get_fignums()) > 0: # To test whether there is currently a figure on the pyplot figure stack
        if labeling_dict.get("title", None) != None:
            plt.title(labeling_dict.get("title"), fontname="Courier")
            #if ax is not None:
            #    ax.set_title(labeling_dict.get("title"))
                
        for ax_index, ax_obj in enumerate(plt.gcf().get_axes()):
            if labeling_dict.get("ylabel", None) != None:
                arg_var = labeling_dict.get("ylabel")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] == "0":
                        ax_obj.set_ylabel("")
                    else:
                        ax_obj.set_ylabel(arg_var[ax_index])
            if labeling_dict.get("xlabel", None) != None:
                arg_var = labeling_dict.get("xlabel")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] == "0":
                        ax_obj.set_xlabel("")
                    else:
                        ax_obj.set_xlabel(arg_var[ax_index])

            if labeling_dict.get("xlim", None) != None:
                arg_var = labeling_dict.get("xlim")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] != "0":
                        ax_obj.set_xlim(arg_var[ax_index][0], arg_var[ax_index][1])
                        ax_obj.ticklabel_format(axis='x' ,style='plain', useOffset=False)
            
            if labeling_dict.get("xtickrot", None) != None:
                arg_var = labeling_dict.get("xtickrot")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] not in ["0", 0]:
                        plt.setp(ax_obj.get_xticklabels(), rotation=arg_var[ax_index])
            
            if labeling_dict.get("x_tick_visible", None) != None:
                arg_var = labeling_dict.get("x_tick_visible")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] in ["0", 0]:
                        ax_obj.xaxis.set_ticklabels([])

            if labeling_dict.get("ylim", None) != None:
                arg_var = labeling_dict.get("ylim")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] != "0":
                        ax_obj.set_ylim(arg_var[ax_index][0], arg_var[ax_index][1])
                        ax_obj.ticklabel_format(axis='y', style='plain', useOffset=False)

            if labeling_dict.get("axis_grid", None) != None:
                arg_var = labeling_dict.get("axis_grid")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] == "0":
                        ax_obj.grid(visible= False)
                    else:
                        ax_obj.grid(visible= True, axis=arg_var[ax_index])
            if labeling_dict.get("legend", None) != None:
                arg_var = labeling_dict.get("legend")
                if len(arg_var) - 1 >= ax_index and ax_obj.get_legend() is not None:
                    if arg_var[ax_index] == "0":
                        ax_obj.get_legend().set_title("")
                    else:
                        ax_obj.get_legend().set_title(arg_var[ax_index].replace("\\n", "\n"))
            if labeling_dict.get("legend_loc", None) != None:
                for item in ax_obj.get_children():
                    if isinstance(item, matplotlib.legend.Legend):
                        if labeling_dict.get("legend_loc") != None:
                            legloc = labeling_dict.get("legend_loc")[0]
                            item._loc = tuple(legloc)

                            if len(labeling_dict.get("legend_loc")) > 1:
                                labeling_dict["legend_loc"] = labeling_dict.get("legend_loc")[1:]
                            else:
                                labeling_dict["legend_loc"] = None

                        
                        
            if labeling_dict.get("legend_remove", None) is not None:
                arg_var = labeling_dict.get("legend_remove")
                if ax_index in arg_var and ax_obj.get_legend() is not None:
                    ax_obj.get_legend().remove()
            if labeling_dict.get("annotate", None) != None:
                arg_var = labeling_dict.get("annotate")
                for anot_list in arg_var:
                    plt.annotate(anot_list[0], pd.to_numeric((anot_list[1], anot_list[2])))
            if labeling_dict.get("legend_visibility", None) != None:
                arg_var = labeling_dict.get("legend_visibility")
                if len(arg_var) - 1 >= ax_index and ax_obj.get_legend() is not None:
                    if arg_var[ax_index] == "0":
                        ax_obj.get_legend().remove()
            if labeling_dict.get("axis_yscale", None) is not None:
                arg_var = labeling_dict.get("axis_yscale")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] != "0":
                        ax_obj.set_yscale(arg_var[ax_index])
            if labeling_dict.get("x_axis_margins", None) is not None:
                arg_var = labeling_dict.get("x_axis_margins")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] != "None" and arg_var[ax_index] is not None:
                        ax_obj.margins(x=arg_var[ax_index])
            if labeling_dict.get("y_axis_margins", None) != None:
                arg_var = labeling_dict.get("y_axis_margins")
                if len(arg_var) - 1 >= ax_index:
                    if arg_var[ax_index] != "None" and arg_var[ax_index] is not None:
                        ax_obj.margins(y=arg_var[ax_index])

def alter_plot_appearance_pre(labeling_dict:dict):
    print("[ALTER PLOT APPEARANCE PRE] - {}".format(labeling_dict))
    if labeling_dict.get("x_axis_tick_top", None) != None:
            plt.rcParams['xtick.bottom'] = plt.rcParams['xtick.labelbottom'] = False
            plt.rcParams['xtick.top'] = plt.rcParams['xtick.labeltop'] = True
            labeling_dict.pop("x_axis_tick_top", None)

    if labeling_dict.get("axis_label_size", None) is not None:
        plt.rcParams['font.size'] = labeling_dict.get("axis_label_size")
    
    

    if len(plt.get_fignums()) > 0: # To test whether there is currently a figure on the pyplot figure stack
        for ax_index, ax_obj in enumerate(plt.gcf().get_axes()):
            break

def plot_add_metadata(metadata:dict, show_dict:dict[str, str]=DEFAULT_PLOT_META):
    info_string = ""
    # GET info in metadata via show_keys dict path
    for show_key in show_dict:
        #print("info_k:", show_key)
        info_metadata = metadata.get(show_key)
        if info_metadata == None: # show_key might not be in metadata
            continue

        if type(info_metadata) == dict: # find value of show_key of show_dict in info_metadata
            info_metadata = info_metadata.get(show_dict.get(show_key))
        
        # // TODO  Add list, str check

        #print("info_m", info_metadata)

        SPACER = " "
        if info_metadata == None:
            continue
        elif type(info_metadata) == str:
            info_string = info_string + str(info_metadata) + SPACER
        elif type(info_metadata) == list:
            for i_elem in info_metadata:
                info_string = info_string + str(i_elem) + SPACER
        elif type(info_metadata) ==  dict:
            for i_elem in info_metadata.items():
                info_string = info_string + str(i_elem) + SPACER
    if info_string != "":
        plt.figtext(.01, .01, info_string)

    #print(info_string)
    print("[ADDED Metadata information to plot]")

RIGOL_WAVE_ECP_LEN_XINCREMENT_TIMESCALE = 1000000000
RIGOL_WAVE_ECP_LEN_THRESHOLD_MV = 1500
def rigol_wave_data_to_ecp_length(wave_full_data:dict[dict, list], threshold_mV:int=RIGOL_WAVE_ECP_LEN_THRESHOLD_MV, xincrement_timescale:int=RIGOL_WAVE_ECP_LEN_XINCREMENT_TIMESCALE):
    # Read xincrement (time) between neighbouring samples
    xincrement = wave_full_data[rigol_ds1054z.WAVE_RETURN_METADATA_KEY]["xincrement"] * xincrement_timescale

    # Calc Delay between first and last flank
    wave = np.asarray(wave_full_data[rigol_ds1054z.WAVE_RETURN_DATA_KEY])
    threshold_indices = np.where(wave < threshold_mV)[0]
    ecp_length = (threshold_indices[-1] - threshold_indices[0]) * xincrement
    return ecp_length

# Plots and other output

def plot_swo_bench_special_heatmap(meta:dict, data:pd.DataFrame, save:str = None, value_col:str=SWO_BENCH_DEFAULT_COL_SHOWED, label_dict:dict=None):

    if meta.get("taskname") == "tci":
        INDEX_TO_OP = {0:'add', 1:'mul', 2:'div'}
        INDEX_TO_STORAGE = {0:'reg', 1:'ram', 2:'flash'}

        cur_df = data.copy().pivot_table(values=value_col, index=SWO_BENCH_DEFAULT_IDX_SHOWED, columns="operation", aggfunc=sum)
        cur_df = cur_df.rename(columns=INDEX_TO_OP) #, index=INDEX_TO_CNTTYPE

        if save is not None:
            fig = plt.figure(num=meta_to_canvas_description(meta=meta))
            plt.title("Operations Added")
        else:
            fig = plt.figure(
                num=meta_to_canvas_description(meta=meta), 
                figsize=label_dict.get("figuresize", FIGSIZE_FULL))
            ax1 = fig.add_subplot(1, 2, 1)
            ax1.set_title("Operations Added")
        
        sns.heatmap(cur_df, annot=True, fmt="d")

        if save is not None:
            #fig.savefig(save + "tci_operation" + SAVE_FILE_TYPE, bbox_inches='tight')
            fig.savefig(save[0] + save[1] + SAVE_FILE_TYPE, bbox_inches='tight')

        cur_df = data.copy().pivot_table(values=value_col, index=SWO_BENCH_DEFAULT_IDX_SHOWED, columns="storage", aggfunc=sum)
        cur_df = cur_df.rename(columns=INDEX_TO_STORAGE) # , index=INDEX_TO_CNTTYPE

        if save is not None:
            fig = plt.figure(num=meta_to_canvas_description(meta=meta))
            plt.title("Storage Access Added")
        else:
            ax1 = fig.add_subplot(1, 2, 2)
            ax1.set_title("Storage Access Added")
        
        sns.heatmap(cur_df, annot=True, fmt="d")

        if save is not None:
            #fig.savefig(save + "tci_storage" + SAVE_FILE_TYPE, bbox_inches='tight')
            fig.savefig(save[0] + save[1] + SAVE_FILE_TYPE, bbox_inches='tight')
            return
        
        plot_add_metadata(metadata=meta)
        plt.tight_layout()
        plt.show()

BOXPLOT_DATA_KEY_COLUMN = "BENCH"
def plot_generic_boxplot(dataframe_list:list[pd.DataFrame], col:str, idx:str, idx_values:list, idx_value_map:dict=None, save:str=None, label_dict:dict=None):
    fig = plt.figure(figsize=label_dict.get("figuresize", FIGSIZE_FULL))
    color_idx = 0
    legend_handles = []
    for val in idx_values:
        box_plot_df = None
        for df in deepcopy(dataframe_list):
            name = df[BOXPLOT_DATA_KEY_COLUMN][0]
            df = dataframe_remove_cols(df, remove_except=[col, idx])
            df = df[df[idx] == val]
            df = pd.DataFrame(data=df.get(col).tolist(), columns=[name])
            box_plot_df = pd.concat([box_plot_df, df], axis=1) if box_plot_df is not None else df
        kwargs = {"color": dict(boxes=INDEX_TO_COLOR[color_idx], whiskers=INDEX_TO_COLOR[color_idx], medians=INDEX_TO_COLOR[color_idx], caps=INDEX_TO_COLOR[color_idx])} if len(idx_values) > 1 else {}
        box_plot_df.boxplot(**kwargs)
        if idx_value_map != None:
            val = idx_value_map[val]
        legend_handles.append(mpatches.Patch(color=INDEX_TO_COLOR[color_idx], label=val))
        color_idx += 1
    
    #plt.ticklabel_format(style="plain")
    plt.legend(handles=legend_handles)
    plt.xticks(rotation=90)
    plt.title("Value Range")
    plt.ylabel(col)
    plt.tight_layout()
    if save is not None:
        #fig.savefig(save + "value_range_boxplot_" + cnt_type + SAVE_FILE_TYPE, bbox_inches='tight')
        fig.savefig(save[0] + save[1] + SAVE_FILE_TYPE, bbox_inches='tight')
        return
    plt.show()

def plot_generic_single_boxplot(data:pd.DataFrame, col:str, idx:str, group_col:list[str]=None, label_dict:dict={}, save:str=None):
    #print(save)
    #data = data.dropna(axis=0)
    #print(data.to_string())
    fig = plt.figure(figsize=label_dict.get("figuresize", FIGSIZE_FULL))
    color_idx = 0
    legend_handles = []
    groups = [(None, data)]
    if group_col != None:
        groups = data.groupby(group_col, as_index=False, observed=True)

    for name, group in groups:
        box_plot_df = None
        #print(group["DELAY"].head(1))
        #group = group.dropna(axis=0)
        #print(group)
        for idx_unq in group[idx].unique():
            df = dataframe_select_features(group, {"equal":{idx:idx_unq}})
            df[col] = pd.to_numeric(df[col])
            df = pd.DataFrame(data=df.get(col).tolist(), columns=[idx_unq], dtype=np.float64)
            box_plot_df = pd.concat([box_plot_df, df], axis=1) if box_plot_df is not None else df
        kwargs = {"color": dict(boxes=INDEX_TO_COLOR[color_idx], whiskers=INDEX_TO_COLOR[color_idx], medians=INDEX_TO_COLOR[color_idx], caps=INDEX_TO_COLOR[color_idx])} if group_col != None else {}
        kwargs.update({"showfliers":False})
        box_plot_df = box_plot_df.dropna(axis=0)
        #print(box_plot_df.dtypes)
        #print(box_plot_df)
        box_plot_df.boxplot(**kwargs)
        legend_handles.append(mpatches.Patch(color=INDEX_TO_COLOR[color_idx], label=name))
        color_idx = (color_idx + 1) % 6
    
    #plt.ticklabel_format(style="plain")
    if group_col != None:
        plt.legend(handles=legend_handles, title=label_dict.get("legend", [None])[0])
    plt.xticks(rotation=90)
    plt.title("Value Range")
    plt.ylabel(col)
    alter_plot_appearance_post(label_dict)
    plt.tight_layout()
    if save is not None:
        fig.savefig(save[0] + save[1] + SAVE_FILE_TYPE, bbox_inches='tight')
        return
    plt.show()

def plot_clustered_stacked_barplot(dfall, idx_names, labels=None, title=None,  H="/", axe:plt.Axes=None, swap_color:bool=False, errdata=None, **kwargs):
    """Given a list of dataframes, with identical columns and index, create a clustered stacked bar plot. 
labels is a list of the names of the dataframe, used for the legend
title is a string for the title of the plot
H is the hatch used for identification of the different dataframe
Found at: https://stackoverflow.com/questions/22787209/how-to-have-clusters-of-stacked-bars-with-python-pandas
"""
    stacked_legend_title = kwargs.pop("stacked-legend-title", None)
    stacked_legend_loc = kwargs.pop("stacked-legend-loc", [1.01, 0.77])

    clustered_legend_title = kwargs.pop("clustered-legend-title", None)
    clustered_legend_loc = kwargs.pop("clustered-legend-loc", [1.01, 0.5])

    # print(stacked_legend_title)
    # print(clustered_legend_title)

    if swap_color:
        kwargs["color"] = "gray"

    #print(labels)
    #print(idx_names)

    n_df = len(dfall)
    n_col = len(dfall[0].columns) 
    n_ind = len(dfall[0].index)
    if axe == None:
        axe = plt.subplot(111)

    for df in dfall : # for each data frame
        axe = df.plot(kind="bar",
                      linewidth=0,
                      stacked=True,
                      ax=axe,
                      legend=False,
                      grid=True,
                      **kwargs)  # make bar plots

    h,l = axe.get_legend_handles_labels() # get the handles we want to modify
    for i in range(0, n_df * n_col, n_col): # len(h) = n_col * n_df
        for j, pa in enumerate(h[i:i+n_col]):
            for rect in pa.patches: # for each index
                rect.set_x(rect.get_x() + 1 / float(n_df + 1) * i / float(n_col))
                if not swap_color:
                    rect.set_hatch(H * int(i / n_col)) #edited part     
                rect.set_width(1 / float(n_df + 1))
                if swap_color:
                    rect.set_color(INDEX_TO_COLOR[int(i / n_col) % len(INDEX_TO_COLOR)])

    axe.set_xticks((np.arange(0, 2 * n_ind, 2) + 1 / float(n_df + 1)) / 2.)
    axe.set_xticklabels(df.index, rotation = 0)
    axe.set_title(title)

    # Add invisible data to add another legend
    n=[]        
    for i in range(n_df):
        if not swap_color:
            n.append(axe.bar(0, 0, color="gray", hatch=H * i))
        else:
            n.append(axe.bar(0, 0, color=INDEX_TO_COLOR[i % len(INDEX_TO_COLOR)]))

    l1 = axe.legend(h[:n_col], l[:n_col], loc=stacked_legend_loc, title=stacked_legend_title)
    if labels is not None:
        l2 = plt.legend(n, labels, loc=clustered_legend_loc, title=clustered_legend_title) 
    axe.add_artist(l1)
    return axe

HEATMAP_FMT = "g"
def plot_generic_heatmap(meta:dict, data:pd.DataFrame, idx_col:str, value_col:str, unique_wl_columns:list[str], label_dict:dict={}, save:str = None):
    # Assert
    assert meta != None
    assert data is not None and not data.empty
    assert idx_col != None and idx_col != ""
    assert value_col != None and value_col != ""
    assert unique_wl_columns not in [None, -1]


    # Get Unique information
    unique_idx_col = data.get(idx_col).unique() # From Series create a set

    # Extract only col value_col, idx_col and unique work columns for plot
    selected_wl_column = [value_col, idx_col, *unique_wl_columns, ] if unique_wl_columns != None else [value_col, idx_col]
    data = data[selected_wl_column]

    if len(unique_wl_columns) > 2:
        print("[GENERIC_HEATMAP: NO HANDLE FOR {} UNQ-COLUMNS]".format(unique_wl_columns))
        return
    fig = plt.figure(num=meta_to_canvas_description(meta=meta), figsize=label_dict.get("figuresize", FIGSIZE_FULL))
    ax:plt.Axes = None
    if len(unique_wl_columns) == 2:

        if label_dict.get("title", None) is None:
            fig.suptitle("TASK: " + meta_to_taskname(meta) + "; VAL_COL: " + value_col, fontsize=16)
        else:
            fig.suptitle(label_dict.get("title", None), fontsize=16)
            label_dict["title"] = None
        subplot_index = 1

        # Spread 4D over multiple 3D plots
        for unq in unique_idx_col:
            # Only select rows of data with the specifc unique_type row
            cur_df:pd.DataFrame = data.copy()
            cur_df = cur_df[cur_df[idx_col] == unq]

            # Prepare 3D Dataframe for plotting - shape into heatmap form
            cur_df = cur_df.pivot(values=value_col, index=str(unique_wl_columns[0]), columns=str(unique_wl_columns[1]))
            
            if len(unique_idx_col) > 1:
                ax = fig.add_subplot(3, 3, subplot_index)
                ax.set_title(unq)
                subplot_index = subplot_index + 1
            sns.heatmap(cur_df, annot=True, fmt=HEATMAP_FMT, annot_kws={"size": label_dict.get("label_size", 13)})
            
           
            

    elif len(unique_wl_columns) == 1:
        # Prepare 3D Dataframe for plotting
        cur_df = data.pivot(values=value_col, index=idx_col, columns=str(unique_wl_columns[0]))

        ax = sns.heatmap(cur_df, annot=True, fmt=HEATMAP_FMT)
        ax.set_title("TASK: " + meta.get("taskname") + "; VAL_COL: " + value_col)


    elif len(unique_wl_columns) == 0:
        # Move column DEFAULT_IDX_SHOWED into index space
        cur_df = data.set_index(idx_col)

        ax = sns.heatmap(cur_df, annot=True, fmt=HEATMAP_FMT)
        ax.set_title(meta.get("taskname"))

    #print(ax)
    alter_plot_appearance_post(label_dict)

    if save is not None:
        #fig.savefig(save + meta_to_filename(meta=meta, special_name=idx_col + "_" + unq) + SAVE_FILE_TYPE, bbox_inches='tight')
        fig.savefig(save[0] + save[1] + SAVE_FILE_TYPE, bbox_inches='tight')
           
    else:
        plt.tight_layout()
        #plot_add_metadata(metadata=meta)
        plt.show()

    return

def plot_generic_barplot(meta:dict, data:pd.DataFrame, idx_col:str, value_col:str, group_columns:list[str], err_col:list[str]=None, clustered_priority:bool=True, label_dict:dict={}, save:list[str] = None,input_axe:bool=None, horizontal:bool=False):
    show_plot = True
    if input_axe is not None:
        show_plot = False
    # Assert
    # assert meta != None
    assert data is not None and not data.empty
    assert idx_col != None and idx_col != ""
    assert value_col != None and value_col != ""
    #assert group_columns not in [None, -1]

    # SEPERATE GROUPING STUFF
    switch_appearance:bool = label_dict.pop("switch_appearance", False)
    separate_grouping:bool = label_dict.pop("separate_grouping", None)
    fig, ax = (None, None)
    if separate_grouping is not None:
        sharex = label_dict.get("separate_group_share_axis", "") == "x"
        sharey = sharey=label_dict.get("separate_group_share_axis", "") == "y"
        fig, ax = plt.subplots(separate_grouping[0], separate_grouping[1], figsize=label_dict.pop("figuresize", FIGSIZE_FULL), sharex=sharex, sharey=sharey)
        ax = ax.flatten(order="C")
    elif input_axe is None: # // TODO input_axe
        fig, ax = plt.subplots(figsize=label_dict.pop("figuresize", FIGSIZE_FULL))

    if group_columns in [None, -1]:
        group_columns = []

    # Extract only col value_col, idx_col and unique work columns for plot
    selected_wl_column = [value_col, idx_col, *group_columns, ] if group_columns != None else [value_col, idx_col]
    if err_col is not None:
        selected_wl_column += err_col
    data = data[selected_wl_column]

    if len(group_columns) > 2:
        print("[GENERIC_HEATMAP: UNQ_SIZE TOO BIG - NO HANDLE FOR {} UNQ-COLUMNS]".format(group_columns))
        return
    
    #input_axe:plt.Axes = None
    fig:plt.figure = None
    if len(group_columns) == 2 and separate_grouping is None:
        # If Stacked is priority, rotate the unique column names
        if not clustered_priority:
            group_columns = [group_columns[1], group_columns[0]]
        
        print("[CLUSTERED AND STACKED BARPLOT]")
        # Prepare data for bar plot
        kwargs = {}
        if label_dict.get("legend", None) is not None:
            kwargs["stacked-legend-title"] = label_dict.get("legend")[0]
            if len(label_dict.get("legend")) > 1:
                kwargs["clustered-legend-title"] = label_dict.pop("legend")[1]

        if label_dict.get("legend_loc", None) is not None:
            kwargs["stacked-legend-loc"] =  label_dict.get("legend_loc")[0] 
        if label_dict.get("legend_loc", None) is not None and len(label_dict.get("legend_loc")) > 1:
            kwargs["clustered-legend-loc"] =  label_dict.pop("legend_loc")[1]

        (prepdata, cluster_names) = dataframe_prepare_for_stacked_clustered_barplot(data, value_col, idx_col, group_columns[0], group_columns[1])
        (preperrdata, err_cluster_names) = (None, None)
        if err_col is not None and len(err_col) == 1:
            (preperrdata, err_cluster_names) = dataframe_prepare_for_stacked_clustered_barplot(data, err_col[0], idx_col, group_columns[0], group_columns[1])
        #print(idx_col)
        plot_clustered_stacked_barplot(prepdata, idx_names=data[idx_col].unique() ,labels=cluster_names, H="/", axe=input_axe, swap_color=switch_appearance, errdata=preperrdata, **kwargs)

    elif len(group_columns) == 1 and separate_grouping is None:
        # Prepare 3D Dataframe for plotting
        print("[CLUSTERED OR STACKED BARPLOT]")
        #print(data)
        prepdata = dataframe_extract_seperated_columns(data, idx_col, value_col, group_columns, True)

        errdata = None
        #print(err_col)
        if err_col is not None and len(err_col) == 1:
            errdata = dataframe_extract_seperated_columns(data, idx_col, err_col[0], group_columns, True)

        kwargs_in = {}
        if label_dict.get("unique_color_order", None) is not None:
            color_list = label_dict.get("unique_color_order")
            kwargs_in["color"] = list(itertools.islice(itertools.cycle(color_list), None, len(color_list)))

        if errdata is None:
            if not horizontal:
                prepdata.plot.bar(rot=0, stacked=(not clustered_priority), grid=True, ax=ax, **kwargs_in)
            else:
                prepdata.plot.barh(rot=0, stacked=(not clustered_priority), grid=True, ax=ax,  **kwargs_in)
        else:
            if not horizontal:
                prepdata.plot.bar(rot=0, stacked=(not clustered_priority), grid=True, ax=ax, yerr=errdata, capsize=3, **kwargs_in)
            else:
                prepdata.plot.barh(rot=0, stacked=(not clustered_priority), grid=True, ax=ax, yerr=errdata, capsize=3, **kwargs_in)

    elif len(group_columns) == 0 or separate_grouping is not None and len(group_columns) > 0:
        # Move column DEFAULT_IDX_SHOWED into index space
        print("[BARPLOT ONLY PER INDEX]")
        kwargs = {}
        if err_col is not None:
            assert len(err_col) == 1, "Only One Error Col Allowed - eg. STD"
            kwargs.update({"yerr":err_col[0], "ecolor":"black", "capsize":2})

        groups = [(None, data)]
        if group_columns != None and group_columns != "None" and len(group_columns) > 0:
            groups = data.groupby(group_columns, as_index=False, observed=True)
            assert groups.ngroups <= len(ax), "SEPERATE GROUPING AXES SHOULD BE CHOSEN BIGGER"

        elif label_dict.get("same_color", None) is None: # Coloring
            color_dict = {}
            for val_idx, val in enumerate(data[idx_col].unique()):
                color_dict[INDEX_TO_COLOR[val_idx % len(INDEX_TO_COLOR)]] = val
            kwargs["color"] = color_dict

        for index, (group_name, group) in enumerate(groups):
            input_kwargs = kwargs.copy()

            if separate_grouping is not None:
                input_axe = ax[index]
                input_kwargs.update({"color": INDEX_TO_COLOR[index % len(INDEX_TO_COLOR)]})
            else:
                input_axe = ax
                
        
            if not horizontal:
                group.plot.bar(x=idx_col, y=value_col, rot=0, ax=input_axe, **input_kwargs)
            else:
                group.plot.barh(x=idx_col, y=value_col, rot=0, ax=input_axe)

            if separate_grouping is not None:
                input_axe.legend([group_name])
            
            #ax.xaxis.tick_top()

    alter_plot_appearance_post(label_dict)
    plot_save_or_show(save)
    return


def plot_current_lineplot(data:pd.DataFrame, plot_col_name:str, index_col_name:str, seperate_plots:bool=False, label_dict:dict=None):
    print(data)
    unique_indices = data[index_col_name].unique()
    plt.figure(figsize=label_dict.get("figuresize", FIGSIZE_FULL))

    ax:plt.Axes = None
    lines = []
    lines_labels = []
    for i, unq in enumerate(unique_indices):
        if seperate_plots:
            ax= plt.subplot(len(unique_indices), 1, i + 1)
        elif i == 0:
            ax = plt.subplot()
        row = data[data[index_col_name] == unq].reset_index() # TODO Test with usage of .iloc[0] or reset_index(drop=True)
        row = row[plot_col_name].get(0)
        row = pd.to_numeric(row) # IMPORTANT

        ax.set_xlabel("time in samples")
        ax.set_ylabel("I")
        if seperate_plots:
            ax.set_title(index_col_name + ": " + str(unq))
        line, = ax.plot(np.arange(0, len(row), 1), row)
        line.set_label(index_col_name + ": " + str(unq))
    if not seperate_plots:
        ax.legend()
    plt.suptitle("Current of: " + plot_col_name)
    plt.show()
    return

def plot_lineplot(data:pd.DataFrame, col:str, idx:str, group_col:list[str]=None, label_dict:dict={}, save:str=None, show:bool=True, second_y_col: str=None, error_col:list[str]=None, scatter:bool=False):
    assert data is not None
    assert col is not None
    assert idx is not None
    
    fig, ax, ax1 = (None, None, None)
    lineplot_color_map = INDEX_TO_COLOR

    if label_dict.get("unique_color_order", None) is not None:
        color_list = label_dict.get("unique_color_order")
        color_list = list(itertools.islice(itertools.cycle(color_list), None, len(color_list)))
        lineplot_color_map = {idx: v for idx, v in enumerate(color_list)}

    reversed_groupby = label_dict.pop("reversed_groupby", False)
    legend_axis_parent = label_dict.pop("legend_axis_parent", 0)
    sorting_activated = label_dict.pop("sorting_activated", False) # Might actually not be neccesarry anymore
    switch_appearance:bool = label_dict.pop("switch_appearance", False)
    separate_grouping:bool = label_dict.pop("separate_grouping", None)
    fig, ax = (None, None)
    if separate_grouping is not None: # SEPARATE STUFF
        sharex = label_dict.get("separate_group_share_axis", "") == "x"
        sharey = sharey=label_dict.get("separate_group_share_axis", "") == "y"
        fig, ax = plt.subplots(separate_grouping[0], separate_grouping[1], figsize=label_dict.pop("figuresize", FIGSIZE_FULL), sharex=sharex, sharey=sharey) # // TODO Sharey
        ax = ax.flatten(order="C")
    else:
        fig, ax = plt.subplots(figsize=label_dict.pop("figuresize", FIGSIZE_FULL))

        if second_y_col is not None:
            ax1 = ax.twinx()
    
    legend_handles = [set(), set()]
    color_idx = [0, 0]
    last_name_history = [set(), set()]
    last_name = None

    groups = [(None, data)]
    if group_col != None and group_col != "None" and len(group_col) > 0:
        groups = data.groupby(group_col, as_index=False, observed=True)

    if reversed_groupby:
        groups = reversed(list(groups))
        if label_dict.get("unique_color_order", None) is None:
            lineplot_color_map = INDEX_TO_COLOR_REVERSED

    for name, group in groups:
        # Line color and style index increment
        if type(name) is not tuple:
           
            if last_name != None and name != last_name: 
                color_idx[0] += 1
            if name in last_name_history[0] and last_name != None and last_name != name:
                color_idx[0] = color_idx[0] % len(last_name_history[0])

            if not scatter:
                legend_handles[0].add(plt.Line2D([0], [0], color=lineplot_color_map[color_idx[0] % len(lineplot_color_map)], label=name))
                if second_y_col is not None:
                    legend_handles[1].add(plt.Line2D([0], [0], color=lineplot_color_map[color_idx[0]], linestyle=INDEX_TO_STYLE[(len(INDEX_TO_STYLE) - 1) - color_idx[1]], label=name))
                last_name_history[0].add(name)
            else:
                legend_handles[0].add(plt.Line2D([0], [0], color=lineplot_color_map[color_idx[0] % len(lineplot_color_map)], linestyle='None', marker=INDEX_TO_MARKER[color_idx[1 if not switch_appearance else 0] % len(INDEX_TO_MARKER)], label=name))
                if second_y_col is not None:
                    legend_handles[1].add(plt.Line2D([0], [0], color=lineplot_color_map[color_idx[0]], linestyle='None', marker=INDEX_TO_MARKER[((len(INDEX_TO_MARKER) - 1) - color_idx[1 if not switch_appearance else 0]) % len(INDEX_TO_MARKER)], label=name))
        else:
            
            if last_name != None and name[0] != last_name[0]: 
                color_idx[0] += 1
            if name[0] in last_name_history[0] and last_name != None and last_name[0] != name[0]:
                color_idx[0] = color_idx[0] % len(last_name_history[0])

            
            if last_name != None and name[1] != last_name[1]: 
                color_idx[1] += 1
            if name[1] in last_name_history[1] and last_name != None and last_name[1] != name[1]:
                color_idx[1] = color_idx[1] % len(last_name_history[1])

            if name[0] not in last_name_history[0]:
                if switch_appearance:
                    if not scatter:
                        legend_handles[0].add(plt.Line2D([0], [0], color="gray",linestyle=INDEX_TO_STYLE[color_idx[0] % len(INDEX_TO_STYLE)], label=name[0]))
                    else:
                        legend_handles[0].add(plt.Line2D([0], [0], color="gray",linestyle="None", marker=INDEX_TO_MARKER[color_idx[0] % len(INDEX_TO_MARKER)], label=name[0]))
                else:
                    legend_handles[0].add(plt.Line2D([0], [0], color=lineplot_color_map[color_idx[0] % len(lineplot_color_map)], label=name[0]))

            #print(last_name_history[1])
            if name[1] not in last_name_history[1]:
                if not scatter:
                    if switch_appearance:
                        legend_handles[1].add(plt.Line2D([0], [0], color=lineplot_color_map[color_idx[1] % len(lineplot_color_map)], label=name[1]))
                    else:
                        legend_handles[1].add(plt.Line2D([0], [0], color="gray",linestyle=INDEX_TO_STYLE[color_idx[1] % len(INDEX_TO_STYLE)], label=name[1]))
                else:
                    if switch_appearance:
                        legend_handles[1].add(plt.Line2D([0], [0], color=lineplot_color_map[color_idx[1] % len(lineplot_color_map)], label=name[1]))
                    else:
                        legend_handles[1].add(plt.Line2D([0], [0], color="gray",linestyle="None", marker=INDEX_TO_MARKER[color_idx[1] % len(INDEX_TO_MARKER)], label=name[1]))
                
            last_name_history[0].add(name[0])
            last_name_history[1].add(name[1])
        last_name = name

        #print(name)
        #print(color_idx)
        #print(group)
        kwargs = {"color": lineplot_color_map[color_idx[0 if not switch_appearance else 1] % len(lineplot_color_map)], "linestyle": INDEX_TO_STYLE[color_idx[1 if not switch_appearance else 0] % len(INDEX_TO_STYLE)]} if group_col != None else {}
        kwargs1 = {"color": lineplot_color_map[color_idx[0] % len(lineplot_color_map)], "linestyle": INDEX_TO_STYLE[((len(INDEX_TO_STYLE) - 1) - color_idx[1]) % len(INDEX_TO_STYLE)]} if group_col != None else {}
        if scatter:
            kwargs.update({"linestyle":'None', "marker":INDEX_TO_MARKER[color_idx[1 if not switch_appearance else 0] % len(INDEX_TO_MARKER)]})
            kwargs1.update({"linestyle":'None', "marker":INDEX_TO_MARKER[((len(INDEX_TO_MARKER) - 1) - color_idx[1 if not switch_appearance else 0]) % len(INDEX_TO_MARKER)]})
        
        # ORDER DISPLAY
        ordering_display = label_dict.pop("ordering_display", None)
        if ordering_display is not None:
            print(json.dumps({name:i for i, name in enumerate(group[idx].unique())}, indent=0))
        
        ax_ptr = ax
        if separate_grouping is not None:
            ax_ptr = ax[color_idx[0]]

       
        ax_ptr.plot(group[idx], group[col], **kwargs)
            
        if error_col is not None:
            if len(error_col) == 1:
                assert "STD" in error_col[0]
                
                ax_ptr.fill_between(group[idx], group[col]-group[error_col[0]], group[col]+group[error_col[0]], color=kwargs["color"], alpha=0.5)
            elif len(error_col) == 2:
                assert all("MIN" in col or "MAX" in col for col in error_col)
                #print(group[error_col[0]], group[error_col[1]])
                ax_ptr.fill_between(group[idx], group[error_col[0]], group[error_col[1]], color=kwargs["color"], alpha=0.5)
            
        if second_y_col is not None and separate_grouping is None:
            ax1.plot(group[idx], group[second_y_col], **kwargs1)

    # Legend Handles % // TODO could be removed as it might already be handled globally
    if group_col != None and len(group_col) > 0:
        # Variable is reused
        loc = ["upper left", "upper right"]

        # Seperate Grouping consequences
        ax_ptr = ax
        if separate_grouping is not None:
            loc = [(1.05, 0.3), (1.05, 0.8)]
            ax_ptr = ax[legend_axis_parent]
        
        legend_handles[0] = ax_ptr.legend(handles=legend_handles[0], title=(label_dict.get("legend")[0]).replace("\\n", "\n") if label_dict.get("legend", None) is not None else None, loc=loc[0])
        draw_second_legend = False
        if type(last_name) is tuple and second_y_col is not None:
            
            legend_handles[1] = ax_ptr.legend(handles=legend_handles[1], title=(label_dict.pop("legend")[1]).replace("\\n", "\n") if label_dict.get("legend", None) is not None and len(label_dict.get("legend", None)) > 1 else None, loc=loc[1])
            draw_second_legend = True
        elif type(last_name) is tuple or second_y_col is not None:
            # print(legend_handles[1])
            # print(loc[1])
            # print(label_dict.get("legend", None))
            legend_handles[1] = ax_ptr.legend(handles=legend_handles[1], title=(label_dict.pop("legend")[1]).replace("\\n", "\n") if label_dict.get("legend", None) is not None and len(label_dict.get("legend", None)) > 1 else None, loc=loc[1])
            draw_second_legend = True
        
        if draw_second_legend:
            ax_ptr.add_artist(legend_handles[0])


    
    
    alter_plot_appearance_post(label_dict)
    if save is not None or show:
        plot_save_or_show(save)

    return (fig, ax)

def plot_vertical_lineplot(data:pd.DataFrame, col:str, idx:str, group_col:list[str]=None, label_dict:dict={}, save:str=None):
    assert data is not None
    assert col is not None
    assert idx is not None
    
    groups = [(None, data)]

    if len(group_col) > 1:
        groups = data.groupby(group_col[0], as_index=False, observed=True)

    seperate_plot_df = []
    if len(group_col) > 1:
        for name, group in groups:
            seperate_plot_df.append(dataframe_extract_seperated_columns(group, idx, col, group_col[1]))
    else:
        seperate_plot_df.append(dataframe_extract_seperated_columns(data, idx, col, group_col))
    seperate_plot_df[0].plot(x=col, y=idx)
    plt.show()

def plot_rep_errorplot(data:pd.DataFrame, mean_col:str, std_col:str, idx:str, group_col:list[str]=None, label_dict:dict={}, save:str=None):
    assert data is not None
    assert mean_col is not None
    assert std_col is not None
    assert idx is not None

    fig = plt.figure(figsize=label_dict.get("figuresize", FIGSIZE_FULL))
    legend_handles = []
    color_idx = 0
    groups = [(None, data)]
    if group_col != None:
        groups = data.groupby(group_col, as_index=False, observed=True)

    for name, group in groups:

        color = INDEX_TO_COLOR[color_idx]
        legend_handles.append(mpatches.Patch(color=INDEX_TO_COLOR[color_idx], label=name))
        #print(group[std_col], group[mean_col])
        plt.errorbar(group[idx], group[mean_col], yerr=group[std_col], color=color, linestyle='None', ecolor="r", marker='^')
        color_idx += 1
        
    
    plt.xticks(data[idx].unique())
    if group_col != None:
        plt.legend(handles=legend_handles, title=label_dict.get("legend", [None])[0])
    
    plt.xticks(rotation=90)
    plt.ylabel(mean_col)

    alter_plot_appearance_post(label_dict)
    plot_save_or_show(save)
    return

def print_data_to_table(metadata:dict[str, str], dataframe:pd.DataFrame, full:int):
    
    print("") # Seperator

    print("[METADATA TABLE]")
    if metadata is not None:
        for row in metadata:
            print("{}: {}".format(row, metadata.get(row)))
    else: 
        print(None)

    print("") # Seperator

    print("[DATA]")
    print(dataframe.to_string() if full == 1 else dataframe)

def plot_save_or_show(save:list[str]):
    plt.tight_layout()
    if save is not None:
        assert len(save) == 2
        folder = save[0]
        if folder[-1] != "/":
            folder+= "/"
        plt.savefig(folder + save[1] + SAVE_FILE_TYPE, bbox_inches='tight')
        print("SAVING ", save[1], " to path: ", folder)
    else:
        plt.show()

def plot_special_plot(mode:int, save:list[str]=None, label_dict:dict = {}):
    print(label_dict)
    major = mode[0]
    minor = mode[1]

    if major == 1: # gpio, ecp delay and ecp length addition
        data_gpio = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/gpio_delay/rigol_gpio_delay.pkl").get("data")
        data_ecp_delay = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/ecp_delay/rigol_ecp_delay.pkl").get("data")
        data_ecp_length = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/ecp_delay/rigol_ecp_wave.pkl").get("data")

        # Data Manipulation
        ## Time between generation and first flank
        data_ecp_length = dataframe_trace_wave_data_to_ecp_length(None, data_ecp_length)
        data_ecp_length = dataframe_repetition_statistics(data_ecp_length, "WAVE_DATA_ECP_LEN", ["FREQ", "TPIU_PSC"])

        ## Time between first flank and last flank
        data_ecp_delay = dataframe_select_features(data_ecp_delay, {"equal":{"CNT_TYPE":0}})
        data_ecp_delay = dataframe_repetition_statistics(data_ecp_delay, "DELAY", ["FREQ", "TPIU_PSC"])
        data_ecp_delay = dataframe_calculate_with_col(data_ecp_delay, ["DELAY_REP_MEAN"], 1000000000, "mul")
        data_ecp_delay = data_ecp_delay.rename(columns={"DELAY_REP_MEAN":"ECP_DELAY_REP_MEAN"})

        ## gpio delay
        data_gpio = dataframe_select_features(data_gpio, {"equal":{"MODE": 3}}) # "GPIO_RISING_FLANK":0, 
        data_gpio = dataframe_remove_rows_with_outliers(data_gpio, "DELAY")
        data_gpio = dataframe_repetition_statistics(data_gpio, "DELAY", ["FREQ"], repetition_necesarry=False)
        data_gpio = dataframe_calculate_with_col(data_gpio, ["DELAY_REP_MEAN"], 1000000000, "mul")
        data_gpio = data_gpio.rename(columns={"DELAY_REP_MEAN":"GPIO_DELAY_REP_MEAN"})
        data_gpio = data_gpio[["FREQ", "GPIO_DELAY_REP_MEAN"]]

        # Data merge
        merge_data = data_ecp_delay[["CNT_TYPE", "TPIU_PSC", "FREQ", "ECP_DELAY_REP_MEAN"]]
        merge_data = merge_data.join(data_ecp_length["WAVE_DATA_ECP_LEN_REP_MEAN"] )
        merge_data = pd.merge(merge_data, data_gpio, on="FREQ")
        merge_data["SUM_DELAY"] = merge_data["ECP_DELAY_REP_MEAN"] + merge_data["WAVE_DATA_ECP_LEN_REP_MEAN"] + merge_data["GPIO_DELAY_REP_MEAN"]

        # Plot
        label_dict = argument_to_kwargs_dict("Total delay between ECP generation and last ECP flank (CYCLE ECP)", "Frequency in Hz", "Sumed Delay in nanoseconds", ["TPIU Prescaler"])
        plot_lineplot(merge_data, "SUM_DELAY", "FREQ", "TPIU_PSC", label_dict, save)
    elif major == 2: # ecp delay and ecp length addition
        data_ecp_delay = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/ecp_delay/rigol_ecp_delay.pkl").get("data")
        data_ecp_length = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/ecp_delay/rigol_ecp_wave.pkl").get("data")

        # Data Manipulation
        ## Time between generation and first flank
        data_ecp_length = dataframe_trace_wave_data_to_ecp_length(None, data_ecp_length)
        data_ecp_length = dataframe_repetition_statistics(data_ecp_length, "WAVE_DATA_ECP_LEN", ["FREQ", "TPIU_PSC"])

        ## Time between first flank and last flank
        data_ecp_delay = dataframe_select_features(data_ecp_delay, {"equal":{"CNT_TYPE":0}})
        data_ecp_delay = dataframe_repetition_statistics(data_ecp_delay, "DELAY", ["FREQ", "TPIU_PSC"])
        data_ecp_delay = dataframe_calculate_with_col(data_ecp_delay, ["DELAY_REP_MEAN"], 1000000000, "mul")
        data_ecp_delay = data_ecp_delay.rename(columns={"DELAY_REP_MEAN":"ECP_DELAY_REP_MEAN"})

        # Data merge
        merge_data = data_ecp_delay[["CNT_TYPE", "TPIU_PSC", "FREQ", "ECP_DELAY_REP_MEAN"]]
        merge_data = merge_data.join(data_ecp_length["WAVE_DATA_ECP_LEN_REP_MEAN"] )
        merge_data["SUM_DELAY"] = merge_data["ECP_DELAY_REP_MEAN"] + merge_data["WAVE_DATA_ECP_LEN_REP_MEAN"]

        # Plot
        label_dict = argument_to_kwargs_dict("Total delay between ECP generation and last ECP flank (CYCLE ECP) (NO GPIO)", "Frequency in Hz", "Sumed Delay in nanoseconds", ["TPIU Prescaler"])
        plot_lineplot(merge_data, "SUM_DELAY", "FREQ", "TPIU_PSC", label_dict, save)
    elif major == 3: # Energy overhead of TRACE components
        # minor description:
        #   - 0 : Has the Workload architecture a static or workload dependent energy consumption? - PROP_SUB
        #   - 1 : How much does the timer in trace_start cost?
        #   - 2 : DEINIT working?
        #   - 3 : Init vs full trace? (avoid always deinitializing?) - BARPLOT
        #   - 4 : Energy Cost after SWDP switch

        #   - 5 : How much does the 3 phases cost? - PROP_SUB
        #   - 6 : How much does the 3 phases cost? - PROP_SUB_PROP_DIV
        #   - 7 : How much does the 3 phases cost? - PROP_SUB_PROP_DIV_REP_MEAN
        #   - 8 : Has the Workload architecture a static or workload dependent energy consumption? - PROP_SUB_PROB_DIV
        #   - 9 : Has the Workload architecture a static or workload dependent energy consumption? - PROP_SUB_PROB_DIV_REP_MEAN
        #   - 10 : Has the Workload architecture a static or workload dependent energy consumption? - PROP_SUB_PROB_DIV_REP_MEAN FREQ:80000000
        #   - 11 : Init vs full trace? (avoid always deinitializing?) - Generic Heatmap
        #   - 12 : How much does the overhead in comparision to the reference workload cost (percentage)
        #   - 13 : How much does the timer vs CYC in trace_start cost? (percentage)
        data = None
        if minor in [0, 1, 2, 3, 4, 8, 9, 10, 11, 12]:
            data = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/swo_prf_overhead_basic.pkl")
        elif minor in [5, 6, 7]:
            #data = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/swo_prf_overhead_phases.pkl")
            data = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_phases.pkl")
        elif minor in [13]:
            data = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/nucleo-l476rg/energy_bench/swo_prf_overhead_basic_SR10k.pkl")

        metadata = data.get("metadata")
        data = data.get("data")

        
        #print(metadata)

        # Get unique workload column names
        unique_wl_columns = ["swo_mode", "work_mode"]

        data = dataframe_select_features(data, {"equal":{"DVS_POL":1}})
        #data = dataframe_select_features(data, {"FREQ":[80000000, 53333333]})
        if minor in [0, 8, 9, 10]:
            data = dataframe_select_features(data, {"equal":{"swo_mode":[0, 1, 2, 3]}})
        elif minor in [1]:
            data = dataframe_select_features(data, {"equal":{"swo_mode":[0, 1, 4]}})
        elif minor in [2]:
            data = dataframe_select_features(data, {"equal":{"swo_mode":[0, 1, 5]}})
        elif minor in [3, 11]:
            data = dataframe_select_features(data, {"equal":{"swo_mode":[0, 6, 3]}})
        elif minor in [4]:
            data = dataframe_select_features(data, {"equal":{"swo_mode":[0, 7]}})
        elif minor in [12]:
            data = dataframe_select_features(data, {"equal":{"swo_mode":[0, 3]}})
        elif minor in [13]:
            data = dataframe_select_features(data, {"equal":{"swo_mode":[0, 2, 8]}})

        if minor in [10]:
            data = dataframe_select_features(data, {"equal":{"FREQ":80000000}})

        # Calculate energy and statistics (also consume the repetition_id)
        data = dataframe_energy_bench_current_data_to_mean(metadata, data, unique_wl_columns + ["DVS_POL", "FREQ"])
        data = dataframe_energy_bench_current_mean_to_energy(metadata, data, unique_wl_columns + ["DVS_POL", "FREQ"])

        # Outlier removal
        data = dataframe_remove_rows_with_outliers(data, "CURR_SAMPLES", 1, grouping_cols=unique_wl_columns + ["DVS_POL", "FREQ"])
        
        data = dataframe_repetition_statistics(data, ["ENERGY_TOTAL", "POWER", "CURR_MEAN"], unique_wl_columns + ["DVS_POL", "FREQ"], repetition_necesarry=True, prior_outlier_removal=True)

        print(data.dtypes)

        curr_name = "CURR_MEAN_REP_MEAN"

        data = dataframe_calculate_with_col(data, [curr_name], 1000, "mul") # Unit of mA
        #print(data)



        # Calculate the difference between the reference work to get the overhead
        if minor not in [12]: # NOT
            data = dataframe_proportion_column(data, "sub", curr_name, ["work_mode", "FREQ"], ("swo_mode", 0))

        if minor in [1]:
            # Calculate the proportion to the TRACE_FULL_CYC
            data = dataframe_proportion_column(data, "div", curr_name + "_PROP_SUB", ["work_mode", "FREQ"], ("swo_mode", 4))
        elif minor in [2]:
            # Calculate the proportion to the TRACE_FULL_CYC
            data = dataframe_proportion_column(data, "div", curr_name + "_PROP_SUB", ["work_mode", "FREQ"], ("swo_mode", 1))
        elif minor in [6, 7, 8, 9]:
            # Calculate the proportion to the TRACE_FULL_CYC
            data = dataframe_proportion_column(data, "div", curr_name + "_PROP_SUB", ["work_mode", "FREQ"], ("swo_mode", 3))
        elif minor in [3, 11]:
            # Calculate the proportion to the TRACE_FULL_CYC
            data = dataframe_proportion_column(data, "div", curr_name + "_PROP_SUB", ["work_mode", "FREQ"], ("swo_mode", 6))
        elif minor in [13]:
            # Calculate the proportion to the TRACE_FULL_CYC
            data = dataframe_proportion_column(data, "div", curr_name + "_PROP_SUB", ["work_mode", "FREQ"], ("swo_mode", 2))
        
        elif minor in [12]:
             data = dataframe_proportion_column(data, "div", curr_name, ["work_mode", "FREQ"], ("swo_mode", 0))

            
        if minor in [7, 9]:
            data = dataframe_repetition_statistics(data, curr_name + "_PROP_SUB" + "_PROP_DIV", ["work_mode", "swo_mode"], False)
        

            #print(data.to_string())
            #return

        if minor not in [3, 11]:
            data = dataframe_remove_features(data, {"equal": {"swo_mode":0}})
        
        # Rename for plot
        dataframe_column_idxval_to_strval(data, "work_mode", {0:"FLASH_ADD", 1:"REG_DIV", 2:"SLEEP"})
        swo_mode_map = ""
        if minor in [0, 1, 2, 3, 4, 8, 9, 10, 11, 12, 13]:
            swo_mode_map = {0:"REF",1:"TRACE_CYC_CCNT",2:"TRACE_LSU_CCNT",3:"TRACE_CPI_CCNT",4:"TRACE_CYC_TIME_TRACK",5:"DEINIT",6:"TRACE_INIT",7:"SWDP_INIT", 8:"TRACE_LSU_TIME_TRACK"}
        elif minor in [5, 6, 7]:
            swo_mode_map = {0:"REF",1:"TRACE_REG",2:"TRACE_NO_TIMCNT",3:"TRACE"}

        dataframe_column_idxval_to_strval(data, "swo_mode", swo_mode_map)

        # TITLE
        if minor in [0]:
            label_dict = {} #argument_labeling_to_dict(title_label= "Static or workload dependent energy consumption?")
        elif minor in [1]:
            label_dict.update(argument_to_kwargs_dict(title_label= "How much does the time tracking cost?"))
        elif minor in [2]:
            label_dict.update(argument_to_kwargs_dict(title_label= "Is Deinit Working?"))
        elif minor in [3, 11]:
            label_dict.update(argument_to_kwargs_dict(title_label="Additional averaged current of trace states (INIT, TRACE)", yaxis_label="Current in mA", xaxis_label="CPU Frequency in Hz"))
        elif minor in [4]:
            label_dict.update(argument_to_kwargs_dict(title_label= "ENERGY COST AFTER SWDP SWITCH"))
        elif minor in [5, 6]:
            label_dict.update(argument_to_kwargs_dict(title_label= "Phases"))
        elif minor in [7]:
            label_dict.update(argument_to_kwargs_dict(title_label= "Average Proportion Overhead Power Consumption between CPU Frequencies", yaxis_label="Proportion to TRACE", xaxis_label="WORK_MODE"))
        elif minor in [10]:
            label_dict.update(argument_to_kwargs_dict(title_label= "Average Overhead Current in mA at 80 MHz"))
        elif minor in [12]:
            label_dict.update( argument_to_kwargs_dict(title_label="trace overhead power in proportion to no trace", yaxis_label="Power Proportion Trace to No-Trace", xaxis_label="CPU Frequency in Hz"))
        elif minor in [13]:
            label_dict.update( argument_to_kwargs_dict(title_label="How much does the time tracking vs CYC Counter tracking cost?", yaxis_label="Current in mA", xaxis_label="CPU Frequency in Hz"))

        if save is not None:
            label_dict["title"] = None
         # PLOTTING
        
        if minor in [11]:
            plot_generic_heatmap(metadata, data, "FREQ", curr_name, unique_wl_columns, label_dict, save)
        elif minor in [0, 4, 5]:
            plot_generic_heatmap(metadata, data, "FREQ", curr_name + "_PROP_SUB", unique_wl_columns, label_dict, save)
        elif minor in [1, 2, 6, 8]:
            plot_generic_heatmap(metadata, data, "FREQ", curr_name + "_PROP_SUB" + "_PROP_DIV", unique_wl_columns, label_dict, save)
        elif minor in [7, 9]:
            #plot_generic_heatmap(metadata, data, "FREQ", "REP_CURR_MEAN_PROP_SUB_PROP_DIV_REP_MEAN", unique_wl_columns, label_dict, save)
            plot_generic_barplot(metadata, data, "work_mode", curr_name + "_PROP_SUB" + "_PROP_DIV" + "_REP_MEAN", ["swo_mode"], label_dict=label_dict, save=save)
        elif minor in [10]:
            fig = plt.figure()
            ax1:plt.Axes = fig.add_subplot(211)
            plot_generic_barplot(metadata, data, "work_mode", curr_name + "_PROP_SUB", ["swo_mode"], True, input_axe=ax1, label_dict={"ylabel":"Overhead Current in mA"})
            prf_cnt_data = pd.DataFrame({"CNT_NORM":[2499, 2499, 2499, 2842, 0, 0, 886, 7530, 0],"CNT_TYPE":[0, 0, 0, 2, 2, 2, 5, 5, 5], "work_mode":[0, 1, 2, 0, 1, 2, 0, 1, 2]})
            prf_cnt_data = dataframe_column_idxval_to_strval(prf_cnt_data, "work_mode", {0:"FLASH_ADD", 1:"REG_DIV", 2:"SLEEP"})
            prf_cnt_data = dataframe_column_idxval_to_strval(prf_cnt_data, "CNT_TYPE", {0:"CYCLE", 2:"LSU", 5:"CPI"})
            ax2:plt.Axes = fig.add_subplot(212)
            plot_generic_barplot({}, prf_cnt_data, "work_mode", "CNT_NORM", ["CNT_TYPE"], True, input_axe=ax2, label_dict={"ylabel":"Traced CNT"})
            print(prf_cnt_data)
            plot_save_or_show(save)
        
        if minor in [3]:
            # Split into dataframes and special columns for stacked_clustered_barplot
            (data, cluster_names) = dataframe_prepare_for_stacked_clustered_barplot(data, curr_name, "FREQ", "work_mode", "swo_mode")

            for index, df in enumerate(data):
                # Change column order
                cols = df.columns
                cols = [cols[0]] + [cols[2]] + [cols[1]]
                df = df[cols] # Sort
                cols = df.columns

                # Calculate the acummulated difference from REF over TRACE_INIT to TRACE_CPI
                df[cols[2]] = df[cols[2]] - df[cols[1]]
                df[cols[1]] = df[cols[1]] - df[cols[0]]
                data[index] = df

            print(data)
            print(cluster_names)
            kwargs = {"stacked-legend-title": "TRACE-STATE", "clustered-legend-title": "WORKLOAD", "stacked-legend-loc" : [0.01, 0.77], "clustered-legend-loc":[0.01, 0.5]}
            fig, ax0 = plt.subplots(figsize=label_dict.get("figuresize", FIGSIZE_FULL))
            plot_clustered_stacked_barplot(data, cluster_names, H="/", axe=ax0, **kwargs)
            print(label_dict)
            alter_plot_appearance_post(labeling_dict=label_dict)
            plot_save_or_show(save)
        elif minor in [12]:
            
            data = dataframe_calculate_with_col(data, [curr_name] + "_PROP_DIV", 1, "sub")
            #plot_generic_barplot(metadata, data, "work_mode", "REP_CURR_MEAN_PROP_DIV", ["FREQ"], True, label_dict=label_dict)
            plot_lineplot(data, curr_name + "_PROP_DIV", "FREQ", ["work_mode"], label_dict, save)

        elif minor in [13]:
            # Lineplot
            data = dataframe_remove_features(data, {"equal": {"swo_mode":"TRACE_LSU_CCNT", "DVS_POL": 0}})
            print(data)
            plot_lineplot(data, curr_name + "_PROP_SUB" + "_PROP_DIV", "FREQ", ["work_mode"], label_dict=label_dict, save=save)

    elif major == 4: # Time overhead of TRACE components
        data = None
        if minor in [0, 1, 3, 4]:
            data = pickle_to_datatypes(pkl_path= "~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_delay/oszi_trace_duration.pkl")
        elif minor in [2]:
            data = pickle_to_datatypes(pkl_path= "~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_delay/oszi_trace_phases.pkl")
        elif minor in [5]:
            data = pickle_to_datatypes(pkl_path= "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/trace_stop_delay/rigol_trace_stop_delay.pkl")

        metadata = data.get("metadata")
        print(metadata)
        data = data.get("data")

        # Get unique workload column names
        unique_wl_columns = ["MODE"]

        data = dataframe_select_features(data, {"equal":{"DVS_POL":1}})
        #data = dataframe_select_features(data, {"equal":{"FREQ":[80000000, 53333333]}})

        if minor in [2]:
            data = dataframe_remove_rows_with_outliers(data, "DELAY")
        else:
            data = dataframe_remove_rows_with_outliers(data, "DELAY", 5)
        #print(data["MODE"].unique())

        # Scale Delay to Microseconds
        data = dataframe_calculate_with_col(data, ["DELAY"], 1000000, "mul")
        #data = dataframe_scale_col(data, "FREQ", 0.000001)
        

        # Calculate statistics (also consume the repetition_id)
        data = dataframe_repetition_statistics(data, "DELAY", unique_wl_columns + ["FREQ"], True)
        #print(data["REP_NUM"].unique())
        #print(data)
        if minor in [0]:
            data = dataframe_select_features(data, {"equal":{"MODE":[0, 1, 2, 3, 4, 5, 6]}})
        elif minor in [1]:
            data = dataframe_select_features(data, {"equal":{"MODE":[6, 7, 8, 9, 10, 11, 12]}})
        elif minor in [2]:
            data = dataframe_select_features(data, {"equal":{"MODE":[0, 1]}})
        elif minor in [3, 4]:
            data = dataframe_proportion_column(data, "div", "DELAY_REP_MEAN", "FREQ", ("MODE", 5))
            data = dataframe_select_features(data, {"equal":{"MODE":[0, 1, 2, 3, 4]}})
        elif minor in [5]:
            data = dataframe_select_features(data, {"equal":{"MODE":[2, 3, 4, 5]}})


        #print(init_data)

        # Calculate the proportion to the TRACE_FULL_CYC
        #init_data = dataframe_proportion_column(init_data, "div", "DELAY_REP_MEAN", ["FREQ"], ("MODE", 5))
        #print(data.to_string())
        rename_value_dict = None
        if minor in [0, 1, 3, 4]:
            rename_value_dict = {0:"DEMCR_EN",1:"TIMCNT_GPIO_INIT",2:"TIMCNT_INIT",3:"SWO_INIT",4:"SWDP_SWITCH",5:"TRACE_INIT_FULL",6:"TRACE_INIT",7:"TRACE_START_FULL",8:"TRACE_STOP_FULL",9:"TRACE_START",10:"TRACE_STOP", 11:"TRACE_DEINIT",12:"TRACE_CALC"}
        elif minor in [2]:
            rename_value_dict = {0:"REG_TRACE_INIT",1:"REG_TRACE_DEINIT",2:"TIMCNT_TRACE_INIT_FULL",3:"TIMCNT_TRACE_INIT",4:"TIMCNT_TRACE_DEINIT",}
        elif minor in [5]:
            rename_value_dict = {0:"FULL_TIME_CYC",1:"FULL_STOP_CYC",2:"PRE_READ_TIME_CYC",3:"PRE_READ_CYC",4:"POST_EVT_PRE_READ_TIME_CYC", 5:"POST_EVT_PRE_READ_CYC"}

        dataframe_column_idxval_to_strval(data, "MODE", rename_value_dict)
        if minor in [0]:
            label_dict.update(argument_to_kwargs_dict("Delay of TRACE_INIT Components in Microseconds", "Delay in Microseconds", "CPU FREQUENCY in Hz"))
        elif minor in [1]:
            label_dict.update(argument_to_kwargs_dict("Delay of TRACE Components in Microseconds", "Delay in Microseconds", "CPU FREQUENCY in Hz"))
        elif minor in [2]:
            label_dict.update(argument_to_kwargs_dict("Delay of TRACE Components in Microseconds (REGISTER VS WORKAROUND USAGE)", "Delay in Microseconds", "CPU FREQUENCY in Hz"))
        elif minor in [3]: # only components not full
            label_dict.update(argument_to_kwargs_dict("Delay of TRACE_INIT Components in Microseconds", "Delay in Microseconds", "CPU FREQUENCY in Hz"))
        elif minor in [4]: # only components not full, splitted by subplot
            label_dict.update(argument_to_kwargs_dict("Delay of TRACE_INIT Components in Microseconds", "Delay in Microseconds", "CPU FREQUENCY in Hz"))
        elif minor in [5]: # only components not full, splitted by subplot
            label_dict.update(argument_to_kwargs_dict("Duration of TRACE_STOP timespans", "CPU FREQUENCY in Hz", "Delay in Microseconds"))
        
        if save is not None:
            label_dict["title"] = None

        col = "DELAY_REP_MEAN"
        if minor in [3]:
            col = "DELAY_REP_MEAN_PROP_DIV"
        elif minor in [4]:
            fig = plt.figure()
            ax1:plt.Axes = fig.add_subplot(211)
            plot_generic_barplot(metadata, dataframe_select_features(data, {"equal":{"FREQ":[80000000, 13333333]}}), "FREQ", col, unique_wl_columns, clustered_priority=False, label_dict=label_dict, save=save, horizontal=True, input_axe=ax1)
            ax2:plt.Axes = fig.add_subplot(212)
            plot_generic_barplot(metadata, dataframe_remove_features(data, {"equal": {"MODE": "SWDP_SWITCH"}}), "FREQ", col, unique_wl_columns, clustered_priority=False, label_dict=label_dict, save=save, horizontal=True, input_axe=ax2)
            plot_save_or_show(save)
        elif minor in [1]:
            fig = plt.figure()
            ax1:plt.Axes = fig.add_subplot(211)
            plot_generic_barplot(metadata, dataframe_select_features(data, {"equal":{"MODE": ["TRACE_INIT", "TRACE_START_FULL", "TRACE_STOP_FULL", "TRACE_DEINIT", "TRACE_CALC"]}}), "FREQ", col, unique_wl_columns, clustered_priority=False, label_dict=label_dict, save=save, horizontal=True, input_axe=ax1)
            ax2:plt.Axes = fig.add_subplot(212)
            plot_generic_barplot(metadata, dataframe_select_features(data,{"equal":{"MODE": ["TRACE_INIT", "TRACE_START", "TRACE_STOP", "TRACE_DEINIT", "TRACE_CALC"]}}), "FREQ", col, unique_wl_columns, clustered_priority=False, label_dict=label_dict, save=save, horizontal=True, input_axe=ax2)
            plot_save_or_show(save)
        elif minor in [5]:
            print(data)
            plot_lineplot(data, col, "FREQ", unique_wl_columns, label_dict=label_dict, save=save)
        else:
            #plot_generic_heatmap(metadata, data, "FREQ", "DELAY_REP_MEAN", unique_wl_columns, label_dict, save)
            print(label_dict)
            plot_generic_barplot(metadata, data, "FREQ", col, unique_wl_columns, clustered_priority=False, label_dict=label_dict, save=save, horizontal=True)

    return    

TWIN_LINE_BAR_FREQ_TO_INDEX_MAP = {13333333 : 0, 26666666: 1, 40000000:2, 53333333: 3, 80000000:4}
def plot_twin_line_bar_plot(line_data:pd.DataFrame, bar_data:pd.DataFrame, line_col:str, bar_col:str, idx:str, bar_group_col:list[str], line_group_col:list[str], label_dict:dict={}, line_not_scatter:bool=True):
    clustered_priority = False
    
    fig, ax0 = plt.subplots(figsize=label_dict.get("figuresize", FIGSIZE_FULL))
    ax1 = ax0.twinx()
    ax1.set_zorder(1)
    
    
    # BARPLOT HANDLING
    if bar_group_col in [None, -1]:
        bar_group_col = []

    # Extract only col value_col, idx_col and unique work columns for plot
    selected_wl_column = [bar_col, idx, *bar_group_col, ] if bar_group_col != None else [bar_col, idx]
    bar_data = bar_data[selected_wl_column]

    if len(bar_group_col) > 2:
        print("[GENERIC_HEATMAP: UNQ_SIZE TOO BIG - NO HANDLE FOR {} UNQ-COLUMNS]".format(bar_group_col))
        return
    
    if len(bar_group_col) == 2:
        print("[CLUSTERED AND STACKED BARPLOT]")
        (bar_data, cluster_names) = dataframe_prepare_for_stacked_clustered_barplot(bar_data, bar_col, idx, bar_group_col[0], bar_group_col[1])
        bar_kwargs = {"stacked-legend-loc": [1.01, 0.77], "clustered-legend-loc": [1.01, 0.5]}
        plot_clustered_stacked_barplot(bar_data, cluster_names, H="/", axe=ax0)

    elif len(bar_group_col) == 1:
        # Prepare 3D Dataframe for plotting
        print("[CLUSTERED OR STACKED BARPLOT]")
        #bar_data["FREQ"] = pd.to_numeric(bar_data["FREQ"])
        bar_data = dataframe_extract_seperated_columns(bar_data, idx, bar_col, bar_group_col, True)
        print(bar_data)
        
        bar_data.plot.bar(rot=0, stacked=(not clustered_priority), grid=True, ax=ax0, use_index=True)
        #bar_data.plot.line(rot=0, grid=True, ax=ax0)

    elif len(bar_group_col) == 0:
        # Move column DEFAULT_IDX_SHOWED into index space
        print("[BARPLOT ONLY PER INDEX]")
        bar_data.plot.bar(x=idx, y=bar_col, rot=0, grid=True, ax=ax0)
    
    # LINEPLOT HANDLING    
    line_data = dataframe_extract_seperated_columns(line_data, idx, line_col, line_group_col, True)

    # Rename Freq to barplot indexing meaning e.g. 13333333 will be mapped to 0
    line_data.index = line_data.index.map(TWIN_LINE_BAR_FREQ_TO_INDEX_MAP)

    
    yaxis_right_start = 0
    yaxis_right_end = 1.25
    

    line_kwargs = {"style": ["k-", "k--"]}
    #print(line_data)
    if line_not_scatter:
        line_data.plot.line(secondary_y=True, ax=ax1, style=line_kwargs["style"], legend=False).legend(loc="lower right")
    else:
        line_data.plot.scatter(x=idx, y=line_col,  secondary_y=True, ax=ax1, style=line_kwargs["style"], legend=False).legend(loc="lower right")
    ax1.right_ax.set_ylim([yaxis_right_start, yaxis_right_end])
    ax1.right_ax.plot(np.arange(0, len(TWIN_LINE_BAR_FREQ_TO_INDEX_MAP), 1), np.ones(len(TWIN_LINE_BAR_FREQ_TO_INDEX_MAP)), color="0.5")
    #ax1.right_ax.axhline(y=1, color='r', linestyle='-', xmin=0, xmax=len(TWIN_LINE_BAR_FREQ_TO_INDEX_MAP))
   
    #ax0.set_ylim([0, 4000])
    print(ax0.get_ylim())
    ax0.set_ylim([0, ax0.get_ylim()[1] + 2000])
    plt.show()
    #plt.close()
    return

def random_color():
    #return list(np.random.choice(range(256), size=3))
    c = tuple((np.random.random(size=3)))
    #c = (*c[:3], int(c[3]))
    print(c)
    return c

TWIN_LINE_BAR_FREQ_TO_INDEX_MAP = {13333333 : 0, 26666666: 1, 40000000:2, 53333333: 3, 80000000:4}
def plot_twin_bar_plot(bar_1_data:pd.DataFrame, bar_2_data:pd.DataFrame, bar_1_col:str, bar_2_col:str, idx:str, bar_1_group_col:list[str], bar_2_group_col:list[str], label_dict:dict={}):
    clustered_priority = True
    
    fig, ax0 = plt.subplots(figsize=label_dict.get("figuresize", FIGSIZE_FULL))
    ax1 = ax0.twinx()
    ax1.set_zorder(1)
    
    
    # BAERPLOT HANDLING
    if bar_1_group_col in [None, -1]:
        bar_1_group_col = []

    # Extract only col value_col, idx_col and unique work columns for plot
    selected_wl_column = [bar_1_col, idx, *bar_1_group_col, ] if bar_1_group_col != None else [bar_1_col, idx]
    bar_1_data = bar_1_data[selected_wl_column]

    if len(bar_1_group_col) > 2:
        print("[GENERIC_HEATMAP: UNQ_SIZE TOO BIG - NO HANDLE FOR {} UNQ-COLUMNS]".format(bar_1_group_col))
        return
    
    if len(bar_1_group_col) == 2:
        (bar_1_data, cluster_names) = dataframe_prepare_for_stacked_clustered_barplot(bar_1_data, bar_1_col, idx, bar_1_group_col[0], bar_1_group_col[1])
        bar_kwargs = {"stacked-legend-loc": [1.01, 0.77], "clustered-legend-loc": [1.01, 0.5]}
        plot_clustered_stacked_barplot(bar_1_data, cluster_names, H="/", axe=ax0)

    elif len(bar_1_group_col) == 1:
        # Prepare 3D Dataframe for plotting
        print("clustered or stacked barplot")
        #bar_1_data["FREQ"] = pd.to_numeric(bar_data["FREQ"])
        bar_1_data = dataframe_extract_seperated_columns(bar_1_data, idx, bar_1_col, bar_1_group_col, True)
        print(bar_1_data)
        
        bar_1_data.plot.bar(rot=0, stacked=(not clustered_priority), grid=True, ax=ax0, use_index=True)
        #bar_data.plot.line(rot=0, grid=True, ax=ax0)

    elif len(bar_1_group_col) == 0:
        # Move column DEFAULT_IDX_SHOWED into index space
        print("barplot only per idx")
        bar_1_data.plot.bar(x=idx, y=bar_1_col, rot=0, grid=True, ax=ax0)
    
    # bar_2 HANDLING    
    if bar_2_group_col in [None, -1]:
        bar_2_group_col = []

    # Extract only col value_col, idx_col and unique work columns for plot
    selected_wl_column = [bar_2_col, idx, *bar_2_group_col, ] if bar_2_group_col != None else [bar_2_col, idx]
    bar_2_data = bar_2_data[selected_wl_column]

    if len(bar_2_group_col) > 2:
        print("[GENERIC_HEATMAP: UNQ_SIZE TOO BIG - NO HANDLE FOR {} UNQ-COLUMNS]".format(bar_2_group_col))
        return
    
    if len(bar_2_group_col) == 2:
        (bar_2_data, cluster_names) = dataframe_prepare_for_stacked_clustered_barplot(bar_2_data, bar_2_col, idx, bar_2_group_col[0], bar_2_group_col[1])
        bar_kwargs = {"stacked-legend-loc": [1.01, 0.77], "clustered-legend-loc": [1.01, 0.5]}
        plot_clustered_stacked_barplot(bar_2_data, cluster_names, H="/", axe=ax1)

    elif len(bar_2_group_col) == 1:
        # Prepare 3D Dataframe for plotting
        print("clustered")
        #bar_2_data["FREQ"] = pd.to_numeric(bar_data["FREQ"])
        bar_2_data = dataframe_extract_seperated_columns(bar_2_data, idx, bar_2_col, bar_2_group_col, True)
        print(bar_2_data)
        print(bar_2_data.shape)
        x = np.arange(bar_2_data.columns[1] + 1)
        col_length = len(list(bar_2_data.columns)) * 2

        x_cluster_offsets = np.array(range(-int(col_length/2), int(col_length/2) + 1, 1))
        width = 0.1
        x_cluster_offsets = x_cluster_offsets * width
        print(x_cluster_offsets)
        print(x)
        for i, col in enumerate(bar_2_data.columns):
            x_offset = x_cluster_offsets[i * 2]
            print(x + x_offset)
            ax1.bar(x + x_offset, bar_2_data[col], width= width, color=random_color())
        
        #ax1.bar(stacked=(not clustered_priority), grid=False, use_index=True, colormap="gnuplot2", width=.5)
        #bar_data.plot.line(rot=0, grid=True, ax=ax1)

    elif len(bar_2_group_col) == 0:
        # Move column DEFAULT_IDX_SHOWED into index space
        print("barplot only per idx")
        bar_2_data.plot.bar(x=idx, y=bar_2_col, rot=0, grid=False, ax=ax1, colormap="gnuplot2", width=.5)
    plt.show()
    #plt.close()
    return

def plot_histogram(data:pd.DataFrame, col:str, bins:int | list=None, orientation:str='vertical', group_by:list[str]=None, label_dict:dict={}, save:str=None):
    assert col is not None
    assert data is not None and not data.empty
    print("[HISTOGRAM: BINS - {}]".format(bins))
    legend_handles = []
    groups = [(None, data)]

    if group_by is not None and len(group_by) > 0:
        groups = data.groupby(group_by, as_index=False, observed=True)


    separate_grouping:bool = label_dict.pop("separate_grouping", None)
    fig, ax = (None, None)
    if separate_grouping is not None: # SEPARATE STUFF
        fig, ax = plt.subplots(separate_grouping[0], separate_grouping[1], figsize=label_dict.pop("figuresize", FIGSIZE_FULL))
        ax = ax.flatten(order="C")
    
    print("[HISTOGRAM: 0 value is removed]")
    
    max_frequency = 0
    min_val, max_val = (sys.maxsize, 0)
    ax_max_index = 0
    for index, (name, group) in enumerate(groups):
        if index > ax_max_index:
            ax_max_index = index
        color = INDEX_TO_COLOR[index % len(INDEX_TO_COLOR)]
        hist_data = list(filter(lambda x: x > 0, group[col])) # Remove 0 from data

        ptr = plt
        if separate_grouping is not None: # SEPARATE STUFF
            ptr = ax[index]

        (ret_n, ret_bins, ret_patches) = ptr.hist(hist_data, bins=bins, orientation=orientation, color=color)
        legend_ptr = legend_handles
        if separate_grouping is not None:
            ax[index].legend(handles=[plt.Line2D([0], [0], color=color, label=name)])
        else:
            legend_handles.append(plt.Line2D([0], [0], color=color, label=name))

        # Find maximum frequency
        if max(ret_n) > max_frequency:
            max_frequency = max(ret_n)

        if len(hist_data) > 0 and min(hist_data) < min_val:
           min_val = min(hist_data)
        
        if len(hist_data) > 0 and max(hist_data) > max_val:
           max_val = max(hist_data)
    
    if separate_grouping is not None: # SEPARATE STUFF
        for num_ax in ax[ax_max_index + 1:]:
            fig.delaxes(num_ax)
        
    print("HISTOGRAM: MAX_FREQUENCY: {}".format(max_frequency))   
    print("MIN: {}, MAX: {}".format(min_val, max_val))
    plt.ylim((0, max_frequency + 1))
    if group_by is not None and len(group_by) > 0 and separate_grouping is None:
        plt.legend(handles=legend_handles)
    if separate_grouping is None:
        plt.xlim((min_val, max_val))
    plt.xlabel(col)
    plt.ylabel("Frequency")

    alter_plot_appearance_post(label_dict)
    plot_save_or_show(save)
    return

def main():
    # Minimum Arguments
    p = argparse.ArgumentParser()
    p.add_argument("-p", "--pickle",        type=str,  help="path to the pickle (.pkl) or folder of pickles ", required=True, metavar=('PATH'))
    p.add_argument("-bm", "--benchmark", type=str,  help="benchmark type", required=True, metavar=('TYPE'), choices=BENCHMARK_TYPES)

    # Exclusive arguments
    mut_group = p.add_mutually_exclusive_group(required=True)
    mut_group.add_argument("-tst", "--test",                action=argparse.BooleanOptionalAction, help="run test function")
    mut_group.add_argument("-tbl", "--table",               type=int, nargs=1, metavar=("FULL_PRINT_0_or_1"), help="show pickle-data as table in console")
    mut_group.add_argument("-gh", "--generic-heatmap",      action=argparse.BooleanOptionalAction, help="plot pickle via generic heatmap plot generation")
    mut_group.add_argument("-spp", "--special-plot",     type=int, nargs=2, help="plot pickle via special/pickle dependent plot generation", metavar=("MAJOR", "MINOR"))
    mut_group.add_argument("-bop", "--boxplot", type=str, nargs="*", metavar=("GROUP-COL"), help="plots the boxplot. DEPENDENCIES: -col -idx. COMBINABLE-PLOT: -xal -yal -tl")
    mut_group.add_argument("-lp", "--lineplot", type=str, nargs="*", metavar=("GROUP-COL-LIST", "SECOND-AXE-COL"), help="plots the lineplot. DEPENDENCIES: -col -idx. COMBINABLE-PLOT: -xal -yal -tl")
    mut_group.add_argument("-scp", "--scatterplot", type=str, nargs="*", metavar=("GROUP-COL-LIST", "SECOND-AXE-COL"), help="plots the scatter plot. DEPENDENCIES: -col -idx. COMBINABLE-PLOT: -xal -yal -tl")

    mut_group.add_argument("-vlp", "--vertical-lineplot", type=str, nargs="*", metavar=("GROUP-COL"), help="plots the lineplot. DEPENDENCIES: -col -idx. COMBINABLE-PLOT: -xal -yal -tl")
    mut_group.add_argument("-ep", "--repetition_errorplot", type=str, nargs="*", metavar=("GROUP-COL"), help="plots the errorplot. DEPENDENCIES: -col -idx.")
    mut_group.add_argument("-bap", "--barplot", type=str, nargs="+", metavar=("CLUSTERED-PRIORITY", "GROUP-COL-LIST", "HORIZONTAL"), help="plots the barplot. CLUSTERED-PRIORITY=[0|1]: Whether first group-column should be clustered. HORIZONTAL: [True | 1] DEPENDENCIES: -col -idx. COMBINABLE-PLOT: -xal -yal -tl. ")
    mut_group.add_argument("-hist", "--histogram", type=str, nargs="+", metavar=("BINS", "ORIENTATION", "GROUP-COL-LIST"), help="plots the histogram. BINS:Number of equal-width bins or list of FROM-TO-STEP. ORIENTATION: 0: vertical (default), 1: horizontal. DEPENDENCIES: -col -idx. COMBINABLE-PLOT: -xal -yal -tl. ")

    mut_group.add_argument("-wavg", "--weighted-average", type=str, nargs=2, metavar=("VALUE-COL", "WEIGHTS-COL"), help="Calculate weighted average")
    mut_group.add_argument("-stat", "--statistic", type=str, nargs="+", metavar=("GROUP-COL-LIST"), help="Calculate statistic over col dependent on grouping (MEAN, MEDIAN, MODE, STD, VARIANCE). DEPENDENCIES: -col")
    mut_group.add_argument("-nnd", "--not-normal-distribution", type=str, nargs=3, metavar=("MEAN-COL", "MEDIAN-COL", "MODE-COL"), help="Show rows where Mean, Median or Mode are indifferent")
    mut_group.add_argument("-expo", "--extrapolate", type=str, nargs=4, metavar=("IDX-EXPO-VAL", "GROUP-COL-LIST", "PLOT", "LEG-VAL-LIST"), help="Calculate extrapolation on -col per group for -idx val. DEPENDENCIES: -col -idx, LEG-VAL-LIST: List of Legend element labels")

    ## Data Correlation
    mut_group.add_argument("-corr", "--correlation", type=str, nargs="+",  metavar=("COL-NAME-LIST-TO-CORR", "DIFF-COL-NAME-LIST", "KEY-VAL-LIST"), help="KEY-VAL-LIST: FREQ:80000000?FREQ:13333333")

    mut_group.add_argument("-corrref", "--correlation-ref", type=str, nargs="+",  metavar=("COL-NAME-LIST-TO-CORR", "DIFF-COL-NAME-LIST", "GROUP-VAL-FIRST-COL"), help="-corrref CNT_NORM:CYC_DIFF_PROP_DIV FREQ FREQ:80000000")

    mut_group.add_argument("-corrm", "--correlation-matrix", type=str, nargs=2,  metavar=("COL-NAME-LIST-TO-CORR", "DIFF-COL-NAME-LIST"), help="")


    mut_group.add_argument("-vrb", "--value-range-boxplot", nargs='+', help="plots", metavar=('IDX_VALUE'))
    mut_group.add_argument("-cp", "--current-plot", help="plot a time course of measured current", action=argparse.BooleanOptionalAction)
    mut_group.add_argument("-hc", "--human-correlation",     nargs= 2, type=str,  metavar=("PATH-SWO-PKL", "GROUP-COL-LIST"), help="human correlation. PATH-SWO-PKL: Same or Path. GROUP-COL-LIST: eg. operation:storage or None")
    mut_group.add_argument("-fc", "--folder-correlation",  nargs= 9, type=str,  metavar=("PATH-SWO-FOLDER", "SPECIAL", "SORT-BY-COL-LIST", "SORT-BY-DESCENDING", "LINE-PLOT-COL", "SCATTER-PLOT-COL", "SELECTION-FILTER", "BAR-PLOT-COL", "ENABLE-CORR"), help="human correlation. PATH-SWO-PKL: Same or Path.")
    mut_group.add_argument("-lrw", "--lineplot-rigol-wave", action=argparse.BooleanOptionalAction, help="plots the lineplot of multiple rigol wave data samples")


    # Additional arguments
    ## Column/ Index selection
    p.add_argument("-col" , "--column", type=str, help="select value column for plotting", metavar=('VAL_COLUMN_NAME'))
    p.add_argument("-idx" , "--index", type=str, help="select index column plotting", metavar=('IDX_COLUMN_NAME'))
    p.add_argument("-ucol", "--unique-columns", nargs="+", metavar=("UNIQUE-COL-NAME"), help="Unique workload column name")
    p.add_argument("-errcol" , "--error-column", type=str, help="select error column for plotting. Might be a single std col or multiple col in case of min/max", metavar=('VAL-COLUMN-NAME-LIST'))

    ## Data Manipulation
    ### COL SCALE
    p.add_argument("-cr", "--column-reindex", nargs=4, metavar=("COLUMN-NAME", "GROUP-COL-LIST", "METHOD", "FILL-VALUE"), help="Perform a reindexing for a specified column")
    p.add_argument("-csc", "--column-scale", nargs=3, metavar=("COLUMN-NAME-LIST", "SCALE-FACTOR", "SCALE-OPERATION"), help="scale a given column with a given operation by a given scale factor")
    p.add_argument("-csc2", "--column-scale-2", nargs=4, metavar=("COLUMN-NAME-LIST", "SCALE-FACTOR", "SCALE-OPERATION", "NEW-COLUMN-LIST"), help="scale a column with a given operation by a given scale factor and assign the result to a new column. If NEW-COLUMN is None the Column Name will be altered.")

    p.add_argument("-csc3", "--column-scale-3", nargs=4, metavar=("COLUMN-NAME-LIST", "SCALE-FACTOR", "SCALE-OPERATION", "NEW-COLUMN-LIST"), help="scale a column with a given operation by a given scale factor and assign the result to a new column. If NEW-COLUMN is None the Column Name will be altered.")

    ### PROPORTION
    p.add_argument("-prop", "--proportion", nargs=4, metavar=("[DIV/SUB]", "PROP_COL_NAME", "REFERENCE_FEATURE_COL_VAL", "SAME_FEATURE_LIST"), help="calculate the proportion between values of the same column. SAME_FEATURE_LIST: eg. operation:storage or None")
    p.add_argument("-prop2", "--proportion-2", nargs=4, metavar=("[DIV/SUB]", "PROP_COL_NAME", "REFERENCE_FEATURE_COL_VAL", "SAME_FEATURE_LIST"), help="calculate the proportion between values of the same column. SAME_FEATURE_LIST: eg. operation:storage or None")
    p.add_argument("-prop3", "--proportion-3", nargs=4, metavar=("[DIV/SUB]", "PROP_COL_NAME", "REFERENCE_FEATURE_COL_VAL", "SAME_FEATURE_LIST"), help="calculate the proportion between values of the same column. SAME_FEATURE_LIST: eg. operation:storage or None")
    p.add_argument("-prop4", "--proportion-4", nargs=4, metavar=("[DIV/SUB]", "PROP_COL_NAME", "REFERENCE_FEATURE_COL_VAL", "SAME_FEATURE_LIST"), help="calculate the proportion between values of the same column. SAME_FEATURE_LIST: eg. operation:storage or None")

    ### REPETITION
    p.add_argument("-repst", "--repetition-statistics", nargs=2, type=str, metavar=("COL-NAME-TO-STAT-LIST", "DIFF-COL-NAME-LIST"), help="calculate mean, std and var between the repetition on the given column name by grouping the data by DIFF_COL_NAME_LIST eg. FREQ:COL1:COL2 . The column name values should be int or float.")
    p.add_argument("-repst2", "--repetition-statistics-2", nargs=3, type=str, metavar=("COL-NAME-TO-STAT-LIST", "DIFF-COL-NAME-LIST", "BOOL-REP-ID"), help="calculate mean, std and var between the repetition on the given column name by grouping the data by DIFF_COL_NAME_LIST eg. FREQ:COL1:COL2 . The column name values should be int or float.")

    p.add_argument("-dr", "--drop",         nargs="+", help="drop the given column type before plotting", metavar=('COLUMN_NAME'))

    p.add_argument("-drnc", "--drop-n-cols", type=int, help="drop the last n columns", metavar=('N'))

    ### FEATURE SELECT / REMOVE
    p.add_argument("-fs", "--feature-selection", nargs='+', help="select a value of a column to decrease the dimension of plotting. WILL BE DIRECTLY EXECUTED AFTER DATA PICKLE READ.  OPERATORS TO CHOOSE: \":\" --> equal; \"{\" --> less; \"}\" --> bigger. EXAMPLE: eg. DVS_POL:0 FWS}1", metavar=('COLUMN_VALUE_PAIR'))
    p.add_argument("-fr", "--feature-removal", nargs='+', help="select a value of a column that should be removed for plotting. WILL BE DIRECTLY EXECUTED AFTER DATA PICKLE READ.  OPERATORS TO CHOOSE: \":\" --> equal; \"{\" --> less; \"}\" --> bigger. EXAMPLE: eg. DVS_POL:0 FWS}1", metavar=('COLUMN_VALUE_PAIR'))

    p.add_argument("-fsp", "--feature-selection-post", nargs='+', help="select a value of a column to decrease the dimension of plotting. OPERATORS TO CHOOSE: \":\" --> equal; \"{\" --> less; \"}\" --> bigger. EXAMPLE: eg. DVS_POL:0 FWS}1", metavar=('COLUMN_VALUE_PAIR'))
    p.add_argument("-frp", "--feature-removal-post", nargs='+', help="select a value of a column that should be removed for plotting. OPERATORS TO CHOOSE: \":\" --> equal; \"{\" --> less; \"}\" --> bigger. EXAMPLE: eg. DVS_POL:0 FWS}1", metavar=('COLUMN_VALUE_PAIR'))

    p.add_argument("-fsc", "--feature-selection-combination", nargs='+', help="Select conditional column values of two dataframe columns. Example: CNT_TYPE:4?CNT_NORM}5000 All rows with Column Type 4 should be higher than 50 [[ {\"equal\": {\"CNT_TYPE\": 4}}, {\"bigger\": {\"CNT_NORM\": 50}}]]", metavar=('COLUMN_VALUE_PAIR'))
    
    p.add_argument("-fsgl", "--feature-select-group-len", type=str, nargs=2, help="", metavar=('GROUPING-COL-LIST', 'GROUP-LEN'))

    p.add_argument("-do", "--drop-outliers", nargs='+', help="select a columns to run a outlier removal on. METHOD: [zscore, iqr]. ARGUMENTS: COLUMN-LIST DIFF-COL-NAME-LIST METHOD", metavar=('COLUMN-LIST'))

    p.add_argument("-bs", "--bench-select", nargs=2, type=str, help="Select a group of Benchmark Names. BENCH-GROUP:{}, REMOVE-BOOL=[0, 1, True, False]".format(BENCH_NAME_GROUP_TO_NAME_LIST), metavar=('BENCH-GROUP', "REMOVE-BOOL"))


    ### CREATE COLOMN
    p.add_argument("-ccp", "--create-column_pre", nargs=4, help="Create a new colum that is based on the combination of other columns.", metavar=('NAME', 'COLUMN-1', 'COLUMN-2', 'OPERATION'))

    p.add_argument("-cc", "--create-column", nargs=4, help="Create a new colum that is based on the combination of other columns.", metavar=('NAME', 'COLUMN-1', 'COLUMN-2', 'OPERATION'))
    p.add_argument("-cc2", "--create-column_2", nargs=4, help="Create a new colum that is based on the combination of other columns.", metavar=('NAME', 'COLUMN-1', 'COLUMN-2', 'OPERATION'))

    p.add_argument("-ccpg", "--create-column-per-group", nargs=4, help="Create a new colum that is based on a group calculation OPERATION=min, max, mean", metavar=('NEW-COL-NAME-LIST', 'CALC-ON-COL-NAME-LIST', 'GROUPING-COL-LIST', 'OPERATION-LIST'))

    p.add_argument("-fl", "--flatten", nargs=1, help="Flatten the benchmark dataframe by ucol", metavar=("DIFF-COL-NAME-LIST"))

    p.add_argument("-mlt", "--melt", nargs=2, help="Flatten the benchmark dataframe by ucol", metavar=("COLS-TO-MELT-LIST", "MELTED-COL-NAME"))


    ### ROW OPERATION
    p.add_argument("-ro", "--row-operation", nargs=5, type=str, metavar=("COL-NAME-TO-OPERATE-LIST", "GROUP-COL-NAME-LIST", "OPERATION", "SPECIFIC-ROW-FEATURE-LIST", "ELEMENT-NAME"), help="COL-NAME-TO-OPERATE-LIST eg. FREQ:CNT_TYPE; GROUP-COL-NAME-LIST eg. operation:storage; OPERATION eg. [sum, diff]; SPECIFIC-ROW-FEATURE-LIST eg. FREQ:80000000:13333333, ELEMENT-NAME eg. COMP_FLASH_SUM")
    p.add_argument("-ro0                  ", "--row-operation-0", nargs=6, type=str, metavar=("COL-NAME-TO-OPERATE-LIST", "GROUP-COL-NAME-LIST", "OPERATION", "SPECIFIC-ROW-FEATURE-LIST", "ELEMENT-NAME", "REMOVE-AGGREGATED-BOOL"), help="COL-NAME-TO-OPERATE-LIST eg. FREQ:CNT_TYPE; GROUP-COL-NAME-LIST eg. operation:storage; OPERATION eg. [sum, diff]; SPECIFIC-ROW-FEATURE-LIST eg. FREQ:80000000:13333333, ELEMENT-NAME eg. COMP_FLASH_SUM")

    # Data Input via cmdline
    p.add_argument("-mwd", "--merge-with-dict", nargs="+", type=str, metavar=("COL-NAME-LIST", "VALUE-PAIR"), help="eg. -mwd FREQ:DELAY_GPIO 13333333:0.5 26666666:10 ...")

    ### ENERGY CALCULATIONS
    p.add_argument("-cac", "--calculate-alpha-c", action=argparse.BooleanOptionalAction, help="Transform Current Data list per row into Current Mean and Current Sample")
    p.add_argument("-ccm", "--calculate-current-mean", nargs=1, help="Transform Current Data list per row into Current Mean and Current Sample", metavar=("DIFF-COL-NAME-LIST"))
    p.add_argument("-ce", "--calculate-energy", nargs=1, help="Transform Current Mean Data per row into Energy metrics", metavar=("DIFF-COL-NAME-LIST"))

    p.add_argument("-bdm", "--benchmark-data-manipulation", action=argparse.BooleanOptionalAction, help="Perform the benchmark specific data manipulation step")
    p.add_argument("-twpl", "--trace-wave-packet-length", action=argparse.BooleanOptionalAction, help="Perform the trace_wave packet length calculation")

    ## ADVANCED ENERGY CALCULATIONS
    p.add_argument("-eff", "--energy-from-flash", nargs=1, help="Calculate the energy at different frequencies dependent on flash usage", metavar=("DIFF-COL-NAME-LIST"))

    PROFILING_COUNTER_COMBINATIONS = {0:"INSTRUCTION", 1:"INSTRUCTION_NON_CPI", 2:"LSU_SUB_RAM", 3:"FLASH_SUB_LSU_CACHE"}
    p.add_argument("-pcc", "--profiling-counter-combinations", nargs=2, help="Calculate the instructions with the profiling counter readings. COMBINATION: {} ".format(PROFILING_COUNTER_COMBINATIONS), metavar=("DIFF-COL-NAME-LIST", "COMBINATION"))
    
    p.add_argument("-efc", "--energy-from-cycles", nargs=1, help="Calculate the most efficient energy per frequency with the profiling counter readings", metavar=("DIFF-COL-NAME-LIST"))

    p.add_argument("-efc2f", "--energy-from-cycles-2-freqs", nargs=3, help="Calculate the most efficient energy per frequency with the profiling counter readings", metavar=("DIFF-COL-NAME-LIST", "FREQ-ID-LIST", "BOOL-INSTRUCTION-WEIGHT"))

    ## Data Ordering
    p.add_argument("-ord", "--ordering",     type=str,  metavar=("PATH-ORDER-JSON"), help="PATH-ORDER-JSON: Path to a file that illsutrate some kind of ordering. e.g. for folder_correlation it could display the ordering of the benchmarks")
    p.add_argument("-orddisp", "--ordering-display", action=argparse.BooleanOptionalAction, help="Counterpart/Source of argument ordering")

    ## Data Sorting before plotting
    p.add_argument("-so", "--sort", type=str, nargs="+",  metavar=("SORT-BY-COL-LIST", "SORT-BY-ASCENDING-LIST"), help="SORT-BY-ASCENDIG-LIST: e.g. 0:1 (should have the length 1 or len(SORT-BY-COL-LIST)) ]")

    ## Plot Labeling and saving Labeling

    ### RENAMING
    p.add_argument("-cl", "--column-labels", nargs="+", metavar=("COLNAME-STR-DICT"), help="Rename index based labels to human-readable labels. Input convention: COLNAME?INDEX:LABEL[?INDEX:LABEL] eg. swo_mode?0:REF?1:DEMCR?2:DEMCR_SWOPIN")

    p.add_argument("-ccl", "--common-column-labels", action=argparse.BooleanOptionalAction, help="Rename index based labels to human-readable labels of known specific columns.")

    p.add_argument("-rc", "--rename-column", nargs=2, help="select a columns to rename to RENAME", metavar=('COLUMN', "RENAME"))

    ### APPEARANCE
    p.add_argument("-rgbp" , "--reversed-groubby-plotting", action=argparse.BooleanOptionalAction, help="Reverse the order of plotting the grouping of certain plots. Should not change the order of sorting")

    p.add_argument("-xal" , "--x-axis-label", nargs="+", type=str, help="select label for x axis per figure axis for plotting", metavar=('LABEL'))
    p.add_argument("-als" , "--axis-label-size", type=int, help="select label for x axis per figure axis for plotting", metavar=('LABEL'))

    p.add_argument("-xtv" , "--x-tick-visible", nargs="+", type=int, help="select label for x axis per figure axis for plotting", metavar=('BOOL-PER-AXIS'), choices=[0, 1])
    p.add_argument("-xalim" , "--x-axis-lim", nargs="+", type=str, help="select ticks limit/steps for x axis per figure axis for plotting", metavar=('left-right-tuple'))

    p.add_argument("-yal" , "--y-axis-label", nargs="+", type=str, help="select label for y axis per figure axis for plotting", metavar=('LABEL'))

    p.add_argument("-yalim" , "--y-axis-lim", nargs="+", type=str, help="select ticks limit/steps for y axis per figure axis for plotting", metavar=('left-right-tuple'))

    p.add_argument("-xatr" , "--x-axis-tickrotation", nargs="+", type=int, help="select ticks tickrotation for x axis per figure axis for plotting", metavar=('rotation-per-axis'))

    p.add_argument("-xatt" , "--x-axis-tick-top", action=argparse.BooleanOptionalAction, help="Whether to print the x axis ticks and axis itself at the top")

    p.add_argument("-xam" , "--x-axis-margins", nargs="+", type=str, help="select x axis margins per figure axis for plotting", metavar=('FLOAT'))
    p.add_argument("-yam" , "--y-axis-margins", nargs="+", type=str, help="select y axis margins per figure axis for plotting", metavar=('FLOAT'))

    p.add_argument("-tl" , "--title-label", type=str, help="select label for plot title", metavar=('LABEL'))
    p.add_argument("-ltl" , "--legend-title-label", nargs="+", help="select label for plot legend title", metavar=('LABEL'))
    p.add_argument("-legl" , "--legend-loc", nargs="+", help="select legend position for plot legend title WIDTH-HEIGHT-TUPLE == eg. 12:4 ", metavar=('WIDTH-HEIGHT-TUPLE'))
    p.add_argument("-legr" , "--legend-remove", type=str, help="select legend to be removed", metavar=('AXIS-ID-LIST'))
    p.add_argument("-legap" , "--legend-axis-parent", type=int, help="select axis the legend should be created on", metavar=('AXIS-ID'))


    p.add_argument("-pfs" , "--plot-figure-size", nargs=2, type=int, help="select label for plot legend title DEFAULT: (12, 8) ", metavar=('WIDTH', "HEIGHT"))
    p.add_argument("-agr" , "--axis-grid", nargs="+", type=str, help="select grid enable/disable for given amount of axes", metavar=('AXES-GRID-STATE'), choices=["0", "x", "y", "both"])
    p.add_argument("-alv" , "--axis-legend-visibility", nargs="+", type=str, help="select legend enable/disable for given amount of axes", metavar=('AXES-LEGEND-STATE'), choices=["0", "1"])
    p.add_argument("-aysc" , "--axis-yscale", nargs="+", type=str, help="select axis scale for given amount of axes", metavar=('AXES-SCALE-STATE'), choices=["0", "linear", "log", "symlog", "logit"])
    p.add_argument("-an" , "--annotate", nargs="+", type=str, help="Annotate figure with text at position: ANNOTATION-POS_TUPLE-LIST eg. Here:5:3", metavar=('ANNOTATION-POS_TUPLE-LIST'))

    p.add_argument("-sg" , "--separate-grouping", nargs=2, type=str, metavar=("ROWS", "COLS"), help="Whether to plot groupings on seperate figures")
    p.add_argument("-sgsa" , "--separate-group-share-axis", type=str, metavar=("SHARE-AXIS"), choices=["x", "y"], help="Whether to plot groupings on seperate figures")

    p.add_argument("-swap" , "--switch-appearance", action=argparse.BooleanOptionalAction, help="Whether to switch the apearance when plttoing with groups or separate axes")

    p.add_argument("-saco" , "--same-color", action=argparse.BooleanOptionalAction, help="Whether to only use one color for plotting the data of column col")
    p.add_argument("-puco" , "--plot-unique-color-order", type=str , metavar=("COLORORDER"), help="COLORORDER: r?g?b?tab:orange")

    p.add_argument("-pub" , "--plot-unique-behavior", type=str , metavar=("PLOT-NAME"), choices=["EXPO_STAT"])



    p.add_argument("-pse", "--pseudo", type=str, help="Does nothing. Is placeholder for string")

    p.add_argument("-s", "--save",         nargs=2, type=str,  help="output folder where plot will be saved (.pdf)", metavar=('OUTPUT_FOLDER_PATH', 'NAME'))

    args = p.parse_args()

    if args.test is not None:
        print("[TEST]")
        return
    
    print("[PICKLE-TO-PLOT]")

    # CHECK BENCHMARK EXISTENCE
    benchmark = args.benchmark
    if benchmark not in BENCHMARK_TYPES:
        print("BENCHMARK TYPE NOT RECOGNIZED")
        return

    # Argument Labels
    label_dict = argument_to_kwargs_dict(xaxis_label=args.x_axis_label, yaxis_label=args.y_axis_label, axis_label_size=args.axis_label_size, title_label=args.title_label, legend_label=args.legend_title_label, figure_size=args.plot_figure_size, legend_loc=args.legend_loc, legend_remove=args.legend_remove, axis_grid=args.axis_grid, legend_visibility=args.axis_legend_visibility, axis_yscale=args.axis_yscale, xaxis_lim=args.x_axis_lim, yaxis_lim=args.y_axis_lim, xaxis_tickrotation=args.x_axis_tickrotation, annotate=args.annotate, separate_grouping=args.separate_grouping, separate_group_share_axis=args.separate_group_share_axis, switch_appearance=args.switch_appearance, x_tick_visible=args.x_tick_visible, ordering_display=args.ordering_display, sorting_activated= True if args.ordering is not None or args.sort is not None else False, same_color=args.same_color, legend_axis_parent=args.legend_axis_parent, x_axis_margins=args.x_axis_margins, y_axis_margins=args.y_axis_margins, x_axis_tick_top=args.x_axis_tick_top, reversed_groupby=args.reversed_groubby_plotting, unique_color_order=args.plot_unique_color_order)

    alter_plot_appearance_pre(label_dict)

    # Ordering argument
    glob_ordering = None
    if args.ordering is not None:
        print("[SHELL ORDERING] - {}".format(args.ordering))
        with open(args.ordering) as f:
                glob_ordering = json.load(f)

    # Special Plot generation
    if args.special_plot is not None:
        plot_special_plot(args.special_plot, args.save, label_dict)
        return 
    


    # BOXPLOT HANDLE
    # TODO arguments feature-selection, drop not applicable for boxplot
    if args.value_range_boxplot is not None:
        # Get data
        files_data = pickle_folder_to_datatypes(pkl_folder_path=args.pickle)

        # Apply filename to Benchmark name
        lst_data = []
        lst_meta = []
        for f_data in files_data:
            frame = dataframe_append_benchname_with_filename(f_data[1].get("data"), f_data[0], BOXPLOT_DATA_KEY_COLUMN)
            lst_data.append(frame)
            lst_meta.append(f_data[1].get("metadata"))

        col = None
        idx = None
        idx_values = pd.to_numeric(args.value_range_boxplot, errors='ignore')
        idx_value_map = None

        # per benchmark handle
        if benchmark == "swo_bench":
            col = SWO_BENCH_DEFAULT_COL_SHOWED
            idx = SWO_BENCH_DEFAULT_IDX_SHOWED
            idx_value_map = SWO_BENCH_INDEX_TO_CNTTYPE
        elif benchmark == "energy_bench":
            col = ENERGY_BENCH_DEFAULT_COL_SHOWED
            idx = ENERGY_BENCH_DEFAULT_IDX_SHOWED
            for index in range(len(lst_data)):

                # Get unique workload column names
                glob_unique_wl_columns = meta_get_workload_params(meta=lst_meta[index])

                # Calculate energy and statistics
                #frame = dataframe_energy_bench_current_data_to_energy(lst_meta[index], lst_data[index], glob_unique_wl_columns + ["FREQ"])
                # TODO add proportion
                # Apply value_col scale
                lst_data[index] = dataframe_calculate_with_col(frame, [ENERGY_BENCH_DEFAULT_COL_SHOWED], ENERGY_BENCH_ENERGY_SCALE_MICRO_JOULE, "mul")
        if args.column is not None:
            col = args.column
        if args.index is not None:
            idx = args.index

        plot_generic_boxplot(lst_data, col, idx, idx_values, idx_value_map)    
        return

    if args.folder_correlation is not None:
        # Arguments: "PATH-SWO-FOLDER", "SPECIAL", "SORT-BY-COL-LIST", "SORT-BY-DESCENDING", "LINE-PLOT-COL", "SCATTER-PLOT-COL", "SELECTION-FILTER", "BAR-PLOT-COL", "ENABLE-CORR"

        special_label_mapping = {
            0: "Most energy efficient frequency (BARS, LINE)",
            2: "Profiling Counter Proportion LSU to CPI (BARS), Most Energy Efficient Frequency (LINE)",
            3: "Profiling Counter Proportion LSU to CPI in Proportion to Cycles Per Instructions (BARS)",
            6: "Biggest Energy Proportion between Highest and Lowest Energy Consumption (SCATTER)",
            9: "Biggest Energy Proportion between Highest and Lowest Energy Consumption (LINE)", # Like (6) but lineplot
            11: "Biggest Energy Proportion between 80 MHz and Lowest Energy Consumption (LINE)", # Real World Energy Saving Potential
            18: "Frequency of Lowest Cycles (BARS, LINE)", # Frequency with the most saved cycles
            19: "Frequency of Biggest Cycles Saving per Saved FWS (BARS, LINE)", # Frequency with the most saved cycles
            20 : "Most energy efficient frequency - CNT_TIME (BARS, LINE)", # Similar to (0)
            23: "Profiling Counter Proportion LSU to CPI (BARS)",
            98: "MCS_PROP_DIV via CYCLES_PER_INSTRUCTIONS",
            100: "Pair Plot"
        }

        ## 6: CNT proportion to instructions

        fc_special = int(args.folder_correlation[1])
        fc_sort_by = None
        if args.folder_correlation[2] not in ["None", "none", "0"]:
            fc_sort_by = parse_argument_list(args.folder_correlation[2])
            print("SORT_BY: ", fc_sort_by)
        fc_sort_by_descending = False
        if args.folder_correlation[3] in ["True", "true", "1"]:
            fc_sort_by_descending = True
            print("SORT_DESCENDING: ", fc_sort_by_descending)

        
        # Argument: "SELECTION-FILTER" Handle
        fc_selection_filter:int = args.folder_correlation[6]
        if fc_selection_filter in ["1"]:
            fc_selection_filter = 1
            print("---------FWSA-SPEED-UP-FILTER ACTIVATED-------------")
        elif fc_selection_filter in ["2"]:
            fc_selection_filter = 2
            print("---------HIGH-MEDIUM-APPLICABLE-FILTER ACTIVATED-------------")
        else:
            fc_selection_filter = 0
        print("FC_SPECIAL: ", fc_special, " with title: ", special_label_mapping.get(fc_special, None))

        bar_arg_cols = None
        if args.folder_correlation[7] not in ["None", "none", "0"]:
            bar_arg_cols = parse_argument_list(args.folder_correlation[7])
            if len(bar_arg_cols) == 1:
                bar_arg_cols = bar_arg_cols[0]
            print("BAR_COL: ", bar_arg_cols)

        line_arg_cols = None
        if args.folder_correlation[4] not in ["None", "none", "0"]:
            line_arg_cols = parse_argument_list(args.folder_correlation[4])
            print("LINE_COL: ", line_arg_cols)

        scatter_arg_col = None
        if args.folder_correlation[5] not in ["None", "none", "0"]:
            scatter_arg_col = parse_argument_list(args.folder_correlation[5])
            if len(scatter_arg_col) > 2:
                print("Scatter Argument is COL_NAME[:SELECT_FREQ]")
                return
            print("SCATTER_COL: ", scatter_arg_col)

        correlation_enable = False
        if args.folder_correlation[8] not in ["None", "none", "0"]:
            correlation_enable = True
            print("Correlation on plot enabled")
        

        # Get data
        energy_path = args.pickle
        if energy_path[-1] != "/":
            energy_path += "/"

        swo_path = args.folder_correlation[0]
        if swo_path in ["Same", "same"]:
            swo_path = energy_path
            swo_path = [swo_path.replace("energy_bench", "swo_bench")]
        elif swo_path in ["None", "none", 0, "0"]:
            swo_path = []
        else:
            swo_path = [swo_path]
        
        temp_data_list:list = pickle_folders_to_datatypes(folders=[energy_path] + swo_path, follow_subdirectories=True)
        assert len(temp_data_list) != 0, "Maybe wrong path given"

        # Precalculate and merge all data by combining swo/current data and bench groups
        data_list = []
        for index, d_point in enumerate(temp_data_list):

            swo_index = 1
            energy_index = 0
            if len(swo_path) == 0:
                swo_index = 0

            # find swo and energy index
            elif len(swo_path) == 1:
                for d_i_index, d_i in enumerate(d_point[1]):
                    if COL_NAME_ENERGY_BENCH_CURRENT in d_i["data"].columns:
                        energy_index = d_i_index
                    else:
                        swo_index = d_i_index

            
            
            # Calculate Repetition statistics
            e_params = meta_get_workload_params(d_point[1][energy_index]["metadata"])
            e_feature = ["DVS_POL", "FREQ"] + e_params
            swo_features:list = ["CNT_TYPE" ,"DVS_POL", "FREQ"] + meta_get_workload_params(d_point[1][swo_index]["metadata"])

            if COL_NAME_BENCH_CACHE in d_point[1][swo_index]["data"]:
                swo_features += [COL_NAME_BENCH_CACHE]
            
            #if COL_NAME_BENCH_REPETITION in d_point[1][energy_index]["data"].columns:
                #d_point[1][energy_index]["data"] = dataframe_energy_bench_current_data_to_energy(d_point[1][energy_index]["metadata"], d_point[1][energy_index]["data"], e_feature)
            
            d_point[1][energy_index]["data"] = dataframe_proportion_column(d_point[1][energy_index]["data"], "div", "REP_ENERGY_TOTAL", e_params + ["DVS_POL"], ("FREQ", 80000000))
            #print(d_point[1][0]["data"]["REP_ENERGY_TOTAL_PROP_DIV"])

            if COL_NAME_BENCH_REPETITION in d_point[1][swo_index]["data"].columns:
                d_point[1][swo_index]["data"] = dataframe_repetition_statistics(d_point[1][swo_index]["data"], "CNT", swo_features) # Calculate Statisitcs on CYC_DIFF + CNT
            
            # Renaming
            d_point[1][swo_index]["data"] = dataframe_column_idxval_to_strval(d_point[1][swo_index]["data"], "CNT_TYPE", SWO_BENCH_INDEX_TO_CNTTYPE) # CNT_TYPE

            d_point[1][energy_index]["data"] = dataframe_column_idxval_to_strval(d_point[1][energy_index]["data"], "DVS_POL", DVS_POL_INDEX_TO_STRING)
            d_point[1][swo_index]["data"] = dataframe_column_idxval_to_strval(d_point[1][swo_index]["data"], "DVS_POL", DVS_POL_INDEX_TO_STRING)

            # TODO think about Renamming of TCI

            # Seperate CNT Type Columns
            swo_features.remove("CNT_TYPE")
            d_point[1][swo_index]["data"] = dataframe_merge_column_to_row(d_point[1][swo_index]["data"], ["CNT_NORM", "CNT_REP_MEAN"], "CNT_TYPE", swo_features)

            # Merge Data and metadata of swo and energy measurements
            (meta_merge, data_merge) = dataframe_merge_energy_swo_data(d_point[1][energy_index]["metadata"], d_point[1][energy_index]["data"], d_point[1][swo_index]["metadata"], d_point[1][swo_index]["data"])

            # Skip the workloads that are already flattened as they have no workload params
            if len(e_params) == 0:
                data_list.append([d_point[0], {"metadata": meta_merge, "data":data_merge}])
                continue

            # Flatten and seperate workloads grouped by workload params
            for (name, met, dat) in dataframe_flatten(meta_merge, data_merge, e_params):
                data_list.append([name, {"metadata": met, "data":dat}])

        
        # Put all dataframe into one dataframe # Could be made by prior loop
        data_frame:pd.DataFrame = None
        for index, d_point in enumerate(data_list):
            if data_frame is None:
                data_frame = d_point[1]["data"]
            else:
                data_frame = pd.concat([data_frame, d_point[1]["data"]], ignore_index=True)
        
        # Sort by Bench namne
        data_frame = data_frame.sort_values(by=["BENCH", "FREQ"])

        CNT_NORM_COL_NAMES = ["CNT_NORM_FOLD", "CNT_NORM_LSU", "CNT_NORM_SLEEP", "CNT_NORM_EX", "CNT_NORM_CPI"]
        CNT_COL_NAMES = ["CNT_REP_MEAN_FOLD", "CNT_REP_MEAN_LSU", "CNT_REP_MEAN_SLEEP", "CNT_REP_MEAN_EX", "CNT_REP_MEAN_CPI"]
        CNT_FLASH_COL_NAMES =  ['CNT_REP_MEAN_COMP_FLASH_0', 'CNT_REP_MEAN_COMP_FLASH_1', 'CNT_REP_MEAN_COMP_FLASH_2', 'CNT_REP_MEAN_COMP_FLASH_3', 'CNT_REP_MEAN_COMP_FLASH_4', 'CNT_REP_MEAN_COMP_FLASH_5', 'CNT_REP_MEAN_COMP_FLASH_6', 'CNT_REP_MEAN_COMP_FLASH_7'] # TODO Rename to CNT_COMP_FLASH

        if all(c in data_frame.columns for c in ["ITERATIONS", "CYC_DIFF"]):
            data_frame["CYCLES_PER_ITERATIONS"] = data_frame["CYC_DIFF"].div(data_frame["ITERATIONS"])

        # Plot Specific data manipulation
        ## Instructions
        if CNT_COL_NAMES[0] in data_frame.columns: # When other prf cnt are not measured
            
            ## LSU/CPI & LSU-CPI
            FC_SP_2_COL = ["LSU_DIV_CPI", "LSU_SUB_CPI", "LSU_CPI_SLEEP_ADD", "ALL_ADD_SUB_LSU_DIV_CPI", "ALL_ADD_ADD_LSU_SUB_CPI"]#, "LSU_ADD_CPI_SUB_FOLD"]
            if fc_special in [2, 3, 7, 23]:
                data_frame[FC_SP_2_COL[0]] = data_frame[CNT_NORM_COL_NAMES[1]].div(data_frame[CNT_NORM_COL_NAMES[4]]).mul(1200)
                data_frame[FC_SP_2_COL[1]] = data_frame[CNT_NORM_COL_NAMES[1]].sub(data_frame[CNT_NORM_COL_NAMES[4]])
                data_frame[FC_SP_2_COL[2]] = data_frame[CNT_NORM_COL_NAMES[1]].add(data_frame[CNT_NORM_COL_NAMES[4]]).add(data_frame[CNT_NORM_COL_NAMES[2]])
                data_frame[FC_SP_2_COL[3]] = (data_frame[FC_SP_2_COL[2]].sub(data_frame[FC_SP_2_COL[0]])).abs()
                data_frame[FC_SP_2_COL[4]] =  data_frame[FC_SP_2_COL[2]].add(data_frame[FC_SP_2_COL[1]])
                #data_frame[FC_SP_2_COL[5]] = data_frame[CNT_NORM_COL_NAMES[1]].add(data_frame[CNT_NORM_COL_NAMES[4]]).sub(data_frame[CNT_NORM_COL_NAMES[0]])
            
        common_energy_grouping = ["BENCH"]
        if len(data_frame["DVS_POL"].unique()) > 1:
            common_energy_grouping += ["DVS_POL"]
        if len(data_frame[COL_NAME_BENCH_CACHE].unique()) > 1:
            common_energy_grouping += [COL_NAME_BENCH_CACHE]
    
        ## Most Energy efficient Frequency per bench by adding column set to FREQ or NaN
        if len(data_frame["FREQ"].unique()) > 1 and "REP_ENERGY_TOTAL" in data_frame.columns: # Energy difference can only be calculated if the data has multiple frequency settings
            
            data_frame["EEF"] = data_frame["FREQ"].loc[data_frame.groupby(common_energy_grouping)["REP_ENERGY_TOTAL_PROP_DIV"].idxmin()]

            ## Biggest Energy Proportion between highest and lowest energy consumption per bench by adding column set to COL_DIFFERENCE or NaN
            ### Hacky version
            temp_data_frame:pd.DataFrame = None
            for name, gr in data_frame.groupby(common_energy_grouping):
                lowest_energy_prop_row = gr[gr["REP_ENERGY_TOTAL_PROP_DIV"] == gr["REP_ENERGY_TOTAL_PROP_DIV"].min()]
                gr["R_BEP"] = gr["REP_ENERGY_TOTAL_PROP_DIV"].sub(lowest_energy_prop_row["REP_ENERGY_TOTAL_PROP_DIV"].values[0])
                gr["R_BEP"] = gr["R_BEP"].abs()

                if temp_data_frame is None:
                    temp_data_frame = gr
                else:
                    temp_data_frame = pd.concat([temp_data_frame, gr])
            data_frame = temp_data_frame

            ### Blend out all other proportion
            data_frame["R_BEP"] = data_frame["R_BEP"].loc[data_frame.groupby(common_energy_grouping)["R_BEP"].idxmax()]

            ## Biggest Energy Proportion between 80MHz and lowest energy consumption per bench by adding column set to COL_DIFFERENCE or NaN
            data_frame["R_80EP"] = data_frame["REP_ENERGY_TOTAL_PROP_DIV"].loc[data_frame.groupby(common_energy_grouping)["REP_ENERGY_TOTAL_PROP_DIV"].idxmin()].sub(1).abs()

            data_frame["REP_ENERGY_TOTAL_IMPROVEMENT"] = data_frame["REP_ENERGY_TOTAL_PROP_DIV"].loc[data_frame.groupby(common_energy_grouping)["REP_ENERGY_TOTAL_PROP_DIV"].idxmin()]
            
            ##
            data_frame["POWER_DIV_FREQ"] = data_frame["REP_POWER"].div(data_frame["FREQ"])
        
        ## EnergyCalc
        #if fc_special in [25]:
        if True and len(data_frame["FREQ"].unique()) > 1:
            # Empiric measured static energy

            data_frame = pd.merge(data_frame, EMPIRIC_STAT_POWER_DATAFRAME, on=["FREQ", "DVS_MV"])

            #print(data_frame[["BENCH", "FREQ", "DVS_MV", "POWER_STAT_CALC"]].to_string())

            #### Hacky version
            temp_data_frame:pd.DataFrame = None
            for name, gr in data_frame.groupby(common_energy_grouping):

                # Extrapolated static energy 
                # extrapolate_power = np.polyfit(gr["FREQ"], gr["REP_POWER"], 1)
                # extrapolate_power = np.poly1d(extrapolate_power)
                # #print(extrapolate)
                # #print(extrapolate(0))
                # gr["POWER_STAT_CALC"] = extrapolate_power(0) # TODO Replace CYC with MCS

                # Empiric measured static energy # OLD VAlues
                gr["POWER_STAT_CALC_TWO"] = gr["DVS_MV"].map({1000:0.00239, 1200:0.00287})
                #print(gr[["BENCH", "FREQ", "DVS_MV", "POWER_STAT_CALC"]].to_string())

                gr["ENERGY_STAT_CALC"] = gr["POWER_STAT_CALC"] * gr["REP_TIME_SAMPLED"]
                gr["ENERGY_DYN_CYC_SUB"] = gr["REP_ENERGY_TOTAL"] - gr["ENERGY_STAT_CALC"]

                # P = alpha * C * V² * f --> Edyn = alpha * C * V^2 * Cycles
                # E_measured = Edyn + Estat --> alpha * C = (E_measured - Estat)/(V^2 * Cycles)
                # alpha * C = E / (V² * Cycles)
                row80MHz = gr[gr["FREQ"] == 80000000]
                alphaC_at_80mhz = (row80MHz["REP_ENERGY_TOTAL"].values[0] - row80MHz["ENERGY_STAT_CALC"].values[0]) / ((row80MHz["DVS_MV"].values[0]/1000)**2 * row80MHz["CYC_DIFF"].values[0])

                gr["ENERGY_DYN_CYC_ALPHAC"] = (gr["REP_ENERGY_TOTAL"] - gr["ENERGY_STAT_CALC"]) / ((gr["DVS_MV"]/1000)**2 * gr["CYC_DIFF"])

                gr["ALPHAC_FROM_POWER"] = (gr["REP_POWER"] - gr["POWER_STAT_CALC"]) / ((gr["DVS_MV"]/1000)**2 * gr["FREQ"])
                gr["ALPHAC_FROM_POWER_TWO"] = (gr["REP_POWER"] - gr["POWER_STAT_CALC_TWO"]) / ((gr["DVS_MV"]/1000)**2 * gr["FREQ"])
                gr["ALPHAC_FROM_POWER_SUB"] = gr["ALPHAC_FROM_POWER"].sub(gr["ALPHAC_FROM_POWER_TWO"])

                #print(gr[["BENCH", "REP_POWER", "DVS_MV", "FREQ", "POWER_STAT_CALC", "ALPHAC_FROM_POWER", "ALPHAC_FROM_POWER_TWO", "POWER_STAT_CALC_TWO"]].to_string())

                # EnergyCalc = alpha * C * V^2 * Cycles
                gr["ENERGY_DYN_CYC_CALC"] = alphaC_at_80mhz * (gr["DVS_MV"].div(1000))**2 * gr["CYC_DIFF"] 

                gr["ENERGY_CYC_CALC"] = gr["ENERGY_DYN_CYC_CALC"] + gr["ENERGY_STAT_CALC"]


                if temp_data_frame is None:
                    temp_data_frame = gr
                    #print("Extrapolate:", extrapolate_power(0))
                    print("alphaC:", alphaC_at_80mhz)
                else:
                    temp_data_frame = pd.concat([temp_data_frame, gr])
            data_frame = temp_data_frame

            #print(data_frame[["BENCH", "FREQ", "DVS_POL", "ENERGY_DYN_CYC_ALPHAC"]].to_string())

            #print(data_frame[["BENCH", "DVS_POL", "FREQ", "ENERGY_CYC_CALC", "POWER_STAT_CALC"]].to_string())

            ### EnergyCalc
            data_frame["ENERGY_CYC_CALC_FREQ"] = data_frame["FREQ"].loc[data_frame.groupby(common_energy_grouping)["ENERGY_CYC_CALC"].idxmin()]

            ### EnergyCalc Error
            data_frame["ENERGY_CYC_CALC_ERROR"] = data_frame["ENERGY_CYC_CALC"].sub(data_frame["REP_ENERGY_TOTAL"])

            ### EnergyCalc is it an improvement over 80MHz
            #### Get calculated frequencies, for these get measured energy
            data_frame["ENERGY_CYC_CALC_IMPROVEMENT"] = data_frame["REP_ENERGY_TOTAL"].loc[data_frame.groupby(common_energy_grouping)["ENERGY_CYC_CALC"].idxmin()]
            #print(data_frame["ENERGY_CYC_CALC_IMPROVEMENT"].to_string())
            ### and divide by meassured energy at 80MHz
            data_frame = dataframe_proportion_column(data_frame, "div", "ENERGY_CYC_CALC_IMPROVEMENT", common_energy_grouping, ("FREQ", 80000000), "ENERGY_CYC_CALC_IMPROVEMENT", "REP_ENERGY_TOTAL")
            #print(data_frame["ENERGY_CYC_CALC_IMPROVEMENT"].to_string())
        
        if len(data_frame["FREQ"].unique()) > 1:
            ## CYCLES SAVED PER FREQUENCY
            data_frame = dataframe_proportion_column(data_frame, "sub", "CYC_DIFF", common_energy_grouping, ("FREQ", 80000000))

            if fc_special in [19]:
                # Calculate Saved FWS
                data_frame = dataframe_proportion_column(data_frame, "sub", "FWS", common_energy_grouping, ("FREQ", 80000000))
                data_frame["FWS_PROP_SUB"] = data_frame["FWS_PROP_SUB"].abs()

                # Calculate Cycles per Saved FWS
                data_frame["CYC_SAVING_PER_FWS"] = data_frame["CYC_DIFF_PROP_SUB"].abs().div(data_frame["FWS_PROP_SUB"])
                data_frame["FMCS_FWS"] = data_frame["FREQ"].loc[data_frame.groupby(common_energy_grouping)["CYC_SAVING_PER_FWS"].idxmin()]
                print(data_frame[["BENCH", "CYC_SAVING_PER_FWS"]].head(100).to_string())

            ## FREQUENCY WITH MOST CYCLES SAVED
            data_frame["FMCS"] = data_frame["CYC_DIFF_PROP_SUB"].abs()
            data_frame["MCS"] = data_frame["FMCS"].loc[data_frame.groupby(common_energy_grouping)["FMCS"].idxmax()]
            data_frame["FMCS"] = data_frame["FREQ"].loc[data_frame.groupby(common_energy_grouping)["FMCS"].idxmax()]
            
            ## Most Cycles Saved in proportion to Cycles
            data_frame = dataframe_proportion_column(data_frame, "div", "MCS", common_energy_grouping, ("FREQ", 80000000), "MCS_PROP_CYC", "CYC_DIFF")


        ## CNT NORM TIME
        CNT_TIME_COL_NAMES = ["CNT_TIME_FOLD", "CNT_TIME_LSU", "CNT_TIME_SLEEP", "CNT_TIME_EX", "CNT_TIME_CPI"]
        if fc_special in [20]:
            for cnt in CNT_COL_NAMES:
                name = cnt.split("_")[-1]
                data_frame["CNT_TIME_" + name] = data_frame[cnt].div(data_frame["CYC_TIME"])
        
        ## CNT_REP_MEAN_COMP_RAM in proportion to cycles
        if "CNT_REP_MEAN_COMP_RAM" in data_frame.columns:
            data_frame["CNT_COMP_RAM_DIV_CYC"] = data_frame["CNT_REP_MEAN_COMP_RAM"].div(data_frame["CYC_DIFF"]).mul(10000)  # TODO MUL DEBUG

            data_frame["CNT_RAM_SUB_LSU"] = data_frame["CNT_COMP_RAM_DIV_CYC"].sub(data_frame[CNT_NORM_COL_NAMES[1]])

        ## CNT_COMP_FLASH
        #print(data_frame.columns)
        if CNT_FLASH_COL_NAMES[0] in data_frame.columns:

            data_frame["CNT_COMP_FLASH_SUM"] = 0
            for name in CNT_FLASH_COL_NAMES:
                if name in data_frame.columns:
                    data_frame["CNT_COMP_FLASH_SUM"] += data_frame[name]
            data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"] = data_frame["CNT_COMP_FLASH_SUM"].div(data_frame["CYC_DIFF"]).mul(10000) # TODO MUL DEBUG

            if "CNT_COMP_RAM_DIV_CYC" in data_frame.columns:
                data_frame["CNT_FLASH_ADD_RAM"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].add(data_frame["CNT_COMP_RAM_DIV_CYC"])
                data_frame["CNT_FLASH_DIV_RAM"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].div(data_frame["CNT_COMP_RAM_DIV_CYC"])
                data_frame["CNT_FLASH_SUB_RAM"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].sub(data_frame["CNT_COMP_RAM_DIV_CYC"])

            if CNT_NORM_COL_NAMES[1] in data_frame.columns and CNT_NORM_COL_NAMES[4] in data_frame.columns:
                data_frame["CNT_FLASH_DIV_LSU"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].div(data_frame[CNT_NORM_COL_NAMES[1]])
                data_frame["CNT_FLASH_ADD_LSU"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].add(data_frame[CNT_NORM_COL_NAMES[1]])
                data_frame["CNT_FLASH_DIV_CPI"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].div(data_frame[CNT_NORM_COL_NAMES[4]])
                data_frame["CNT_FLASH_ADD_CPI"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].add(data_frame[CNT_NORM_COL_NAMES[4]])


                data_frame["CNT_FLASH_ADD_LSU_SUB_CPI"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].add(data_frame[CNT_NORM_COL_NAMES[1]]).sub(data_frame[CNT_NORM_COL_NAMES[4]])

                data_frame["CNT_ADD_FLASH_LSU_SUB_RAM"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].add(data_frame[CNT_NORM_COL_NAMES[1]]).sub(data_frame["CNT_COMP_RAM_DIV_CYC"])

                data_frame["CNT_ADD_FLASH_LSU_SUB_RAM_CPI"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].add(data_frame[CNT_NORM_COL_NAMES[1]]).sub(data_frame["CNT_COMP_RAM_DIV_CYC"]).sub(data_frame[CNT_NORM_COL_NAMES[4]])

                data_frame["CNT_ADD_FLASH_LSU_SUB_RAM_CPI"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].add(data_frame[CNT_NORM_COL_NAMES[1]]).sub(data_frame["CNT_COMP_RAM_DIV_CYC"]).sub(data_frame[CNT_NORM_COL_NAMES[4]])

            if "CYCLES_PER_INSTRUCTIONS" in data_frame.columns:
                data_frame["CNT_FLASH_ADD_CYCLES_PER_INSTRUCTIONS"] = data_frame["CNT_COMP_FLASH_SUM_DIV_CYC"].add(data_frame["CYCLES_PER_INSTRUCTIONS"].mul(1000))


        # Filter out all tasks that do not get faster with fwsa
        if fc_selection_filter == 1:
            fwsa_speed_up_benches = []
            b_group = data_frame.groupby(common_energy_grouping)
            frequencies = list(TWIN_LINE_BAR_FREQ_TO_INDEX_MAP.keys())
            for name, gr in b_group:
                cycles_highest_freq = gr[(gr["FREQ"] == max(frequencies))]["CYC_DIFF"].values[0]
                cycles_lowest_freq = gr[(gr["FREQ"] == min(frequencies))]["CYC_DIFF"].values[0]
                percentage_of_change = abs((1 - (cycles_lowest_freq/ cycles_highest_freq))) * 100
                #print(percentage_of_change)
                if percentage_of_change > 1:
                    fwsa_speed_up_benches.append(gr["BENCH"].values[0])
        
            data_frame = data_frame[data_frame["BENCH"].isin(fwsa_speed_up_benches)]
        elif fc_selection_filter == 2: # beebs applicability filter
            # Read beebs statistics - is a json document copying the appendix of the beebs paper
            BEEBS_STATISTICS_PATH = "/home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/json_config_files/workload_benchmarks/beebs_bm/bench_statistics.json"
            beebs_stat = None
            with open(BEEBS_STATISTICS_PATH) as f:
                beebs_stat = json.load(f)
            
            # Get tasks with M or H as applicability
            applicable_benches = []
            for task in beebs_stat:
                if task["applicability"] in ["M", "H"]:
                    applicable_benches.append(task["json_name"])

            # Only select beebs dataframe rows which have a min. Medium embedded applicability
            data_frame = data_frame[data_frame["BENCH"].isin(applicable_benches)]
            #print(applicable_benches)

        

        # Sort dataframe
        if fc_sort_by is None:
            fc_sort_by = ["DVS_POL", "EEF"]
        print("Data is sorted by: ", str(fc_sort_by))
        data_frame = data_frame.sort_values(by=fc_sort_by, ascending=fc_sort_by_descending) # ascending=[False, True]

        #print(data_frame.head(40))

        # Be clear on the x_axis order
        x_axis_order_mapping = {name:i for i, name in enumerate(data_frame["BENCH"].unique())}
        if glob_ordering is not None:
            print("ORDERING BY SHELL ARGUMENT OF FILE: ", args.ordering)
            x_axis_order_mapping = glob_ordering
            print(x_axis_order_mapping)
        else:
            print("ORDERING:")
            print(json.dumps(x_axis_order_mapping, indent=0))



        # Info column print
        print(data_frame.columns)

        # Plot Stuff
        fig, ax0 = plt.subplots(num="FC_SPECIAL= {}, SORTED BY={}, SORT-DESCENDING={}".format(str(fc_special), str(fc_sort_by), str(fc_sort_by_descending)), figsize=label_dict.get("figuresize", FIGSIZE_FULL))
        ax1 = ax0.twinx()
        
        ## CORRELATION - numeric data
        correlation_data = {"bar": None, "line": None, "scatter": None}

        # ax0 - BARS - e.g. CNT_NORM
        if True: #fc_special in [0, 1, 2, 3, 4, 5, 6, 7, 8, 11, 12]:
            bar_x_col = "BENCH"
            bar_col = None
            bar_select:dict = {"DVS_POL":"FAST_FLASH", "FREQ":80000000}
            bar_label = "CNT_NORM" # TODO

            # special specific column selection
            if bar_arg_cols is not None:
                bar_col = bar_arg_cols
                bar_label = bar_col
            elif fc_special in [2, 3, 7, 23]:
                bar_col = FC_SP_2_COL # LSU/CPI & LSU-CPI
            elif fc_special in [20]:
                bar_col = CNT_TIME_COL_NAMES
                bar_label = "CNT_TIME"
            elif fc_special not in special_label_mapping.keys():
                bar_col = None

            # Map Group name to Group col
            if bar_col == "CNT_NORM":
                bar_col = CNT_NORM_COL_NAMES
            elif bar_col == "CNT_TIME":
                bar_col = CNT_TIME_COL_NAMES
            elif bar_col == "CNT_PROP":
                bar_col = FC_SP_2_COL
            elif bar_col == "MCS_PROP_CYC":
                bar_select.pop("FREQ", None)

            # Make bar_label more informative
            bar_label = str(bar_label) + str(bar_select)
            if "CNT" in bar_label:
                bar_label = "CNT" + str(bar_select)

            if bar_col is not None:
                ax0_data = dataframe_select_features(data_frame, {"equal":bar_select}, False) # Destroys the prior ordering

                if bar_col == "MCS_PROP_CYC":
                    ax0_data = ax0_data[ax0_data[bar_col].notna()]
                #print(bar_select)
                #print(ax0_data)

                # Make sure the ordering is as defined
                ax0_data = ax0_data.sort_values(by=["BENCH"], key=lambda x : x.map(x_axis_order_mapping))
                #print(ax0_data["BENCH"])

                ax0_data.plot.bar(x=bar_x_col, y=bar_col, stacked=False, ax=ax0).legend(loc="upper left", title=bar_label)

                ## CORRELATION
                #print(ax0_data[["BENCH", bar_col]])
                correlation_data["bar"] = ax0_data[bar_col].reset_index(drop=True)

                ax0.set_ylabel(bar_label)

                if bar_col in ["CNT_NORM"] or fc_special in [2, 3, 7, 23]:
                    value_range = ax0_data[bar_col]
                    #print(min(value_range.min().values))
                    ax0.set_yticks(np.arange(min(value_range.min().values), max(value_range.max().values)+1, 500.0))
                
                ax0.grid(True)
            else: # Keep order - Pseudo bar plot
                ax0.bar(x_axis_order_mapping.keys(), [0] * len(x_axis_order_mapping.keys()))
                ax0.tick_params(axis='x', labelrotation = 90)
                ax0.set_yticks([])


        # ax1 - LINE - e.g. best frequencies # TODO X_axis labels are broken when there is more than one value per bench
        line_col = None
        line_group = "DVS_POL"
        line_label = line_col
        line_select = {}

        if line_arg_cols is not None:
            line_col = line_arg_cols
            line_label = line_col
        elif fc_special in [9]:
            line_col = "R_BEP"
            line_label = "Biggest Energy Proportion (Highest - Lowest Energy Consumption)"
        elif fc_special in [11]:
            line_col = "R_80EP"
            line_label = "Biggest Energy Proportion (80MHz - Lowest Energy Consumption)"
        elif fc_special in [18]:
            line_col = "FMCS"
            line_label = "Frequency with Most CYCLES Saved"
        elif fc_special in [19]:
            line_col = "FMCS_FWS"
            line_label = "Frequency with Most CYCLES Saved per Saved FWS"
        elif fc_special in [23]:
            line_col = None
        

        if line_col is not None: #fc_special in [0, 1, 2, 4, 5, 8, 10, 11]:
            
            if type(line_col) is str:
                line_col = [line_col]
            
            #groups_amount = data_frame[line_group].unique().size #inner_index + groups_amount * outer_index
            
            for outer_index, line_col_i in enumerate(line_col):
                # Select only rows with no NaN values
                eef_group = data_frame[data_frame[line_col_i].notna()] # TODO

                
                print("LINE COL:", line_col,", Data selection:", line_select, ", LINE GROUP:", line_group)
                if line_select is not None and len(line_select) > 0:
                    eef_group = dataframe_select_features(eef_group, {"equal":line_select})

                eef_group = eef_group.sort_values(by=["BENCH"], key=lambda x : x.map(x_axis_order_mapping))

                # Group By "DVS_POL"
                eef_group = eef_group.groupby(line_group)
                for inner_index, (name, gr) in enumerate(eef_group):
                    if gr.count()[0] > 0:
                        concat_name = str(name) + ("_" + line_col_i if len(line_col) > 1 else "")

                        gr.plot.line(x="BENCH", y=line_col_i, ax=ax1, color=INDEX_TO_COLOR[inner_index], linestyle=INDEX_TO_STYLE[outer_index], label=concat_name, grid=True)

                        ## CORRELATION
                        
                        if correlation_data["line"] is None:
                            correlation_data["line"] = gr[line_col_i].reset_index(drop=True).to_frame().rename(columns={line_col_i: concat_name})
                        else:
                            correlation_data["line"] = correlation_data["line"].join(gr[line_col_i].reset_index(drop=True).to_frame().rename(columns={line_col_i: concat_name}))

            if any(item in line_col for item in ["EEF", "FMCS", "ENERGY_CYC_CALC_FREQ"]): 
                ax1.set_yticks([13333333, 26666666, 40000000, 53333333, 80000000])
            if fc_special not in [97]:
                limes = ax1.get_ylim()
                ax1.set_ylim(limes[0] - (limes[1] - limes[0]) * 1.2, limes[1])
            ax1.set_ylabel(line_label)
            ax1.legend(loc="upper right", title=str(line_col))

        # ax2 - Scatter data
        scatter_col = "REP_POWER"
        scatter_select = {"DVS_POL":"FAST_FLASH"}
        scatter_grayscale_group = "FREQ"
        scatter_data = data_frame

        
        
            #print("SCATTER_COL: ", scatter_col)

        if fc_special in [6] or scatter_arg_col is not None: # TODO
            ax2 = ax0.twinx()
            ax2.spines.right.set_position(("axes", 1.05)) # Offset third y axes to the right
            ax2.get_yaxis().get_offset_text().set_position((1.05,5.0))
            fig.subplots_adjust(right=0.75)

            if scatter_arg_col is not None:
                scatter_col = scatter_arg_col[:-1]
                if len(scatter_arg_col) == 2 and scatter_arg_col[1] not in ["None", "none", "0"]:
                    try:
                        scatter_select["FREQ"] = pd.to_numeric(scatter_arg_col[-1])
                    except:
                        scatter_col += [scatter_arg_col[-1]]
                        print("Try to parse last scatter col to frequency selection - failed")

            elif fc_special in [6]:
                scatter_col = "R_BEP"
                scatter_grayscale_group = "DVS_POL"
                scatter_select = {}

            if len(scatter_select) > 0:
                scatter_data = dataframe_select_features(data_frame, {"equal":scatter_select})
            
            ax2.set_ylabel(scatter_col)
            print("SCATTER_COL: ", scatter_col, " Scatter select: ", str(scatter_select))

            if type(scatter_col) is not list:
                scatter_col = [scatter_col]

            legend_elements = []
            for col_index, scatter_col_i in enumerate(scatter_col):
                if (scatter_arg_col is not None and len(scatter_data["FREQ"].unique()) == 1): # One scatter line
                    scatter_data_temp = scatter_data.sort_values(by=["BENCH"], key=lambda x : x.map(x_axis_order_mapping))

                    scatter_data_temp.plot.scatter(x="BENCH", y=scatter_col_i, stacked=False, ax=ax2) # TODO check order and merge down

                    ## CORRELATION
                    correlation_data["scatter"] = scatter_data_temp[scatter_col_i].reset_index(drop=True).to_frame()
                    ax2.grid(True)
                    
                elif fc_special in [6] or (scatter_arg_col is not None and len(scatter_data["FREQ"].unique()) > 1): # Multiple Scatter lines
                    scatter_data_temp = scatter_data.groupby("BENCH")

                    group_unq = data_frame[scatter_grayscale_group].unique()

                    len_color_list = len(group_unq)

                    black_color_list = []
                    for index in np.arange(0, len_color_list, 1):
                        c = (col_index / (len(scatter_col) - 1) , 0.0, 0.0, ((index + 1) / (len_color_list + 1)))
                        black_color_list.append(c)
                        legend_elements.append(Line2D([0], [0], marker='o', color='w', markerfacecolor=c, label=str(group_unq[index]) + "_" + scatter_grayscale_group))

                
                    for name, val in x_axis_order_mapping.items():
                        #print(scatter_data.get_group(name)[scatter_col])
                        ax2.scatter([val]*len_color_list, scatter_data_temp.get_group(name)[scatter_col_i].dropna(), c=black_color_list)
            ax2.legend(handles=legend_elements, loc="lower right", title=scatter_col)
            ax2.grid(True)
            
        # Pair plot
        if fc_special in [100]:
            sns.pairplot(data_frame[(data_frame["DVS_POL"] == 1) & (data_frame["FREQ"] == 80000000)][["BENCH", "CNT_NORM_LSU", "CNT_NORM_CPI", "REP_POWER", "EEF"]], hue="BENCH")

        
        # CORRELATION - Evaluation
        if (correlation_data["bar"] is not None and correlation_data["line"] is not None) or \
           (correlation_data["bar"] is not None and correlation_data["scatter"] is not None) or \
           (correlation_data["scatter"] is not None and correlation_data["line"] is not None) :

            corrs = {}
            corrs.update(correlate_two_dataframes(correlation_data["bar"], correlation_data["line"]))
            corrs.update(correlate_two_dataframes(correlation_data["bar"], correlation_data["scatter"]))
            corrs.update(correlate_two_dataframes(correlation_data["scatter"], correlation_data["line"]))
            #print(json.dumps(corrs, sort_keys=True, indent=4))
            corrs = pd.DataFrame.from_dict(corrs, orient='index')
            corrs = corrs.sort_values(by=[0], key=lambda x: abs(x), ascending=False)
            corrs.index.name = "CORRELATIONS"
            print(corrs)

            if correlation_enable:
                at = AnchoredText(corrs.head(10).to_string(), prop=dict(size=6), frameon=True, loc='upper center')
                at.patch.set_boxstyle("round,pad=0.,rounding_size=0.2")
                ax0.add_artist(at)

            if fc_special in [98]:
                # Find function that has x as an input and return y as an output
                # def fit_func(x, a, b, c, d):
                #     return a * np.exp(-b * x) + c

                xdata = correlation_data["scatter"]["CYCLES_PER_INSTRUCTIONS"].to_numpy()
                ydata = correlation_data["line"]["FAST_FLASH_MCS_PROP_CYC"].to_numpy()

                print(xdata)
                print(ydata)
                fit_func = np.polynomial.Chebyshev.fit(xdata, ydata, 3)
                print(fit_func)

                #popt, pcov = curve_fit(fit_func, ydata, xdata, maxfev=1000)
                cfit_x = list(x_axis_order_mapping.values())
                cfit_y = fit_func(xdata)#, *popt)
                #print(popt)

                ax3 = ax0.twinx()
                ax3.plot(cfit_x, cfit_y, "y--")

                limes = ax3.get_ylim()
                ax3.set_ylim(limes[0] - (limes[1] - limes[0]) * 1.2, limes[1])
            

        # Plot visibility stuff
        #ax0.grid(True)
        if label_dict.get("title", None) is None and special_label_mapping.get(fc_special, None) is not None:
            ax0.set_title(special_label_mapping[fc_special])

        # Rename Axes, title etc if a rename has been given via shell arguments
        alter_plot_appearance_post(label_dict)
        
        plt.tight_layout()

        plot_save_or_show(args.save)
    

        return

    if args.lineplot_rigol_wave is not None:
        # Get data
        files_data = rigol_wave_pickle_folder_to_datatypes(pkl_folder_path=args.pickle)

        if files_data == []:
            print("[lineplot_rigol_wave]: No .pkl files found")
            return

        nrz_vs_man_workaround = True

        # # WORKAROUND for NRZ vs Manchester plots - Did a measurment with a false format Mistake: WORD --> better use BYTE when wave tracing
        # data_lengths = []
        # if nrz_vs_man_workaround:
        #     # Remove all data points below a certain level
        #     for index, f_data in enumerate(files_data): 
        #         #print(f_data)
        #         files_data[index][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY] = list(filter(lambda item: item > -10, files_data[index][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY]))
        #         data_lengths.append(len(files_data[index][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY]))
        #     print(data_lengths)

        #     # Increase data point to same size by continuing with last value
        #     for index, f_data in enumerate(files_data):
        #         data_len = len(f_data[1][rigol_ds1054z.WAVE_RETURN_DATA_KEY])
        #         if data_len < max(data_lengths):
        #             last_value = files_data[index][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY][-1]
        #             files_data[index][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY].extend([last_value] * (max(data_lengths) - data_len))
        #         print(len(f_data[1][rigol_ds1054z.WAVE_RETURN_DATA_KEY]))

        #     # Right Rotate data list to be on the same x point
        #     if rotate:
        #         manchester_idx = 1
        #         nrz_id = 0
        #         files_data[manchester_idx][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY] = list_rotate(files_data[manchester_idx][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY], 95)
        #         files_data[nrz_id][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY] = list_rotate(files_data[nrz_id][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY], 70)

        
        TIMESCALE_XINREMENT = 1000000
        xincrement = files_data[0][1][rigol_ds1054z.WAVE_RETURN_METADATA_KEY]["xincrement"] * TIMESCALE_XINREMENT
        samples = len(files_data[0][1][rigol_ds1054z.WAVE_RETURN_DATA_KEY])
        x =  np.linspace(0, xincrement * samples, samples)

        # Plot each wave data
        plt.figure(figsize=label_dict.get("figuresize", FIGSIZE_FULL))
        for f_data in files_data:
            #print(f_data)
            line, = plt.plot(x, f_data[1][rigol_ds1054z.WAVE_RETURN_DATA_KEY]) # , linestyle="None", marker="o")
            name_list = f_data[0].split("_")
            if nrz_vs_man_workaround:
                line.set_label(SWO_BENCH_INDEX_TO_ENCODING[pd.to_numeric(name_list[name_list.index("ENC") + 1])])
            else:
                line.set_label(SWO_BENCH_INDEX_TO_CNTTYPE[pd.to_numeric(name_list[name_list.index("CNT") + 1])])
            
        plt.legend()
        # plt.title(args.title_label)
        # plt.xlabel(args.x_axis_label)
        # plt.ylabel(args.y_axis_label)

        alter_plot_appearance_post(label_dict)
        plot_save_or_show(args.save)
        return

    # DATA MANIPULATION
    # pickle to seperate datatypes (metadata:dict, data:Dataframe) conversion
    di = pickle_to_datatypes(pkl_path= args.pickle)
    
    metadata:dict = di.get("metadata")
    data:pd.DataFrame = di.get("data")
    print("DTYPES:")
    print(data.dtypes)
    print()

    # Get unique workload column names
    glob_unique_wl_columns = None
    if benchmark not in ["trace_csv", "assembler_bench"]:
        glob_unique_wl_columns = meta_get_workload_params(meta=metadata)

    if args.unique_columns is not None:
        print("[UNIQUE COLUMN NAMES SELECTED]: {}".format(args.unique_columns))
        glob_unique_wl_columns = args.unique_columns
    
    # ARGUMENT DATA HANDLES
    if args.rename_column is not None:
        print("[RENAME COLUMN]")
        data.rename(columns={args.rename_column[0]: args.rename_column[1]}, inplace=True)
    
    if args.bench_select is not None:

        bench_group:str = args.bench_select[0]
        remove = False
        if args.bench_select[1] in ["1", "True"]:
            remove = True
        print("[BENCH SELECT] remove:{} - group:{}".format(remove, bench_group))
        if remove:
            data = dataframe_remove_features(data, {"equal": {"BENCH" : BENCH_NAME_GROUP_TO_NAME_LIST[bench_group]}})
        else:
            data = dataframe_select_features(data, {"equal": {"BENCH" : BENCH_NAME_GROUP_TO_NAME_LIST[bench_group]}})

    if args.feature_selection is not None:
        features = parse_arguments_feature_selection(args.feature_selection)
        print("[FEATURE SELECTION] - {}".format(features))
        data = dataframe_select_features(data, features)


    if args.feature_selection_combination is not None:
        features = parse_arguments_feature_selection_combinations(args.feature_selection_combination)
        print("[FEATURE SELECTION COMBINATION] - {}".format(features))
        data = dataframe_select_features_combinations(data, features)
        


    if args.feature_removal is not None:
        
        features = parse_arguments_feature_selection(args.feature_removal)
        print("[FEATURE REMOVAL] - {}".format(features))
        data = dataframe_remove_features(data, features)
    
    if args.feature_select_group_len is not None:
        
        group_cols = parse_argument_list(args.feature_select_group_len[0])
        group_len = pd.to_numeric(args.feature_select_group_len[1])
        print("[FEATURE REMOVAL GROUP LEN] - {} with len {}".format(group_cols, group_len))
        grouping = data.groupby(group_cols, as_index=False, observed=True)

        remainder = []
        for name, group in grouping:
            if group.shape[0] == group_len:
                remainder.append(group)

        data = pd.concat(remainder, ignore_index=True)

        

    if args.column_reindex is not None:
        # "COLUMN-NAME", "GROUP-COL-LIST", "METHOD", "FILL-VALUE"
        assert False, "NOT IMPLENTED YET"
        print(data)
        column_name = args.column_reindex[0]
        assert column_name in data.columns
        group_cols = None
        if args.column_reindex[1] != "None":
            group_cols = parse_argument_list(args.column_reindex[1])
        reindex_method = args.column_reindex[2]
        assert reindex_method in ["backfill", "pad", "nearest"]
        reindex_fill_value = None
        if args.column_reindex[3] != "None":
            reindex_fill_value = pd.to_numeric(args.column_reindex[3], errors='ignore')


        full_idx:np.ndarray = data[column_name].unique()
        full_idx.sort()
        data = (data.groupby(group_cols, observed=True, as_index=False)
            .apply(lambda group: group.reindex(index=full_idx, method=reindex_method, fill_value=reindex_fill_value))
            .reset_index(level=0, drop=True))
        
        print(data.to_string())

    # Drop a column that is special to the taskname but not interesing for plotting purposes
    if args.drop is not None:#
        print("[DROP COLUMNS]")
        columns = data.columns
        for dr in args.drop:
            if dr in columns:
                del data[dr]
    
    #print(data.to_string())
    if args.calculate_current_mean is not None:
        print("[CALCULATE CURRENT MEAN]")
        data = dataframe_energy_bench_current_data_to_mean(metadata, data, parse_argument_list(args.calculate_current_mean[0]))

    if args.calculate_energy is not None:
        print("[CALCULATE ENERGY FROM CURRENT MEAN]")
        data = dataframe_energy_bench_current_mean_to_energy(metadata, data, parse_argument_list(args.calculate_energy[0]))

    # DO BENCHMARK SPECIFIC DATA STUFF # TODO make modifable with argument handle
    if args.benchmark_data_manipulation:
        print("[BENCHMARK SPECIFIC DATA MANIPULATION:]")
        if benchmark == "swo_bench":
            print("     [SWO BENCH RENAMES]")
            # Rename data values
            data = dataframe_column_idxval_to_strval(data, SWO_BENCH_DEFAULT_IDX_SHOWED, SWO_BENCH_INDEX_TO_CNTTYPE)

        elif benchmark == "energy_bench":
            print("     [ENERGY BENCH DATA MANIPULATION]")
            # Plot the ampere data
            if args.current_plot is not None:
                energy_index = "FREQ"
                if args.index is not None:
                    energy_index = args.index
                
                plot_current_lineplot(data, COL_NAME_ENERGY_BENCH_CURRENT, energy_index)
                return
            #print("HI")

        elif benchmark == "trace_wave":
            print("     [TRACE WAVE BENCH DATA MANIPULATION]")
            # Transform wave data into ecp length value
            print("[TRANSFORM WAVE DATA - NOT IMPLEMENTED YET]")
            data = dataframe_trace_wave_data_to_ecp_length(metadata, data)
        
    if args.calculate_alpha_c:
        data_temp = pd.merge(data, EMPIRIC_STAT_POWER_BEEBS_DATAFRAME, on=["DVS_MV"])
        data_temp["ENERGY_STAT_CALC"] = data_temp["POWER_STAT_CALC"] * (data_temp["CYC_DIFF"] / data_temp["FREQ"])
        data["ALPHAC_CALC"] = (data["ENERGY_TOTAL_REP_MEAN"] - data_temp["ENERGY_STAT_CALC"]) / ((data["DVS_MV"]/1000)**2 * data["CYC_DIFF"])
    

    if args.trace_wave_packet_length is not None:
        data = dataframe_trace_wave_data_to_ecp_length(metadata, data)

    if args.energy_from_flash is not None:
        group_cols = None
        if args.energy_from_flash[0] not in ["None", "0"]:
            group_cols = parse_argument_list(args.energy_from_flash[0])
        print("[INSTRUCTIONS FROM PROFILING COUNTERS] - via grouping: {}".format(group_cols))
        data = dataframe_energy_from_flash_calculation(metadata, data, group_cols)

    if args.column_scale is not None:
        print("[COLUMN SCALE]")
        # Apply value_col scale
        print(parse_argument_list(args.column_scale[0]))
        data = dataframe_calculate_with_col(data, parse_argument_list(args.column_scale[0]), pd.to_numeric(args.column_scale[1]), args.column_scale[2])

    if args.drop_outliers is not None:
        
        grouping_col = None
        outlier_method = "iqr"
        if len(args.drop_outliers) > 1:
            grouping_col = parse_argument_list(args.drop_outliers[1])
        if len(args.drop_outliers) > 2 and args.drop_outliers[2] in ["zcore", "iqr"]:
            outlier_method = args.drop_outliers[2]

        print("[DROP OUTLIERS VIA {} METHOD]".format(outlier_method))
        for col in parse_argument_list(args.drop_outliers[0]):
            data = dataframe_remove_rows_with_outliers(data, col, 1, grouping_cols=grouping_col, method=outlier_method)

    if args.repetition_statistics is not None:
        print("[REPETITION STATISTICS]")
        # Apply value_col scale
        data = dataframe_repetition_statistics(data, parse_argument_list(args.repetition_statistics[0]), parse_argument_list(args.repetition_statistics[1]), prior_outlier_removal=args.drop_outliers is not None)

    if args.create_column_pre is not None:
        print("[CREATE COLUMN PRE]")
        data = dataframe_create_column(data, args.create_column_pre[0], args.create_column_pre[1:-1], args.create_column_pre[3])
    
    if args.proportion is not None:
        print("[PROPORTION]")
        (col_feature, reference_feature_tuple, same_features) = parse_arguments_proportion(args.proportion[1:])
        operation = args.proportion[0].lower()
        if operation in ARGUMENT_PROPORTION_OPERATIONS:
            data = dataframe_proportion_column(data, operation, col_name_to_prop=col_feature, same_features=same_features, reference_feature=reference_feature_tuple)

    if args.proportion_2 is not None:
        print("[PROPORTION_2]")
        (col_feature, reference_feature_tuple, same_features) = parse_arguments_proportion(args.proportion_2[1:])
        operation = args.proportion_2[0].lower()
        if operation in ARGUMENT_PROPORTION_OPERATIONS:
            data = dataframe_proportion_column(data, operation, col_name_to_prop=col_feature, same_features=same_features, reference_feature=reference_feature_tuple)
    
    if args.repetition_statistics_2 is not None:
        print("[REPETITION STATISTICS 2]")
        repetition_necesarry = True
        if args.repetition_statistics_2[2].lower() in ["0", "False", "false"]:
            repetition_necesarry = False
        # Apply value_col scale
        data = dataframe_repetition_statistics(data, parse_argument_list(args.repetition_statistics_2[0]), parse_argument_list(args.repetition_statistics_2[1]), prior_outlier_removal=args.drop_outliers is not None, repetition_necesarry=repetition_necesarry)

    if args.row_operation_0 is not None:
        print("[ROW OPERATION 2: REMOVED AGGREGATED]")
        assert len(args.row_operation_0) >= 5
        # "COL-NAME-TO-OPERATE-LIST", "GROUP-COL-NAME-LIST", "OPERATION", "SPECIFIC-ROW-FEATURE-LIST", "ELEMENT-NAME"

        remove_aggregated = True
        if len(args.row_operation_0) == 6 and args.row_operation_0[5] in ["0", "False"]:
            remove_aggregated = False

        data = dataframe_operation_row(data=data, operation= args.row_operation_0[2], cols_to_calculate_on=parse_argument_list(args.row_operation_0[0]), cols_group_by=parse_argument_list(args.row_operation_0[1]), specific_row_features= parse_argument_key_list(args.row_operation_0[3]), element_name=pd.to_numeric(args.row_operation_0[4], errors='ignore'), remove_aggregated=remove_aggregated)

    if args.row_operation is not None:
        print("[ROW OPERATION: REMOVED AGGREGATED]")
        assert len(args.row_operation) >= 5
        # "COL-NAME-TO-OPERATE-LIST", "GROUP-COL-NAME-LIST", "OPERATION", "SPECIFIC-ROW-FEATURE-LIST", "ELEMENT-NAME"
        remove_aggregated = True
        if len(args.row_operation) == 6 and args.row_operation[5] in ["0", "False"]:
            remove_aggregated = False

        data = dataframe_operation_row(data=data, operation= args.row_operation[2], cols_to_calculate_on=parse_argument_list(args.row_operation[0]), cols_group_by=parse_argument_list(args.row_operation[1]), specific_row_features= parse_argument_key_list(args.row_operation[3]), element_name=pd.to_numeric(args.row_operation[4], errors='ignore'), remove_aggregated=remove_aggregated)

    

    if args.merge_with_dict is not None:
        print("[MERGE WITH DICT]")
        assert len(args.merge_with_dict) > 1
        cols = parse_argument_list(args.merge_with_dict[0])
        merge_on = []
        merge_dict = {}
        for cl in cols:
            merge_dict[cl] = []
            if cl in data.columns:
                merge_on.append(cl)

        for pair in args.merge_with_dict[1:]:
            pair_list = pd.to_numeric(parse_argument_list(pair), errors='ignore')
            for idx, val in enumerate(pair_list):

                merge_dict[cols[idx]].append(val)

        merge_df = pd.DataFrame.from_dict(merge_dict)

        data = pd.merge(data, merge_df, on=merge_on)

    if args.column_scale_2 is not None:
        print("[COLUMN SCALE 2]")

        new_col_list = parse_argument_list(args.column_scale_2[3])
        if type(new_col_list) is list and new_col_list[0] in ["None", "0", None] :
            new_col_list = None

        # Apply value_col scale
        data = dataframe_calculate_with_col(data, parse_argument_list(args.column_scale_2[0]), pd.to_numeric(args.column_scale_2[1]), args.column_scale_2[2], new_col=new_col_list)

    if args.column_scale_3 is not None:
        print("[COLUMN SCALE 3]")

        new_col_list = parse_argument_list(args.column_scale_3[3])
        if type(new_col_list) is list and new_col_list[0] in ["None", "0", None] :
            new_col_list = None

        # Apply value_col scale
        data = dataframe_calculate_with_col(data, parse_argument_list(args.column_scale_3[0]), pd.to_numeric(args.column_scale_3[1]), args.column_scale_3[2], new_col=new_col_list)

    if args.create_column is not None:
        print("[CREATE COLUMN]")
        data = dataframe_create_column(data, args.create_column[0], args.create_column[1:-1], args.create_column[3])
    
    if args.create_column_2 is not None:
        print("[CREATE COLUMN 2]")
        data = dataframe_create_column(data, args.create_column_2[0], args.create_column_2[1:-1], args.create_column_2[3])

    if args.proportion_3 is not None:
        print("[PROPORTION_2]")
        (col_feature, reference_feature_tuple, same_features) = parse_arguments_proportion(args.proportion_3[1:])
        operation = args.proportion_3[0].lower()
        if operation in ARGUMENT_PROPORTION_OPERATIONS:
            data = dataframe_proportion_column(data, operation, col_name_to_prop=col_feature, same_features=same_features, reference_feature=reference_feature_tuple)

    if args.create_column_per_group is not None:
        """ 'NEW-COL-NAME-LIST', 'CALC-ON-COL-NAME-LIST', 'GROUPING-COL-LIST', 'OPERATION-LIST' """
        print("[CREATE COLUMN PER GROUP]")
        data = dataframe_create_column_per_group(data, parse_argument_list(args.create_column_per_group[0]), parse_argument_list(args.create_column_per_group[1]), parse_argument_list(args.create_column_per_group[2]), parse_argument_list(args.create_column_per_group[3]))
        print()

    if args.flatten is not None:
        print("[FLATTEN]")
        #print(metadata["bench_config"]["WORKLOAD_PARAMS"])
        id_columns = None
        if args.flatten[0] != None:
            id_columns = parse_argument_list(args.flatten[0])
        data = dataframe_flatten(metadata, data, id_group_columns=id_columns, seperate=False)[0][2]

    if args.melt is not None:
        
        #print(metadata["bench_config"]["WORKLOAD_PARAMS"])
        id_columns = None
        if args.melt[0] != None:
            id_columns = parse_argument_list(args.melt[0])
        
        melt_col_name = args.melt[1]
        print("[MELT] - MELT COLS {} - TO {}".format(id_columns, melt_col_name))

        cols:list = list(data.columns)
        for m_col in id_columns:
            cols.remove(m_col)

        data = data.melt(cols, id_columns, melt_col_name + "_TYPE", melt_col_name + "_VALUE")


    if args.profiling_counter_combinations is not None:

        group_cols = None
        if args.profiling_counter_combinations[0] not in ["None", "0"]:
            group_cols = parse_argument_list(args.profiling_counter_combinations[0])
        
        combination_id = pd.to_numeric(args.profiling_counter_combinations[1])
        assert combination_id in list(PROFILING_COUNTER_COMBINATIONS.keys())

        if combination_id == 0:
            print("[INSTRUCTIONS FROM PROFILING COUNTERS] - via grouping: {}".format(group_cols))
            data = dataframe_instructions_from_profiling_counter(metadata, data, group_cols)
        elif combination_id == 1:
            print("[INSTRUCTIONS FROM PROFILING COUNTERS] - via grouping: {}".format(group_cols))
            data = dataframe_instruction_without_cpi_from_profiling_counter(metadata, data, group_cols)
        elif combination_id == 2:
            print("[LSU SUB RAM] - via grouping: {}".format(group_cols))
            data = dataframe_lsu_without_ram_from_profiling_counter(metadata, data, group_cols)
        elif combination_id == 3:
            print("[Flash SUB LSU Cache] - via grouping: {}".format(group_cols))
            print(data)
            data = dataframe_flash_without_lsu_cache_difference(metadata, data, group_cols)
        

    if args.energy_from_cycles is not None:
        group_cols = None
        if args.energy_from_cycles[0] not in ["None", "0"]:
            group_cols = parse_argument_list(args.energy_from_cycles[0])
        print("[ENERGY FROM DIFFERENT CYCLE MEASUREMENTS] - via grouping: {}".format(group_cols))
        data = dataframe_energy_from_second_cycles(metadata, data, group_cols)

    if args.energy_from_cycles_2_freqs is not None:
        group_cols = None
        if args.energy_from_cycles_2_freqs[0] not in ["None", "0"]:
            group_cols = parse_argument_list(args.energy_from_cycles_2_freqs[0])

        freq_ids = parse_argument_list(args.energy_from_cycles_2_freqs[1])
        instruction_weight:bool = False
        if args.energy_from_cycles_2_freqs[2] in ["1", "True"]:
            instruction_weight = True
        list_string_elem_to_numeric(freq_ids)
        print("[ENERGY FROM DIFFERENT 2 CYCLE MEASUREMENTS] - via grouping: {}".format(group_cols))
        data = dataframe_energy_from_second_cycles_only(metadata, data, freq_ids, group_cols, instruction_weight)

    if args.proportion_4 is not None:
        print("[PROPORTION_4]")
        (col_feature, reference_feature_tuple, same_features) = parse_arguments_proportion(args.proportion_4[1:])
        operation = args.proportion_4[0].lower()
        if operation in ARGUMENT_PROPORTION_OPERATIONS:
            data = dataframe_proportion_column(data, operation, col_name_to_prop=col_feature, same_features=same_features, reference_feature=reference_feature_tuple)


    if args.feature_selection_post is not None:
        print("[FEATURE SELECTION POST]")
        features = parse_arguments_feature_selection(args.feature_selection_post)
        data = dataframe_select_features(data, features)

    if args.feature_removal_post is not None:
        print("[FEATURE REMOVAL POST]")
        features = parse_arguments_feature_selection(args.feature_removal_post)
        data = dataframe_remove_features(data, features)


    if args.common_column_labels is not None:
        print("[COMMON COLUMN LABELS RENAME ACTIVATED]")
        print("     {} mapped by {}".format(SWO_BENCH_CNT_TYPE_COL, SWO_BENCH_INDEX_TO_CNTTYPE))
        data = dataframe_column_idxval_to_strval(data, SWO_BENCH_CNT_TYPE_COL, SWO_BENCH_INDEX_TO_CNTTYPE)
        data = dataframe_column_idxval_to_strval(data, SWO_BENCH_DVS_POL_COL, DVS_POL_INDEX_TO_STRING)
        data = dataframe_column_idxval_to_strval(data, SWO_BENCH_FLASH_CACHE_COL, FLASH_CACHE_TO_STRING)
        data = dataframe_column_idxval_to_strval(data, SWO_BENCH_FREQ_COL, SWO_BENCH_INDEX_TO_FREQ)
        

    # Argument col value rename
    if args.column_labels is not None:
        print("[COLUMN LABELS]")
        labels = parse_arguments_column_labels(args.column_labels)
        for key, value in labels.items():
            data = dataframe_column_idxval_to_strval(data, key, value)

    if args.drop_n_cols is not None:#

        print("[DROP N COLUMNS]")
        columns = data.columns
        for col in columns[len(columns) - args.drop_n_cols:]:
            del data[col]

    # SORTING
    if args.sort is not None:
        
        sort_cols = parse_argument_list(args.sort[0])

        ascending = True
        if len(args.sort) > 1:
            ascending = parse_argument_list(args.sort[1])
            bool_argument_map = {"0":False, "1": True, 0:False, 1:True}
            ascending = list(map(lambda x : bool_argument_map[x], ascending))
            ascending = ascending[:len(sort_cols)]
        if glob_ordering is None:
            print("[SORT] - by {} with Ascending: {}".format(sort_cols, ascending))
            data = data.sort_values(by=sort_cols, ascending=ascending)
            #print(data[sort_cols].to_string())
    
    if glob_ordering is not None:
        print("[SORT] - by glob_ordering")
        data = data.sort_values(by=["BENCH"], key=lambda x : x.map(glob_ordering))

    # ARGUMENT HANDLE

    print("COLUMNS") # Seperator
    print(data.dtypes)

    if args.correlation is not None:
        print("[CORRELATION]")
        cols_to_correlate = parse_argument_list(args.correlation[0])

        group_cols = None
        if len(args.correlation) > 1 and args.correlation[1] not in ["0", "None"]:
            group_cols = parse_argument_list(args.correlation[1])
        
        key_val_select = None
        if len(args.correlation) > 2:
            key_val_select = parse_argument_list_key_value(args.correlation[2])
            print(key_val_select)

        corr = dataframe_correlate_cols(data, cols_to_correlate, group_cols, key_val_select)
        print(corr.to_string())
        return

    if args.correlation_ref is not None:
        print("[CORRELATION]")
        cols_to_correlate = parse_argument_list(args.correlation_ref[0])

        group_col = None
        if len(args.correlation_ref) > 1 and args.correlation_ref[1] not in ["0", "None"]:
            group_col = args.correlation_ref[1]
        
        first_col_select = None
        if len(args.correlation_ref) > 2:
            first_col_select = parse_argument_list_key_value(args.correlation_ref[2])[0]

        corr = dataframe_correlate_cols_ref(data=data, cols=cols_to_correlate, group_col=group_col, select_first_col=first_col_select)
        print(corr.to_string())
        return

    if args.correlation_matrix is not None:
        print("[CORRELATION]")
        cols_to_correlate = parse_argument_list(args.correlation_matrix[0])

        group_cols = None
        if len(args.correlation_matrix) > 1 and args.correlation_matrix[1] not in ["0", "None"]:
            group_cols = parse_argument_list(args.correlation_matrix[1])

        print(data.set_index(["BENCH"] + group_cols)[cols_to_correlate[0]])

        corr = data.groupby(group_cols)[cols_to_correlate].corr()
        print(corr.to_string())
        return

    

    # Quick table viewing
    if args.table is not None:
        #print(args.table[0])
        print_data_to_table(metadata=metadata, dataframe=data, full=args.table[0])
        return

    # Generic Heatmap handler
    if args.generic_heatmap is not None:
        idx_col = None
        value_col = None

        # BENCHMARK AND ARGUMENT SPECIFIC DATA STUFF
        if benchmark == "swo_bench":
            # Get Unique WL Column
            if glob_unique_wl_columns == DEFAULT_ERROR:
                glob_unique_wl_columns = dataframe_get_workload_params(data, SWO_BENCH_DEFAULT_COL)

            # Select columns
            idx_col = SWO_BENCH_DEFAULT_IDX_SHOWED
            value_col = SWO_BENCH_DEFAULT_COL_SHOWED
        elif benchmark == "energy_bench":
            if args.feature_selection is None:
                # Select features
                data = dataframe_select_features(data, {"equal":ENERGY_BENCH_DEFAULT_FEATURE_SELECTION})

            # Select columns
            idx_col = ENERGY_BENCH_DEFAULT_IDX_SHOWED
            value_col = ENERGY_BENCH_DEFAULT_COL_SHOWED
        
        elif benchmark == "trace_delay":
            # Select columns
            idx_col = ENERGY_BENCH_DEFAULT_IDX_SHOWED
        
        if args.column is not None:
            value_col = args.column
        if args.index is not None:
            idx_col = args.index

        try:
            plot_generic_heatmap(metadata, data, idx_col, value_col, glob_unique_wl_columns, label_dict, save=args.save)
        except:
            print(data)
            raise
        return

    # Barplot
    if args.barplot is not None:

        grouping_col = None
        if len(args.barplot) > 1 and args.barplot[1] not in ["0", "None"]:
            grouping_col = parse_argument_list(args.barplot[1])

        horizontal:bool = False
        if len(args.barplot) > 2 and args.barplot[2] in ["1", "True"]:
            horizontal = True

        clustered_priority = True
        if args.barplot[0] == "0":
            clustered_priority = False
        print("[BARPLOT] - GROUPING: {}, CLUSTERED: {}, HORIZONTAL: {}".format(grouping_col, horizontal, clustered_priority))
        plot_generic_barplot(meta=metadata, data=data, idx_col=args.index, value_col=args.column, group_columns=grouping_col, clustered_priority=clustered_priority, err_col=parse_argument_list(args.error_column), label_dict=label_dict, save=args.save, horizontal=horizontal)
        return

    if args.histogram is not None:
        bins = pd.to_numeric(args.histogram[0]) if ":" not in args.histogram[0] else parse_argument_list(args.histogram[0])
        if type(bins) is not list and bins == 0:
            bins = None
        elif type(bins) is list:
            bins = pd.to_numeric(bins)
            assert len(bins) == 3
            bins = list(np.arange(start=bins[0], stop=bins[1], step=bins[2]))
        orientation = 'vertical'
        if len(args.histogram) > 1 and args.histogram[1] == 1:
            orientation = 'horizontal'
        group_by = None
        if len(args.histogram) > 2:
            group_by = parse_argument_list(args.histogram[2])
        
        plot_histogram(data=data, col=args.column, bins=bins, orientation=orientation, group_by=group_by, label_dict=label_dict, save=args.save)
        return

    if args.statistic is not None:
        
        assert args.column is not None
        group_by = None
        if len(args.statistic) > 0 and args.statistic[0] not in ["None", "0"]:
            group_by = parse_argument_list(args.statistic[0])
        
        grouping = [(None, data)]
        if group_by is not None:
            grouping = data.groupby(group_by, observed=True)
        print("[STATISTICS] - GROUPBY: {}".format(group_by))
        stat_dict = {"COL": [], "COL_DATA_LEN": [], "GROUP_COL" : [], "MEAN": [], "MEDIAN": [], "MODE": [], "STD":[], "VARIANCE": [], "MIN": [], "MAX": []}
        for name, group in grouping:
            stat_dict["COL"].append(args.column)
            stat_dict["COL_DATA_LEN"].append(len(group[args.column]))
            stat_dict["GROUP_COL"].append(name)
            stat_dict["MEAN"].append(np.mean(group[args.column]))
            stat_dict["MEDIAN"].append(np.median(group[args.column]))
            stat_dict["MODE"].append(stats.mode(group[args.column], nan_policy='omit'))
            stat_dict["STD"].append(np.std(group[args.column]))
            stat_dict["VARIANCE"].append(np.var(group[args.column]))
            stat_dict["MIN"].append(min(group[args.column]))
            stat_dict["MAX"].append(max(group[args.column]))

        print(pd.DataFrame.from_dict(stat_dict).to_string())
        return

    if args.extrapolate is not None:
        
        assert args.column is not None and args.column in data.columns
        assert args.index is not None and args.index in data.columns

        plot_bool = False
        if args.extrapolate[2] in ["1", "True"]:
            plot_bool = True

        legend_labels = None
        if args.extrapolate[3] not in ["None"]:
            legend_labels = parse_argument_list(args.extrapolate[3])

        index_val = pd.to_numeric(args.extrapolate[0], errors='ignore')

        group_by = None
        if len(args.extrapolate) > 0 and args.extrapolate[1] not in ["None", "0"]:
            group_by = parse_argument_list(args.extrapolate[1])
        
        grouping = [(None, data)]
        if group_by is not None:
            grouping = data.groupby(group_by, observed=True)
        
        def linear_func(x, a, b):
            if type(x) is list:
                return [a * x_elem + b for x_elem in x]
            return a * x + b
        
        guess = (0.5, 0.5, 0.5)

        if plot_bool:
            plt.figure(figsize=label_dict.pop("figuresize", FIGSIZE_FULL))

        params_unique_bahvior = []
        # if args.plot_unique_behavior == "EXPO_STAT":
        #     grouping = reversed(list(grouping))
        #     LVPOL_Y_AXIS = list(data[data["FREQ"] == 13333333][args.column])
        #     LVPOL_Y_AXIS = abs(LVPOL_Y_AXIS[0] - LVPOL_Y_AXIS[1])

        print("[EXTRAPOLATE] - GROUPBY: {}".format(group_by))
        stat_dict = {"COL": [], "COL_DATA_LEN": [], "IDX": [],"GROUP_COL" : [], "PARAMS": [], "INDEX_VAL": [], "COL_AT_INDEX_VAL" : []}

        labels = []
        for enum_index, (name, group) in enumerate(grouping):
            print(name)
            stat_dict["COL"].append(args.column)
            stat_dict["COL_DATA_LEN"].append(len(group[args.column]))
            stat_dict["GROUP_COL"].append(name)
            stat_dict["IDX"].append(args.index)

            x_data = group[args.index]
            y_data = group[args.column]

            print(x_data)
            print(y_data)

            params, covs = curve_fit(linear_func, x_data, y_data)

            if plot_bool:
                if args.plot_unique_behavior == "EXPO_STAT":
                    if name == "FAST_FLASH" or name is None:
                        params_unique_bahvior = params
                        plt.plot([index_val] + list(x_data), [linear_func(index_val, params_unique_bahvior[0], params_unique_bahvior[1])] + list(y_data))
                        print([linear_func(index_val, params_unique_bahvior[0], params_unique_bahvior[1])] + list(y_data))
                    else:
                        plt.plot([index_val] + list(x_data), linear_func([index_val] + list(x_data), params_unique_bahvior[0], params_unique_bahvior[1] - LVPOL_Y_AXIS))
                        print(linear_func([index_val] + list(x_data), params_unique_bahvior[0], params_unique_bahvior[1] - LVPOL_Y_AXIS))
                else:
                    plt.plot([index_val] + list(x_data), [linear_func(index_val, params[0], params[1])] + list(y_data))
                labels.append(name)

                plt.plot(list(x_data), list(y_data), linestyle='None', marker=INDEX_TO_MARKER[enum_index % len(INDEX_TO_MARKER)])
                labels.append(name)
               

            stat_dict["PARAMS"].append(params)
            #stat_dict["COVS"].append(covs)

            stat_dict["INDEX_VAL"].append(index_val)
            stat_dict["COL_AT_INDEX_VAL"].append(linear_func(index_val, params[0], params[1]))            

        if plot_bool:
            if legend_labels is not None:
                labels = legend_labels
            plt.legend(labels)
            alter_plot_appearance_post(label_dict)
            plot_save_or_show(args.save)
        else:
            print(pd.DataFrame.from_dict(stat_dict).to_string())


        return

    if args.weighted_average is not None:
        print(["WEIGHTED AVERAGE"])
        assert args.weighted_average[0] is not None
        assert args.weighted_average[1] is not None

        value_col = args.weighted_average[0]
        weight_col = args.weighted_average[1]

        
        weighted_avg = 0
        sum_weights = 0
        for index, row in data.iterrows():
            sum_weights += row[weight_col]
            weighted_avg += np.nan_to_num(row[value_col]) * np.nan_to_num(row[weight_col])
        
        print("Weighted Average: {} for column: {} with weights of column: {}".format(weighted_avg / sum_weights, value_col, weight_col))
        return

    if args.not_normal_distribution is not None:
        assert args.not_normal_distribution[0] in data.columns, "MEAN-COL not found"
        assert args.not_normal_distribution[1] in data.columns, "MEDIAN-COL not found"
        assert args.not_normal_distribution[2] in data.columns, "MODE-COL not found"
        #print(data[args.not_normal_distribution[2]].apply(lambda x : x[0]))

        # unpacked_mode_col = data[args.not_normal_distribution[2]].apply(lambda x : x[0])
        # print(21871957.0 in unpacked_mode_col.iloc[0])
        # print()
        # return

        data["MEAN_EQ_MEDIAN"] = data[args.not_normal_distribution[0]] == data[args.not_normal_distribution[1]]
        data["MEAN_IN_MODE"] = data.apply(lambda x : x[args.not_normal_distribution[0]] in x[args.not_normal_distribution[2]][0], axis=1)
        data["MEDIAN_IN_MODE"] = data.apply(lambda x : x[args.not_normal_distribution[1]] in x[args.not_normal_distribution[2]][0], axis=1)

        show_cols = []
        for showable in ["BENCH", "FREQ", "DVS_POL", "CNT_TYPE", "REP_NUM"] + [args.not_normal_distribution[0].replace("MEAN", "STD"), args.not_normal_distribution[0].replace("MEAN", "STD_ERR")]:
            if showable in data.columns:
                show_cols.append(showable)

        data = dataframe_remove_features(data, {"equal": {"MEAN_EQ_MEDIAN": True, "MEAN_IN_MODE":True, "MEDIAN_IN_MODE":True}})

        print(data[show_cols + ["MEAN_EQ_MEDIAN", "MEAN_IN_MODE", "MEDIAN_IN_MODE"] + args.not_normal_distribution].to_string())
        return

    # Single boxplot
    if args.boxplot is not None:
        #print(args.boxplot)
        grouping_col = None
        if args.boxplot != []:
            grouping_col = args.boxplot
        
        plot_generic_single_boxplot(data, args.column, args.index, group_col=grouping_col, label_dict=label_dict, save=args.save)

    # Single lineplot
    if args.lineplot is not None or args.scatterplot is not None:
        argument_input = None
        scatter = False
        if args.lineplot is not None:
            argument_input = args.lineplot
        else:
            argument_input = args.scatterplot
            scatter = True

        group_col_list = None
        if len(argument_input) > 0 and argument_input[0] != "None":
            group_col_list = parse_argument_list(argument_input[0])

        second_y_col = None
        if len(argument_input) == 2:
            second_y_col = argument_input[1]
        plot_lineplot(data=data, col=args.column, idx=args.index, group_col=group_col_list, label_dict= label_dict, save=args.save, second_y_col=second_y_col, error_col=parse_argument_list(args.error_column), scatter=scatter)

        return

    # vertical lineplot
    if args.vertical_lineplot is not None:
        plot_vertical_lineplot(data, args.column, args.index, args.vertical_lineplot, label_dict, save=args.save)
        return

    # errorplot 
    if args.repetition_errorplot is not None:

        grouping = None
        if len(args.repetition_errorplot) > 0:
            grouping = parse_argument_list(args.repetition_errorplot[0])
        plot_rep_errorplot(data, mean_col=args.column, idx=args.index, std_col=parse_argument_list(args.error_column), group_col=grouping, label_dict=label_dict, save=args.save)
        return
    
    # Convenience Function
    # For now only works for beebs, mibench and workloads with no arguments
    if args.human_correlation is not None:
    
        #data = dataframe_energy_bench_current_data_to_energy(metadata, data, ["DVS_POL", "FREQ"])
        
        data = dataframe_proportion_column(data, "div", "REP_ENERGY_TOTAL",  ["DVS_POL"], ("FREQ", 80000000))
        #print(data)

        path:str = args.human_correlation[0]
        if path in ["Same", "same"]:
            path = args.pickle
            path = path.replace("energy_bench", "swo_bench")
            print(path)
            #return

        # Read swo_bench data
        swo_data:pd.DataFrame = pickle_to_datatypes(pkl_path= path).get("data")

        # Remove CYCLE as Counter to view at
        swo_data = dataframe_remove_features(swo_data, {"equal": {"CNT_TYPE":0}})

        # Apply repetition statistics
        swo_data = dataframe_repetition_statistics(swo_data, "CNT_NORM", ["DVS_POL", "FREQ", "CNT_TYPE"], True)
        #print(swo_data)

        
        # Renaming
        labels = {}

       
        # Automatic renaming
        swo_data = dataframe_column_idxval_to_strval(swo_data, SWO_BENCH_DEFAULT_IDX_SHOWED, SWO_BENCH_INDEX_TO_CNTTYPE)
        data = dataframe_column_idxval_to_strval(data, "DVS_POL", {0:"LOW_VOLTAGE", 1:"FAST_FLASH"})
        swo_data = dataframe_column_idxval_to_strval(swo_data, "DVS_POL", {0:"LOW_VOLTAGE", 1:"FAST_FLASH"})

        #swo_data = dataframe_select_features(swo_data, {"equal":{"DVS_POL": 1}})


        fig, ax = ([None, None], [None, None])
        #_temp, ax = plt.subplots(2, 1, figsize=label_dict.get("figuresize", FIGSIZE_FULL))
        #(fig[0], ax[0]) = plot_generic_barplot({}, swo_data, "FREQ", "CNT_NORM_REP_MEAN", ["CNT_TYPE", "DVS_POL"], False, show=False)

        # python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p BA_Measurement_Utils/results_online/home/swo_bench/iter_mode_unique/basic_bm/nucleo-l476rg/swo_bench/sleep.pkl -bm swo_bench -fs DVS_POL:0 -col CNT_NORM_REP_MEAN -idx FREQ -repst CNT_NORM FREQ:CNT_TYPE -bap 0 CNT_TYPE -pfs 12 4 -fr CNT_TYPE:0  -yal "Proportion CNT to Trace Cycles" -xal "CPU Frequency"  -pse "Profiling Counter (stacked) per CPU Frequency (index) (POL: Low Voltage)" -ltl "CNT TYPE"

        #print("[Not implemented yet]")

        #(fig[1], ax[1]) = plot_lineplot(data, "REP_ENERGY_TOTAL_PROP_DIV", "FREQ", "DVS_POL", show=False)
        plot_twin_line_bar_plot(data, swo_data,  "REP_ENERGY_TOTAL_PROP_DIV", "CNT_NORM_REP_MEAN", "FREQ", ["DVS_POL", "CNT_TYPE"], ["DVS_POL"])

        #plt.show()

        # python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p BA_Measurement_Utils/results_online/home/energy_bench/iter_mode_unique/basic_bm/nucleo-l476rg/energy_bench/sleep.pkl -bm energy_bench -ucol DVS_POL -col REP_ENERGY_TOTAL_PROP_DIV -prop div REP_ENERGY_TOTAL  FREQ:80000000 DVS_POL -idx FREQ -lp 0 DVS_POL -pfs 12 4 -xal "CPU Frequency in Hz" -yal "Energy Proportion to 80 MHz"
    
    return

if __name__ == "__main__":
    main()