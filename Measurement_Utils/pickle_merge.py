
import argparse
import hashlib
import pickle
from secrets import choice
import sys
from typing import Dict, Any

import pandas as pd
import numpy as np
import os

import json

from experiment_to_pickle_constants import COL_NAME_BENCH_REPETITION, COL_NAME_ENERGY_BENCH_CURRENT, COL_NAME_TRACE_DELAY_DELAY, COL_NAME_TRACE_SAMPLES_WAVE, BENCHMARK_TYPES, SWO_BENCH_INDEX_TO_CNTTYPE, DVS_POL_INDEX_TO_STRING, METADATA_MODFICATION_KEY

from pickle_to_plot import DEFAULT_ERROR, REPETITION_STATISTICS_COL_NAMES, meta_to_benchmark_type, parse_argument_list, pickle_folders_to_datatypes, meta_get_workload_params, dataframe_create_column, data_find_outliers, dataframe_repetition_statistics, dataframe_proportion_column, dataframe_column_idxval_to_strval, dataframe_merge_column_to_row, dataframe_merge_energy_swo_data, parse_arguments_feature_selection, dataframe_select_features, dataframe_remove_rows_with_outliers, dataframe_remove_features, dataframe_calculate_with_col, parse_arguments_proportion, parse_arguments_column_labels, print_data_to_table, pickle_to_datatypes, dataframe_flatten, dataframe_energy_bench_current_data_to_mean, dataframe_energy_bench_current_mean_to_energy, dataframe_operation_row, parse_argument_key_list, pickle_folder_to_datatypes, dataframe_trace_wave_data_to_ecp_length, ARGUMENT_PROPORTION_OPERATIONS


def datatypes_to_pickle(pkl_path:str, pickle_name:str, meta:dict, data:pd.DataFrame, key_meta:str="metadata", key_data:str="dataframes"):
    """
    Converts a dict with meta as dict and data as dataframe to a pickle
    """ 
    if pkl_path[-1] != "/":
        pkl_path += "/"
    if pickle_name[-4:] != ".pkl":
        pickle_name += ".pkl"

    with open(pkl_path + pickle_name ,"wb") as f:
        pickle.dump({ key_meta: meta, key_data : [data] }, f)

def dict_add_key_suffix(di:dict, suffix:str):
    ret_dict = {}
    for key, value in di.items():
        ret_dict[str(key) + suffix] = value
    return ret_dict

def dict_hash(dictionary: Dict[str, Any]) -> str:
    """MD5 hash of a dictionary.
    https://www.doc.ic.ac.uk/~nuric/coding/how-to-hash-a-dictionary-in-python.html """
    dhash = hashlib.md5()
    # We need to sort arguments so {'a': 1, 'b': 2} is
    # the same as {'b': 2, 'a': 1}
    encoded = json.dumps(dictionary, sort_keys=True).encode()
    dhash.update(encoded)
    return dhash.hexdigest()

def short_dict_hash(dictionary: Dict[str, Any], length=5) -> str:
    return dict_hash(dictionary=dictionary)[:length]

def main():
    # Minimum Arguments
    p = argparse.ArgumentParser()
    mut_group_0 = p.add_mutually_exclusive_group(required=True)
    mut_group_0.add_argument("-p", "--pickle",        type=str, nargs=2,  help="path to the pickle (.pkl) or folder of pickles ", metavar=('PATH'))
    mut_group_0.add_argument("-sp", "--single-pickle", type=str, help="path to the pickle (.pkl) or folder of pickles ", metavar=('PATH'))

    p.add_argument("-pfs", "--path-follow-subdirectories", type=str, help="benchmark type", required=False, metavar=('BOOL'), choices=["0", "1"])
    p.add_argument("-bm", "--benchmark", type=str, nargs="+", help="benchmark type", required=True, metavar=('TYPE'))


    mut_group = p.add_mutually_exclusive_group(required=True)
    mut_group.add_argument("-tbl", "--table",               type=int, nargs=1, metavar=("FULL_PRINT_0_or_1"), help="show pickle-data as table in console")
    mut_group.add_argument("-o", "--out", nargs="+", help="PATH to save the merged data", metavar=('PATH', 'NAME'))

    p.add_argument("-mto", "--merge-to-one", action=argparse.BooleanOptionalAction, help="Whether to merge all benchmark types into one pickle or seperately. Only takes effect when merging folder.")

    # Additional arguments

    ## Data Manipulation
    ### Column Scale
    p.add_argument("-csc", "--column-scale", nargs=4, metavar=("COLUMN-NAME", "SCALE-FACTOR", "SCALE-OPERATION", "NEW-COLUMN"), help="scale a column with a given operation by a given scale factor and assign the result to a new column. If NEW-COLUMN is None the Column Name will be altered.")
    p.add_argument("-csc2", "--column-scale-2", nargs=4, metavar=("COLUMN-NAME", "SCALE-FACTOR", "SCALE-OPERATION", "NEW-COLUMN"), help="scale a column with a given operation by a given scale factor and assign the result to a new column. If NEW-COLUMN is None the Column Name will be altered.")

    ### Proportion
    p.add_argument("-prop", "--proportion", nargs=4, metavar=("[DIV/SUB]", "PROP_COL_NAME", "REFERENCE_FEATURE_COL_VAL", "SAME_FEATURE_LIST"), help="calculate the proportion between values of the same column. SAME_FEATURE_LIST: eg. operation:storage or None")

    ### Repetition
    p.add_argument("-repst", "--repetition-statistics", nargs=2, type=str, metavar=("COL-NAME-TO-STAT-LIST", "DIFF-COL-NAME-LIST"), help="calculate mean, std and var between the repetition on the given column name by grouping the data by DIFF_COL_NAME_LIST eg. FREQ:COL1:COL2 . The column name values should be int or float.")
    p.add_argument("-erepst", "--energy-repetition-statistics", action=argparse.BooleanOptionalAction, help="calculate mean, std and var between the repetition on the current data")


    p.add_argument("-dr", "--drop",         nargs="+", help="drop the given column type before plotting", metavar=('COLUMN_NAME'))

    ### Feature Selection/ Removal
    p.add_argument("-fs", "--feature-selection", nargs='+', help="select a value of a column to decrease the dimension of plotting. eg. DVS_POL:0 FWSA:0", metavar=('COLUMN_VALUE_PAIR'))
    p.add_argument("-fr", "--feature-removal", nargs='+', help="select a value of a column that should be removed for plotting. eg. DVS_POL:0 FWSA:0", metavar=('COLUMN_VALUE_PAIR'))

    p.add_argument("-do", "--drop-outliers", nargs='+', help="select columns to run a outlier removal on. TYPE: 'iqr', 'zscore'", metavar=('COLUMN-LIST', "TYPE"))

    p.add_argument("-rc", "--rename-column", nargs=2, help="select a columns to rename to RENAME", metavar=('COLUMN', "RENAME"))

    p.add_argument("-cc", "--create-column", nargs=4, help="Create a new colum that is based on the combination of other columns.", metavar=('NAME', 'COLUMN-1', 'COLUMN-2', 'OPERATION'))
    p.add_argument("-fl", "--flatten-ucol", action=argparse.BooleanOptionalAction, help="Flatten the benchmark dataframe by ucol")

    p.add_argument("-pfl", "--prevent-flatten-ucol", action=argparse.BooleanOptionalAction, help="Flatten the benchmark dataframe by ucol")

    p.add_argument("-fep", "--fix-repetition-id", type=int, help="Fix repetition id duplicates", metavar=("IGNORE-OTHERS-FURTHER"), choices=[0, 1])
    p.add_argument("-twpl", "--trace-wave-packet-length", action=argparse.BooleanOptionalAction, help="Perform the trace_wave packet length calculation")


    p.add_argument("-ro", "--row-operation", nargs=5, type=str, metavar=("COL-NAME-TO-OPERATE-LIST", "GROUP-COL-NAME-LIST", "OPERATION", "SPECIFIC-ROW-FEATURE-LIST", "ELEMENT-NAME"), help="COL-NAME-TO-OPERATE-LIST eg. FREQ:CNT_TYPE; GROUP-COL-NAME-LIST eg. operation:storage; OPERATION eg. [sum]; SPECIFIC-ROW-FEATURE-LIST eg. FREQ:80000000:13333333, ELEMENT-NAME eg. COMP_FLASH_SUM")

    ## Plot Labeling and saving Labeling

    p.add_argument("-cl", "--column-labels", nargs="+", metavar=("COLNAME-STR-DICT"), help="Rename index based labels to human-readable labels. Input convention: COLNAME?INDEX:LABEL[?INDEX:LABEL] eg. swo_mode?0:REF?1:DEMCR?2:DEMCR_SWOPIN")

    args = p.parse_args()

    
    print("[PICKLE-MERGE]")

    # CHECK BENCHMARK EXISTENCE
    assert ((args.pickle is not None and len(args.benchmark) == 2) or (args.single_pickle is not None and len(args.benchmark) == 1))
    benchmark = args.benchmark
    if any(bm not in BENCHMARK_TYPES for bm in benchmark):
        print("BENCHMARK TYPE NOT RECOGNIZED")
        return

    input_paths:str = None
    # Check whether input pickle path are uniform in forms of dimensions (folder-folder or pickle-pickle)
    if args.pickle is not None:
        assert (args.pickle[0][-1] == "/" and args.pickle[1][-1] == "/") or (".pkl" == args.pickle[0][-4:] and ".pkl" == args.pickle[1][-4:])
        input_paths = args.pickle
    else:
        input_paths = [args.single_pickle]
    # Check wehther input pickle is folder or single pickle path 
    arg_path_is_folder = False
    if input_paths[0][-1] == "/":
        arg_path_is_folder = True

    path_follow_subdirectories = True
    if args.path_follow_subdirectories is not None and args.path_follow_subdirectories == "0":
        path_follow_subdirectories = False
    
    print("[PATH FOLLOW SUBDIRECTORIES: {}]".format(path_follow_subdirectories))
    
    # DATA MANIPULATION
    # pickle to seperate datatypes (metadata:dict, data:Dataframe) conversion
    pickle_data = []
    if arg_path_is_folder: # pickle path
        if args.pickle is not None:
            pickle_data = pickle_folders_to_datatypes(input_paths, path_follow_subdirectories)
        else:
            pickle_data = pickle_folder_to_datatypes(input_paths[0])
            #print(pickle_data[0])
    else: # single pickles
        for path in input_paths:
            pickle_data.append(pickle_to_datatypes(pkl_path= path))
        
        pickle_data = [[input_paths[0].split("/")[-1].replace(".pkl", ""), pickle_data]]
        #assert (args.pickle[0].split("/")[-1] == args.pickle[1].split("/")[-1]), "pickles dont have the same name" # TODO

    print("PICKLE DATA SIZE:", len(pickle_data))
    assert len(pickle_data) > 0, "Something wrong with reading the data"

    if args.fix_repetition_id is not None:
        print("[FIX REPETITION_ID]")
        ignore_others_further = False
        if args.fix_repetition_id == 1:
            print("[[FIX REPETITION_ID - Ignore others true]]")
            ignore_others_further = True
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                cols = bm_data["data"].columns

                if COL_NAME_BENCH_REPETITION not in cols:
                    if ignore_others_further:
                        del pickle_data[bm_i]
                    continue
                
                # Get column differentiations
                wl_params = meta_get_workload_params(bm_data["metadata"])
                if wl_params is DEFAULT_ERROR or wl_params is None:
                    wl_params = []

                for diff in ["FREQ", "DVS_POL", "CNT_TYPE"]:
                    if diff in cols:
                        wl_params += [diff]
                
                maximum_id = max(bm_data["data"][COL_NAME_BENCH_REPETITION])

                grouping = bm_data["data"].groupby(wl_params, as_index=False, observed=True)
                missing_found_once = False
                for name, group in grouping:
                    id_missing = list(np.arange(0, maximum_id + 1, 1))
                    if len(group[COL_NAME_BENCH_REPETITION].unique()) < maximum_id + 1:
                        
                        missing_found_once = True
                        for id in group[COL_NAME_BENCH_REPETITION]:
                            if id in id_missing:
                                id_missing.remove(id)
                        #print(id_missing)
                        for index, missing in enumerate(id_missing):
                            # Find indices with same repetition ids
                            data_index = group.index[group[COL_NAME_BENCH_REPETITION] == index][-1]

                            # Get row for assignment
                            row = bm_data["data"].iloc[data_index].copy()

                            # Assign missing repetition id
                            row[COL_NAME_BENCH_REPETITION] = missing

                            # Persist change row into dataset
                            bm_data["data"].iloc[data_index] = row

                            # Check
                            #print(bm_data["data"].iloc[data_index])
                        #print(id_missing)
                        #print(name)
                if ignore_others_further and not missing_found_once:
                    print("[{} ignored for further processing]".format(pickle_data[bm_i][0]))
                    del pickle_data[bm_i]

    # Trace_Wave DATA HANDLE
    if args.trace_wave_packet_length is not None:
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                bm_data["data"] = dataframe_trace_wave_data_to_ecp_length(bm_data["metadata"], bm_data["data"])
    # ARGUMENT DATA HANDLES
    if args.drop_outliers is not None:
        outlier_cols = parse_argument_list(args.drop_outliers[0])
        outlier_method = 'iqr'
        if len(args.drop_outliers) > 1 and args.drop_outliers[1] in ["zscore", "iqr", "equal"]:
            outlier_method = args.drop_outliers[1]
        print("DROP OUTLIER via {}".format(outlier_method))
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                cols = bm_data["data"].columns
                wl_params = meta_get_workload_params(bm_data["metadata"])
                if wl_params is DEFAULT_ERROR or wl_params is None:
                    wl_params = []
                if "FREQ" in cols:
                    wl_params += ["FREQ"]
                if "DVS_POL" in cols:
                    wl_params += ["DVS_POL"]
                if "CNT_TYPE" in cols:
                    wl_params += ["CNT_TYPE"]
                for col in outlier_cols:
                    if col in cols:
                        bm_data["data"] = dataframe_remove_rows_with_outliers(bm_data["data"], col, grouping_cols=wl_params, method=outlier_method)

    # ENERGY HANDLE
    if args.energy_repetition_statistics is not None:
        print("[ENERGY REPETITION]")
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                if COL_NAME_BENCH_REPETITION in bm_data["data"].columns and meta_to_benchmark_type(bm_data["metadata"]) == "energy_bench":
                    cols = bm_data["data"].columns
                    wl_params = meta_get_workload_params(bm_data["metadata"])
                    if wl_params is DEFAULT_ERROR or wl_params is None:
                        wl_params = []
                    if "FREQ" in cols:
                        wl_params += ["FREQ"]
                    if "DVS_POL" in cols:
                        wl_params += ["DVS_POL"]

                    bm_data["data"] = dataframe_energy_bench_current_data_to_mean(bm_data["metadata"], bm_data["data"], wl_params)
                    bm_data["data"] = dataframe_energy_bench_current_mean_to_energy(bm_data["metadata"], bm_data["data"], wl_params)

                    # Outlier removal
                    bm_data["data"] = dataframe_remove_rows_with_outliers(bm_data["data"], "CURR_SAMPLES", 1, grouping_cols=wl_params)
                    
                    bm_data["data"] = dataframe_repetition_statistics(bm_data["data"], ["ENERGY_TOTAL", "POWER"], wl_params, repetition_necesarry=True, prior_outlier_removal=True)


                    pickle_data[bm_i][1][bm_data_i]["data"] = bm_data["data"]

                    if METADATA_MODFICATION_KEY not in pickle_data[bm_i][1][bm_data_i]["metadata"]:
                        pickle_data[bm_i][1][bm_data_i]["metadata"]["MODS"] = []
                    pickle_data[bm_i][1][bm_data_i]["metadata"]["MODS"].append({"energy_repetition": wl_params})

    
    # Summarize Repetition
    if args.repetition_statistics is not None:
        print("[REPETITION]")
        parsed_arguments = [parse_argument_list(args.repetition_statistics[0]), parse_argument_list(args.repetition_statistics[1])]
        # TODO unique WL COLUMNS

        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                if COL_NAME_BENCH_REPETITION in bm_data["data"].columns and meta_to_benchmark_type(bm_data["metadata"]) != "energy_bench":
                    wl_params = meta_get_workload_params(bm_data["metadata"])
                    if wl_params is DEFAULT_ERROR or wl_params is None:
                        wl_params = []

                    # Outlier removal
                    outlier_removal = False
                    if "CYC_DIFF" in bm_data["data"].columns:
                        outlier_removal = True
                        bm_data["data"] = dataframe_remove_rows_with_outliers(bm_data["data"], "CYC_DIFF", 1, grouping_cols=parsed_arguments[1] + wl_params)

                    pickle_data[bm_i][1][bm_data_i]["data"] = dataframe_repetition_statistics(bm_data["data"], parsed_arguments[0], parsed_arguments[1] + wl_params, prior_outlier_removal=outlier_removal)
                    if METADATA_MODFICATION_KEY not in pickle_data[bm_i][1][bm_data_i]["metadata"]:
                        pickle_data[bm_i][1][bm_data_i]["metadata"]["MODS"] = []
                    pickle_data[bm_i][1][bm_data_i]["metadata"]["MODS"].append({"repetition": parsed_arguments})

    if args.proportion is not None:

        (col_feature, reference_feature_tuple, same_features) = parse_arguments_proportion(args.proportion[1:])
        operation = args.proportion[0].lower()
        assert operation in ARGUMENT_PROPORTION_OPERATIONS
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                data_columns = bm_data["data"].columns
                if all(col in data_columns for col in same_features) and reference_feature_tuple[0] in data_columns and col_feature in data_columns:
                    print("[PROPORTION]")
                    pickle_data[bm_i][1][bm_data_i]["data"] = dataframe_proportion_column(bm_data["data"], operation, col_name_to_prop=col_feature, same_features=same_features, reference_feature=reference_feature_tuple)


    if args.row_operation is not None:
        print("[ROW OPERATION]")
        # "COL-NAME-TO-OPERATE-LIST", "GROUP-COL-NAME-LIST", "OPERATION", "SPECIFIC-ROW-FEATURE-LIST", "ELEMENT-NAME"
        key_list = parse_argument_key_list(args.row_operation[3])
        group_by = parse_argument_list(args.row_operation[1])
        calc_on = parse_argument_list(args.row_operation[0])
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):

                wl_params = meta_get_workload_params(bm_data["metadata"])
                if wl_params is DEFAULT_ERROR or wl_params is None:
                    wl_params = []

                # check input with data columns
                operational = True
                for key, value in key_list.items():
                    if key not in bm_data["data"].columns:
                        operational = False
                        break
                    for val in pd.to_numeric(value):
                        if val not in bm_data["data"][key].unique():
                            operational = False
                if operational:
                    pickle_data[bm_i][1][bm_data_i]["data"] = dataframe_operation_row(bm_data["data"], args.row_operation[2], cols_to_calculate_on=calc_on, cols_group_by=group_by + wl_params, specific_row_features=key_list, element_name=args.row_operation[4])

    if args.column_scale is not None:
        print("[COLUMN SCALE]")
        to_scale_col_lst = parse_argument_list(args.column_scale[0])
        
        new_col_list = parse_argument_list(args.column_scale[3])
        if type(new_col_list) is list and new_col_list[0] in ["None", "0", None] :
            new_col_list = None
        
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                # Apply value_col scale
                if all(col in bm_data["data"].columns for col in to_scale_col_lst):
                    pickle_data[bm_i][1][bm_data_i]["data"] = dataframe_calculate_with_col(bm_data["data"], to_scale_col_lst, pd.to_numeric(args.column_scale[1]), args.column_scale[2], new_col=new_col_list)

    if args.column_scale_2 is not None:
        print("[COLUMN SCALE 2]")
        to_scale_col_lst = parse_argument_list(args.column_scale_2[0])

        new_col_list = parse_argument_list(args.column_scale_2[3])
        if type(new_col_list) is list and new_col_list[0] in ["None", "0", None] :
            new_col_list = None
        
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                # Apply value_col scale
                if all(col in bm_data["data"].columns for col in to_scale_col_lst):
                    pickle_data[bm_i][1][bm_data_i]["data"] = dataframe_calculate_with_col(bm_data["data"], to_scale_col_lst, pd.to_numeric(args.column_scale_2[1]), args.column_scale_2[2], new_col=new_col_list)

    if args.create_column is not None:
        print("[CREATE COLUMN]")
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                if all(col in bm_data["data"].columns for col in args.create_column[1:-1]):
                    pickle_data[bm_i][1][bm_data_i]["data"] = dataframe_create_column(bm_data["data"], args.create_column[0], args.create_column[1:-1], args.create_column[3])

    # Flatten dataframes with unique Workload parameters
    if (args.flatten_ucol is not None or args.merge_to_one) and args.prevent_flatten_ucol is None:
        print("[FLATTEN]")
        for bm_i, bm in enumerate(pickle_data):
            for bm_data_i, bm_data in enumerate(bm[1]):
                if (bm_data["metadata"].get("bench_config", None) is not None and
                        bm_data["metadata"]["bench_config"]["WORKLOAD_PARAMS"] is not None and
                        len( bm_data["metadata"]["bench_config"]["WORKLOAD_PARAMS"]) > 0):
                    print( bm_data["metadata"]["bench_config"]["WORKLOAD_PARAMS"])
                    out = dataframe_flatten(bm_data["metadata"], bm_data["data"], seperate=False)
                    pickle_data[bm_i][1][bm_data_i] = {"metadata": out[0][1], "data": out[0][2]}

    
    
    # MERGE STEP ON PER BM BASE
    # [["taskname", [dict_d1, dict_d2]], ...] --> [["taskname", {metadata:dict, data:pd.DataFrame}], ...]
    if args.pickle is not None:
        print("[MERGE]")
        for bm_i, bm in enumerate(pickle_data):
            assert COL_NAME_BENCH_REPETITION not in bm[1][0]["data"].columns and COL_NAME_BENCH_REPETITION not in bm[1][1]["data"].columns

            meta = [pickle_data[bm_i][1][0]["metadata"], pickle_data[bm_i][1][1]["metadata"]]
            data = [pickle_data[bm_i][1][0]["data"], pickle_data[bm_i][1][1]["data"]]
            pickle_data[bm_i][1] = {}

            # Data
            bm_types = [meta_to_benchmark_type(meta[0]), meta_to_benchmark_type(meta[1])]
            if all(t == bm_types[0] for t in bm_types):
                pickle_data[bm_i][1]["data"] = pd.concat(data).reset_index(drop=True)
            elif "energy_bench" in bm_types and "swo_bench" in bm_types:
                energy_index = bm_types.index("energy_bench")
                swo_index = bm_types.index("swo_bench")
                (_, data_merge) = dataframe_merge_energy_swo_data(meta[energy_index], data[energy_index], meta[swo_index], data[swo_index])
                pickle_data[bm_i][1]["data"] = data_merge
            
            # Metadata
            meta[0].update(dict_add_key_suffix(meta[1], "_" + short_dict_hash(meta[1])))
            pickle_data[bm_i][1]["metadata"] = meta[0]
            pickle_data[bm_i][1]["metadata"]["MERGE"] = [args.pickle[0], args.pickle[1]]
    else:
        for bm_i, bm in enumerate(pickle_data):
            pickle_data[bm_i][1] = {"metadata": bm[1][0]["metadata"], "data": bm[1][0]["data"]}

    # MERGE ALL BM INTO ONE DATAFRAME
    # [["taskname", {metadata:dict, data:pd.DataFrame}], ...] --> [["taskname", {metadata:dict, data:pd.DataFrame}]]
    if args.merge_to_one is not None:
        print("[MERGE-TO-ONE]")
        temp_all_dataframes = None
        temp_all_metadata = None
        for bm_i, bm in enumerate(pickle_data):
            ## DataFrames
            if temp_all_dataframes is None:
                temp_all_dataframes = bm[1]["data"]
                temp_all_metadata = bm[1]["metadata"]
                if bm[1]["metadata"].get("MERGE", None) is not None:
                    temp_all_metadata["MERGE"] = {bm[1]["metadata"]["taskname"]: bm[1]["metadata"]["MERGE"]}
                temp_all_metadata["taskname"] = "benchmark_merge"
            else:
                temp_all_dataframes = pd.concat([temp_all_dataframes, bm[1]["data"]])
                if bm[1]["metadata"].get("MERGE", None) is not None:
                    temp_all_metadata["MERGE"][bm[1]["metadata"]["taskname"]] = bm[1]["metadata"]["MERGE"]
        temp_all_dataframes = temp_all_dataframes.reset_index(drop=True)
        pickle_data.clear()
        pickle_data.append(["benchmark_merge", {"metadata": temp_all_metadata, "data":temp_all_dataframes}])

    # TODO for every data manipulation add note into metadata

    # if args.rename_column is not None:
    #     data.rename(columns={args.rename_column[0]: args.rename_column[1]}, inplace=True)
    
    # if args.feature_selection is not None:
    #     features = parse_arguments_feature_selection(args.feature_selection)
    #     #print(data.head(23))
    #     data = dataframe_select_features(data, features)
    #     #print(data.head(1))
    #     #return

    # if args.feature_removal is not None:
    #     features = parse_arguments_feature_selection(args.feature_removal)
    #     #print(data.head(23))
    #     data = dataframe_remove_features(data, features)
    #     #print(data.head(1))
    #     #return

    # # Drop a column that is special to the taskname but not interesing for plotting purposes
    # if args.drop is not None:#
    #     columns = data.columns
    #     for dr in args.drop:
    #         if dr in columns:
    #             del data[dr]

    # if args.column_scale is not None:
    #     # Apply value_col scale
    #     data = dataframe_calculate_with_col(data, args.column_scale[0], pd.to_numeric(args.column_scale[1]), args.column_scale[2])
    
    # # Argument col value rename
    # if args.column_labels is not None:
    #     labels = parse_arguments_column_labels(args.column_labels)
    #     for key, value in labels.items():
    #         data = dataframe_column_idxval_to_strval(data, key, value)

    # ARGUMENT HANDLE

    # Quick table viewing
    if args.table is not None:
        print("[TABLE]")
        #print(args.table[0])
        if arg_path_is_folder and args.merge_to_one is None:
            print("TBL: NOT IMPLEMNTED YET")
        else:
            print_data_to_table(metadata=pickle_data[0][1]["metadata"], dataframe=pickle_data[0][1]["data"], full=args.table[0]) # TODO Metadata
    # Save merged/manipulated data to pickle
    elif args.out is not None:
        print("[SAVE]")
        for bm_i, bm in enumerate(pickle_data):
            name = bm[0]
            print(name)
            if len(args.out) == 2 and (not arg_path_is_folder or args.merge_to_one is not None):
                name = args.out[1]
            datatypes_to_pickle(args.out[0], name, bm[1]["metadata"], bm[1]["data"]) # TODO Metadata
            print("Saving ... ", name, " to ", args.out[0])
    
    return

if __name__ == "__main__":
    main()