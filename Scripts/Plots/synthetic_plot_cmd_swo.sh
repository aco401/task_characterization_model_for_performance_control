
# Pictures
# TCI

# barplot_profiling_tci_freq: ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/swo/different_iter/tci.pkl -bm swo_bench -ucol operation storage  -fs operation:0 DVS_POL:1 -col CNT_NORM_REP_MEAN -idx storage -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV DVS_POL?0:LOW_VOLTAGE?1:FAST_FLASH -repst CNT_NORM operation:storage:FREQ:CNT_TYPE:DVS_POL -bap 1 FREQ:CNT_TYPE -xal "Access Type" -yal "Profiling Counter / Cycles"  -pfs 12 4 -fr CNT_TYPE:0 -ltl "Counter Type" "CPU Frequency [MHz]" --legend-loc 1.01:0.57 1.01:0.1 -ccl -csc CNT_NORM 10000 div  


# barplot_cycles_tci_freq ~
python3 Measurement_Utils/pickle_to_plot.py -p /Data/results/synthetic/swo/same_iter/tci.pkl -bm swo_bench -ucol operation storage  -fs operation:0 DVS_POL:1 -col CYC_DIFF_PROP_DIV -idx storage -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV DVS_POL?0:LOW_VOLTAGE?1:FAST_FLASH -repst CNT_NORM operation:storage:FREQ:CNT_TYPE:DVS_POL -fsp CNT_TYPE:1 -bap 1 FREQ -xal "Access Type" -yal "Cycles / Cycles (80MHz)"  -pfs 12 4 -fr CNT_TYPE:0  --legend-loc 1.01:0.57 -ccl -prop div CYC_DIFF FREQ:80000000 storage:CNT_TYPE -an "4 MCycles":-0.1:1 "376 MCycles":0.9:1 "483 MCycles":1.9:1 -ltl "CPU Frequency [MHz]" 


# barplot_ram_flash_tci_ffpol_80 ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/swo/different_iter/tci_merged.pkl -bm swo_bench -ucol storage operation -fs FREQ:80000000 DVS_POL:1 -col CNT_NORM -idx storage -cl storage?0:REG?1:RAM?2:FLASH operation?0:ADD?1:MUL?2:DIV  -bap 1 operation:CNT_TYPE -xal "Access Type" -yal "Comparator Counter / Cycles"  -pfs 12 4 -fr CNT_TYPE:0 -fsp CNT_TYPE}5 -csc2 CNT_REP_STD 8.25 div CNT_STD_NORM -cc CNT_STD_NORM CNT_STD_NORM CYC_DIFF div -errcol CNT_STD_NORM -csc CNT_NORM 10000 div -ltl "Counter Type" "Operation Type" -ccl -legl 0.01:0.7 0.01:0.4 


# SPI
# barplot_profiling_ffpol_spi ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/swo/different_iter/spi.pkl -bm swo_bench -ucol spifreq -fs DVS_POL:1 -col CNT_NORM_REP_MEAN -idx spifreq -repst CNT_NORM spifreq:FREQ:CNT_TYPE -bap 0 CNT_TYPE:FREQ -pfs 12 4 -fr CNT_TYPE:0 spifreq:100000 -xal "Selected SPI Frequency [Hz]" -yal "Profiling Counter / Cycles"  -ltl "Counter Type" "CPU Frequency [MHz]" --legend-loc 1.01:0.57 1.01:0.1 -ccl -csc CNT_NORM 10000 div 

# barplot_cycles_ffpol_spi_same_iter ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/swo/same_iter/spi_flash.pkl -bm swo_bench -ucol spifreq -fs DVS_POL:1 CNT_TYPE:100 -col CYC_DIFF_REP_MEAN -idx spifreq -repst CYC_DIFF spifreq:FREQ:CNT_TYPE -bap 1 FREQ -pfs 12 4 -fr CNT_TYPE:0 spifreq:100000 -xal "Selected SPI Frequency [Hz]" -yal "Cycles [#]" -ltl "CPU Frequency [MHz]" --legend-loc 1.01:0.57 1.01:0.1 -ccl 

# barplot_ram_flash_ffpol_spi_sameiter ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/swo/same_iter/spi_merged.pkl -bm swo_bench -ucol DVS_POL:spifreq  -col CNT_NORM -idx spifreq -bap 1 FREQ:CNT_TYPE -fs DVS_POL:1  -xal "Selected SPI Frequency [Hz]" -yal "Comparator Counter / Cycles"  -pfs 12 4 -fr CNT_TYPE:0 spifreq:100000  --legend-loc 1.01:0.57 1.01:0.1 -ro CNT_REP_MEAN DVS_POL:FREQ:spifreq sum CNT_TYPE:100:101:102 100 -csc2 CNT_REP_MEAN 8.25 div CNT_NORM -cc CNT_NORM CNT_NORM CYC_DIFF div -ltl "Counter Type" "CPU Frequency [MHz]" -ccl 

# barplot_periph_ffpol_spi_sameiter_80MHz ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/swo/same_iter/spi_periph.pkl -bm swo_bench -ucol spifreq -fs DVS_POL:1 CNT_TYPE}19 FREQ:80000000 -col CNT_NORM -idx spifreq -bap 1 CNT_TYPE -pfs 12 4 -fr CNT_TYPE:0 spifreq:100000 -repst CNT DVS_POL:FREQ:spifreq:CNT_TYPE -xal "Selected SPI Frequency [Hz]" -yal "Comp. Peripheral Counter / Cycles" -ltl "Counter Type" "CPU Frequency [MHz]" --legend-loc 1.01:0.57 1.01:0.1 -csc2 CNT_REP_MEAN 8.25 div CNT_NORM -cc CNT_NORM CNT_NORM CYC_DIFF div  -ccl -als 12 

# lineplot_spi_selected_actual_frequency ~
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/spi_freqs.pkl -bm trace_csv -idx actual_spifreq -col FREQ -lp selected_spifreq -pfs 12 4 -yal "CPU Frequency [MHz]" -xal "" "ACTUAL SPI FREQUENCY [MHz]" -ltl "Selected SPI\nFrequency [MHz]" -fr selected_spifreq:100000 -sg 1 3 -agr both both both -legap 2 -cl selected_spifreq?1000000:1?5000000:5?10000000:10 -ccl -csc actual_spifreq 1000000 div 


# SLEEP
# barplot_profiling_sleep:
python3 Measurement_Utils/pickle_to_plot.py -p Data/results/synthetic/swo/different_iter/sleep.pkl -bm swo_bench -fs DVS_POL:0 -col CNT_NORM_REP_MEAN -idx FREQ -repst CNT_NORM FREQ:CNT_TYPE -bap 0 CNT_TYPE -pfs 5 3 -ccl -fr CNT_TYPE:0  -yal "Profiling Counter / Cycles" -xal "CPU Frequency [MHz]"   -ltl "Counter Type" -csc CNT_NORM 10000 div 
