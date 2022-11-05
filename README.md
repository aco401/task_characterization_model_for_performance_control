# Appendix of bachelor thesis on topic: Design and Evaluation of a Task Characterization Model for Performance Control of Embedded Devices at Runtime

Author: Tobias Westphal, Email: tobias.westphal@haw-hamburg.de

This repository contains source code, scripts and data that has been created alongside the thesis. This repository also includes a RIOT ScaleClock Fork, which was not created in this thesis, but contains integrated tests and packages that were created. This enables to easily reproduce and test the designed components. The created parts are listed in the following:

## This repository lists:
- RIOT ScaleClock Fork on clock_config_clean_task_characterization branch containing (*ScaleClock and the RIOT code was given*): {µC} (`RiotClockConf/`) 
    - Implementation of task characterization model with Nucleo-l476RG board (`drivers/armv7m_dbg_task_characterization`)
    - Task Benchmark Utility to
        - Trace workloads with the task characterization model (`tests/gclk/profiling_counter_bench.c` and `tests/gclk/workloads.c`)
        - Start energy measurements (`tests/gclk/profiling_counter_bench[.c, .h]`)
        - Measure the delay of the trace utlity and perform TPIU configuration tests (`tests/oszilloscope-and-tests/`)

    - BEEBS set of tasks to evaluate the task characterization model with (`pkg/beebs/`)
    - MiBench2 set of tasks for potentially usage (`pkg/mibench2`) 

- Measurement Utilities: {PC} (`Measurement_Utils/`)
    - Experiment Utility - start automated task characterization, energy or delay experiments and save data to pickle of DataFrame (`experiment_to_pickle.py`)
    - Data Processing - Merge data pickles for easier plotting (`pickle_merge.py`)
    - Data Visualization - Plot DataFrames from pickles (`pickle_to_plot.py`)
    - Data Conversion - Convert CSV Data to pickle of DataFrame (`csv_to_pickle.py`)

    - Static Analysis of assembler files (`assembler_stat_analysis.py`)
    - Communicate with RigolDS1054Z (`rigol_ds1054z.py`)
    - Analysis of RIOT Boards for Cortex-M CPUs (`riot_board_analysis.ipynb`)

- Data: (`Data/`)
    - Compiled BEEBS source code for static analysis (`assembler_code/`)
    - Configuration json files for benchmarks (`json_config_files/`)
    - Measured Task Characterization Results, Energy Results, Delay Results - used by plot scripts (`results/`)

- Scripts: (`Scripts/`)
    - Start experiment (`Experiment/`)
        - Perform energy and task characterization benchmarks with beebs tasks (`beebs_swo_energy.sh`)
        - Perform energy measurements for task characterization model (`beebs_swo_energy.sh`)
        - Perform delay measurements for ecp_delay and ecp_length (`oszi_exp.sh`)
    - Plot data with pickle (`Plots/`)
        - Beebs Energy Plots (`beebs_plot_cmd_energy.sh`)
        - Beebs task characterization Plots (`beebs_plot_cmd_swo.sh`)
        - Overhead Delay task characterization Plots (`overhead_delay_plot_cmd.sh`)
        - Synthetic Tasks Energy Plots (`synthetic_plot_cmd_energy.sh`)
        - Synthetic Tasks task characterization Plots (`synthetic_plot_cmd_swo.sh`)


## Links:
- RIOT Fork on clock_config_clean_task_characterization branch [https://github.com/MichelRottleuthner/RiotClockConf/tree/clock_config_clean_task_characterization] (RiotClockConf/)
- RIOT Beebs pkg - [https://github.com/aco401/RIOT/tree/feature-beebs]
- BEEBS patches-for-riot branch - [https://github.com/aco401/beebs/tree/patches-for-riot]
- MiBench2 patches-for-riot branch - [https://github.com/aco401/MiBench2/tree/patches-for-riot]

- Measurement Utility Repository for DMM7510 - used by experiment_to_pickle [https://github.com/MichelRottleuthner/MeasurementUtils] 



