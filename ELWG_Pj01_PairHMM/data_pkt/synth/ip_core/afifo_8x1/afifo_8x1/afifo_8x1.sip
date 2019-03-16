set_global_assignment -entity "afifo_8x1" -library "lib_afifo_8x1" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "afifo_8x1" -library "lib_afifo_8x1" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "afifo_8x1" -library "lib_afifo_8x1" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_afifo_8x1" -name SPD_FILE [file join $::quartus(sip_path) "afifo_8x1.spd"]
set_global_assignment -library "lib_afifo_8x1" -name MISC_FILE [file join $::quartus(sip_path) "../afifo_8x1.qsys"]

set_global_assignment -library "lib_afifo_8x1" -name MISC_FILE [file join $::quartus(sip_path) "sim/afifo_8x1.v"]
set_global_assignment -library "lib_afifo_8x1" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/afifo_8x1_fifo_161_rgwi5iq.v"]
set_global_assignment -library "lib_afifo_8x1" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/afifo_8x1_fifo_161_rgwi5iq.sdc"]
