set_global_assignment -entity "Rom_Check2" -library "lib_Rom_Check2" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "Rom_Check2" -library "lib_Rom_Check2" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "Rom_Check2" -library "lib_Rom_Check2" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_Rom_Check2" -name SPD_FILE [file join $::quartus(sip_path) "Rom_Check2.spd"]
set_global_assignment -library "lib_Rom_Check2" -name MISC_FILE [file join $::quartus(sip_path) "../Rom_Check2.qsys"]

set_global_assignment -library "lib_Rom_Check2" -name MISC_FILE [file join $::quartus(sip_path) "sim/Rom_Check2.v"]
set_global_assignment -library "lib_Rom_Check2" -name MISC_FILE [file join $::quartus(sip_path) "rom_1port_161/sim/Rom_Check2_rom_1port_161_6cvufhq.v"]
