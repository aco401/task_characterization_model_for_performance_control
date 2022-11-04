# BEEBS HISTOGRAMS

# histogram_beebs_80MHz_CNTNORM
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench  -hist 50 0 CNT_TYPE -fs FREQ:80000000  -col CNT_NORM -fr CNT_TYPE:0  -sg 2 4 -xal "Profiling Counter / Cycles" "Profiling Counter / Cycles" "Profiling Counter / Cycles" "Profiling Counter / Cycles" "Profiling Counter / Cycles" "Profiling Counter / Cycles" "Profiling Counter / Cycles" -yal "FREQUENCIES" "" "" "" "FREQUENCIES" "" ""

# scatterplot_beebs_time_proportion
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp DVS_POL:FREQ -fs CNT_TYPE:0 -col TIME_SAMPLED_PROP_DIV  -idx BENCH  --ordering Scripts/Plots/energy_order.json -prop div TIME_SAMPLED FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL -sg 2 1 -xatr 0 90 -agr both both -ccl -swap -legl 1.01:0. 1.01:0.6 -sgsa x -ltl "DVS policy"  "CPU Frequency [MHz]" -xal "Taskname" -yal "Execution Time / Execution Time (80 MHZ)" "Execution Time / Execution Time (80 MHZ)" -xam 0.01 -rgbp -puco y?b?r?g?purple

# scatterplot_beebs_CNT_STD_PROP
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp CNT_TYPE:FREQ -cc CNT_STD_PROP_MEAN CNT_REP_STD CNT_REP_MEAN div -col CNT_STD_PROP_MEAN  -idx BENCH -fr CNT_TYPE:0  -yal "Counter Standard Deviation / Counter Mean" -ltl "CNT_TYPE" "CPU Frequency [MHz]" -xal "Taskname" -ccl --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -pfs 15 6 -xam 0.01 -als 10

# scatterplot_CNT_STD
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp CNT_TYPE:FREQ -col CNT_REP_STD  -idx BENCH -fr CNT_TYPE:0  -yal "CNT_STD / CNT_MEAN" -ltl "CNT_TYPE" "CPU Frequency [MHz]" -xal "Taskname" -ccl --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -pfs 15 6 -xam 0.01 0.01

# barplot_beebs_cycles_per_iterations
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 -fs CNT_TYPE:0 DVS_POL:1 FREQ:80000000  -cc CYC_PROP_ITERATIONS CYC_DIFF ITERATIONS div -col CYC_PROP_ITERATIONS -agr y -idx BENCH -xatr 90 -xal "Taskname" --sort CYC_PROP_ITERATIONS -aysc log -yal "CYCLES / ITERATIONS" -legr 0 -pfs 15 6 -als 12

# barplot_beebs_cycles_per_iterations_ordered
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 -fs CNT_TYPE:0 DVS_POL:1 FREQ:80000000  -cc CYC_PROP_ITERATIONS CYC_DIFF ITERATIONS div -col CYC_PROP_ITERATIONS  -idx BENCH -xatr 90 --sort CYC_PROP_ITERATIONS -aysc log -yal "CYCLES / ITERATIONS" -legr 0 --ordering Scripts/Plots/energy_order.json -xal "Taskname" -agr y -pfs 15 6 -als 12

# barplot_beebs_time_per_iteration
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 -fs CNT_TYPE:0 DVS_POL:1 FREQ:80000000  -cc TIME_PROP_ITERATIONS TIME_SAMPLED ITERATIONS div -col TIME_PROP_ITERATIONS -agr y -idx BENCH -xatr 90 --sort TIME_PROP_ITERATIONS -xal "Taskname" -aysc log -yal "Execution Time [s] / ITERATIONS" -legr 0 -pfs 15 6 -saco -als 12

# barplot_beebs_cnt_norm_all
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0:3:4 -fs  FREQ:80000000 DVS_POL:1 -col CNT_NORM -idx BENCH  --ordering Scripts/Plots/energy_order.json -sg 5 1 -sgsa x -xatr 0 0 0 0 90 -ccl -yal "" "" "Profiling Counter / Cycles" "" "" -yalim 0:0.5500 0:0.1000 0:0.5500 0:0.0400 0:0.0400 -agr both both both both both -xal "Taskname" -pfs 15 17

# barplot_beebs_cnt_norm_prf
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0 -fs  FREQ:80000000 DVS_POL:1 CNT_TYPE{6 -col CNT_NORM -idx BENCH  --ordering Scripts/Plots/energy_order.json -sg 5 1 -sgsa x -xatr 0 0 0 0  90 -ccl -yal "" "" "Profiling Counter / Cycles" "" "" -yalim 0:0.5500 0:0.1000 0:0.5500 -xal "Taskname" -agr both both both both both

# CPI_CORRELATION_TO_SAVED_CYCLES
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:5 -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL --ordering Scripts/Plots/energy_order.json -corrref CNT_NORM:CYC_DIFF_PROP_DIV FREQ FREQ:80000000

# CPI_MEAN_right_most_group
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:5 FREQ:80000000 -bs BCC 1 --ordering Scripts/Plots/energy_order.json -stat None -col CNT_NORM

# CPI_MEAN_left_most_group
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:5 FREQ:80000000 -bs BCC 0 --ordering Scripts/Plots/energy_order.json -stat None -col CNT_NORM

# barplot_beebs_cnt_norm_prf_sleep_ex
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0 -fs  FREQ:80000000 DVS_POL:1 CNT_TYPE:3:4 -col CNT_NORM -idx BENCH  --ordering Scripts/Plots/energy_order.json -sg 2 1 -sgsa x -xatr 0 90 -ccl -yal "Profiling Counter / Cycles" "Profiling Counter / Cycles" -yalim 0:0.0100 0:0.0100 -xal "Taskname" -agr both both -pfs 15 6
# barplot_beebs_cnt_norm_prf_lsu_cpi_fold
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0 -fs  FREQ:80000000 DVS_POL:1 CNT_TYPE:1:2:5 -col CNT_NORM -idx BENCH  --ordering Scripts/Plots/energy_order.json -sg 3 1 -sgsa x -xatr 0 0 90 -ccl -yal "Profiling Counter / Cycles" "Profiling Counter / Cycles" "Profiling Counter / Cycles" -yalim 0:0.5500 0:0.1000 0:0.5500 -agr both both both -xal "" "" "Taskname"

# barplot_beebs_cnt_norm_prf_lsu_cpi_fold_sub_freq
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0 -fs  FREQ:80000000:13333333 DVS_POL:1 CNT_TYPE:1:2:5 -col CNT_NORM_PROP_SUB -idx BENCH  --ordering Scripts/Plots/energy_order.json -sg 3 1 -sgsa x -xatr 0 0 90 -ccl -yal "Profiling Counter / Cycles" "Profiling Counter / Cycles" "Profiling Counter / Cycles" -agr both both both -prop sub CNT_NORM FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL -fsp FREQ:13333333 -xal "Taskname"

# barplot_beebs_cnt_norm_comp
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0 -fs  FREQ:80000000 DVS_POL:1 CNT_TYPE}6 -col CNT_NORM -idx BENCH  --ordering Scripts/Plots/energy_order.json -sg 2 1 -sgsa x -xatr 0 90 -ccl -yal "Comparator Counter / Cycles" "Comparator Counter / Cycles" "" -yalim 0:0.0400 0:0.0400 -agr both both -csc2 CNT_REP_STD 8.25 div CNT_STD_NORM -cc CNT_STD_NORM CNT_STD_NORM CYC_DIFF div -xal "" "Taskname" -errcol CNT_STD_NORM

# barplot_beebs_cnt_norm_comp_sub_freq
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0 -fs  FREQ:80000000:13333333 DVS_POL:1 CNT_TYPE}6 -col CNT_NORM_PROP_SUB -idx BENCH  --ordering Scripts/Plots/energy_order.json -sg 2 1 -sgsa x -xatr 0 90 -ccl -yal "" "Comparator Counter Difference / Cycles" "" -yalim 0:0.0400 0:0.0400 -agr both both -csc2 CNT_REP_STD 8.25 div CNT_STD_NORM -cc CNT_STD_NORM CNT_STD_NORM CYC_DIFF div -errcol CNT_STD_NORM -prop sub CNT_NORM FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL -fsp FREQ:13333333 -xal "" "Taskname" -pfs 15 6 -als 12 

# barplot_beebs_cnt_norm_comp_flash
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0 -fs  FREQ:80000000 DVS_POL:1 CNT_TYPE:100 -col CNT_NORM -idx BENCH  --ordering Scripts/Plots/energy_order.json -xatr 90 -ccl -yal "Comparator Counter / Cycles" "" "" -yalim 0:0.0400 0:0.0400 -agr both both -csc2 CNT_REP_STD 8.25 div CNT_STD_NORM -cc CNT_STD_NORM CNT_STD_NORM CYC_DIFF div -errcol CNT_STD_NORM -pfs 15 4 -xal "Taskname" -xatt -als 12

# scatterplot_beebs_cycles_saved
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp FREQ -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:1 -col CYC_DIFF_PROP_DIV -fsp FREQ{80000000 -idx BENCH -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -yal "Cycles / Cycles (80MHz)" -xal "Taskname" -ltl "CPU Frequency [MHz]" -pfs 15 6 -xam 0.01 -ccl -legl 0.86:0.01 -als 12 -puco r?g?b?y?purple

# scatterplot_beebs_cycles_saved_correlation
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:1 -fsp FREQ{80000000 -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL --ordering Scripts/Plots/energy_order.json -corr ENERGY_TOTAL_REP_MEAN_PROP_DIV:CYC_DIFF_PROP_DIV FREQ

# scatterplot_beebs_nocache_cycles_saved
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_cache/benchmark_merge.pkl -bm swo_bench -scp FREQ -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:100 -col CYC_DIFF_PROP_DIV -fsp FREQ{80000000 -idx BENCH -prop div CYC_DIFF FREQ:80000000 BENCH --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -yal "Cycles / Cycles (80MHz)" -xal "Taskname" -ltl "CPU Frequency [MHz]" -xam 0.01 -als 12

# scatterplot_beebs_noinstructioncache_cycles_saved
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_cache/swo_flash_separately_disabled/benchmark_merge.pkl -bm swo_bench -scp FREQ -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:100 FLASH_CACHE:2 -col CYC_DIFF_PROP_DIV -fsp FREQ{80000000 -idx BENCH -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -yal "Cycles / Cycles (80MHz)" -xal "Taskname" -ltl "CPU Frequency [MHz]" -xam 0.01

# scatterplot_beebs_nodatacache_cycles_saved
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_cache/swo_flash_separately_disabled/benchmark_merge.pkl -bm swo_bench -scp FREQ -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:100 FLASH_CACHE:1 -col CYC_DIFF_PROP_DIV -fsp FREQ{80000000 -idx BENCH -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -yal "Cycles / Cycles (80MHz)" -xal "Taskname" -ltl "CPU Frequency [MHz]" -pfs 15 6 -xam 0.01

# scatterplot_beebs_nodatacache_cycles_saved_compare
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_cache/swo_flash_separately_disabled/benchmark_merge_mixed.pkl -bm swo_bench -scp FLASH_CACHE -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:100 FLASH_CACHE:1:3 -fsp FREQ:13333333 -col CYC_DIFF_PROP_DIV -idx BENCH -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -yal "Cycles (13MHz) / Cycles (80MHz)" -xal "Taskname" -ltl "Flash Data Cache State" -pfs 15 6 -ccl -xam 0.01 -cl FLASH_CACHE?INSTRUCTION_FLASH_CACHE_ENABLED:"Disabled"?DATA_INSTRUCTION_FLASH_CACHE_ENABLED:"Enabled" -als 12 

# scatterplot_beebs_noinstructioncache_cycles_saved_compare
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_cache/swo_flash_separately_disabled/benchmark_merge_mixed.pkl -bm swo_bench -scp FLASH_CACHE -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:100 FLASH_CACHE:2:3 -fsp FREQ:13333333 -col CYC_DIFF_PROP_DIV -idx BENCH -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -yal "Cycles / Cycles (80MHz)" -xal "Taskname" -ltl "Flash Cache Status" -pfs 15 6 -ccl -xam 0.01


# scatterplot_beebs_nofwsa_cycles_saved
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_fwsa/benchmark_merge.pkl -bm swo_bench -scp FREQ -fr CNT_TYPE:0 -fs DVS_POL:1 CNT_TYPE:100 -col CYC_DIFF_PROP_DIV -fsp FREQ{80000000 -idx BENCH -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both -yal "Cycles / Cycles (80MHz)" -xal "Taskname" -ltl "CPU Frequency [MHz]" -pfs 15 6 -xam 0.01 -ccl

# barplot_beebs_cycles_per_instructions_ordered
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 -fs DVS_POL:1 FREQ:80000000 -col CNT_NORM -fsp CNT_TYPE:INSTRUCTIONS  -idx BENCH -xatr 90 --ordering Scripts/Plots/energy_order.json -agr y -pcc DVS_POL:FREQ:BENCH 0 -legr 0 -xal "Taskname" -yal "Cycles / Instructions" -saco -pfs 15 6 

# barplot_beebs_cycles_per_instructions_ordered - CORRELATION
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fs DVS_POL:1  -col CNT_NORM -fsp CNT_TYPE:INSTRUCTIONS  -idx BENCH -xatr 90 --ordering Scripts/Plots/energy_order.json -agr y -pcc DVS_POL:FREQ:BENCH 0 -legr 0 -xal "Taskname" -yal "Cycles / Instructions" -saco -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL -corrref CNT_NORM:CYC_DIFF_PROP_DIV FREQ FREQ:80000000 -bs BCC 1


# barplot_beebs_cycles_per_instructions_ordered - STATS
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fs DVS_POL:1  -col CNT_NORM -fsp CNT_TYPE:INSTRUCTIONS FREQ:80000000  -idx BENCH -xatr 90 --ordering Scripts/Plots/energy_order.json -agr y -pcc DVS_POL:FREQ:BENCH 0 -legr 0 -xal "Taskname" -yal "Cycles / Instructions" -saco -prop div CYC_DIFF FREQ:80000000 BENCH:CNT_TYPE:FLASH_CACHE:DVS_POL -stat None -bs BCC 1

# barplot_beebs_cycles_per_instructions_non_cpi_ordered
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 -fs DVS_POL:1 FREQ:80000000 -col CNT_NORM -fsp CNT_TYPE:INSTRUCTIONS_NON_CPI  -idx BENCH -xatr 90 --ordering Scripts/Plots/energy_order.json -agr y -pcc DVS_POL:FREQ:BENCH 1 -legr 0 -xal "Taskname" -yal "Cycles / Instructions" -saco -pfs 15 6

# barplot_beebs_lsu_non_ram_ordered
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 -fs DVS_POL:1 FREQ:80000000 -col CNT_NORM -fsp CNT_TYPE:LSU_SUB_RAM  -idx BENCH -xatr 90 --ordering Scripts/Plots/energy_order.json -agr y -pcc DVS_POL:FREQ:BENCH 2 -legr 0 -xal "Taskname" -yal "NCC" -saco -pfs 15 6

# barplot_beebs_assembler_instructions
python3 Measurement_Utils/pickle_to_plot.py -p Data/assembler_code/assembler_benchmark_merge.pkl -bm assembler_bench -col INSTRUCTION_LEN -idx BENCH --ordering Scripts/Plots/energy_order.json -bap 0 -pfs 15 6 -saco -xatr 90 -agr both -yal "Instruction Amount [#]" -xal "Taskname" -legr 0 -als 12 

# barplot_beebs_assembler_float_double
python3 Measurement_Utils/pickle_to_plot.py -p Data/assembler_code/assembler_benchmark_merge.pkl -bm assembler_bench -col FLOATING_VALUE -idx BENCH --ordering Scripts/Plots/energy_order.json -bap 1 FLOATING_TYPE -pfs 15 6 -saco -xatr 90 -agr both -yal "Instruction Amount [#]" -xal "Taskname" -mlt FLOAT_LEN:DOUBLE_LEN FLOATING -cl FLOATING_TYPE?DOUBLE_LEN:DOUBLE?FLOAT_LEN:FLOAT -als 12

# barplot_beebs_assembler_word
python3 Measurement_Utils/pickle_to_plot.py -p Data/assembler_code/assembler_benchmark_merge.pkl -bm assembler_bench -col WORD_LEN -idx BENCH --ordering Scripts/Plots/energy_order.json -bap 0 -pfs 15 6 -saco -xatr 90 -agr both -yal "Data Word Amount [#]" -legr 0 -xal "Taskname" -als 12

# barplot_beebs_cnt_norm_prf_lsu_cpi_less_20
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap 1 CNT_TYPE -fr CNT_TYPE:0 -fs  FREQ:80000000 DVS_POL:1 CNT_TYPE:2:5 CNT_NORM{0.2000 -col CNT_NORM -idx BENCH  --ordering Scripts/Plots/energy_order.json -sg 2 1 -sgsa x -xatr 0 90 -ccl -yal "Profiling Counter / Cycles" -yalim 0:0.5500 0:0.5500 -agr both both -fsgl BENCH 2  -pfs 10 5 -xal "" "Taskname"

# barplot_beebs_cnt_norm_prf_lsu_cache_diff_3_1
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_cache/swo_lsu_separately_disabled/benchmark_merge.pkl -bm swo_bench -bap 0 CNT_TYPE -fs  FREQ:80000000 DVS_POL:1 CNT_TYPE:2 FLASH_CACHE:3:1 -col CNT_NORM -idx BENCH  --ordering Scripts/Plots/energy_order.json -xatr 90 -ccl -yal "Profiling Counter / Cycles" -agr both both both -xal "Taskname" -ro CNT_NORM BENCH diff FLASH_CACHE:3:1 DIFF_LSU -fsp FLASH_CACHE:DIFF_LSU -pfs 15 6 


# scatterplot_beebs_cycles_calc_from_cycles_2_points
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench  -col CNT_NORM -efc2f DVS_POL:BENCH:CNT_TYPE 4:3 0 -scp FREQ -fsp CNT_TYPE:INSTRUCTIONS -col CYC_DIFF_CALC_PROP_DIV  -idx BENCH --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both both -ccl -xal "Taskname" -yal "Calculated Cycles / Cycles (80MHz)" -legl 0.85:0.1 -pcc DVS_POL:FREQ:BENCH 0 -xam 0.01 -ltl "CPU Frequency [MHz]" -puco y?g?r?b?purple -prop4 div CYC_DIFF_CALC FREQ:80000000 CNT_TYPE:DVS_POL:BENCH -fs DVS_POL:1 -pfs 15 6 -als 12