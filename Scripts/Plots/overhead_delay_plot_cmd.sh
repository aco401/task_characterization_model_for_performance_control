RENAME="-cl MODE?1:TIMCNT_GPIO_INIT?2:TIMCNT_INIT?3:SWO_INIT?4:SWDP_SWITCH?5:TRACE_INIT_FULL?6:TRACE_INIT?9:TRACE_START?10:TRACE_STOP?13:TRACE_COMP_START?14:TRACE_COMP_STOP?11:TRACE_DEINIT?12:TRACE_CALC"


# barplot_delay_trace_init_swdp
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/overhead/oszi_trace_duration.pkl -bm trace_delay -fs DVS_POL:1 -do DELAY MODE:DVS_POL:FREQ -repst DELAY MODE:DVS_POL:FREQ -csc2 DELAY_REP_MEAN 1000000 mul 0 -fsp MODE:1:2:3:4 FREQ:13333333:80000000 -idx FREQ -col DELAY_REP_MEAN -bap 0 MODE 1 -pfs 15 6 $RENAME -xal "Delay [µs]" -yal "CPU Frequency [MHz]" -ltl "TRACE_INIT STEPS" -ccl 

# barplot_delay_trace_init_no_swdp
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/overhead/oszi_trace_duration.pkl -bm trace_delay -fs DVS_POL:1 -do DELAY MODE:DVS_POL:FREQ -repst DELAY MODE:DVS_POL:FREQ -csc2 DELAY_REP_MEAN 1000000 mul 0 -fsp MODE:1:2:3 FREQ:13333333:80000000 -idx FREQ -col DELAY_REP_MEAN -bap 0 MODE 1 -pfs 15 6 $RENAME -xal "Delay [µs]" -yal "CPU Frequency [MHz]" -ltl "TRACE_INIT STEPS" -ccl 

# barplot_delay_trace_init_prf
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/overhead/oszi_trace_duration.pkl -bm trace_delay -fs DVS_POL:1 -do DELAY MODE:DVS_POL:FREQ -repst DELAY MODE:DVS_POL:FREQ -csc2 DELAY_REP_MEAN 1000000 mul 0 -fsp MODE:6:9:10:11:12 FREQ:13333333:80000000 -idx FREQ -col DELAY_REP_MEAN -bap 0 MODE 1 -pfs 15 6 $RENAME -xal "Delay [µs]" -yal "CPU Frequency [MHz]" -ltl "TRACE STEPS" -ccl 

# barplot_delay_trace_init_comp
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/overhead/oszi_trace_duration.pkl -bm trace_delay -fs DVS_POL:1 -do DELAY MODE:DVS_POL:FREQ -repst DELAY MODE:DVS_POL:FREQ -csc2 DELAY_REP_MEAN 1000000 mul 0 -fsp MODE:13:14 FREQ:13333333:80000000 -idx FREQ -col DELAY_REP_MEAN -bap 0 MODE 1 -pfs 15 6 $RENAME -xal "Delay [µs]" -yal "CPU Frequency [MHz]" -ltl "TRACE STEPS" -puco tab:orange?tab:green -ccl




