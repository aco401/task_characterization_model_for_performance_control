# Info: Connect Osci to PC2 (1x) and SWO PIN (10X)


# Flash Oscilloscope Test Application
make BUILD_IN_DOCKER=1 BOARD=nucleo-l476rg -j5  -s -C RiotClockConf/tests/oszilloscope-and-tests WL_TCI=1 all flash

# Perform ecp_delay measurements - needs nucleo-l476rg (over USB) and rigolds1054Z oscilloscope (over ip) - ip is still hardcode in Measurement_Utils/experiment_to_pickle_constants.py
python3 Measurement_Utils/experiment_to_pickle.py -o ./ -b nucleo-l476rg -bm trace_delay Data/json_config_files/benchmarks.json --flash_info RiotClockConf/tests/oszilloscope-and-tests --json Data/json_config_files/delay_benchmark/swo_trace_delay.json rigol_ecp_delay

# Perform ecp_length measurements - needs nucleo-l476rg (over USB) and rigolds1054Z oscilloscope (over ip)
python3 Measurement_Utils/experiment_to_pickle.py -o ./ -b nucleo-l476rg -bm trace_wave Data/json_config_files/benchmarks.json --flash_info RiotClockConf/tests/oszilloscope-and-tests --json Data/json_config_files/delay_benchmark/swo_trace_delay.json rigol_ecp_wave
