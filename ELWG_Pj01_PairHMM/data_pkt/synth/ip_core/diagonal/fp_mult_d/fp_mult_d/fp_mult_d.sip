set_global_assignment -entity "fp_mult_d" -library "lib_fp_mult_d" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "fp_mult_d" -library "lib_fp_mult_d" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "fp_mult_d" -library "lib_fp_mult_d" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_fp_mult_d" -name SPD_FILE [file join $::quartus(sip_path) "fp_mult_d.spd"]
set_global_assignment -library "lib_fp_mult_d" -name MISC_FILE [file join $::quartus(sip_path) "../fp_mult_d.qsys"]

set_global_assignment -library "lib_fp_mult_d" -name MISC_FILE [file join $::quartus(sip_path) "sim/fp_mult_d.v"]
set_global_assignment -library "lib_fp_mult_d" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fp_mult_d" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/dspba_library.vhd"]
set_global_assignment -library "lib_fp_mult_d" -name MISC_FILE [file join $::quartus(sip_path) "altera_fp_functions_161/sim/fp_mult_d_altera_fp_functions_161_qww3g2q.vhd"]
