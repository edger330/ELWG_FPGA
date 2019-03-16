set_global_assignment -entity "fp_mult" -library "lib_fp_mult" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fp_mult" -library "lib_fp_mult" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fp_mult" -library "lib_fp_mult" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fp_mult" -name SPD_FILE [file join $::quartus(sip_path) "fp_mult.spd"]
set_global_assignment -library "lib_fp_mult" -name MISC_FILE [file join $::quartus(sip_path) "../fp_mult.qsys"]

set_global_assignment -library "lib_fp_mult" -name MISC_FILE [file join $::quartus(sip_path) "sim/fp_mult.v"]
set_global_assignment -library "lib_fp_mult" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_mult" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_mult" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/fp_mult_altera_fp_functions_161_5joiagi.vhd"]
