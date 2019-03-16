set_global_assignment -entity "pll_125m" -library "lib_pll_125m" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "pll_125m" -library "lib_pll_125m" -name IP_TOOL_VERSION "16.1"
set_global_assignment -entity "pll_125m" -library "lib_pll_125m" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_pll_125m" -name SPD_FILE [file join $::quartus(sip_path) "pll_125m.spd"]
set_global_assignment -library "lib_pll_125m" -name MISC_FILE [file join $::quartus(sip_path) "../pll_125m.qsys"]

set_global_assignment -library "lib_pll_125m" -name MISC_FILE [file join $::quartus(sip_path) "sim/pll_125m.v"]
set_global_assignment -library "lib_pll_125m" -name MISC_FILE [file join $::quartus(sip_path) "altera_iopll_161/sim/pll_125m_altera_iopll_161_5zboggi.vo"]
