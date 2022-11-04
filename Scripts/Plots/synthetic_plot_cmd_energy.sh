# lineplot_seperated_energy_lvpol_tci ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/energy/tci.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:0  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp storage:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV -pfs 12 4 -yal "CPU Frequency [MHz]" -xal "" "Energy Consumption / Energy Consumption (80MHz)" -ccm storage:operation:DVS_POL:FREQ -ce storage:operation:DVS_POL:FREQ -repst ENERGY_TOTAL storage:operation:DVS_POL:FREQ -do CURR_SAMPLES storage:operation:DVS_POL:FREQ -sg 1 3 -legap 2 -agr both both both -ltl "Access Type" "Operation Type" -ccl


# lineplot_seperated_energy_ffpol_tci ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/energy/tci.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:1  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp storage:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV -pfs 12 4 -yal "CPU Frequency [MHz]" -xal "" "Energy Consumption / Energy Consumption (80MHz)"  -ccm storage:operation:DVS_POL:FREQ -ce storage:operation:DVS_POL:FREQ -repst ENERGY_TOTAL storage:operation:DVS_POL:FREQ -do CURR_SAMPLES storage:operation:DVS_POL:FREQ -sg 1 3 -legap 2 -agr both both both -ltl "Access Type" "Operation Type" -ccl 


# lineplot_seperated_energy_ffpol_tci_fl_arithmetic
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/energy/tci_benchmark_merge.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:1 storage:0 -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation:BENCH -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp BENCH:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV BENCH?tci_float:FLOAT?tci_double:DOUBLE -pfs 12 4 -yal "CPU Frequency [MHz]" -xal "Energy Consumption / Energy Consumption (80MHz)" "Energy Consumption / Energy Consumption (80MHz)" -sg 1 2 -legap 1 -agr both both -ltl "Variable Type" "Operation Type" legl 1.01:0.8 -ccl 


# lineplot_energy_sleep ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/energy/sleep.pkl -bm energy_bench -ucol DVS_POL -col ENERGY_TOTAL_REP_MEAN_PROP_DIV -prop div ENERGY_TOTAL_REP_MEAN  FREQ:80000000 DVS_POL -idx FREQ -lp DVS_POL -pfs 5 3 -xal "CPU Frequency [MHz]" -yal "Energy Consumption / Energy Consumption (80MHz)" -cl DVS_POL?0:LOW_VOLTAGE?1:FAST_FLASH -ltl "DVS Policy" -ccm DVS_POL:FREQ -ce DVS_POL:FREQ -repst ENERGY_TOTAL DVS_POL:FREQ -do CURR_SAMPLES DVS_POL:FREQ -agr both -ccl 

