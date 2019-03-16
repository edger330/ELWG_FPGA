`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2018 10:36:02 AM
// Design Name: 
// Module Name: getID_sim
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


module getID_sim() ;

parameter integer C_BUS_WIDTH      = 512;
parameter integer C_ID_WIDTH       = 10 ;

reg clk									;
reg rst_n								;
reg [C_BUS_WIDTH-1:0]	B_busy			;

wire[C_ID_WIDTH-1:0]	C_ID 			;

reg [9:0]				count			;

initial begin
	clk <= 1'b0;
	rst_n <= 1'b0;
	B_busy <= 512'b0;

	#25 rst_n <= 1'b1;
end

always begin
	#5 clk = ~clk;
end

always @(posedge clk or negedge rst_n) begin
	if (rst_n) begin
		count <= 0;
		
	end
	else if (count == 20) begin
		count <= 10'b0;
	end
	else
	    count <= count + 1'b1;
end

always @(posedge clk or negedge rst_n) begin
	if (rst_n) begin
		B_busy <= 512'b1;		
	end	
	else if (count == 20) begin
		B_busy = B_busy << 1;
	end
	else
	    B_busy <= B_busy;
end



getID getID_0(
	.B_busy(B_busy),
	.ID(C_ID)
	);

endmodule
