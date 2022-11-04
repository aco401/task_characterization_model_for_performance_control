# scatterplot_beebs_energy_proportion
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp DVS_POL:FREQ -fs CNT_TYPE:0 -col ENERGY_TOTAL_REP_MEAN_PROP_DIV  -idx BENCH -sg 2 1 -xatr 0 90 -agr both both -ccl -swap -legl 0.01:0.7 0.85:0.01 -sgsa x -ltl "DVS Policy"  "CPU Frequency [MHz]" -xal "" "Taskname" -yal "" "Energy Consumption / Energy Consumption (80MHz)" --sort DVS_POL:ENERGY_PROP_GROUP_MIN:ENERGY_PROP_GROUP_MAX 0:1:1 -ccpg ENERGY_PROP_GROUP_MIN:ENERGY_PROP_GROUP_MAX ENERGY_TOTAL_REP_MEAN_PROP_DIV:ENERGY_TOTAL_REP_MEAN_PROP_DIV DVS_POL:BENCH min:max --ordering-display -legl 0.01:0.7 0.82:0.02 -xam 0.01 # --save PATH_OF_YOUR_CHOICE NAME_OF_YOUR_CHOICE

# scatterplot_beebs_nofwsa_energy_proportion
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_fwsa/benchmark_merge.pkl -bm swo_bench -scp DVS_POL:FREQ -fs CNT_TYPE:100 -col ENERGY_TOTAL_REP_MEAN_PROP_DIV  -idx BENCH -sg 2 1 -xatr 0 90 -agr both both -ccl -swap -legl 1.01:0.7 1.01:0.02 -sgsa x -ltl "DVS Policy"  "CPU Frequency [MHz]" -xal "" "Taskname" -yal "" "Energy Consumption / Energy Consumption (80MHz)" --sort DVS_POL:ENERGY_PROP_GROUP_MIN:ENERGY_PROP_GROUP_MAX 0:1:1 -ccpg ENERGY_PROP_GROUP_MIN:ENERGY_PROP_GROUP_MAX ENERGY_TOTAL_REP_MEAN_PROP_DIV:ENERGY_TOTAL_REP_MEAN_PROP_DIV DVS_POL:BENCH min:max --ordering Scripts/Plots/energy_order.json  --ordering-display -xam 0.01

# scatterplot_beebs_nocache_energy_proportion
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/no_cache/benchmark_merge.pkl -bm swo_bench -scp DVS_POL:FREQ -fs CNT_TYPE:100 -col ENERGY_TOTAL_REP_MEAN_PROP_DIV  -idx BENCH -sg 2 1 -xatr 0 90 -agr both both -ccl -swap -legl 0.01:0.7 0.85:0.01 -sgsa x -ltl "DVS Policy"  "CPU Frequency [MHz]" -xal "" "Taskname" -yal "" "Energy Consumption / Energy Consumption (80MHz)" --sort DVS_POL:ENERGY_PROP_GROUP_MIN:ENERGY_PROP_GROUP_MAX 0:1:1 -ccpg ENERGY_PROP_GROUP_MIN:ENERGY_PROP_GROUP_MAX ENERGY_TOTAL_REP_MEAN_PROP_DIV:ENERGY_TOTAL_REP_MEAN_PROP_DIV DVS_POL:BENCH min:max --ordering Scripts/Plots/energy_order.json  --ordering-display -xam 0.01 


# Odering 

# barplot_beebs_power_80mhz
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -bap DVS_POL -fr CNT_TYPE:0 -fs CNT_TYPE:1 FREQ:80000000 -col POWER_REP_MEAN  -idx BENCH -xatr 0 90 -agr both both -swap -ccl -yal "Power Consumption [mW]" -ltl "DVS Policy" "CPU Frequency [MHz]" -xatr 90 -xal "Taskname" --sort POWER_REP_MEAN:DVS_POL -csc3 POWER_REP_MEAN 1000 mul POWER_REP_MEAN 

# scatterplot_beebs_power_max
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp DVS_POL:FREQ -fr CNT_TYPE:0 -fs CNT_TYPE:1 -col CURR_MAX  -idx BENCH -xatr 0 90 -agr both both -swap -ccl -yal "Power Consumption [mW]" -ltl "DVS Policy" "CPU Frequency [MHz]" -xatr 90 --sort CURR_MIN:DVS_POL 0:0 -ccpg POWER_REP_MEAN_MAX POWER_REP_MEAN DVS_POL:BENCH max -csc CURR_MAX 3.3 mul

# scatterplot_beebs_power
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp DVS_POL:FREQ -fr CNT_TYPE:0 -fs CNT_TYPE:1 -col POWER_REP_MEAN  -idx BENCH -xatr 0 90 -agr both both -swap -ccl -yal "Power Consumption [mW]" -ltl "DVS Policy" "CPU Frequency [MHz]" -xatr 90 --sort POWER_REP_MEAN_MAX:DVS_POL 0:0 -ccpg POWER_REP_MEAN_MAX POWER_REP_MEAN DVS_POL:BENCH max -xal "Taskname" -csc3 POWER_REP_MEAN 1000 mul POWER_REP_MEAN -xam 0.01 -legl 0.2:0.87 

# scatterplot_beebs_power_ordered
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp DVS_POL:FREQ -fr CNT_TYPE:0 -fs CNT_TYPE:1 -col POWER_REP_MEAN  -idx BENCH -xatr 0 90 -agr both both -swap -ccl -yal "Power Consumption [mW]" -ltl "DVS Policy" "CPU Frequency [MHz]" -xatr 90 --ordering Scripts/Plots/energy_order.json -csc3 POWER_REP_MEAN 1000 mul POWER_REP_MEAN -xam 0.01 

# scatterplot_beebs_power_proportion_ordered
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -scp DVS_POL:FREQ -fr CNT_TYPE:0 -fs CNT_TYPE:1 -col POWER_REP_MEAN_PROP_DIV  -idx BENCH -prop div POWER_REP_MEAN FREQ:80000000 DVS_POL:BENCH -xatr 0 90 -agr both both -swap -ccl -yal "Power Consumption [mW]" -ltl "DVS Policy" "CPU Frequency [MHz]" -xatr 90 --ordering Scripts/Plots/energy_order.json -csc3 POWER_REP_MEAN 1000 mul POWER_REP_MEAN 

# scatterplot_beebs_power_freqmean
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fr CNT_TYPE:0 -fs CNT_TYPE:1 -col POWER_REP_MEAN_REP_MEAN  -idx FREQ -xatr 0 90 -agr both both -ccl -yal "Power Consumption [mW]" -ltl "DVS Policy" "CPU Frequency [MHz]" -xatr 90 -csc3 POWER_REP_MEAN_REP_MEAN 1000 mul POWER_REP_MEAN_REP_MEAN -repst2 POWER_REP_MEAN FREQ:DVS_POL 0 -scp DVS_POL -pfs 10 4 -yalim 0:50 

# scatterplot_beebs_power_freqmean_extrapolate
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fr CNT_TYPE:0 -fs CNT_TYPE:1 DVS_POL:1 -col POWER_REP_MEAN_REP_MEAN  -idx FREQ -xatr 0 90 -agr both both -yal "Power Consumption [mW]" -xatr 90 -ltl "Power Consumption" -repst2 POWER_REP_MEAN FREQ:DVS_POL 0 -expo 0 None 1 "Extrapolated":"Measured Average"  -csc3 POWER_REP_MEAN_REP_MEAN 1000 mul POWER_REP_MEAN_REP_MEAN -pub EXPO_STAT -xal "CPU Frequency [HZ]" -pfs 10 4 

# extrapolate_stat_power
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fr CNT_TYPE:0 -fs CNT_TYPE:1 -col POWER_REP_MEAN_REP_MEAN  -idx FREQ -xatr 0 90 -agr both both -ccl -yal "Power Consumption [mW]" -ltl "DVS Policy" "CPU Frequency [Hz]" -xatr 90  -repst2 POWER_REP_MEAN FREQ:DVS_POL 0 -expo 0 DVS_POL 0 -csc3 POWER_REP_MEAN_REP_MEAN 1000 mul POWER_REP_MEAN_REP_MEAN

# scatterplot_beebs_energy_calc_from_cycles_2_points
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fs DVS_POL:1 -col CNT_NORM -efc2f DVS_POL:BENCH:CNT_TYPE 4:0 0 -scp FREQ -fsp CNT_TYPE:INSTRUCTIONS -col ENERGY_TOTAL_CALC_PROP_DIV  -idx BENCH --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both both -ccl -xal "Taskname" -yal "EEP" -legl 0.85:0.01 -pcc DVS_POL:FREQ:BENCH 0 -xam 0.01 -ltl "CPU Frequency [MHz]" -puco b?g?r?y?purple -pfs 15 6 -als 13  

# scatterplot_beebs_energy_calc_from_cycles_measured
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench  -col CNT_NORM -efc DVS_POL:BENCH:CNT_TYPE -scp DVS_POL:FREQ -fsp CNT_TYPE:INSTRUCTIONS -col ENERGY_TOTAL_CALC_PROP_DIV  -idx BENCH --ordering Scripts/Plots/energy_order.json -sg 2 1 -xatr 0 90 -agr both both -ccl -swap -sgsa x -xal "" "Taskname" -yal "ENERGY CALC / ENERGY CALC (80MHz)" -legl 1:0.7 1:0.3 -pcc DVS_POL:FREQ:BENCH 0 -xam 0.01

# scatterplot_beebs_energy_calc_from_flash
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -eff DVS_POL:BENCH -scp DVS_POL:FREQ -fsp CNT_TYPE:100 -col ENERGY_TOTAL_FLASH_CALC_PROP_DIV  -idx BENCH --ordering Scripts/Plots/energy_order.json -sg 2 1 -xatr 0 90 -agr both both -ccl -swap -sgsa x -xal "" "Taskname" -yal "ENERGY CALC / ENERGY CALC (80MHz)" -legl 1:0.7 1:0.3 

# AlphaC Mean
#python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fs DVS_POL:1 -col CNT_NORM -fsp CNT_TYPE:0 -col ALPHAC_CALC_REP_MEAN  -idx BENCH --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both both -ccl -xal "" "Taskname" -yal "" "CALCULATED ENERGY / CALCULATED ENERGY (80MHz)" -legl 0.85:0.01 -xam 0.01 -ltl "CPU Frequency [MHz]" -puco y?g?r?b?purple -pfs 15 6 -als 13 -cac -repst2 ALPHAC_CALC BENCH:CNT_TYPE 0 -stat None

# scatterplot_beebs_alphaC
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/beebs/benchmark_merge.pkl -bm swo_bench -fs DVS_POL:1 -col CNT_NORM -fsp CNT_TYPE:0 -col ALPHAC_CALC  -idx BENCH --ordering Scripts/Plots/energy_order.json -xatr 90 -agr both both -ccl -xal "Taskname" -yal "alphaC [#]" -legl 0.85:0.01 -xam 0.01 -ltl "CPU Frequency [MHz]" -puco y?g?r?b?purple -pfs 15 6 -als 13 -cac -scp FREQ -legl 1.01:0.05 