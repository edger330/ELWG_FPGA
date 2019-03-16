set_global_assignment -entity "fifo_M" -library "lib_fifo_M" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fifo_M" -library "lib_fifo_M" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fifo_M" -library "lib_fifo_M" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fifo_M" -name SPD_FILE [file join $::quartus(sip_path) "fifo_M.spd"]
set_global_assignment -library "lib_fifo_M" -name MISC_FILE [file join $::quartus(sip_path) "../fifo_M.qsys"]

set_global_assignment -library "lib_fifo_M" -name MISC_FILE [file join $::quartus(sip_path) "sim/fifo_M.v"]
set_global_assignment -library "lib_fifo_M" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/fifo_M_fifo_161_skz73ra.v"]
