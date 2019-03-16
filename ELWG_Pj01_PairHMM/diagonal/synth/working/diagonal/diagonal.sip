set_global_assignment -entity "diagonal" -library "lib_diagonal" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "diagonal" -library "lib_diagonal" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "diagonal" -library "lib_diagonal" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_diagonal" -name SPD_FILE [file join $::quartus(sip_path) "diagonal.spd"]
set_global_assignment -library "lib_diagonal" -name MISC_FILE [file join $::quartus(sip_path) "../diagonal.qsys"]

set_global_assignment -library "lib_diagonal" -name MISC_FILE [file join $::quartus(sip_path) "sim/diagonal.v"]
set_global_assignment -library "lib_diagonal" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_diagonal" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/dspba_library.vhd"]
set_global_assignment -library "lib_diagonal" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/diagonal_altera_fp_functions_161_4gfcm3q.vhd"]
