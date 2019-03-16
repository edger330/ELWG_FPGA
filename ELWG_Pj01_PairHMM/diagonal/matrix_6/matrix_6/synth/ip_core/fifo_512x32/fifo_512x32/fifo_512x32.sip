set_global_assignment -entity "fifo_512x32" -library "lib_fifo_512x32" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fifo_512x32" -library "lib_fifo_512x32" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fifo_512x32" -library "lib_fifo_512x32" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fifo_512x32" -name SPD_FILE [file join $::quartus(sip_path) "fifo_512x32.spd"]
set_global_assignment -library "lib_fifo_512x32" -name MISC_FILE [file join $::quartus(sip_path) "../fifo_512x32.qsys"]

set_global_assignment -library "lib_fifo_512x32" -name MISC_FILE [file join $::quartus(sip_path) "sim/fifo_512x32.v"]
set_global_assignment -library "lib_fifo_512x32" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/fifo_512x32_fifo_161_6hroaea.v"]
