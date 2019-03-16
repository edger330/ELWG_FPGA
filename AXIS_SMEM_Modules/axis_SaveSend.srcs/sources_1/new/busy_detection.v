`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/18 20:25:28
// Design Name: 
// Module Name: save_send
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

module busy_detection #(
  parameter integer C_ID_WIDTH = 10
)
(
  state    ,
  busy  ,
  ID    ,
  num
  );  
  
  parameter IDLE = 2'b00;
  parameter GET_ID = 2'b01;
  parameter MATCH_ID = 2'b10;
  parameter DONE    = 2'b11;

input wire [1:0] state                   ;
input wire busy                 ;
input wire [C_ID_WIDTH-1:0] ID  ;

output reg [C_ID_WIDTH-1:0] num ;

always @(*) begin
  if (busy == 1'b1) begin
    num = 1'b0;
  end
  else if (state == GET_ID )begin
    num = ID;
  end
end
  
endmodule