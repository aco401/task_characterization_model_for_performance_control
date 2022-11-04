
# 1. FLASH - select one of the following beebs groups
## Flash the nucleo-l476rg with tests/gclk benchmarking utlity for swo_bench with first set of beebs_tasks
python3 Measurement_Utils/experiment_to_pickle.py -o /temp -b nucleo-l476rg -bm swo_bench --flash_info RiotClockConf/tests/gclk --flash RiotClockConf/tests/gclk Data/json_config_files/workload_benchmarks/beebs_bm/bench_settings_1.json

## Flash the nucleo-l476rg with tests/gclk benchmarking utlity for energy_bench with second set of beebs_tasks
python3 Measurement_Utils/experiment_to_pickle.py -o /temp -b nucleo-l476rg -bm energy_bench --flash_info RiotClockConf/tests/gclk --flash RiotClockConf/tests/gclk Data/json_config_files/workload_benchmarks/beebs_bm/bench_settings_2.json

## Flash the nucleo-l476rg with tests/gclk benchmarking utlity for swo_bench with third set of beebs_tasks
python3 Measurement_Utils/experiment_to_pickle.py -o /temp -b nucleo-l476rg -bm energy_bench --flash_info RiotClockConf/tests/gclk --flash RiotClockConf/tests/gclk Data/json_config_files/workload_benchmarks/beebs_bm/bench_settings_3.json


# 2. EXPERIMENT - select one of the following experiments - requires flashed beebs group
# Perform swo_bench with nucleo-l476rg with benchmarks.json as benchmark input, with first set of beebs_tasks, start tasks at offset beebs_mergesort, save output pickle to folder root - Only needs board
python3 Measurement_Utils/experiment_to_pickle.py -o ./ -b nucleo-l476rg -bm swo_bench Data/json_config_files/benchmarks.json --flash_info RiotClockConf/tests/gclk --json /home/tobi/RIOT_ARBEIT/flexclock_code/BA_Measurement_Utils/json_config_files/workload_benchmarks/beebs_bm/bench_settings_1.json --json_offset beebs_mergesort

# Perform energy_bench with nucleo-l476rg with benchmarks.json as benchmark input, with second set of beebs_tasks, save output pickle to folder root - needs board and DMM
python3 Measurement_Utils/experiment_to_pickle.py -o ./-b nucleo-l476rg -bm energy_bench Data/json_config_files/benchmarks.json --flash_info RiotClockConf/tests/gclk --json /json_config_files/workload_benchmarks/beebs_bm/bench_settings_2.json  


python3 Measurement_Utils/experiment_to_pickle.py -o ./ -b nucleo-l476rg -bm energy_bench Data/json_config_files/benchmarks.json --flash_info RiotClockConf/tests/gclk --json /json_config_files/workload_benchmarks/beebs_bm/bench_settings_3.json  