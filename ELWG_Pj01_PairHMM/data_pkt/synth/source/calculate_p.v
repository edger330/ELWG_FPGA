

/*********************************************************************
//  Author:    cz
//  Filename:  
//  Modified:
//  Version:   1.0
//
//  Description:
//
//  Copyright (c) 2006   Combrio Networks.
//
//  All Rights Reserved.
//
//
// -------------------------------------------------------------------
//  Modification History:
//
//  Date             Who            Description of change
//  ------------------------------------------------------------------
//  2017-09-15       cz             initial version
//
**********************************************************************/
`timescale 1ns/1ps

module calculate_p (
	sys_clk,
	sys_rst_n,
	float_i_0,
	float_q_0,
	float_q_1,
	float_d_1,
	lambda,
	p_mm
	);
		
/*-------------------------------------------------------------------*\
                          Parameter Description
\*-------------------------------------------------------------------*/	
parameter ONE_DIVEDE_THREE = 32'h3EAAAAAA;
/*-------------------------------------------------------------------*\
                            Port Description
\*-------------------------------------------------------------------*/		
input sys_clk;
input sys_rst_n;
input  [31:0] float_i_0;
input  [31:0] float_q_0;
input  [31:0] float_q_1;
input  [31:0] float_d_1;
output reg [31:0] lambda;
output reg [31:0] p_mm;

/*-------------------------------------------------------------------*\
                          Reg/Wire Description
\*-------------------------------------------------------------------*/
reg  [31:0] constant;
wire [31:0] s0_out;
wire [31:0] u0_out;
/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		constant <= 32'd0;
	end else begin 
		constant <= ONE_DIVEDE_THREE;
	end
end


	fp_sub s0 (
		.clk    (sys_clk  ),    //    clk.clk
		.areset (~sys_rst_n), // areset.reset
		.a      (float_i_0),      //      a.a
		.b      (float_d_1),      //      b.b
		.q      (s0_out)       //      q.q
	);


	fp_mult f0 (
		.areset (~sys_rst_n), 
		.clk    (sys_clk),    
		.a      (float_q_1),     
		.b      (constant),      
		.en     (1'b1),     
		.q      (u0_out)       
	);
	 

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		p_mm <= 0;
	end else begin
		p_mm <= s0_out;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
	if(~sys_rst_n) begin
		lambda <= 0;
	end else begin
		lambda <= u0_out;
	end
end
endmodule 



