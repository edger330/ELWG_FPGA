/*********************************************************************
//  Author:    jyb
//  Filename:  
//  Modified:
//  Version:   1.0
//
//  Description:
//
//  Copyright (c) 2017 Test.
//
//  All Rights Reserved.
//
//
// -------------------------------------------------------------------
//  Modification History:
//
//  Date                  Who            Description of change
//  ------------------------------------------------------------------
//  2017-05-22            jyb            initial version
//
**********************************************************************/
`timescale 1ns/1ps


module test_pkt(
//input
sys_clk,sys_rst_n,
//output
result_fifo_rdat
);
parameter MAX_ADDR = 8'd113;

input sys_clk;
input sys_rst_n;
output [31:0] result_fifo_rdat;

reg [7:0] rom_addr;
reg rom_rden;

wire[35:0] rom_q;
wire pkt_receive_enable;
wire result_fifo_empty;
wire [127:0] result_fifo_rdat;


reg [31:0] matrix_memory_data;
reg matrix_memory_sop;
reg matrix_memory_eop;
reg matrix_memory_vld;

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin 
    matrix_memory_data <= 32'd0;
    matrix_memory_sop  <= 1'b0;
    matrix_memory_eop  <= 1'b0;
    matrix_memory_vld  <= 1'b0;
  end else begin 
    matrix_memory_data <= rom_q[31:0];
    matrix_memory_sop  <= rom_q[34];
    matrix_memory_eop  <= rom_q[33];
    matrix_memory_vld  <= rom_q[32];
  end
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin 
    rom_rden <= 1'b0;
  end else if (pkt_receive_enable) begin
    rom_rden <= 1'b1;
  end else if (rom_addr == MAX_ADDR) begin 
    rom_rden <= 1'b0;
  end 
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin 
    rom_addr <= 32'd0;
  end else if ((rom_addr == MAX_ADDR) & rom_rden == 1'b1) begin 
    rom_addr <= 32'd0;
  end else if (rom_rden) begin 
    rom_addr <= rom_addr + 1'b1;
  end
end





rom_256x32 u0 (
  .address(rom_addr), //  rom_input.address
  .clock  (sys_clk), //           .clk
  .rden   (rom_rden), //           .rden
  .q      (rom_q   )  // rom_output.dataout
);

matrix_6 m0(
  //input
  .sys_clk (sys_clk)          ,
  .sys_rst_n(sys_rst_n)         ,
  .matrix_memory_sop(matrix_memory_sop) ,
  .matrix_memory_eop(matrix_memory_eop) ,
  .matrix_memory_vld(matrix_memory_vld) ,
  .matrix_memory_data(matrix_memory_data),
  .result_fifo_rden(~result_fifo_empty)  ,
  //output
  .pkt_receive_enable(pkt_receive_enable),
  .result_fifo_rdat(result_fifo_rdat)  ,
  .result_fifo_empty(result_fifo_empty)
  
);

endmodule