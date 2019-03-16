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



// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module  fifo_256x128_fifo_161_q4rrtey  (
    data,
    rdclk,
    rdreq,
    wrclk,
    wrreq,
    q,
    rdempty,
    rdusedw,
    wrfull,
    wrusedw);

    input  [127:0]  data;
    input    rdclk;
    input    rdreq;
    input    wrclk;
    input    wrreq;
    output [511:0]  q;
    output   rdempty;
    output [5:0]  rdusedw;
    output   wrfull;
    output [7:0]  wrusedw;

    wire [511:0] sub_wire0;
    wire  sub_wire1;
    wire [5:0] sub_wire2;
    wire  sub_wire3;
    wire [7:0] sub_wire4;
    wire [511:0] q = sub_wire0[511:0];
    wire  rdempty = sub_wire1;
    wire [5:0] rdusedw = sub_wire2[5:0];
    wire  wrfull = sub_wire3;
    wire [7:0] wrusedw = sub_wire4[7:0];

    dcfifo_mixed_widths  dcfifo_mixed_widths_component (
                .data (data),
                .rdclk (rdclk),
                .rdreq (rdreq),
                .wrclk (wrclk),
                .wrreq (wrreq),
                .q (sub_wire0),
                .rdempty (sub_wire1),
                .rdusedw (sub_wire2),
                .wrfull (sub_wire3),
                .wrusedw (sub_wire4),
                .aclr (1'b0),
                .eccstatus (),
                .rdfull (),
                .wrempty ());
    defparam
        dcfifo_mixed_widths_component.enable_ecc  = "FALSE",
        dcfifo_mixed_widths_component.intended_device_family  = "Arria 10",
        dcfifo_mixed_widths_component.lpm_hint  = "DISABLE_DCFIFO_EMBEDDED_TIMING_CONSTRAINT=TRUE",
        dcfifo_mixed_widths_component.lpm_numwords  = 256,
        dcfifo_mixed_widths_component.lpm_showahead  = "ON",
        dcfifo_mixed_widths_component.lpm_type  = "dcfifo_mixed_widths",
        dcfifo_mixed_widths_component.lpm_width  = 128,
        dcfifo_mixed_widths_component.lpm_widthu  = 8,
        dcfifo_mixed_widths_component.lpm_widthu_r  = 6,
        dcfifo_mixed_widths_component.lpm_width_r  = 512,
        dcfifo_mixed_widths_component.overflow_checking  = "ON",
        dcfifo_mixed_widths_component.rdsync_delaypipe  = 4,
        dcfifo_mixed_widths_component.underflow_checking  = "ON",
        dcfifo_mixed_widths_component.use_eab  = "ON",
        dcfifo_mixed_widths_component.wrsync_delaypipe  = 4;


endmodule


