set_global_assignment -entity "fifo_X" -library "lib_fifo_X" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fifo_X" -library "lib_fifo_X" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fifo_X" -library "lib_fifo_X" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fifo_X" -name SPD_FILE [file join $::quartus(sip_path) "fifo_X.spd"]
set_global_assignment -library "lib_fifo_X" -name MISC_FILE [file join $::quartus(sip_path) "../fifo_X.qsys"]

set_global_assignment -library "lib_fifo_X" -name MISC_FILE [file join $::quartus(sip_path) "sim/fifo_X.v"]
set_global_assignment -library "lib_fifo_X" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/fifo_X_fifo_161_skz73ra.v"]
