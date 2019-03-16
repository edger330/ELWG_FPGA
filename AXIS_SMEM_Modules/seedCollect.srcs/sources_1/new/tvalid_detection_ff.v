`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/13 11:34:41
// Design Name: 
// Module Name: tvalid_detection
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tvalid_detection_ff #(
	parameter integer C_ID_WIDTH    = 5,
	parameter integer C_STATE_WIDTH = 2
)
(
  clk,
  rst_n,
	state,
	tvalid,
	ID,
	num
    );

input wire clk;
input wire rst_n;

input wire tvalid                    ;
input wire [C_ID_WIDTH-1:0] ID       ;
input wire [C_STATE_WIDTH-1:0] state ;

output reg [C_ID_WIDTH-1:0] num ;

localparam IDLE      = 2'b00;
localparam GET_ID    = 2'b01;
localparam CMP_ID    = 2'b10;
localparam TRANS     = 2'b11;

always @(posedge clk or negedge rst_n) begin
  if (~rst_n) begin
    num <= 1'b0;
  end
  else if ((~tvalid) && (state == GET_ID)) begin
    num <= 1'b0;
  end
  else if ((tvalid) && (state == GET_ID)) begin
    num <= ID;
  end
end

endmodule
