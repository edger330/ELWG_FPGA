// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Nov  2 15:31:57 2018
// Host        : DESKTOP-80OJBTC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub E:/projects/SW_zzt/SW_zzt.srcs/sources_1/ip/ADD/ADD_stub.v
// Design      : ADD
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *)
module ADD(A, B, CLK, SCLR, S)
/* synthesis syn_black_box black_box_pad_pin="A[15:0],B[15:0],CLK,SCLR,S[15:0]" */;
  input [15:0]A;
  input [15:0]B;
  input CLK;
  input SCLR;
  output [15:0]S;
endmodule
