`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/07 11:34:41
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


module tvalid_detection #(
	parameter integer C_ID_WIDTH    = 10,
	parameter integer C_STATE_WIDTH = 2
)
(
	state,
	tvalid,
	ID,
	num
    );

input wire tvalid                    ;
input wire [C_ID_WIDTH-1:0] ID       ;
input wire [C_STATE_WIDTH-1:0] state ;

output reg [C_ID_WIDTH-1:0] num ;

localparam IDLE      = 2'b00;
localparam GET_ID    = 2'b01;
localparam HANDSHAKE = 2'b10;
localparam TRANS     = 2'b11;

always @(*) begin
  if ((~tvalid) && (state == GET_ID)) begin
    num = 1'b0;
  end
  else if ((tvalid) && (state == GET_ID)) begin
    num = ID;
  end
end

endmodule
