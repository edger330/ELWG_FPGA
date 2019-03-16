`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2018 11:29:17 AM
// Design Name: 
// Module Name: 
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


module SEQ_CMP #(
    parameter integer CMP_WIDTH = 4,
    parameter integer SCORE_WIDTH = 16
)
(
    //==========input===============//
    clk   ,
    rst_n ,
    Nr    ,
    Ns    ,
    //==========output===============//
    S
    );

input wire clk   ;
input wire rst_n ;

input wire [CMP_WIDTH-1:0] Nr;
input wire [CMP_WIDTH-1:0] Ns;

output reg signed [SCORE_WIDTH-1:0] S;

always @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        S <= 16'sh0000;  //0
    end
    else if (Nr > 3 || Ns > 3) begin
        S <= 16'shFFFF; //-1
    end
    else if (Nr == Ns) begin
        S <= 16'sh0001;  //1
    end
    else begin
        S <= 16'shFFFC;  //-4
    end
end

endmodule
