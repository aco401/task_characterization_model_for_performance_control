
# Flash
python3 BA_Measurement_Utils/experiment_to_pickle.py -o ./ -b nucleo-l476rg -bm energy_bench --flash_info RiotClockConf/tests/gclk/ --flash RiotClockConf/tests/gclk/ Data/json_config_files/workload_benchmarks/basic_bm/bench_settings_dwt_overhead.json

# swo_prf_overhead_phases
python3 BA_Measurement_Utils/experiment_to_pickle.py -o ./ -b nucleo-l476rg -bm energy_bench Data/json_config_files/benchmarks.json --flash_info RiotClockConf/tests/gclk/ --json Data/json_config_files/workload_benchmarks/basic_bm/bench_settings_dwt_overhead.json swo_prf_overhead_phases

# swo_prf_overhead_basic
python3 BA_Measurement_Utils/experiment_to_pickle.py -o ./ -b nucleo-l476rg -bm energy_bench Data/json_config_files/benchmarks.json --flash_info RiotClockConf/tests/gclk/ --json Data/json_config_files/workload_benchmarks/basic_bm/bench_settings_dwt_overhead.jsonswo_prf_overhead_basic