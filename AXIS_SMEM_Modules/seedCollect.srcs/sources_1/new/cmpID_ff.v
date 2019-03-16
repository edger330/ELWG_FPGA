`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: zzt
// 
// Create Date: 2018/08/13 15:25:50
// Design Name: 
// Module Name: cmpID
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


module cmpID_ff #( 
  parameter integer C_ID_WIDTH = 5   
)
(
  clk,
  rst_n,
  in1 ,
  in2 ,
  out
  );

input wire clk;
input wire rst_n;

input wire [C_ID_WIDTH-1:0] in1 ;
input wire [C_ID_WIDTH-1:0] in2 ;

output reg [C_ID_WIDTH-1:0] out ;

always @(posedge clk or negedge rst_n) begin
  if (~rst_n) begin
    out <= 1'b1;
  end
  else if (in1 > in2) begin
    out <= in1;
  end
  else begin
    out <= in2;
  end
end
  
endmodule
