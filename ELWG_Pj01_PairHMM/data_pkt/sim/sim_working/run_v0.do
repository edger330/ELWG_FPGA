transcript file ""
transcript file tb.log

vlib work
vmap work work

 

vlog "F:/data_pkt/synth/ip_core/ram_2_port_32x8_32/ram_2_port_32x8_32/ram_2port_161/sim/ram_2_port_32x8_32_ram_2port_161_nja676i.v" 
vlog "F:/data_pkt/synth/ip_core/ram_2_port_32x8_32/ram_2_port_32x8_32/sim/ram_2_port_32x8_32.v"     


vlog  "F:/data_pkt/synth/ip_core/ram_2_port_9600x128_8/ram_2_port_9600x128_8/ram_2port_161/sim/ram_2_port_9600x128_8_ram_2port_161_crzok3y.v" 
vlog  "F:/data_pkt/synth/ip_core/ram_2_port_9600x128_8/ram_2_port_9600x128_8/sim/ram_2_port_9600x128_8.v"  


vlog "F:/data_pkt/synth/ip_core/ram_2_port_102400x8/ram_2_port_102400x8/ram_2port_161/sim/ram_2_port_102400x8_ram_2port_161_lizdoxy.v" 
vlog "F:/data_pkt/synth/ip_core/ram_2_port_102400x8/ram_2_port_102400x8/sim/ram_2_port_102400x8.v" 

vlog "F:/data_pkt/synth/ip_core/ram_2_port_8192x8/ram_2_port_8192x8/ram_2port_161/sim/ram_2_port_8192x8_ram_2port_161_n5r7w6y.v" 
vlog "F:/data_pkt/synth/ip_core/ram_2_port_8192x8/ram_2_port_8192x8/sim/ram_2_port_8192x8.v"                                                        

vlog "F:/data_pkt/synth/ip_core/rom_512x32/rom_512x32/rom_1port_161/sim/rom_512x32_rom_1port_161_rdwfe6y.v" 
vlog "F:/data_pkt/synth/ip_core/rom_512x32/rom_512x32/sim/rom_512x32.v" 

vlog "F:/data_pkt/synth/ip_core/rom_128x16/rom_128x16/rom_1port_161/sim/rom_128x16_rom_1port_161_fqxh2ei.v" 
vlog "F:/data_pkt/synth/ip_core/rom_128x16/rom_128x16/sim/rom_128x16.v"   

vlog "F:/data_pkt/synth/ip_core/ram_2_port_8192x32/ram_2_port_8192x32/ram_2port_161/sim/ram_2_port_8192x32_ram_2port_161_5d6pisa.v" 
vlog "F:/data_pkt/synth/ip_core/ram_2_port_8192x32/ram_2_port_8192x32/sim/ram_2_port_8192x32.v" 

vlog "F:/data_pkt/synth/ip_core/rom_16384x32/rom_16384x32/rom_1port_161/sim/rom_16384x32_rom_1port_161_ys2v4dq.v" 
vlog "F:/data_pkt/synth/ip_core/rom_16384x32/rom_16384x32/sim/rom_16384x32.v"      

vcom "F:/data_pkt/synth/ip_core/fp_mul_32/fp_mul_32/altera_fp_functions_161/sim/dspba_library_package.vhd"                     
vcom "F:/data_pkt/synth/ip_core/fp_mul_32/fp_mul_32/altera_fp_functions_161/sim/dspba_library.vhd"                             
vcom "F:/data_pkt/synth/ip_core/fp_mul_32/fp_mul_32/altera_fp_functions_161/sim/fp_mul_32_altera_fp_functions_161_buvpzaq.vhd" 
vlog "F:/data_pkt/synth/ip_core/fp_mul_32/fp_mul_32/sim/fp_mul_32.v" 

vlog "F:/data_pkt/synth/ip_core/fifo_1024x32/fifo_1024x32/fifo_161/sim/fifo_1024x32_fifo_161_2hu64yq.v" 
vlog "F:/data_pkt/synth/ip_core/fifo_1024x32/fifo_1024x32/sim/fifo_1024x32.v"      


vlog "F:/data_pkt/synth/ip_core/rom_y_initial/rom_y_initial/rom_1port_161/sim/rom_y_initial_rom_1port_161_6afnwmy.v"
vlog "F:/data_pkt/synth/ip_core/rom_y_initial/rom_y_initial/sim/rom_y_initial.v"   




vlog -incr +define+FSDB -f run.f

vsim  -novopt -t ps   -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip -pli novas.dll work.test

#vsim  -novopt -t ps -L ram_2port_161 -L fifo_161 -L lpm_mult_161 -L lpm_divide_161  -L altera_gpio_core20_161 -L altera_gpio_161 -L altera_fp_functions_161 -L rom_1port_161 -L altera_fft_ii_161 -L altera_merlin_slave_translator_161 -L altera_merlin_master_translator_161 -L altera_reset_controller_161 -L altera_mm_interconnect_161 -L altera_avalon_onchip_memory2_161 -L altera_avalon_mm_bridge_161 -L altera_emif_ioaux_master_161 -L altera_emif_arch_nf_161 -L altera_emif_161  -L altera_fir_compiler_ii_161 -L altera_cic_ii_161 -L altera_nco_ii_161 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip -pli novas.dll work.test

#vsim  -novopt -t ps -L ram_2port_161 -L fifo_161 -L lpm_mult_161 -L lpm_divide_161  -L altera_fp_functions_161 -L rom_1port_161 -L altera_fft_ii_161  -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L twentynm -L twentynm_hssi -L twentynm_hip -pli novas.dll work.test


run  -all

quit -f



