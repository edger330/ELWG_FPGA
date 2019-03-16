
# (C) 2001-2017 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and 
# other software and tools, and its AMPP partner logic functions, and 
# any output files any of the foregoing (including device programming 
# or simulation files), and any associated documentation or information 
# are expressly subject to the terms and conditions of the Altera 
# Program License Subscription Agreement, Altera MegaCore Function 
# License Agreement, or other applicable license agreement, including, 
# without limitation, that your use is for the sole purpose of 
# programming logic devices manufactured by Altera and sold by Altera 
# or its authorized distributors. Please refer to the applicable 
# agreement for further details.

# ACDS 16.1 196 linux 2017.10.21.17:48:11
# ----------------------------------------
# Auto-generated simulation script rivierapro_setup.tcl
# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     ddr4_core
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level script that compiles Altera simulation libraries and
# the Quartus-generated IP in your project, along with your design and
# testbench files, copy the text from the TOP-LEVEL TEMPLATE section below
# into a new file, e.g. named "aldec.do", and modify the text as directed.
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# set QSYS_SIMDIR <script generation output directory>
# #
# # Source the generated IP simulation script.
# source $QSYS_SIMDIR/aldec/rivierapro_setup.tcl
# #
# # Set any compilation options you require (this is unusual).
# set USER_DEFINED_COMPILE_OPTIONS <compilation options>
# #
# # Call command to compile the Quartus EDA simulation library.
# dev_com
# #
# # Call command to compile the Quartus-generated IP simulation files.
# com
# #
# # Add commands to compile all design files and testbench files, including
# # the top level. (These are all the files required for simulation other
# # than the files compiled by the Quartus-generated IP simulation script)
# #
# vlog -sv2k5 <your compilation options> <design and testbench files>
# #
# # Set the top-level simulation or testbench module/entity name, which is
# # used by the elab command to elaborate the top level.
# #
# set TOP_LEVEL_NAME <simulation top>
# #
# # Set any elaboration options you require.
# set USER_DEFINED_ELAB_OPTIONS <elaboration options>
# #
# # Call command to elaborate your design and testbench.
# elab
# #
# # Run the simulation.
# run
# #
# # Report success to the shell.
# exit -code 0
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# IP SIMULATION SCRIPT
# ----------------------------------------
# If ddr4_core is one of several IP cores in your
# Quartus project, you can generate a simulation script
# suitable for inclusion in your top-level simulation
# script by running the following command line:
# 
# ip-setup-simulation --quartus-project=<quartus project>
# 
# ip-setup-simulation will discover the Altera IP
# within the Quartus project, and generate a unified
# script which supports all the Altera IP within the design.
# ----------------------------------------

# ----------------------------------------
# Initialize variables
if ![info exists SYSTEM_INSTANCE_NAME] { 
  set SYSTEM_INSTANCE_NAME ""
} elseif { ![ string match "" $SYSTEM_INSTANCE_NAME ] } { 
  set SYSTEM_INSTANCE_NAME "/$SYSTEM_INSTANCE_NAME"
}

if ![info exists TOP_LEVEL_NAME] { 
  set TOP_LEVEL_NAME "ddr4_core"
}

if ![info exists QSYS_SIMDIR] { 
  set QSYS_SIMDIR "./../"
}

if ![info exists QUARTUS_INSTALL_DIR] { 
  set QUARTUS_INSTALL_DIR "/home/gpu_server4/intelFPGA/16.1/quartus/"
}

if ![info exists USER_DEFINED_COMPILE_OPTIONS] { 
  set USER_DEFINED_COMPILE_OPTIONS ""
}
if ![info exists USER_DEFINED_ELAB_OPTIONS] { 
  set USER_DEFINED_ELAB_OPTIONS ""
}

# ----------------------------------------
# Initialize simulation properties - DO NOT MODIFY!
set ELAB_OPTIONS ""
set SIM_OPTIONS ""
if ![ string match "*-64 vsim*" [ vsim -version ] ] {
} else {
}

set Aldec "Riviera"
if { [ string match "*Active-HDL*" [ vsim -version ] ] } {
  set Aldec "Active"
}

if { [ string match "Active" $Aldec ] } {
  scripterconf -tcl
  createdesign "$TOP_LEVEL_NAME"  "."
  opendesign "$TOP_LEVEL_NAME"
}

# ----------------------------------------
# Copy ROM/RAM files to simulation directory
alias file_copy {
  echo "\[exec\] file_copy"
  file copy -force $QSYS_SIMDIR/../altera_avalon_onchip_memory2_161/sim/seq_cal_soft_m20k.hex ./
  file copy -force $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_seq_params_sim.hex ./
  file copy -force $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_seq_params_synth.hex ./
  file copy -force $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_seq_cal.hex ./
}

# ----------------------------------------
# Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib      ./libraries     
ensure_lib      ./libraries/work
vmap       work ./libraries/work
ensure_lib                   ./libraries/altera_ver       
vmap       altera_ver        ./libraries/altera_ver       
ensure_lib                   ./libraries/lpm_ver          
vmap       lpm_ver           ./libraries/lpm_ver          
ensure_lib                   ./libraries/sgate_ver        
vmap       sgate_ver         ./libraries/sgate_ver        
ensure_lib                   ./libraries/altera_mf_ver    
vmap       altera_mf_ver     ./libraries/altera_mf_ver    
ensure_lib                   ./libraries/altera_lnsim_ver 
vmap       altera_lnsim_ver  ./libraries/altera_lnsim_ver 
ensure_lib                   ./libraries/twentynm_ver     
vmap       twentynm_ver      ./libraries/twentynm_ver     
ensure_lib                   ./libraries/twentynm_hssi_ver
vmap       twentynm_hssi_ver ./libraries/twentynm_hssi_ver
ensure_lib                   ./libraries/twentynm_hip_ver 
vmap       twentynm_hip_ver  ./libraries/twentynm_hip_ver 
ensure_lib                                                 ./libraries/ddr4_core_channel_adapter_161                  
vmap       ddr4_core_channel_adapter_161                   ./libraries/ddr4_core_channel_adapter_161                  
ensure_lib                                                 ./libraries/ddr4_core_altera_avalon_packets_to_master_161  
vmap       ddr4_core_altera_avalon_packets_to_master_161   ./libraries/ddr4_core_altera_avalon_packets_to_master_161  
ensure_lib                                                 ./libraries/ddr4_core_altera_avalon_st_packets_to_bytes_161
vmap       ddr4_core_altera_avalon_st_packets_to_bytes_161 ./libraries/ddr4_core_altera_avalon_st_packets_to_bytes_161
ensure_lib                                                 ./libraries/ddr4_core_altera_avalon_st_bytes_to_packets_161
vmap       ddr4_core_altera_avalon_st_bytes_to_packets_161 ./libraries/ddr4_core_altera_avalon_st_bytes_to_packets_161
ensure_lib                                                 ./libraries/ddr4_core_altera_avalon_sc_fifo_161            
vmap       ddr4_core_altera_avalon_sc_fifo_161             ./libraries/ddr4_core_altera_avalon_sc_fifo_161            
ensure_lib                                                 ./libraries/ddr4_core_timing_adapter_161                   
vmap       ddr4_core_timing_adapter_161                    ./libraries/ddr4_core_timing_adapter_161                   
ensure_lib                                                 ./libraries/ddr4_core_altera_jtag_dc_streaming_161         
vmap       ddr4_core_altera_jtag_dc_streaming_161          ./libraries/ddr4_core_altera_jtag_dc_streaming_161         
ensure_lib                                                 ./libraries/ddr4_core_altera_merlin_slave_translator_161   
vmap       ddr4_core_altera_merlin_slave_translator_161    ./libraries/ddr4_core_altera_merlin_slave_translator_161   
ensure_lib                                                 ./libraries/ddr4_core_altera_merlin_master_translator_161  
vmap       ddr4_core_altera_merlin_master_translator_161   ./libraries/ddr4_core_altera_merlin_master_translator_161  
ensure_lib                                                 ./libraries/ddr4_core_altera_reset_controller_161          
vmap       ddr4_core_altera_reset_controller_161           ./libraries/ddr4_core_altera_reset_controller_161          
ensure_lib                                                 ./libraries/ddr4_core_altera_mm_interconnect_161           
vmap       ddr4_core_altera_mm_interconnect_161            ./libraries/ddr4_core_altera_mm_interconnect_161           
ensure_lib                                                 ./libraries/ddr4_core_altera_avalon_onchip_memory2_161     
vmap       ddr4_core_altera_avalon_onchip_memory2_161      ./libraries/ddr4_core_altera_avalon_onchip_memory2_161     
ensure_lib                                                 ./libraries/ddr4_core_alt_mem_if_jtag_master_161           
vmap       ddr4_core_alt_mem_if_jtag_master_161            ./libraries/ddr4_core_alt_mem_if_jtag_master_161           
ensure_lib                                                 ./libraries/ddr4_core_altera_avalon_mm_bridge_161          
vmap       ddr4_core_altera_avalon_mm_bridge_161           ./libraries/ddr4_core_altera_avalon_mm_bridge_161          
ensure_lib                                                 ./libraries/ddr4_core_altera_emif_cal_slave_nf_161         
vmap       ddr4_core_altera_emif_cal_slave_nf_161          ./libraries/ddr4_core_altera_emif_cal_slave_nf_161         
ensure_lib                                                 ./libraries/ddr4_core_altera_ip_col_if_161                 
vmap       ddr4_core_altera_ip_col_if_161                  ./libraries/ddr4_core_altera_ip_col_if_161                 
ensure_lib                                                 ./libraries/ddr4_core_altera_emif_arch_nf_161              
vmap       ddr4_core_altera_emif_arch_nf_161               ./libraries/ddr4_core_altera_emif_arch_nf_161              
ensure_lib                                                 ./libraries/ddr4_core_altera_emif_161                      
vmap       ddr4_core_altera_emif_161                       ./libraries/ddr4_core_altera_emif_161                      

# ----------------------------------------
# Compile device library files
alias dev_com {
  echo "\[exec\] dev_com"
  eval vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v"                -work altera_ver       
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v"                         -work lpm_ver          
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v"                            -work sgate_ver        
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v"                        -work altera_mf_ver    
  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv"                    -work altera_lnsim_ver 
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_atoms.v"                   -work twentynm_ver     
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/twentynm_atoms_ncrypt.v"      -work twentynm_ver     
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/twentynm_hssi_atoms_ncrypt.v" -work twentynm_hssi_ver
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_atoms.v"              -work twentynm_hssi_ver
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/aldec/twentynm_hip_atoms_ncrypt.v"  -work twentynm_hip_ver 
  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_atoms.v"               -work twentynm_hip_ver 
}

# ----------------------------------------
# Compile the design files in correct order
alias com {
  echo "\[exec\] com"
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../channel_adapter_161/sim/ddr4_core_channel_adapter_161_xd7xncy.sv"                          -work ddr4_core_channel_adapter_161                  
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../channel_adapter_161/sim/ddr4_core_channel_adapter_161_fcviibi.sv"                          -work ddr4_core_channel_adapter_161                  
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_avalon_packets_to_master_161/sim/altera_avalon_packets_to_master.v"                 -work ddr4_core_altera_avalon_packets_to_master_161  
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_avalon_st_packets_to_bytes_161/sim/altera_avalon_st_packets_to_bytes.v"             -work ddr4_core_altera_avalon_st_packets_to_bytes_161
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_avalon_st_bytes_to_packets_161/sim/altera_avalon_st_bytes_to_packets.v"             -work ddr4_core_altera_avalon_st_bytes_to_packets_161
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_avalon_sc_fifo_161/sim/altera_avalon_sc_fifo.v"                                     -work ddr4_core_altera_avalon_sc_fifo_161            
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../timing_adapter_161/sim/ddr4_core_timing_adapter_161_u532i6q.sv"                            -work ddr4_core_timing_adapter_161                   
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_jtag_interface.v"                        -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_jtag_dc_streaming.v"                               -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_jtag_sld_node.v"                                   -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_jtag_streaming.v"                                  -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_clock_crosser.v"                         -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_std_synchronizer_nocut.v"                          -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_pipeline_base.v"                         -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_idle_remover.v"                          -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_idle_inserter.v"                         -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_pipeline_stage.sv"                       -work ddr4_core_altera_jtag_dc_streaming_161         
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_merlin_slave_translator_161/sim/altera_merlin_slave_translator.sv"                  -work ddr4_core_altera_merlin_slave_translator_161   
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_merlin_master_translator_161/sim/altera_merlin_master_translator.sv"                -work ddr4_core_altera_merlin_master_translator_161  
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_reset_controller_161/sim/altera_reset_controller.v"                                 -work ddr4_core_altera_reset_controller_161          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_reset_controller_161/sim/altera_reset_synchronizer.v"                               -work ddr4_core_altera_reset_controller_161          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_mm_interconnect_161/sim/ddr4_core_altera_mm_interconnect_161_rjywn6y.v"             -work ddr4_core_altera_mm_interconnect_161           
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_avalon_onchip_memory2_161/sim/ddr4_core_altera_avalon_onchip_memory2_161_ouhlr2a.v" -work ddr4_core_altera_avalon_onchip_memory2_161     
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_mm_interconnect_161/sim/ddr4_core_altera_mm_interconnect_161_x5yuuaa.v"             -work ddr4_core_altera_mm_interconnect_161           
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../alt_mem_if_jtag_master_161/sim/ddr4_core_alt_mem_if_jtag_master_161_s34bviy.v"             -work ddr4_core_alt_mem_if_jtag_master_161           
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_avalon_mm_bridge_161/sim/altera_avalon_mm_bridge.v"                                 -work ddr4_core_altera_avalon_mm_bridge_161          
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_mm_interconnect_161/sim/ddr4_core_altera_mm_interconnect_161_wl6t3li.v"             -work ddr4_core_altera_mm_interconnect_161           
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_emif_cal_slave_nf_161/sim/ddr4_core_altera_emif_cal_slave_nf_161_m6azz7i.v"         -work ddr4_core_altera_emif_cal_slave_nf_161         
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_ip_col_if_161/sim/ddr4_core_altera_ip_col_if_161_foc7v3q.v"                         -work ddr4_core_altera_ip_col_if_161                 
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_top.sv"              -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_io_aux.sv"           -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi.sv"                  -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_bufs.sv"                                   -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_se_i.sv"                          -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_se_o.sv"                          -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_df_i.sv"                          -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_df_o.sv"                          -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_cp_i.sv"                          -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_bdir_df.sv"                            -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_bdir_se.sv"                            -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_unused.sv"                             -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_pll.sv"                                    -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_pll_fast_sim.sv"                           -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_pll_extra_clks.sv"                         -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_oct.sv"                                    -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_core_clks_rsts.sv"                         -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hps_clks_rsts.sv"                          -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_io_tiles_wrap.sv"                          -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_io_tiles.sv"                               -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_io_tiles_abphy.sv"                         -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_abphy_mux.sv"                              -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_avl_if.sv"                             -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_sideband_if.sv"                        -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_mmr_if.sv"                             -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_amm_data_if.sv"                        -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_ast_data_if.sv"                        -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_afi_if.sv"                                 -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_seq_if.sv"                                 -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_regs.sv"                                   -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_oct.sv"                                                 -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_oct_um_fsm.sv"                                          -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/mem_array_abphy.sv"                                            -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/twentynm_io_12_lane_abphy.sv"                                  -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/twentynm_io_12_lane_encrypted_abphy.sv"                        -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/twentynm_io_12_lane_nf5es_encrypted_abphy.sv"                  -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/io_12_lane_bcm__nf5es_abphy.sv"                                -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog  $USER_DEFINED_COMPILE_OPTIONS      "$QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/io_12_lane__nf5es_abphy.sv"                                    -work ddr4_core_altera_emif_arch_nf_161              
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/../altera_emif_161/sim/ddr4_core_altera_emif_161_lsd7o4q.v"                                   -work ddr4_core_altera_emif_161                      
  eval  vlog -v2k5 $USER_DEFINED_COMPILE_OPTIONS "$QSYS_SIMDIR/ddr4_core.v"                                                                                                                                       
}

# ----------------------------------------
# Elaborate top level design
alias elab {
  echo "\[exec\] elab"
  eval vsim +access +r -t ps $ELAB_OPTIONS -L work -L ddr4_core_channel_adapter_161 -L ddr4_core_altera_avalon_packets_to_master_161 -L ddr4_core_altera_avalon_st_packets_to_bytes_161 -L ddr4_core_altera_avalon_st_bytes_to_packets_161 -L ddr4_core_altera_avalon_sc_fifo_161 -L ddr4_core_timing_adapter_161 -L ddr4_core_altera_jtag_dc_streaming_161 -L ddr4_core_altera_merlin_slave_translator_161 -L ddr4_core_altera_merlin_master_translator_161 -L ddr4_core_altera_reset_controller_161 -L ddr4_core_altera_mm_interconnect_161 -L ddr4_core_altera_avalon_onchip_memory2_161 -L ddr4_core_alt_mem_if_jtag_master_161 -L ddr4_core_altera_avalon_mm_bridge_161 -L ddr4_core_altera_emif_cal_slave_nf_161 -L ddr4_core_altera_ip_col_if_161 -L ddr4_core_altera_emif_arch_nf_161 -L ddr4_core_altera_emif_161 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Elaborate the top level design with -dbg -O2 option
alias elab_debug {
  echo "\[exec\] elab_debug"
  eval vsim -dbg -O2 +access +r -t ps $ELAB_OPTIONS -L work -L ddr4_core_channel_adapter_161 -L ddr4_core_altera_avalon_packets_to_master_161 -L ddr4_core_altera_avalon_st_packets_to_bytes_161 -L ddr4_core_altera_avalon_st_bytes_to_packets_161 -L ddr4_core_altera_avalon_sc_fifo_161 -L ddr4_core_timing_adapter_161 -L ddr4_core_altera_jtag_dc_streaming_161 -L ddr4_core_altera_merlin_slave_translator_161 -L ddr4_core_altera_merlin_master_translator_161 -L ddr4_core_altera_reset_controller_161 -L ddr4_core_altera_mm_interconnect_161 -L ddr4_core_altera_avalon_onchip_memory2_161 -L ddr4_core_alt_mem_if_jtag_master_161 -L ddr4_core_altera_avalon_mm_bridge_161 -L ddr4_core_altera_emif_cal_slave_nf_161 -L ddr4_core_altera_ip_col_if_161 -L ddr4_core_altera_emif_arch_nf_161 -L ddr4_core_altera_emif_161 -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L twentynm_ver -L twentynm_hssi_ver -L twentynm_hip_ver $TOP_LEVEL_NAME
}

# ----------------------------------------
# Compile all the design files and elaborate the top level design
alias ld "
  dev_com
  com
  elab
"

# ----------------------------------------
# Compile all the design files and elaborate the top level design with -dbg -O2
alias ld_debug "
  dev_com
  com
  elab_debug
"

# ----------------------------------------
# Print out user commmand line aliases
alias h {
  echo "List Of Command Line Aliases"
  echo
  echo "file_copy                     -- Copy ROM/RAM files to simulation directory"
  echo
  echo "dev_com                       -- Compile device library files"
  echo
  echo "com                           -- Compile the design files in correct order"
  echo
  echo "elab                          -- Elaborate top level design"
  echo
  echo "elab_debug                    -- Elaborate the top level design with -dbg -O2 option"
  echo
  echo "ld                            -- Compile all the design files and elaborate the top level design"
  echo
  echo "ld_debug                      -- Compile all the design files and elaborate the top level design with -dbg -O2"
  echo
  echo 
  echo
  echo "List Of Variables"
  echo
  echo "TOP_LEVEL_NAME                -- Top level module name."
  echo "                                 For most designs, this should be overridden"
  echo "                                 to enable the elab/elab_debug aliases."
  echo
  echo "SYSTEM_INSTANCE_NAME          -- Instantiated system module name inside top level module."
  echo
  echo "QSYS_SIMDIR                   -- Qsys base simulation directory."
  echo
  echo "QUARTUS_INSTALL_DIR           -- Quartus installation directory."
  echo
  echo "USER_DEFINED_COMPILE_OPTIONS  -- User-defined compile options, added to com/dev_com aliases."
  echo
  echo "USER_DEFINED_ELAB_OPTIONS     -- User-defined elaboration options, added to elab/elab_debug aliases."
}
file_copy
h
