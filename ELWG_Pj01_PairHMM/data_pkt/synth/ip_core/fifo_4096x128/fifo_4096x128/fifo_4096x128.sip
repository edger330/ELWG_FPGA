set_global_assignment -entity "fifo_4096x128" -library "lib_fifo_4096x128" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fifo_4096x128" -library "lib_fifo_4096x128" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fifo_4096x128" -library "lib_fifo_4096x128" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fifo_4096x128" -name SPD_FILE [file join $::quartus(sip_path) "fifo_4096x128.spd"]
set_global_assignment -library "lib_fifo_4096x128" -name MISC_FILE [file join $::quartus(sip_path) "../fifo_4096x128.qsys"]

set_global_assignment -library "lib_fifo_4096x128" -name MISC_FILE [file join $::quartus(sip_path) "sim/fifo_4096x128.v"]
set_global_assignment -library "lib_fifo_4096x128" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/fifo_4096x128_fifo_161_5kcov5y.v"]
