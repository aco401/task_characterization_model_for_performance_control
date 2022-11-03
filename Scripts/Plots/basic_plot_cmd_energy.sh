# lineplot_energy_seperated_spi
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p BA_Measurement_Utils/results_online/home/energy_bench/same_iter/nucleo-l476rg/basic_bm/spi.pkl -bm energy_bench -cl DVS_POL?0:LOW_VOLTAGE?1:FAST_FLASH -ucol spifreq DVS_POL  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN  FREQ:80000000 spifreq:DVS_POL -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp spifreq:DVS_POL -pfs 12 4 -yal "CPU Frequency [MHz]" -xal "" "Energy Consumption / Energy Consumption (80MHz)"  -ltl "SPI Frequency [MHz]" "DVS Policy" -ccm spifreq:DVS_POL:FREQ -ce spifreq:DVS_POL:FREQ -repst ENERGY_TOTAL spifreq:DVS_POL:FREQ -do CURR_SAMPLES spifreq:DVS_POL:FREQ -sg 1 3 -agr both -agr both both both -legap 2 -fr spifreq:100000 -ccl -cl spifreq?1000000:1?5000000:5?10000000:10 --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_energy_seperated_spi



# lineplot_seperated_energy_lvpol_tci ~
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/iter_mode_unique/nucleo-l476rg/basic_bm/10_rep/nucleo-l476rg/energy_bench/tci.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:0  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp storage:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV -pfs 12 4 -yal "CPU Frequency [MHz]" -xal "" "Energy Consumption / Energy Consumption (80MHz)" -ccm storage:operation:DVS_POL:FREQ -ce storage:operation:DVS_POL:FREQ -repst ENERGY_TOTAL storage:operation:DVS_POL:FREQ -do CURR_SAMPLES storage:operation:DVS_POL:FREQ -sg 1 3 -legap 2 -agr both both both -ltl "Access Type" "Operation Type" -ccl --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_energy_seperated_lvpol_tci


# lineplot_seperated_energy_ffpol_tci ~
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/iter_mode_unique/nucleo-l476rg/basic_bm/10_rep/nucleo-l476rg/energy_bench/tci.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:1  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp storage:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV -pfs 12 4 -yal "CPU Frequency [MHz]" -xal "" "Energy Consumption / Energy Consumption (80MHz)"  -ccm storage:operation:DVS_POL:FREQ -ce storage:operation:DVS_POL:FREQ -repst ENERGY_TOTAL storage:operation:DVS_POL:FREQ -do CURR_SAMPLES storage:operation:DVS_POL:FREQ -sg 1 3 -legap 2 -agr both both both -ltl "Access Type" "Operation Type" -ccl --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_energy_seperated_ffpol_tci

# lineplot_seperated_energy_ffpol_tci_float
#python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/iter_mode_unique/nucleo-l476rg/basic_bm/10_rep/nucleo-l476rg/energy_bench/nucleo-l476rg/energy_bench/tci_float.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:1  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp storage:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV -pfs 12 4 -yal "CPU Frequency [HZ]" -xal "Energy Consumption / Energy Consumption (80MHz)"  -ccm storage:operation:DVS_POL:FREQ -ce storage:operation:DVS_POL:FREQ -repst ENERGY_TOTAL storage:operation:DVS_POL:FREQ -do CURR_SAMPLES storage:operation:DVS_POL:FREQ -sg 1 3 -legap 2 -agr both both both -ltl "Access Type" "Operation Type"

# lineplot_seperated_energy_ffpol_tci_double
#python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/iter_mode_unique/nucleo-l476rg/basic_bm/10_rep/nucleo-l476rg/energy_bench/nucleo-l476rg/energy_bench/tci_double.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:1  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp storage:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV -pfs 12 4 -yal "CPU Frequency [HZ]" -xal "Energy Consumption / Energy Consumption (80MHz)"  -ccm storage:operation:DVS_POL:FREQ -ce storage:operation:DVS_POL:FREQ -repst ENERGY_TOTAL storage:operation:DVS_POL:FREQ -do CURR_SAMPLES storage:operation:DVS_POL:FREQ -sg 1 3 -legap 2 -agr both both both -ltl "Access Type" "Operation Type"

# lineplot_seperated_energy_ffpol_tci_fl_arithmetic
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/iter_mode_unique/nucleo-l476rg/basic_bm/10_rep/nucleo-l476rg/energy_bench/nucleo-l476rg/energy_bench/benchmark_merge.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:1 storage:0 -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation:BENCH -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp BENCH:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV BENCH?tci_float:FLOAT?tci_double:DOUBLE -pfs 12 4 -yal "CPU Frequency [MHz]" -xal "Energy Consumption / Energy Consumption (80MHz)" "Energy Consumption / Energy Consumption (80MHz)" -sg 1 2 -legap 1 -agr both both -ltl "Variable Type" "Operation Type" legl 1.01:0.8 -ccl --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_seperated_energy_ffpol_tci_fl_arithmetic



# lineplot_seperated_energy_lvpol_tci_sameiter
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/same_iter/nucleo-l476rg/basic_bm/tci.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:0  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp storage:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV -pfs 12 4 -yal "" "CPU Frequency [HZ]" -xal "Energy Consumption / Energy Consumption (80MHz)" -ccm storage:operation:DVS_POL:FREQ -ce storage:operation:DVS_POL:FREQ -repst ENERGY_TOTAL storage:operation:DVS_POL:FREQ -do CURR_SAMPLES storage:operation:DVS_POL:FREQ -sg 1 3 --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_seperated_energy_lvpol_tci_sameiter

# lineplot_seperated_energy_ffpol_tci_sameiter
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/iter_mode_unique/nucleo-l476rg/basic_bm/tci.pkl -bm energy_bench -ucol storage operation -fs DVS_POL:1  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 storage:operation -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp storage:operation -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV -pfs 12 4 -yal "CPU Frequency [HZ]" -xal "Energy Consumption / Energy Consumption (80MHz)"  -ccm storage:operation:DVS_POL:FREQ -ce storage:operation:DVS_POL:FREQ -repst ENERGY_TOTAL storage:operation:DVS_POL:FREQ -do CURR_SAMPLES storage:operation:DVS_POL:FREQ -sg 1 3 --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_seperated_energy_ffpol_tci_sameiter

# lineplot_energy_bitbang_gpio
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/same_iter/nucleo-l476rg/basic_bm/bitbang_gpio.pkl -bm energy_bench -ucol DVS_POL datasize -col ENERGY_TOTAL_REP_MEAN_PROP_DIV -prop div ENERGY_TOTAL_REP_MEAN  FREQ:80000000 DVS_POL:datasize -idx FREQ -lp DVS_POL:datasize -pfs 12 4 -xal "CPU Frequency [HZ]" -yal "Energy Consumption / Energy Consumption (80MHz)" -cl DVS_POL?0:LOW_VOLTAGE?1:FAST_FLASH -ltl "DVS Policy" "Datasize" -ccm datasize:DVS_POL:FREQ -ce datasize:DVS_POL:FREQ -repst ENERGY_TOTAL datasize:DVS_POL:FREQ -do CURR_SAMPLES datasize:DVS_POL:FREQ  --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_energy_bitbang_gpio

# lineplot_energy_sleep ~
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/iter_mode_unique/nucleo-l476rg/basic_bm/sleep.pkl -bm energy_bench -ucol DVS_POL -col ENERGY_TOTAL_REP_MEAN_PROP_DIV -prop div ENERGY_TOTAL_REP_MEAN  FREQ:80000000 DVS_POL -idx FREQ -lp DVS_POL -pfs 5 3 -xal "CPU Frequency [MHz]" -yal "Energy Consumption / Energy Consumption (80MHz)" -cl DVS_POL?0:LOW_VOLTAGE?1:FAST_FLASH -ltl "DVS Policy" -ccm DVS_POL:FREQ -ce DVS_POL:FREQ -repst ENERGY_TOTAL DVS_POL:FREQ -do CURR_SAMPLES DVS_POL:FREQ -agr both -ccl --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_energy_sleep

# lineplot_seperated_energy_ffpol_adc
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/same_iter/nucleo-l476rg/basic_bm/adc.pkl -bm energy_bench -ucol min_sample_time_ns res_nbits -fs DVS_POL:1  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 min_sample_time_ns:res_nbits -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp min_sample_time_ns:res_nbits -pfs 12 4 -yal "CPU Frequency [HZ]" -xal "Energy Consumption / Energy Consumption (80MHz)" -ltl "MIN SAMPLE t" "RESOLUTION" -ccm min_sample_time_ns:res_nbits:DVS_POL:FREQ -ce min_sample_time_ns:res_nbits:DVS_POL:FREQ -repst ENERGY_TOTAL min_sample_time_ns:res_nbits:DVS_POL:FREQ -do CURR_SAMPLES min_sample_time_ns:res_nbits:DVS_POL:FREQ -sg 1 4 --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_energy_seperated_ffpol_adc

# lineplot_seperated_energy_lvpol_adc
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/same_iter/nucleo-l476rg/basic_bm/adc.pkl -bm energy_bench -ucol min_sample_time_ns res_nbits -fs DVS_POL:0  -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 min_sample_time_ns:res_nbits -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp min_sample_time_ns:res_nbits -pfs 12 4 -yal "CPU Frequency [HZ]" -xal "Energy Consumption / Energy Consumption (80MHz)" -ltl "MIN SAMPLE t" "RESOLUTION" -ccm min_sample_time_ns:res_nbits:DVS_POL:FREQ -ce min_sample_time_ns:res_nbits:DVS_POL:FREQ -repst ENERGY_TOTAL min_sample_time_ns:res_nbits:DVS_POL:FREQ -do CURR_SAMPLES min_sample_time_ns:res_nbits:DVS_POL:FREQ -sg 1 4 --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_energy_seperated_lvpol_adc

# lineplot_seperated_energy_spincrunch
python3 ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/pickle_to_plot.py -p ~/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/results_online/home/energy_bench/same_iter/nucleo-l476rg/basic_bm/spincrunch.pkl -bm energy_bench -ucol poll_us work_cnt DVS_POL -fs poll_us:1000000 -fsp CURR_SAMPLES}100 -col FREQ -prop div ENERGY_TOTAL_REP_MEAN FREQ:80000000 poll_us:work_cnt:DVS_POL -idx ENERGY_TOTAL_REP_MEAN_PROP_DIV -lp DVS_POL:work_cnt -pfs 12 4 -yal "CPU Frequency [HZ]" -xal "Energy Consumption / Energy Consumption (80MHz)" -ltl "DVS_POL" "Work Counter" -cl DVS_POL?0:LOW_VOLTAGE?1:FAST_FLASH -ccm poll_us:work_cnt:DVS_POL:FREQ -ce poll_us:work_cnt:DVS_POL:FREQ -repst ENERGY_TOTAL poll_us:work_cnt:DVS_POL:FREQ -do CURR_SAMPLES poll_us:work_cnt:DVS_POL:FREQ -sg 1 2 --save ~/RIOT_ARBEIT/Bachelor/LateX/plots/chapter_measurements/basic/ lineplot_seperated_energy_spincrunch