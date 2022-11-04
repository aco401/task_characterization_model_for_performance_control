#!/usr/bin/env python3

# Copyright (C) 2018 Michel Rottleuthner <michel.rottleuthner@haw-hamburg.de>
#
# This file is subject to the terms and conditions of the GNU Lesser
# General Public License v2.1. See the file LICENSE in the top level
# directory for more details.

import time
import usbtmc

CMD_TIMEOUT_S = 0.05
DEFAULT_BUFFER_SIZE = 8000000
valid_iolines        = [1, 2, 3, 4, 5, 6]
valid_iostates       = [0, 1]
valid_lineTypes      = ['digital', 'trigger', 'synchronous']
valid_lineDirections = ['in', 'out', 'opendrain', 'master', 'acceptor']

class DMMControl:

    def __init__(self, tmc_dev):
        self.tmc_dev = usbtmc.Instrument(tmc_dev)
        #self.tmc_dev.timeout = 30*1000

    def write_cmd(self, cmd):
        self.tmc_dev.write(cmd)


    def configure_digitize_trigger(self, function="current", samplerate=1000,
                                   range=1, aperture="DEFault",
                                   buffername = "defbuffer1", count="INF"):
        self.tmc_dev.write("sense:digitize:function:on \"{0}\"".format(function))
        self.tmc_dev.write("dig:{}:range {}".format(function, range))
        self.tmc_dev.write("sense:digitize:{}:srate {}".format(function, samplerate))
        self.tmc_dev.write("sense:digitize:{}:aperture {}".format(function, aperture))
        if count == "INF":
            self.tmc_dev.write("TRACe:POINts {}, \"{}\"".format(DEFAULT_BUFFER_SIZE, buffername))
        else:
            self.tmc_dev.write("TRACe:POINts {}, \"{}\"".format(count, buffername))

        #self.tmc_dev.write("TRACe:CLEar")
        self.tmc_dev.write("TRIGger:LOAD \"Empty\"")
        self.tmc_dev.write("TRIGger:BLOCk:BUFFer:CLEar 1, \"{}\"".format(buffername))
        # TODO change to max buffer count
        self.tmc_dev.write("TRIGger:BLOCk:DIGitize 2, \"{}\", {}".format(buffername, count))
        # the below block is needed when using INF count - otherwise the DMM locks up
        self.tmc_dev.write("TRIG:BLOCK:WAIT 3, command")

    def configure_digitize_triggers_simple(self, function="current", range=100E-3,
                                                samplerate=1000000, aperture="default",
                                                buffername = "defbuffer1", bufsize=1000000):
        # select measurement. default current
        self.tmc_dev.write("sense:digitize:function:on \"{0}\"".format(function))
        # select measurement range. default 100mA
        self.tmc_dev.write("dig:{}:range {}".format(function, range))
        # select max. sampling rate. default 1Ms
        self.tmc_dev.write("sense:digitize:{}:srate {}".format(function, samplerate))
        # selext aperture. default/auto
        self.tmc_dev.write("sense:digitize:{}:aperture {}".format(function, aperture))
        # setup buffer. default buffer defbuffer1 in INF mode. this doesn't block -> wee
        # need it in order to reach the event logs. in INF acts as ringbuffer *but* our
        # measurement time isn't that long and we stop that mode at the end. shouldn't be aprobelm.
        self.tmc_dev.write("trace:points {}, \"{}\"".format(bufsize, buffername))


        # configure triggers
        # dig1 for start
        self.tmc_dev.write("dig:line1:mode trig, in")
        self.tmc_dev.write("trig:dig1:in:edge ris")
        # dig2 for trigger
        self.tmc_dev.write("dig:line2:mode trig, in")
        self.tmc_dev.write("trig:dig2:in:edge ris")

        # load empty, clear buffer
        self.tmc_dev.write("trig:load \"Empty\"")
        self.tmc_dev.write("trig:block:buffer:clear 1, \"{}\"".format(buffername))


        # wait for start trigger and record
        self.tmc_dev.write("trig:block:wait 2, dig1")
        self.tmc_dev.write("trigger:block:digitize 3, \"{}\", INF".format(buffername))
        self.tmc_dev.write("trig:block:wait 4, dig2")
        self.tmc_dev.write("trigger:block:digitize 5, \"{}\", {}".format(buffername, 0))

        self.tmc_dev.write("trig:block:log:event 6, info1, 'EVENTENDE'")



        #self.tmc_dev.write(":TRIGger:TIMer1:DELay 10");


    def configure_digitize_triggers_icnlowpan19(self, function="current", range=100E-3,
                                                samplerate=1000000, aperture="default",
                                                buffername = "defbuffer1", bufsize=1000000):

        # select measurement. default current
        self.tmc_dev.write("sense:digitize:function:on \"{0}\"".format(function))
        # select measurement range. default 100mA
        self.tmc_dev.write("dig:{}:range {}".format(function, range))
        # select max. sampling rate. default 1Ms
        self.tmc_dev.write("sense:digitize:{}:srate {}".format(function, samplerate))
        # selext aperture. default/auto
        self.tmc_dev.write("sense:digitize:{}:aperture {}".format(function, aperture))
        # setup buffer. default buffer defbuffer1 in INF mode. this doesn't block -> wee
        # need it in order to reach the event logs. in INF acts as ringbuffer *but* our
        # measurement time isn't that long and we stop that mode at the end. shouldn't be aprobelm.
        self.tmc_dev.write("trace:points {}, \"{}\"".format(bufsize, buffername))

        # configure triggers
        # dig1 for start
        self.tmc_dev.write("dig:line1:mode trig, in")
        self.tmc_dev.write("trig:dig1:in:edge ris")
        # dig2 for trigger
        self.tmc_dev.write("dig:line2:mode trig, in")
        self.tmc_dev.write("trig:dig2:in:edge ris")
        # dig3 for trigger
        self.tmc_dev.write("dig:line3:mode trig, in")
        self.tmc_dev.write("trig:dig3:in:edge ris")
        # dif4 for stop
        self.tmc_dev.write("dig:line4:mode trig, in")
        self.tmc_dev.write("trig:dig4:in:edge ris")



        # load empty, clear buffer
        self.tmc_dev.write("trig:load \"Empty\"")
        self.tmc_dev.write("trig:block:buffer:clear 1, \"{}\"".format(buffername))

        # wait for start trigger and record
        self.tmc_dev.write("trig:block:wait 2, dig1")
        # When you set the count to a finite value, trigger model execution remains at the block until all
        # measurements are complete. If you set the count to infinite, the trigger model executes subsequent
        # blocks and measurements continue in the background until the trigger model execution reaches
        # another digitize block or until the trigger model is aborted or re-initialized.
        self.tmc_dev.write("trigger:block:digitize 3, \"{}\", INF".format(buffername))


        # wait for trigger and log event
        self.tmc_dev.write("trig:block:wait 4, dig2")
        self.tmc_dev.write("trig:block:log:event 5, info1, 'log event 1'")

        # wait for trigger and log event
        self.tmc_dev.write("trig:block:wait 6, dig3")
        self.tmc_dev.write("trig:block:log:event 7, info1, 'log event 2'")

        # wait for stop trigger and record
        self.tmc_dev.write("trig:block:wait 8, dig4")
        # stop digitizing
        self.tmc_dev.write("trigger:block:digitize 9, \"{}\", {}".format(buffername, 0))

        self.tmc_dev.write("trig:block:log:event 10, info1, 'EVENTENDE'")


        # save buffer to file
        # self.tmc_dev.write("trace:save 'bufferlog', \"{}\"".format(buffername))
        # save informational event log to file
        # self.tmc_dev.write("system:eventlog:save 'eventlog', INF")



    def configure_digitize_triggers_ett19(self, function="current", range=100E-3,
                                                samplerate=1000000, aperture="default",
                                                buffername = "defbuffer1", bufsize=1000000, trig1="fall", trig2="ris"):
        # select measurement. default current
        self.tmc_dev.write("sense:digitize:function:on \"{0}\"".format(function))
        # select measurement range. default 100mA
        self.tmc_dev.write("dig:{}:range {}".format(function, range))
        # select max. sampling rate. default 1Ms
        self.tmc_dev.write("sense:digitize:{}:srate {}".format(function, samplerate))
        # selext aperture. default/auto
        self.tmc_dev.write("sense:digitize:{}:aperture {}".format(function, aperture))
        # setup buffer. default buffer defbuffer1 in INF mode. this doesn't block -> wee
        # need it in order to reach the event logs. in INF acts as ringbuffer *but* our
        # measurement time isn't that long and we stop that mode at the end. shouldn't be aprobelm.
        self.tmc_dev.write("trace:points {}, \"{}\"".format(bufsize, buffername))

        # configure triggers
        # dig1 for start
        self.tmc_dev.write("dig:line1:mode trig, in")
        self.tmc_dev.write("trig:dig1:in:edge "+trig1)

        # dif4 for stop
        self.tmc_dev.write("dig:line5:mode trig, in")
        self.tmc_dev.write("trig:dig5:in:edge "+trig2)


        # load empty, clear buffer
        self.tmc_dev.write("trig:load \"Empty\"")
        self.tmc_dev.write("trig:block:buffer:clear 1, \"{}\"".format(buffername))

        # wait for start trigger and record
        self.tmc_dev.write("trig:block:wait 2, dig1")
        # When you set the count to a finite value, trigger model execution remains at the block until all
        # measurements are complete. If you set the count to infinite, the trigger model executes subsequent
        # blocks and measurements continue in the background until the trigger model execution reaches
        # another digitize block or until the trigger model is aborted or re-initialized.
        self.tmc_dev.write("trigger:block:digitize 3, \"{}\", INF".format(buffername))

        # wait for stop trigger and record
        self.tmc_dev.write("trig:block:wait 4, dig5")
        # stop digitizing
        self.tmc_dev.write("trigger:block:digitize 5, \"{}\", {}".format(buffername, 0))

        self.tmc_dev.write("trig:block:log:event 6, info1, 'END'")


    def buf_get_data(self, startidx, stopidx, buffername = "defbuffer1", bufferelements = "reading"):
        return self.tmc_dev.ask(":TRACe:DATA? {}, {}, \"{}\", {}".format(startidx, stopidx, buffername, bufferelements))

    def buf_get_num_readings(self, buffername = "defbuffer1"):
        return self.tmc_dev.ask(":TRACe:ACTual? \"{}\"".format(buffername))

    def get_trigger_state(self):
        return self.tmc_dev.ask(":trig:state?").split(";")[0]

    def event_log_clear(self):
        self.tmc_dev.write(":SYSTem:CLEar")

    def event_get_oldest(self):
        return self.tmc_dev.ask(":SYSTem:EVENtlog:NEXT?")

    def trig_get_block_cnt(self, input_block):
        return self.tmc_dev.ask("trigger:block:branch:counter:count? {}".format(input_block)) # input is block number

    def start_digitize_current(self):
        self.tmc_dev.write(":INITiate")

    def abort_digitize(self):
        self.tmc_dev.write("abort")

    def get_average(self):
        return self.tmc_dev.ask("TRACe:STATistics:AVERage?")

    def get_std_dev(self):
        return self.tmc_dev.ask("TRACe:STATistics:STDDev?")

    def get_current(self):
        return self.tmc_dev.ask("meas:curr:dc?")

    def beep(self, freq, duration_ms):
        self.tmc_dev.write(':SYSTem:BEEPer {},{}'.format(freq, duration_ms / 1000.0))

    def fan_quiet(self):
        self.tmc_dev.write("system:fan:level quiet")

    def reset(self):
        self.tmc_dev.write("*RST")

    def pin_config(self, ioline, linetype, linedirection):
        if ioline not in valid_iolines:
            raise ValueError("Invalid pin number given! Must be ", valid_iolines)
        if linetype not in valid_lineTypes:
            raise ValueError("Invalid io line type given! Must be ", valid_lineTypes)
        if linedirection not in valid_lineDirections:
            raise ValueError("Invalid io line direction given! Must be ", valid_lineDirections)

        self.tmc_dev.write('dig:line{}:mode {}, {}'.format(ioline, linetype, linedirection))

    def pin_write(self, ioline, state):
        if ioline not in valid_iolines:
            raise ValueError("Invalid pin number given! Must be ", valid_iolines)
        if state not in valid_iostates:
            raise ValueError("Invalid io line type given! Must be ", valid_iostates)

        self.tmc_dev.write('dig:line{}:state {}'.format(ioline, state))

    def pin_read(self, ioline):
        if ioline not in valid_iolines:
            raise ValueError("Invalid pin number given! Must be ", valid_iolines)

        return self.tmc_dev.ask('dig:line{}:state?'.format(ioline))


    def __del__(self):
        if hasattr(self, "tmc_dev"):
            self.tmc_dev.close()
