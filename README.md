# Appendix of bachelor thesis on topic: Design and Evaluation of a Task Characterization Model for Performance Control of Embedded Devices at Runtime

Author: Tobias Westphal
Email: tobias.westphal@haw-hamburg.de

This repository contains source code, scripts and data that has been created alongside the work.

This repository lists:
- Riot Fork with ScaleClock implementation containing: {µC} (Riot/)
    - Implementation of task characterization model with Nucleo-l476RG board (drivers/armv7m_dbg_task_characterization)
    - Task Benchmark Utility to
        - trace workloads with the task characterization model (tests/gclk/profiling_counter_bench.c & tests/gclk/workloads.c)
        - start energy measurements (tests/gclk/profiling_counter_bench.c)
        - measure the delay of the trace utlity and perform TPIU configuration tests (tests/oszilloscope-and-tests/)
    - Set of tasks to evaluate the task characterization model with (pkg/beebs/)

- Measurement Scripts: {PC} (Measurement_Utils/)
    - Experiment Utility - start automated task characterization, energy or delay experiments and save data to pickle of DataFrame (experiment_to_pickle.py)
    - Data Processing - Merge data pickles for easier plotting (pickle_merge.py)
    - Data Visualization - Plot DataFrames from pickles (pickle_to_plot.py)
    - Data Conversion - Convert CSV Data of the USART communication with board to pickle of DataFrame (csv_to_pickle.py)

    - Static Analysis of assembler files (assembler_stat_analysis.py)
    - Communicate with RigolDS1054Z (rigol_ds1054z.py)
    - Analysis of Riot Boards for Cortex-M CPUs (riot_board_analysis.ipynb)

- Data: (Data/)
    - Compiled beebs source code for static analysis (assembler_code/)
    - Configuration json files for benchmarks (json_config_files/)
    - Measured Task Characterization Results, Energy Results, Delay Results (results/)

- Scripts:
    - Start experiment
    - Plot Data with pickle