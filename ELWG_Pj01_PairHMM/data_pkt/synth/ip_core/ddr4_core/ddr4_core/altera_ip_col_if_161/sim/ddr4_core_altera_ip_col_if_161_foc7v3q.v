// ddr4_core_altera_ip_col_if_161_foc7v3q.v

// This file was auto-generated from altera_ip_col_if_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module ddr4_core_altera_ip_col_if_161_foc7v3q (
		input  wire        avl_clk_in_clk,         //  avl_clk_in.clk
		output wire        avl_clk_out_clk,        // avl_clk_out.clk
		input  wire        avl_rst_in_reset,       //  avl_rst_in.reset
		output wire        avl_rst_out_reset,      // avl_rst_out.reset
		input  wire        to_ioaux_waitrequest,   //    to_ioaux.waitrequest
		input  wire [31:0] to_ioaux_readdata,      //            .readdata
		input  wire        to_ioaux_readdatavalid, //            .readdatavalid
		output wire [0:0]  to_ioaux_burstcount,    //            .burstcount
		output wire [31:0] to_ioaux_writedata,     //            .writedata
		output wire [29:0] to_ioaux_address,       //            .address
		output wire        to_ioaux_write,         //            .write
		output wire        to_ioaux_read,          //            .read
		output wire [3:0]  to_ioaux_byteenable,    //            .byteenable
		output wire        to_ioaux_debugaccess    //            .debugaccess
	);

	wire  [31:0] colmaster_master_readdata;                         // mm_interconnect_0:colmaster_master_readdata -> colmaster:master_readdata
	wire         colmaster_master_waitrequest;                      // mm_interconnect_0:colmaster_master_waitrequest -> colmaster:master_waitrequest
	wire  [31:0] colmaster_master_address;                          // colmaster:master_address -> mm_interconnect_0:colmaster_master_address
	wire         colmaster_master_read;                             // colmaster:master_read -> mm_interconnect_0:colmaster_master_read
	wire   [3:0] colmaster_master_byteenable;                       // colmaster:master_byteenable -> mm_interconnect_0:colmaster_master_byteenable
	wire         colmaster_master_readdatavalid;                    // mm_interconnect_0:colmaster_master_readdatavalid -> colmaster:master_readdatavalid
	wire         colmaster_master_write;                            // colmaster:master_write -> mm_interconnect_0:colmaster_master_write
	wire  [31:0] colmaster_master_writedata;                        // colmaster:master_writedata -> mm_interconnect_0:colmaster_master_writedata
	wire  [31:0] mm_interconnect_0_avl_bridge_out_s0_readdata;      // avl_bridge_out:s0_readdata -> mm_interconnect_0:avl_bridge_out_s0_readdata
	wire         mm_interconnect_0_avl_bridge_out_s0_waitrequest;   // avl_bridge_out:s0_waitrequest -> mm_interconnect_0:avl_bridge_out_s0_waitrequest
	wire         mm_interconnect_0_avl_bridge_out_s0_debugaccess;   // mm_interconnect_0:avl_bridge_out_s0_debugaccess -> avl_bridge_out:s0_debugaccess
	wire  [29:0] mm_interconnect_0_avl_bridge_out_s0_address;       // mm_interconnect_0:avl_bridge_out_s0_address -> avl_bridge_out:s0_address
	wire         mm_interconnect_0_avl_bridge_out_s0_read;          // mm_interconnect_0:avl_bridge_out_s0_read -> avl_bridge_out:s0_read
	wire   [3:0] mm_interconnect_0_avl_bridge_out_s0_byteenable;    // mm_interconnect_0:avl_bridge_out_s0_byteenable -> avl_bridge_out:s0_byteenable
	wire         mm_interconnect_0_avl_bridge_out_s0_readdatavalid; // avl_bridge_out:s0_readdatavalid -> mm_interconnect_0:avl_bridge_out_s0_readdatavalid
	wire         mm_interconnect_0_avl_bridge_out_s0_write;         // mm_interconnect_0:avl_bridge_out_s0_write -> avl_bridge_out:s0_write
	wire  [31:0] mm_interconnect_0_avl_bridge_out_s0_writedata;     // mm_interconnect_0:avl_bridge_out_s0_writedata -> avl_bridge_out:s0_writedata
	wire   [0:0] mm_interconnect_0_avl_bridge_out_s0_burstcount;    // mm_interconnect_0:avl_bridge_out_s0_burstcount -> avl_bridge_out:s0_burstcount

	altera_avalon_mm_bridge #(
		.DATA_WIDTH        (32),
		.SYMBOL_WIDTH      (8),
		.HDL_ADDR_WIDTH    (30),
		.BURSTCOUNT_WIDTH  (1),
		.PIPELINE_COMMAND  (1),
		.PIPELINE_RESPONSE (1)
	) avl_bridge_out (
		.clk              (avl_clk_in_clk),                                    //   clk.clk
		.reset            (avl_rst_in_reset),                                  // reset.reset
		.s0_waitrequest   (mm_interconnect_0_avl_bridge_out_s0_waitrequest),   //    s0.waitrequest
		.s0_readdata      (mm_interconnect_0_avl_bridge_out_s0_readdata),      //      .readdata
		.s0_readdatavalid (mm_interconnect_0_avl_bridge_out_s0_readdatavalid), //      .readdatavalid
		.s0_burstcount    (mm_interconnect_0_avl_bridge_out_s0_burstcount),    //      .burstcount
		.s0_writedata     (mm_interconnect_0_avl_bridge_out_s0_writedata),     //      .writedata
		.s0_address       (mm_interconnect_0_avl_bridge_out_s0_address),       //      .address
		.s0_write         (mm_interconnect_0_avl_bridge_out_s0_write),         //      .write
		.s0_read          (mm_interconnect_0_avl_bridge_out_s0_read),          //      .read
		.s0_byteenable    (mm_interconnect_0_avl_bridge_out_s0_byteenable),    //      .byteenable
		.s0_debugaccess   (mm_interconnect_0_avl_bridge_out_s0_debugaccess),   //      .debugaccess
		.m0_waitrequest   (to_ioaux_waitrequest),                              //    m0.waitrequest
		.m0_readdata      (to_ioaux_readdata),                                 //      .readdata
		.m0_readdatavalid (to_ioaux_readdatavalid),                            //      .readdatavalid
		.m0_burstcount    (to_ioaux_burstcount),                               //      .burstcount
		.m0_writedata     (to_ioaux_writedata),                                //      .writedata
		.m0_address       (to_ioaux_address),                                  //      .address
		.m0_write         (to_ioaux_write),                                    //      .write
		.m0_read          (to_ioaux_read),                                     //      .read
		.m0_byteenable    (to_ioaux_byteenable),                               //      .byteenable
		.m0_debugaccess   (to_ioaux_debugaccess),                              //      .debugaccess
		.s0_response      (),                                                  // (terminated)
		.m0_response      (2'b00)                                              // (terminated)
	);

	ddr4_core_alt_mem_if_jtag_master_161_s34bviy #(
		.USE_PLI     (0),
		.PLI_PORT    (50000),
		.FIFO_DEPTHS (2)
	) colmaster (
		.clk_clk              (avl_clk_in_clk),                 //          clk.clk
		.clk_reset_reset      (avl_rst_in_reset),               //    clk_reset.reset
		.master_address       (colmaster_master_address),       //       master.address
		.master_readdata      (colmaster_master_readdata),      //             .readdata
		.master_read          (colmaster_master_read),          //             .read
		.master_write         (colmaster_master_write),         //             .write
		.master_writedata     (colmaster_master_writedata),     //             .writedata
		.master_waitrequest   (colmaster_master_waitrequest),   //             .waitrequest
		.master_readdatavalid (colmaster_master_readdatavalid), //             .readdatavalid
		.master_byteenable    (colmaster_master_byteenable),    //             .byteenable
		.master_reset_reset   ()                                // master_reset.reset
	);

	ddr4_core_altera_mm_interconnect_161_x5yuuaa mm_interconnect_0 (
		.clk_bridge_out_clk_1_clk                         (avl_clk_in_clk),                                    //                       clk_bridge_out_clk_1.clk
		.avl_bridge_out_reset_reset_bridge_in_reset_reset (avl_rst_in_reset),                                  // avl_bridge_out_reset_reset_bridge_in_reset.reset
		.colmaster_clk_reset_reset_bridge_in_reset_reset  (avl_rst_in_reset),                                  //  colmaster_clk_reset_reset_bridge_in_reset.reset
		.colmaster_master_address                         (colmaster_master_address),                          //                           colmaster_master.address
		.colmaster_master_waitrequest                     (colmaster_master_waitrequest),                      //                                           .waitrequest
		.colmaster_master_byteenable                      (colmaster_master_byteenable),                       //                                           .byteenable
		.colmaster_master_read                            (colmaster_master_read),                             //                                           .read
		.colmaster_master_readdata                        (colmaster_master_readdata),                         //                                           .readdata
		.colmaster_master_readdatavalid                   (colmaster_master_readdatavalid),                    //                                           .readdatavalid
		.colmaster_master_write                           (colmaster_master_write),                            //                                           .write
		.colmaster_master_writedata                       (colmaster_master_writedata),                        //                                           .writedata
		.avl_bridge_out_s0_address                        (mm_interconnect_0_avl_bridge_out_s0_address),       //                          avl_bridge_out_s0.address
		.avl_bridge_out_s0_write                          (mm_interconnect_0_avl_bridge_out_s0_write),         //                                           .write
		.avl_bridge_out_s0_read                           (mm_interconnect_0_avl_bridge_out_s0_read),          //                                           .read
		.avl_bridge_out_s0_readdata                       (mm_interconnect_0_avl_bridge_out_s0_readdata),      //                                           .readdata
		.avl_bridge_out_s0_writedata                      (mm_interconnect_0_avl_bridge_out_s0_writedata),     //                                           .writedata
		.avl_bridge_out_s0_burstcount                     (mm_interconnect_0_avl_bridge_out_s0_burstcount),    //                                           .burstcount
		.avl_bridge_out_s0_byteenable                     (mm_interconnect_0_avl_bridge_out_s0_byteenable),    //                                           .byteenable
		.avl_bridge_out_s0_readdatavalid                  (mm_interconnect_0_avl_bridge_out_s0_readdatavalid), //                                           .readdatavalid
		.avl_bridge_out_s0_waitrequest                    (mm_interconnect_0_avl_bridge_out_s0_waitrequest),   //                                           .waitrequest
		.avl_bridge_out_s0_debugaccess                    (mm_interconnect_0_avl_bridge_out_s0_debugaccess)    //                                           .debugaccess
	);

	assign avl_clk_out_clk = avl_clk_in_clk;

	assign avl_rst_out_reset = avl_rst_in_reset;

endmodule
