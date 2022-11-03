# SWO BENCH CONSTANTS
SWO_BENCH_RIOT_SHELL_ARG = ["name", "prf_cnt", "work_args",
                            "iter_mode", "iter_idx", "iter", "freq", "fwsa", "dvs_pol"]
# // TODO Calculate how much time - depends on timeout length
SWO_BENCH_SERIAL_MAX_TIMEOUT = None
SWO_BENCH_BREAK_ERROR = False

# OTHER CHARACTER BENCH CONSTANTS
OTHER_CHARACTER_BENCH_SERIAL_MAX_TIMEOUT = 100

# ENERGY BENCH CONSTANTS
ENERGY_BENCH_SERIAL_MAX_TIMEOUT = 1000
ENERGY_BENCH_MIN_MEASURMENTS = 100  # TODO Argumentable
ENERGY_BENCH_BREAK_TIMEOUT = False
ENERGY_BENCH_BREAK_LEN_DMM = False

# PERF UTIL TEST CONSTANTS
PERF_UTIL_DEFAULT_ARGS = [30000, 11]

# GENERAL BENCH CONSTANTS
BENCH_REPETITION_DEFAULT = 1
BENCH_ERROR = {"conf": None, "data": None}

# OTHER FUNCTION CONSTANTS
MAIN_ARGUMENT_PRECMDRESET_DEFAULT = False
RUN_TASK_VERBOSE = True
PROMPT_SYNC_TIMEOUT = 100
FLASH_VERBOSE = True

# SERIAL DECODE CONSTANTS
SERIAL_DECODE_TIMEOUT = -1
SERIAL_DECODE_ERROR = -2
SERIAL_DECODE_ERROR_DUMP = ["##USAGE:", "Context before hardfault",
                            "MEM MANAGE", "ERROR", "FAILED", "not found", "shell"]

# DMM CONSTANTS
DMM_MEASURE_RANGE = 100E-3
DMM_SAMPLERATE = 10000
DMM_DONT_START_TRACE = False

# Rigol Oszilloscope
RGOSZI_COMMUNICATE = True

# DATAFRAME BENCH COL NAMES
COL_NAME_BENCH_REPETITION = "REPETITION_ID"
COL_NAME_ENERGY_BENCH_CURRENT = "CURRENT_DATA"
COL_NAME_BENCH_CACHE = "FLASH_CACHE"
# COL_NAME_ENERGY_BENCH_CURRENT = "ENERGY_DATA" # For Backwards Compatability
COL_NAME_TRACE_DELAY_DELAY = "DELAY"
COL_NAME_TRACE_SAMPLES_WAVE = "WAVE_DATA"

BEEBS_SELECTED_PAPER_BENCHMARKS = ["beebs_crc", "beebs_cubic", "beebs_dijkstra",
                                   "beebs_fdct", "beebs_matmult", "beebs_rijndael", "beebs_nettle_sha256", "beebs_fir"]

BENCHMARK_TYPES = ["swo_bench", "perf_util", "energy_bench", "trace_delay",
                   "trace_prescaler", "trace_wave", "trace_csv", "assembler_bench"]
SWO_BENCH_CNT_TYPE_COL = "CNT_TYPE"
SWO_BENCH_DVS_POL_COL = "DVS_POL"
SWO_BENCH_FLASH_CACHE_COL = "FLASH_CACHE"
SWO_BENCH_INDEX_TO_CNTTYPE = {0: 'CYCLE', 1: 'FOLD', 2: 'LSU', 3: 'SLEEP', 4: 'EX', 5: 'CPI', 6: 'PCSAMPLE', 10: 'COMP_DATA_RAM', 20: 'PERIPH_SPI', 21: 'PERIPH_GPIO', 22: 'PERIPH_ADC', 23: "PERIPH_TIM",
                              24: "PERIPH_LPTIM", 100: 'COMP_DATA_FLASH', 101: 'COMP_FLASH_1', 102: 'COMP_FLASH_2', 103: 'COMP_FLASH_3', 104: 'COMP_FLASH_4', 105: 'COMP_FLASH_5', 106: 'COMP_FLASH_6', 107: 'COMP_FLASH_7'}
SWO_BENCH_FREQ_COL = "FREQ"
SWO_BENCH_INDEX_TO_FREQ = {13333333: 13, 26666666: 26, 40000000: 40, 53333333: 53, 80000000: 80}
SWO_BENCH_INDEX_TO_ENCODING = {1: "MANCHESTER", 2: "NRZ"}

DVS_POL_INDEX_TO_STRING = {0: "LOW_VOLTAGE", 1: "FAST_FLASH"}

FLASH_CACHE_TO_STRING = {3: "DATA_INSTRUCTION_FLASH_CACHE_ENABLED", 2: "DATA_FLASH_CACHE_ENABLED",
                         1: "INSTRUCTION_FLASH_CACHE_ENABLED", 0: "NO_FLASH_CACHE_ENABLED"}

METADATA_MODFICATION_KEY = "MODS"

COL_NAME_CURRENT_STAT_MODE = "CURR_MODE"
COL_NAME_CURRENT_STAT_MEDIAN = "CURR_MEDIAN"
COL_NAME_CURRENT_STAT_MEAN = "CURR_MEAN"
COL_NAME_CURRENT_STAT_MIN = "CURR_MIN"
COL_NAME_CURRENT_STAT_MAX = "CURR_MAX"


EMPIRIC_STAT_POWER = [
    [80000000, 1200, 0.0050867],
    [80000000, 1000, 0.0039312],
    [53333333, 1200, 0.0043483],
    [53333333, 1000, 0.0034183],
    [40000000, 1200, 0.0039789],
    [40000000, 1000, 0.0031619],
    [26666666, 1200, 0.0036096],
    [26666666, 1000, 0.0029055],
    [13333333, 1200, 0.0032404],
    [13333333, 1000, 0.0026490],
]  # From Michel

EMPIRIC_STAT_POWER_BEEBS = [
    [1200, 0.00278207],
    [1000, 0.00030082],
]  # From Michel

BENCH_NAME_BEEBS_CYCLE_SAVING_NAME_LIST = ["beebs_nettle_cast128", "beebs_nettle_des", "beebs_nsichneu", "beebs_rijndael", "beebs_statemate", "beebs_nettle_sha256", "beebs_nettle_md5",
                                           "beebs_stb_perlin", "beebs_sqrt", "beebs_frac", "beebs_fir", "beebs_dtoa", "beebs_nbody", "beebs_cubic", "beebs_whetstone", "beebs_mergesort", "beebs_nettle_aes", "beebs_ndes", "beebs_picojpeg"]

BENCH_NAME_BEEBS_FLOAT_INSTRUCTIONS = ["beebs_stb_perlin",
                                       "beebs_sqrt",
                                       "beebs_frac",
                                       "beebs_dtoa",
                                       "beebs_nbody",
                                       "beebs_cubic",
                                       "beebs_whetstone",
                                       "beebs_mergesort",
                                       "beebs_newlib_log",
                                       "beebs_newlib_mod",
                                       "beebs_minver",
                                       "beebs_ludcmp",
                                       "beebs_fasta",
                                       "beebs_ud",
                                       "beebs_newlib_exp",
                                       "beebs_qurt",
                                       "beebs_newlib_sqrt",
                                       "beebs_st"]


BENCH_NAME_GROUP_TO_NAME_LIST = {
    "BCC": BENCH_NAME_BEEBS_CYCLE_SAVING_NAME_LIST, "BFI":BENCH_NAME_BEEBS_FLOAT_INSTRUCTIONS}
