`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/07 15:25:50
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


module cmpID #( 
  parameter integer C_ID_WIDTH = 10   
)
(
  in1 ,
  in2 ,
  out
  );

input wire [C_ID_WIDTH-1:0] in1 ;
input wire [C_ID_WIDTH-1:0] in2 ;

output reg [C_ID_WIDTH-1:0] out ;

always @(*) begin
  if (in1 > in2) begin
    out = in1;
  end
  else begin
    out = in2;
  end
end
  
endmodule
