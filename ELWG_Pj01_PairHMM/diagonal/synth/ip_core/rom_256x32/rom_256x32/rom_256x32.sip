set_global_assignment -entity "rom_256x32" -library "lib_rom_256x32" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "rom_256x32" -library "lib_rom_256x32" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "rom_256x32" -library "lib_rom_256x32" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_rom_256x32" -name SPD_FILE [file join $::quartus(sip_path) "rom_256x32.spd"]
set_global_assignment -library "lib_rom_256x32" -name MISC_FILE [file join $::quartus(sip_path) "../rom_256x32.qsys"]

set_global_assignment -library "lib_rom_256x32" -name MISC_FILE [file join $::quartus(sip_path) "sim/rom_256x32.v"]
set_global_assignment -library "lib_rom_256x32" -name MISC_FILE [file join $::quartus(sip_path) "rom_1port_161/sim/rom_256x32_rom_1port_161_n3fz64y.v"]
