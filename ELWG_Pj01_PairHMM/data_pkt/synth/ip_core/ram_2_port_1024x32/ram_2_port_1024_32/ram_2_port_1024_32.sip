set_global_assignment -entity "ram_2_port_1024_32" -library "lib_ram_2_port_1024_32" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "ram_2_port_1024_32" -library "lib_ram_2_port_1024_32" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "ram_2_port_1024_32" -library "lib_ram_2_port_1024_32" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_ram_2_port_1024_32" -name SPD_FILE [file join $::quartus(sip_path) "ram_2_port_1024_32.spd"]
set_global_assignment -library "lib_ram_2_port_1024_32" -name MISC_FILE [file join $::quartus(sip_path) "../ram_2_port_1024_32.qsys"]

set_global_assignment -library "lib_ram_2_port_1024_32" -name MISC_FILE [file join $::quartus(sip_path) "sim/ram_2_port_1024_32.v"]
set_global_assignment -library "lib_ram_2_port_1024_32" -name MISC_FILE [file join $::quartus(sip_path) "ram_2port_161/sim/ram_2_port_1024_32_ram_2port_161_r5t2nhi.v"]
