
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
# vcs - auto-generated simulation script

# ----------------------------------------
# This script provides commands to simulate the following IP detected in
# your Quartus project:
#     ddr4_core
# 
# Altera recommends that you source this Quartus-generated IP simulation
# script from your own customized top-level script, and avoid editing this
# generated script.
# 
# To write a top-level shell script that compiles Altera simulation libraries
# and the Quartus-generated IP in your project, along with your design and
# testbench files, follow the guidelines below.
# 
# 1) Copy the shell script text from the TOP-LEVEL TEMPLATE section
# below into a new file, e.g. named "vcs_sim.sh".
# 
# 2) Copy the text from the DESIGN FILE LIST & OPTIONS TEMPLATE section into
# a separate file, e.g. named "filelist.f".
# 
# ----------------------------------------
# # TOP-LEVEL TEMPLATE - BEGIN
# #
# # TOP_LEVEL_NAME is used in the Quartus-generated IP simulation script to
# # set the top-level simulation or testbench module/entity name.
# #
# # QSYS_SIMDIR is used in the Quartus-generated IP simulation script to
# # construct paths to the files required to simulate the IP in your Quartus
# # project. By default, the IP script assumes that you are launching the
# # simulator from the IP script location. If launching from another
# # location, set QSYS_SIMDIR to the output directory you specified when you
# # generated the IP script, relative to the directory from which you launch
# # the simulator.
# #
# # Source the Quartus-generated IP simulation script and do the following:
# # - Compile the Quartus EDA simulation library and IP simulation files.
# # - Specify TOP_LEVEL_NAME and QSYS_SIMDIR.
# # - Compile the design and top-level simulation module/entity using
# #   information specified in "filelist.f".
# # - Override the default USER_DEFINED_SIM_OPTIONS. For example, to run
# #   until $finish(), set to an empty string: USER_DEFINED_SIM_OPTIONS="".
# # - Run the simulation.
# #
# source <script generation output directory>/synopsys/vcs/vcs_setup.sh \
# TOP_LEVEL_NAME=<simulation top> \
# QSYS_SIMDIR=<script generation output directory> \
# USER_DEFINED_ELAB_OPTIONS="\"-f filelist.f\"" \
# USER_DEFINED_SIM_OPTIONS=<simulation options for your design>
# #
# # TOP-LEVEL TEMPLATE - END
# ----------------------------------------
# 
# ----------------------------------------
# # DESIGN FILE LIST & OPTIONS TEMPLATE - BEGIN
# #
# # Compile all design files and testbench files, including the top level.
# # (These are all the files required for simulation other than the files
# # compiled by the Quartus-generated IP simulation script)
# #
# +systemverilogext+.sv
# <design and testbench files, compile-time options, elaboration options>
# #
# # DESIGN FILE LIST & OPTIONS TEMPLATE - END
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
# ACDS 16.1 196 linux 2017.10.21.17:48:11
# ----------------------------------------
# initialize variables
TOP_LEVEL_NAME="ddr4_core"
QSYS_SIMDIR="./../../"
QUARTUS_INSTALL_DIR="/home/gpu_server4/intelFPGA/16.1/quartus/"
SKIP_FILE_COPY=0
SKIP_SIM=0
USER_DEFINED_ELAB_OPTIONS=""
USER_DEFINED_SIM_OPTIONS="+vcs+finish+100"
# ----------------------------------------
# overwrite variables - DO NOT MODIFY!
# This block evaluates each command line argument, typically used for 
# overwriting variables. An example usage:
#   sh <simulator>_setup.sh SKIP_SIM=1
for expression in "$@"; do
  eval $expression
  if [ $? -ne 0 ]; then
    echo "Error: This command line argument, \"$expression\", is/has an invalid expression." >&2
    exit $?
  fi
done

# ----------------------------------------
# initialize simulation properties - DO NOT MODIFY!
ELAB_OPTIONS=""
SIM_OPTIONS=""
if [[ `vcs -platform` != *"amd64"* ]]; then
  :
else
  :
fi

# ----------------------------------------
# copy RAM/ROM files to simulation directory
if [ $SKIP_FILE_COPY -eq 0 ]; then
  cp -f $QSYS_SIMDIR/../altera_avalon_onchip_memory2_161/sim/seq_cal_soft_m20k.hex ./
  cp -f $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_seq_params_sim.hex ./
  cp -f $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_seq_params_synth.hex ./
  cp -f $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_seq_cal.hex ./
fi

vcs -lca -timescale=1ps/1ps -sverilog +verilog2001ext+.v -ntb_opts dtm $ELAB_OPTIONS $USER_DEFINED_ELAB_OPTIONS \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_primitives.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/220model.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/sgate.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_mf.v \
  $QUARTUS_INSTALL_DIR/eda/sim_lib/altera_lnsim.sv \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/twentynm_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/twentynm_hssi_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hssi_atoms.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/synopsys/twentynm_hip_atoms_ncrypt.v \
  -v $QUARTUS_INSTALL_DIR/eda/sim_lib/twentynm_hip_atoms.v \
  $QSYS_SIMDIR/../channel_adapter_161/sim/ddr4_core_channel_adapter_161_xd7xncy.sv \
  $QSYS_SIMDIR/../channel_adapter_161/sim/ddr4_core_channel_adapter_161_fcviibi.sv \
  $QSYS_SIMDIR/../altera_avalon_packets_to_master_161/sim/altera_avalon_packets_to_master.v \
  $QSYS_SIMDIR/../altera_avalon_st_packets_to_bytes_161/sim/altera_avalon_st_packets_to_bytes.v \
  $QSYS_SIMDIR/../altera_avalon_st_bytes_to_packets_161/sim/altera_avalon_st_bytes_to_packets.v \
  $QSYS_SIMDIR/../altera_avalon_sc_fifo_161/sim/altera_avalon_sc_fifo.v \
  $QSYS_SIMDIR/../timing_adapter_161/sim/ddr4_core_timing_adapter_161_u532i6q.sv \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_jtag_interface.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_jtag_dc_streaming.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_jtag_sld_node.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_jtag_streaming.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_clock_crosser.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_std_synchronizer_nocut.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_pipeline_base.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_idle_remover.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_idle_inserter.v \
  $QSYS_SIMDIR/../altera_jtag_dc_streaming_161/sim/altera_avalon_st_pipeline_stage.sv \
  $QSYS_SIMDIR/../altera_merlin_slave_translator_161/sim/altera_merlin_slave_translator.sv \
  $QSYS_SIMDIR/../altera_merlin_master_translator_161/sim/altera_merlin_master_translator.sv \
  $QSYS_SIMDIR/../altera_reset_controller_161/sim/altera_reset_controller.v \
  $QSYS_SIMDIR/../altera_reset_controller_161/sim/altera_reset_synchronizer.v \
  $QSYS_SIMDIR/../altera_mm_interconnect_161/sim/ddr4_core_altera_mm_interconnect_161_rjywn6y.v \
  $QSYS_SIMDIR/../altera_avalon_onchip_memory2_161/sim/ddr4_core_altera_avalon_onchip_memory2_161_ouhlr2a.v \
  $QSYS_SIMDIR/../altera_mm_interconnect_161/sim/ddr4_core_altera_mm_interconnect_161_x5yuuaa.v \
  $QSYS_SIMDIR/../alt_mem_if_jtag_master_161/sim/ddr4_core_alt_mem_if_jtag_master_161_s34bviy.v \
  $QSYS_SIMDIR/../altera_avalon_mm_bridge_161/sim/altera_avalon_mm_bridge.v \
  $QSYS_SIMDIR/../altera_mm_interconnect_161/sim/ddr4_core_altera_mm_interconnect_161_wl6t3li.v \
  $QSYS_SIMDIR/../altera_emif_cal_slave_nf_161/sim/ddr4_core_altera_emif_cal_slave_nf_161_m6azz7i.v \
  $QSYS_SIMDIR/../altera_ip_col_if_161/sim/ddr4_core_altera_ip_col_if_161_foc7v3q.v \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_top.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi_io_aux.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/ddr4_core_altera_emif_arch_nf_161_bgkg3xi.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_bufs.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_se_i.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_se_o.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_df_i.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_df_o.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_udir_cp_i.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_bdir_df.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_bdir_se.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_buf_unused.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_pll.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_pll_fast_sim.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_pll_extra_clks.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_oct.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_core_clks_rsts.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hps_clks_rsts.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_io_tiles_wrap.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_io_tiles.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_io_tiles_abphy.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_abphy_mux.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_avl_if.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_sideband_if.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_mmr_if.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_amm_data_if.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_hmc_ast_data_if.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_afi_if.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_seq_if.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_emif_arch_nf_regs.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_oct.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/altera_oct_um_fsm.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/mem_array_abphy.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/twentynm_io_12_lane_abphy.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/twentynm_io_12_lane_encrypted_abphy.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/twentynm_io_12_lane_nf5es_encrypted_abphy.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/io_12_lane_bcm__nf5es_abphy.sv \
  $QSYS_SIMDIR/../altera_emif_arch_nf_161/sim/io_12_lane__nf5es_abphy.sv \
  $QSYS_SIMDIR/../altera_emif_161/sim/ddr4_core_altera_emif_161_lsd7o4q.v \
  $QSYS_SIMDIR/ddr4_core.v \
  -top $TOP_LEVEL_NAME
# ----------------------------------------
# simulate
if [ $SKIP_SIM -eq 0 ]; then
  ./simv $SIM_OPTIONS $USER_DEFINED_SIM_OPTIONS
fi
