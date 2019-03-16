set_global_assignment -entity "Rom_Check1" -library "lib_Rom_Check1" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "Rom_Check1" -library "lib_Rom_Check1" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "Rom_Check1" -library "lib_Rom_Check1" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_Rom_Check1" -name SPD_FILE [file join $::quartus(sip_path) "Rom_Check1.spd"]
set_global_assignment -library "lib_Rom_Check1" -name MISC_FILE [file join $::quartus(sip_path) "../Rom_Check1.qsys"]

set_global_assignment -library "lib_Rom_Check1" -name MISC_FILE [file join $::quartus(sip_path) "sim/Rom_Check1.v"]
set_global_assignment -library "lib_Rom_Check1" -name MISC_FILE [file join $::quartus(sip_path) "rom_1port_161/sim/Rom_Check1_rom_1port_161_rt54boq.v"]
