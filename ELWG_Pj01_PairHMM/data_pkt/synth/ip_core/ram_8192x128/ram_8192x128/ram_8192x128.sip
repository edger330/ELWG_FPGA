set_global_assignment -entity "ram_8192x128" -library "lib_ram_8192x128" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "ram_8192x128" -library "lib_ram_8192x128" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "ram_8192x128" -library "lib_ram_8192x128" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_ram_8192x128" -name SPD_FILE [file join $::quartus(sip_path) "ram_8192x128.spd"]
set_global_assignment -library "lib_ram_8192x128" -name MISC_FILE [file join $::quartus(sip_path) "../ram_8192x128.qsys"]

set_global_assignment -library "lib_ram_8192x128" -name MISC_FILE [file join $::quartus(sip_path) "sim/ram_8192x128.v"]
set_global_assignment -library "lib_ram_8192x128" -name MISC_FILE [file join $::quartus(sip_path) "ram_2port_161/sim/ram_8192x128_ram_2port_161_rjsjy2a.v"]
