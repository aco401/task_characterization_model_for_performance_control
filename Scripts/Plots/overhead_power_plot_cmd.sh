# barplot_overhead_energy_phases
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_phases.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -prop sub CURR_MEAN_REP_MEAN swo_mode:0 work_mode:FREQ:DVS_POL -prop2 div CURR_MEAN_REP_MEAN_PROP_SUB swo_mode:1 work_mode:FREQ:DVS_POL -col CURR_MEAN_REP_MEAN_PROP_SUB_PROP_DIV -idx work_mode -bap 1 swo_mode -fs DVS_POL:1 FREQ:80000000 -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP swo_mode?0:REF?1:TRACE_NO_SWO?2:TRACE_NO_TIMCNT?3:TRACE -xal "Workload" -yal "POWER IN PROPORTION TO POWER OF TRACE_NO_SWO" -frp swo_mode:0 -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ltl "TRACE TYPE" -als 13 --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_phases

# barplot_overhead_energy_stat_dyn
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_basic.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -fs swo_mode:0:1:2:3:9 FREQ:80000000 DVS_POL:1 -prop sub CURR_MEAN_REP_MEAN swo_mode:0 work_mode:FREQ:DVS_POL -col CURR_MEAN_REP_MEAN_PROP_SUB -idx work_mode -bap 1 swo_mode -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP swo_mode?0:REF?1:CYC?2:LSU?3:CPI?9:COMP_DATA_FLASH  -xal "Workload" -yal "OVERHEAD POWER [mW]" -frp swo_mode:0 -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -csc CURR_MEAN 1000 mul -csc3 CURR_MEAN_REP_MEAN_PROP_SUB:CURR_MEAN_REP_STD 3.3 mul CURR_MEAN_REP_MEAN_PROP_SUB:CURR_MEAN_REP_STD -errcol CURR_MEAN_REP_STD -ltl "CNT TYPE" -als 13 --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_stat_dyn

# barplot_overhead_energy_stat_dyn_cnt_norm
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_basic.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -fs swo_mode:0:1:2:3:9 FREQ:80000000 DVS_POL:1 -fsp swo_mode:1 -prop sub CURR_MEAN_REP_MEAN swo_mode:0 work_mode:FREQ:DVS_POL -col CNT_NORM -idx work_mode -bap 1 CNT_TYPE -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP swo_mode?0:REF?1:TRACE_CYC?2:TRACE_LSU?3:TRACE_CPI?9:TRACE_COMP_FLASH  -xal "Workload" -yal "NORMALIZED CNT" -frp swo_mode:0 -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -csc CURR_MEAN 1000 mul -mwd work_mode:CNT_TYPE:CNT_NORM 0:0:0.2499 1:0:0.2499 2:0:0.2499 0:2:0.2842 1:2:0 2:2:0 0:5:0.0886 1:5:0.7530 2:5:0 0:100:0.0275 1:100:0 2:100:0 -ccl -ltl "CNT TYPE" --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_stat_dyn_cnt_norm

# barplot_overhead_energy_stat_dyn_raw
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_basic.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -fs swo_mode:0:1:2:3:9 FREQ:80000000 DVS_POL:1 -fsp swo_mode:1 -prop sub CURR_MEAN_REP_MEAN swo_mode:0 work_mode:FREQ:DVS_POL -col CNT_NORM -idx work_mode -bap 1 CNT_TYPE -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP swo_mode?0:REF?1:TRACE_CYC?2:TRACE_LSU?3:TRACE_CPI?9:TRACE_COMP_FLASH  -xal "Workload" -yal "CNT [#]" -frp swo_mode:0 -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -csc CURR_MEAN 1000 mul -mwd work_mode:CNT_TYPE:CNT_NORM 0:0:290040 1:0:423310 2:0:39095 0:2:324220 1:2:0 2:2:125 0:5:103515 1:5:1273330 2:5:40 0:100:7577656 1:100:179 2:100:543 -ccl -ltl "CNT TYPE" -als 13 --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_stat_dyn_cnt_raw

# barplot_overhead_energy_compflash_freq
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_basic.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -fs swo_mode:0:9 DVS_POL:1 -prop sub CURR_MEAN_REP_MEAN swo_mode:0 work_mode:FREQ:DVS_POL -col CURR_MEAN_REP_MEAN_PROP_SUB -idx work_mode -bap 1 FREQ -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP swo_mode?0:REF?1:TRACE_CYC?2:TRACE_LSU?3:TRACE_CPI?9:TRACE_COMP_FLASH  -xal "Workload" -yal "OVERHEAD POWER [mW]" -frp swo_mode:0 -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -csc CURR_MEAN 1000 mul -csc3 CURR_MEAN_REP_MEAN_PROP_SUB:CURR_MEAN_REP_STD 3.3 mul CURR_MEAN_REP_MEAN_PROP_SUB:CURR_MEAN_REP_STD -errcol CURR_MEAN_REP_STD -ltl "CPU FREQUENCY [MHz]" -ccl -als 13 --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_compflash_freq

# # barplot_overhead_energy_trace_init
# python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_basic.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -fs swo_mode:0:6:3:9 FREQ:80000000 DVS_POL:1 -col CURR_MEAN_REP_MEAN -idx work_mode -bap 1 swo_mode -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP swo_mode?0:REF?6:TRACE_INIT?3:TRACE_CPI?9:TRACE_COMP_FLASH  -xal "Workload" -yal "MEASURED CURRENT [mA]" -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -csc CURR_MEAN 1000 mul --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_trace_init

# barplot_overhead_energy_overhead_lsu_prop_total
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_basic.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -prop div CURR_MEAN_REP_MEAN swo_mode:0 work_mode:FREQ:DVS_POL -csc2 CURR_MEAN_REP_MEAN_PROP_DIV 1 sub None  -fs swo_mode:0:2 DVS_POL:1 -frp swo_mode:0 -col CURR_MEAN_REP_MEAN_PROP_DIV -idx work_mode -bap 1 FREQ -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP  -xal "Workload" -yal "OVERHEAD CURRENT PROPORTION [%/100]" -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ccl -ltl "CPU FREQUENCY [MHz]" --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_overhead_lsu_prop_total

# barplot_overhead_energy_overhead_cpi_prop_total
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_basic.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -prop div CURR_MEAN_REP_MEAN swo_mode:0 work_mode:FREQ:DVS_POL -csc2 CURR_MEAN_REP_MEAN_PROP_DIV 1 sub None  -fs swo_mode:0:3 DVS_POL:1 -frp swo_mode:0 -col CURR_MEAN_REP_MEAN_PROP_DIV -idx work_mode -bap 1 FREQ -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP  -xal "Workload" -yal "OVERHEAD POWER PROPORTION [%/100]" -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ltl "CPU FREQUENCY [MHz]" -ccl -als 13  --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_overhead_cpi_prop_total

# barplot_overhead_energy_overhead_compflash_prop_total
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/questions/overhead_trace_energy/comparator/nucleo-l476rg/energy_bench/swo_prf_overhead_basic.pkl -bm energy_bench -ccm swo_mode:work_mode:DVS_POL:FREQ -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ce swo_mode:work_mode:DVS_POL:FREQ -repst CURR_MEAN swo_mode:work_mode:DVS_POL:FREQ -prop div CURR_MEAN_REP_MEAN swo_mode:0 work_mode:FREQ:DVS_POL -csc2 CURR_MEAN_REP_MEAN_PROP_DIV 1 sub None  -fs swo_mode:0:9 DVS_POL:1 -frp swo_mode:0 -col CURR_MEAN_REP_MEAN_PROP_DIV -idx work_mode -bap 1 FREQ -cl work_mode?0:FLASH_ADD?1:REG_DIV?2:SLEEP  -xal "Workload" -yal "OVERHEAD POWER PROPORTION [%/100]" -pfs 15 6 -do CURR_SAMPLES swo_mode:work_mode:DVS_POL:FREQ -ltl "CPU FREQUENCY [MHz]" -ccl -als 13  --save /home/tobi/RIOT_ARBEIT/Bachelor/LateX/plots/testing_and_overhead/overhead/power/ barplot_overhead_energy_overhead_compflash_prop_total

# ADD latter plot with trace COMP