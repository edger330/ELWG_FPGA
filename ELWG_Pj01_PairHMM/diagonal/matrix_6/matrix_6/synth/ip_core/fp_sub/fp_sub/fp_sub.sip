set_global_assignment -entity "fp_sub" -library "lib_fp_sub" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fp_sub" -library "lib_fp_sub" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fp_sub" -library "lib_fp_sub" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fp_sub" -name SPD_FILE [file join $::quartus(sip_path) "fp_sub.spd"]
set_global_assignment -library "lib_fp_sub" -name MISC_FILE [file join $::quartus(sip_path) "../fp_sub.qsys"]

set_global_assignment -library "lib_fp_sub" -name MISC_FILE [file join $::quartus(sip_path) "sim/fp_sub.v"]
set_global_assignment -library "lib_fp_sub" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_sub" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_sub" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/fp_sub_altera_fp_functions_161_2aqu3xy.vhd"]
