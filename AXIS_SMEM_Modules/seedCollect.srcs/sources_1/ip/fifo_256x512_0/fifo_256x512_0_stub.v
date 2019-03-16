// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Aug  7 11:34:54 2018
// Host        : DESKTOP-80OJBTC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               E:/projects/seedCollect/seedCollect.srcs/sources_1/ip/fifo_256x512_0/fifo_256x512_0_stub.v
// Design      : fifo_256x512_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "fifo_generator_v13_2_1,Vivado 2017.4" *)
module fifo_256x512_0(clk, srst, din, wr_en, rd_en, dout, full, empty, 
  rd_data_count, wr_rst_busy, rd_rst_busy)
/* synthesis syn_black_box black_box_pad_pin="clk,srst,din[127:0],wr_en,rd_en,dout[255:0],full,empty,rd_data_count[11:0],wr_rst_busy,rd_rst_busy" */;
  input clk;
  input srst;
  input [127:0]din;
  input wr_en;
  input rd_en;
  output [255:0]dout;
  output full;
  output empty;
  output [11:0]rd_data_count;
  output wr_rst_busy;
  output rd_rst_busy;
endmodule
