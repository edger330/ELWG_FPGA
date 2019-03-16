// (C) 2001-2016 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.



///////////////////////////////////////////////////////////////////////////////
// This module handles the creation and wiring of the HPS clock/reset signals.
//
///////////////////////////////////////////////////////////////////////////////

// altera message_off 10036

 module altera_emif_arch_nf_hps_clks_rsts #(
   parameter IS_VID                                  = 0,
   parameter PORT_CLKS_SHARING_MASTER_OUT_WIDTH      = 32,
   parameter PORT_CLKS_SHARING_SLAVE_IN_WIDTH        = 32,
   parameter PORT_DFT_NF_CORE_CLK_BUF_OUT_WIDTH      = 1,
   parameter PORT_DFT_NF_CORE_CLK_LOCKED_WIDTH       = 1,
   parameter PORT_HPS_EMIF_H2E_GP_WIDTH              = 1,
   parameter PHY_USERMODE_OCT                        = 0,
   parameter PHY_HPS_ENABLE_EARLY_RELEASE            = 0
) (
   // For a master interface, the PLL ref clock and the global reset signal
   // come from an external source from user logic, via the following ports. 
   // For slave interfaces, they come from the master via the sharing interface.
   // The connectivity ensures that all interfaces in a master/slave
   // configuration share the same ref clock and global reset, which is
   // one of the requirements for core-clock sharing.
   input  logic                                                 pll_ref_clk,
   input  logic                                                 global_reset_n,
   
   // This signal is connected to the SmartVID controller, and signals EMIF to 
   // only calibrate after SmartVID is done voltage calibration.
   input  logic                                                 vid_cal_done_persist,
   
   // For a master interface, the core reset signal is generated by synchronizing
   // the deassertion of the async reset coming from the hard PHY via the following
   // port, to the core clock signal. 
   // For slave interfaces, the core reset signal comes from the master 
   // via the sharing interface. 
   input  logic                                                 phy_reset_n,
   
   // Feedback signals to CPA via the core
   output logic [1:0]                                           core_clks_fb_to_cpa_pri,
   output logic [1:0]                                           core_clks_fb_to_cpa_sec,
   
   // The following is the master/slave sharing interfaces.
   input  logic [PORT_CLKS_SHARING_SLAVE_IN_WIDTH-1:0]          clks_sharing_slave_in,
   output logic [PORT_CLKS_SHARING_MASTER_OUT_WIDTH-1:0]        clks_sharing_master_out,
   
   // The following are the actual pll ref clock and global reset signals that
   // will be used internally by the rest of the IP.
   output logic                                                 pll_ref_clk_int,
   output logic                                                 global_reset_n_int,
   
   // The following are all the possible core clock/reset signals.
   // afi_* only exists in PHY-only mode (or if soft controller is used).
   // emif_usr_* only exists if hard memory controller is used.
   output logic                                                 afi_clk,
   output logic                                                 afi_half_clk,
   output logic                                                 afi_reset_n,

   output logic                                                 emif_usr_clk,
   output logic                                                 emif_usr_half_clk,
   output logic                                                 emif_usr_reset_n,
   
   output logic                                                 emif_usr_clk_sec,
   output logic                                                 emif_usr_half_clk_sec,
   output logic                                                 emif_usr_reset_n_sec,

   // The calibration slave core clock domain is used by core logic that serves
   // as Avalon slaves for the sequencer CPU. The clock comes directly from PLL C-counter
   // instead of from the CPA.
   output logic                                                 cal_slave_clk,
   output logic                                                 cal_slave_reset_n,
   
   // The calibration master core clock domain is used by core logic that serves
   // as Avalon masters for the sequencer calbus. The clock comes directly from PLL C-counter
   // instead of from the CPA.
   output logic                                                 cal_master_clk,
   output logic                                                 cal_master_reset_n,
   
   // The following signal is driven by the HPS to hard reset the EMIF PHY
   input  logic [PORT_HPS_EMIF_H2E_GP_WIDTH-1:0]                hps_to_emif_gp,

   // DFT
   output logic [PORT_DFT_NF_CORE_CLK_BUF_OUT_WIDTH-1:0]        dft_core_clk_buf_out,
   output logic [PORT_DFT_NF_CORE_CLK_LOCKED_WIDTH-1:0]         dft_core_clk_locked
);
   timeunit 1ns;
   timeprecision 1ps;
   
   // HPS clocks are not modeled for simulation.
   // Also in HPS mode we do not generate clocks that are visible to user logic.
   assign pll_ref_clk_int    = pll_ref_clk;

   generate
   if (IS_VID) begin : use_vid_persist_reset
      // Create register to capture path false path internal to EMIF block
      reg vid_cal_done_persist_reg;
      always_ff @(posedge pll_ref_clk) begin
         vid_cal_done_persist_reg <= vid_cal_done_persist;
      end
      if (PHY_USERMODE_OCT == 1) begin : gen_hps_reset
         assign global_reset_n_int = global_reset_n & hps_to_emif_gp[1] & vid_cal_done_persist_reg;
      end else begin : gen_nohps_reset
         assign global_reset_n_int = global_reset_n & vid_cal_done_persist_reg;
      end
   end else begin : default_reset
      if (PHY_USERMODE_OCT == 1) begin : gen_hps_reset
         assign global_reset_n_int = global_reset_n & hps_to_emif_gp[1];
      end else begin : gen_nohps_reset
         if (PHY_HPS_ENABLE_EARLY_RELEASE == 1) begin : gen_nohps_early_reset
            assign global_reset_n_int = 1'b1;
         end else begin : gen_nohps_normal_reset
            assign global_reset_n_int = global_reset_n;
         end
      end
   end
   endgenerate
   
   assign afi_clk                 = 1'b0;
   assign afi_half_clk            = 1'b0;
   assign afi_reset_n             = 1'b1;
   
   assign emif_usr_clk            = 1'b0;
   assign emif_usr_half_clk       = 1'b0;
   assign emif_usr_reset_n        = 1'b1;
   
   assign emif_usr_clk_sec        = 1'b0;
   assign emif_usr_half_clk_sec   = 1'b0;
   assign emif_usr_reset_n_sec    = 1'b1;
   
   assign core_clks_fb_to_cpa_pri = '0;
   assign core_clks_fb_to_cpa_sec = '0;
   assign clks_sharing_master_out = '0;

   assign cal_master_clk          = 1'b0;
   assign cal_master_reset_n      = 1'b1;
   
   assign cal_slave_clk           = 1'b0;
   assign cal_slave_reset_n       = 1'b1;
   
   assign dft_core_clk_locked     = '0;
   assign dft_core_clk_buf_out    = '0;
   
endmodule
