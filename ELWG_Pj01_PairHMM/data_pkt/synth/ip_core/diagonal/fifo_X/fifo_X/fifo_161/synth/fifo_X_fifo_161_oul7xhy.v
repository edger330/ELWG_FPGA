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
module  fifo_X_fifo_161_oul7xhy  (
    aclr,
    clock,
    data,
    rdreq,
    wrreq,
    q,
    usedw);

    input    aclr;
    input    clock;
    input  [31:0]  data;
    input    rdreq;
    input    wrreq;
    output [31:0]  q;
    output [8:0]  usedw;

    wire [31:0] sub_wire0;
    wire [8:0] sub_wire1;
    wire [31:0] q = sub_wire0[31:0];
    wire [8:0] usedw = sub_wire1[8:0];

    scfifo  scfifo_component (
                .aclr (aclr),
                .clock (clock),
                .data (data),
                .rdreq (rdreq),
                .wrreq (wrreq),
                .q (sub_wire0),
                .usedw (sub_wire1),
                .almost_empty (),
                .almost_full (),
                .eccstatus (),
                .empty (),
                .full (),
                .sclr ());
    defparam
        scfifo_component.add_ram_output_register  = "OFF",
        scfifo_component.enable_ecc  = "FALSE",
        scfifo_component.intended_device_family  = "Arria 10",
        scfifo_component.lpm_numwords  = 512,
        scfifo_component.lpm_showahead  = "OFF",
        scfifo_component.lpm_type  = "scfifo",
        scfifo_component.lpm_width  = 32,
        scfifo_component.lpm_widthu  = 9,
        scfifo_component.overflow_checking  = "ON",
        scfifo_component.underflow_checking  = "ON",
        scfifo_component.use_eab  = "ON";


endmodule


