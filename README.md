# Appendix of bachelor thesis on topic: Design and Evaluation of a Task Characterization Model for Performance Control of Embedded Devices at Runtime

Author: Tobias Westphal, Email: tobias.westphal@haw-hamburg.de

This repository contains source code, scripts and data that has been created alongside the thesis.

## This repository lists:
- Riot ScaleClock Fork on `clock_config_clean_task_characterization` branch containing: {µC} (RiotClockConf/)
    - Implementation of task characterization model with Nucleo-l476RG board (drivers/armv7m_dbg_task_characterization)
    - Task Benchmark Utility to
        - trace workloads with the task characterization model (tests/gclk/profiling_counter_bench.c & tests/gclk/workloads.c)
        - start energy measurements (tests/gclk/profiling_counter_bench.c)
        - measure the delay of the trace utlity and perform TPIU configuration tests (tests/oszilloscope-and-tests/)
    - BEEBS set of tasks to evaluate the task characterization model with (pkg/beebs/)

- Measurement Utilities: {PC} (Measurement_Utils/)
    - Experiment Utility - start automated task characterization, energy or delay experiments and save data to pickle of DataFrame (experiment_to_pickle.py)
    - Data Processing - Merge data pickles for easier plotting (pickle_merge.py)
    - Data Visualization - Plot DataFrames from pickles (pickle_to_plot.py)
    - Data Conversion - Convert CSV Data of the USART communication with board to pickle of DataFrame (csv_to_pickle.py)

    - Static Analysis of assembler files (assembler_stat_analysis.py)
    - Communicate with RigolDS1054Z (rigol_ds1054z.py)
    - Analysis of Riot Boards for Cortex-M CPUs (riot_board_analysis.ipynb)

- Data: (Data/)
    - Compiled BEEBS source code for static analysis (assembler_code/)
    - Configuration json files for benchmarks (json_config_files/)
    - Measured Task Characterization Results, Energy Results, Delay Results (results/)

- Scripts: (Scripts/)
    - Start experiment (Experiment/)
    - Plot data with pickle (Plots/)

## Links:
- BEEBS patches-for-riot - [https://github.com/aco401/beebs/tree/patches-for-riot]
- Riot Beebs pkg - [https://github.com/aco401/RIOT/tree/feature-beebs]

- Riot Fork on `clock_config_clean_task_characterization` branch (RiotClockConf/) [https://github.com/MichelRottleuthner/RiotClockConf/tree/clock_config_clean_task_characterization]
