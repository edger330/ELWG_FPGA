set_global_assignment -entity "fifo_8x512_dis" -library "lib_fifo_8x512_dis" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fifo_8x512_dis" -library "lib_fifo_8x512_dis" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fifo_8x512_dis" -library "lib_fifo_8x512_dis" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fifo_8x512_dis" -name SPD_FILE [file join $::quartus(sip_path) "fifo_8x512_dis.spd"]
set_global_assignment -library "lib_fifo_8x512_dis" -name MISC_FILE [file join $::quartus(sip_path) "../fifo_8x512_dis.qsys"]

set_global_assignment -library "lib_fifo_8x512_dis" -name MISC_FILE [file join $::quartus(sip_path) "sim/fifo_8x512_dis.v"]
set_global_assignment -library "lib_fifo_8x512_dis" -name MISC_FILE [file join $::quartus(sip_path) "fifo_161/sim/fifo_8x512_dis_fifo_161_niqd2pa.v"]
