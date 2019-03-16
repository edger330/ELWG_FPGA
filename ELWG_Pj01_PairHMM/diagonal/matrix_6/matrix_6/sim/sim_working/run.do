transcript file ""
transcript file tb.log

vlib work
vmap work work
 
vcom "../../synth/ip_core/fp_sub/fp_sub/altera_fp_functions_161/sim/dspba_library_package.vhd"                 
vcom "../../synth/ip_core/fp_sub/fp_sub/altera_fp_functions_161/sim/dspba_library.vhd"                         
vcom "../../synth/ip_core/fp_sub/fp_sub/altera_fp_functions_161/sim/fp_sub_altera_fp_functions_161_2aqu3xy.vhd"
vlog "../../synth/ip_core/fp_sub/fp_sub/sim/fp_sub.v"                                                                 

vlog "../../synth/ip_core/ram_2port_512x32/ram_2port_512x32/ram_2port_161/sim/ram_2port_512x32_ram_2port_161_wdhffea.v"
vlog "../../synth/ip_core/ram_2port_512x32/ram_2port_512x32/sim/ram_2port_512x32.v"                                           

 vlog "../../synth/ip_core/rom_256x32/rom_256x32/rom_1port_161/sim/rom_256x32_rom_1port_161_2qxtcda.v"
 vlog "../../synth/ip_core/rom_256x32/rom_256x32/sim/rom_256x32.v"                                           


 vlog "../../synth/ip_core/Rom_Check0/Rom_Check0/rom_1port_161/sim/Rom_Check0_rom_1port_161_yfdjnlq.v"
 vlog "../../synth/ip_core/Rom_Check0/Rom_Check0/sim/Rom_Check0.v"                                           


 vlog "../../synth/ip_core/Rom_Check1/Rom_Check1/rom_1port_161/sim/Rom_Check1_rom_1port_161_rt54boq.v"
 vlog "../../synth/ip_core/Rom_Check1/Rom_Check1/sim/Rom_Check1.v"                                           

vlog "../../synth/ip_core/Rom_Check2/Rom_Check2/rom_1port_161/sim/Rom_Check2_rom_1port_161_6cvufhq.v"
vlog "../../synth/ip_core/Rom_Check2/Rom_Check2/sim/Rom_Check2.v"                                           

vlog "../../synth/ip_core/fifo_M/fifo_M/fifo_161/sim/fifo_M_fifo_161_skz73ra.v"
vlog "../../synth/ip_core/fifo_M/fifo_M/sim/fifo_M.v"                                 

vlog "../../synth/ip_core/fifo_X/fifo_X/fifo_161/sim/fifo_X_fifo_161_skz73ra.v"
vlog "../../synth/ip_core/fifo_X/fifo_X/sim/fifo_X.v"                                 

vcom "../../synth/ip_core/fp_add/fp_add/altera_fp_functions_161/sim/dspba_library_package.vhd"                  
vcom "../../synth/ip_core/fp_add/fp_add/altera_fp_functions_161/sim/dspba_library.vhd"                          
vcom "../../synth/ip_core/fp_add/fp_add/altera_fp_functions_161/sim/fp_add_altera_fp_functions_161_vikdi5i.vhd" 
vlog "../../synth/ip_core/fp_add/fp_add/sim/fp_add.v"                                                                  

vcom "../../synth/ip_core/fp_mult/fp_mult/altera_fp_functions_161/sim/dspba_library_package.vhd"                   
vcom "../../synth/ip_core/fp_mult/fp_mult/altera_fp_functions_161/sim/dspba_library.vhd"                           
vcom "../../synth/ip_core/fp_mult/fp_mult/altera_fp_functions_161/sim/fp_mult_altera_fp_functions_161_5joiagi.vhd" 
vlog "../../synth/ip_core/fp_mult/fp_mult/sim/fp_mult.v"                                                                  

vlog "../../synth/ip_core/fifo_512x128/fifo_512x128/fifo_161/sim/fifo_512x128_fifo_161_myzf2pa.v"
vlog "../../synth/ip_core/fifo_512x128/fifo_512x128/sim/fifo_512x128.v"                                 

vlog "../../synth/ip_core/ram_9600x128/ram_9600x128/ram_2port_161/sim/ram_9600x128_ram_2port_161_6d7ia5i.v" 
vlog "../../synth/ip_core/ram_9600x128/ram_9600x128/sim/ram_9600x128.v"

vlog "../../synth/ip_core/fifo_512x32/fifo_512x32/fifo_161/sim/fifo_512x32_fifo_161_6hroaea.v" 
vlog "../../synth/ip_core/fifo_512x32/fifo_512x32/sim/fifo_512x32.v"                                  


vlog -incr +define+FSDB -f run.f

vsim  -novopt -t ps   -L  altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip -pli novas.dll work.test

#vsim  -novopt -t ps -L ram_2port_161 -L fifo_161 -L lpm_mult_161 -L lpm_divide_161  -L altera_gpio_core20_161 -L altera_gpio_161 -L altera_fp_functions_161 -L rom_1port_161 -L altera_fft_ii_161 -L altera_merlin_slave_translator_161 -L altera_merlin_master_translator_161 -L altera_reset_controller_161 -L altera_mm_interconnect_161 -L altera_avalon_onchip_memory2_161 -L altera_avalon_mm_bridge_161 -L altera_emif_ioaux_master_161 -L altera_emif_arch_nf_161 -L altera_emif_161  -L altera_fir_compiler_ii_161 -L altera_cic_ii_161 -L altera_nco_ii_161 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip -pli novas.dll work.test

#vsim  -novopt -t ps -L ram_2port_161 -L fifo_161 -L lpm_mult_161 -L lpm_divide_161  -L altera_fp_functions_161 -L rom_1port_161 -L altera_fft_ii_161  -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip -pli novas.dll work.test

run  -all

quit -f



