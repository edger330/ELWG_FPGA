
/*********************************************************************
//  Author:    zzt
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
//  2017-11-17       zzt             initial version
//
**********************************************************************/
`timescale 1ns/1ps
module PEx (
		//input
			sys_clk  ,
			sys_rst_n,

			M_i_j    ,
			X_i_j    ,
			Y_i_j    ,

			p_mx     ,
			p_my     ,
			p_mm     ,

			lambda1  ,
			lambda2  ,

			H_in     ,
			R_in     ,

			Init_in  ,
			SUM_valid,
			SUM_start,
					
		//output	
			M_out    ,
			X_out    ,
			Y_out    ,

			Init_out ,

			SUM_out	 ,
			SUM_start_out,

			H_out    
);

/*-------------------------------------------------------------------*\
                          Parameter Description
\*-------------------------------------------------------------------*/	
parameter FLOAT_C_0 = 32'h3F666666; //0.9
parameter FLOAT_C_1 = 32'h3DCCCCCC; //0.1

/*-------------------------------------------------------------------*\
                            Port Description
\*-------------------------------------------------------------------*/	
input         sys_clk  ;
input         sys_rst_n;

input 		SUM_valid;
input 		SUM_start;

input  [31:0] M_i_j    ;
input  [31:0] X_i_j    ;
input  [31:0] Y_i_j    ;

input  [31:0] p_mx     ;
input  [31:0] p_my     ;
input  [31:0] p_mm     ;

input  [31:0] lambda1  ;
input  [31:0] lambda2  ;

input  [7:0]  H_in     ;
input  [7:0]  R_in     ;

input         Init_in  ;

output [31:0] M_out    ;
output [31:0] X_out    ;
output [31:0] Y_out    ;

output        Init_out ;
output [31:0] SUM_out  ;
output [7:0]  H_out    ;

output 	SUM_start_out;	

/*-------------------------------------------------------------------*\
                          Reg/Wire Description
\*-------------------------------------------------------------------*/
reg SUM_start_reg_0;
reg SUM_start_reg_1;
reg SUM_start_reg_2;
reg SUM_start_reg_3;
reg SUM_start_reg_4;
reg SUM_start_reg_5;

reg SUM_start_flag;

wire [31:0] X;
wire [31:0] Y;
wire [31:0] M; 

wire [31:0] m0_out;
wire [31:0] m1_out;
wire [31:0] m2_out;
wire [31:0] m3_out;
wire [31:0] m4_out;
wire [31:0] m5_out;
wire [31:0] m6_out;
wire [31:0] m7_out;

wire [31:0] a0_out;
wire [31:0] a1_out;
wire [31:0] a2_out;
wire [31:0] a3_out;
wire [31:0] a4_out;
wire [31:0] a5_out;

reg       Init_in_0;
reg       Init_in_1;
reg       Init_in_2;
reg       Init_in_3;
reg       Init_in_4;
reg       Init_in_5;

reg [7:0] H_in_0;
reg [7:0] H_in_1;
reg [7:0] H_in_2;
reg [7:0] H_in_3;
reg [7:0] H_in_4;
reg [7:0] H_in_5;

reg [31:0] lambda;
reg [31:0] lambda_0;
reg [31:0] lambda_1;
reg [31:0] lambda_2;
reg [31:0] lambda_3;
reg [31:0] lambda_4;
reg [31:0] lambda_5;
reg [31:0] lambda_6;
reg [31:0] lambda_7;
reg [31:0] lambda_8;

reg [31:0] SUM_0;
reg [31:0] SUM_1;
reg [31:0] SUM_2;

reg [31:0] Y_value_0;
reg [31:0] Y_value_1;
reg [31:0] Y_value_2;

reg [31:0] p0;
reg [31:0] p1;

reg [31:0] M_Init;
reg [31:0] Y_Init;
reg [31:0] X_Init;

//(*noprune*) reg infinity ;

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/

//inital

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin 
		SUM_start_reg_0 <= 1'b0;
		SUM_start_reg_1 <= 1'b0;
		SUM_start_reg_2 <= 1'b0;
		SUM_start_reg_3 <= 1'b0;
		SUM_start_reg_4 <= 1'b0;
		SUM_start_reg_5 <= 1'b0;
	end
	else begin 
		SUM_start_reg_0 <= SUM_start;
		SUM_start_reg_1 <= SUM_start_reg_0;
		SUM_start_reg_2 <= SUM_start_reg_1;
		SUM_start_reg_3 <= SUM_start_reg_2;
		SUM_start_reg_4 <= SUM_start_reg_3;
		SUM_start_reg_5 <= SUM_start_reg_4;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) SUM_start_flag <= 1'b0;
	else if (SUM_start) SUM_start_flag <= 1'b1;
	else if (SUM_valid)	SUM_start_flag <= 1'b0;
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		   p0 <= FLOAT_C_0;
	       p1 <= FLOAT_C_1;
	end else begin 
		   p0 <= FLOAT_C_0;
	       p1 <= FLOAT_C_1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) M_Init <= 32'b0;
	else M_Init <= 32'b0; 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) Y_Init <= 32'b0;
	else Y_Init <= 32'b0; 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) X_Init <= 32'b0;
	else X_Init <= 32'b0; 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		   Init_in_0 <= 1'b0;
	       Init_in_1 <= 1'b0;
	       Init_in_2 <= 1'b0;
	       Init_in_3 <= 1'b0;
	       Init_in_4 <= 1'b0;
	       Init_in_5 <= 1'b0;
	end 
	// else if (SUM_valid) begin
	// 	   Init_in_0 <= 1'b0;
	//        Init_in_1 <= 1'b0;
	//        Init_in_2 <= 1'b0;
	//        Init_in_3 <= 1'b0;
	//        Init_in_4 <= 1'b0;
	//        Init_in_5 <= 1'b0;
	// end
	else begin 
		   Init_in_0 <= Init_in;
	       Init_in_1 <= Init_in_0;
	       Init_in_2 <= Init_in_1;
	       Init_in_3 <= Init_in_2;
	       Init_in_4 <= Init_in_3;
	       Init_in_5 <= Init_in_4;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
			H_in_0 <= 8'b0;
			H_in_1 <= 8'b0;
			H_in_2 <= 8'b0;
			H_in_3 <= 8'b0;
			H_in_4 <= 8'b0;
			H_in_5 <= 8'b0;
	end 
	// else if (SUM_valid) begin
	// 		H_in_0 <= 8'b0;
	// 		H_in_1 <= 8'b0;
	// 		H_in_2 <= 8'b0;
	// 		H_in_3 <= 8'b0;
	// 		H_in_4 <= 8'b0;
	// 		H_in_5 <= 8'b0;
	// end
	else begin 
			H_in_0 <= H_in;
			H_in_1 <= H_in_0;
			H_in_2 <= H_in_1;
			H_in_3 <= H_in_2;
			H_in_4 <= H_in_3;
			H_in_5 <= H_in_4;
	end 
end

// calculate M
assign X = (Init_in_5)? X_i_j : X_Init;
assign Y = (Init_in_5)? Y_i_j : Y_Init;
assign M = (Init_in_5)? M_i_j : M_Init;

fp_mult mul0 (			
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (p_mm),
	.b     (M),
	.q     (m0_out),
	.en    (1'b1)
	);

fp_mult mul1(				
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (p0),
	.b     (X),
	.q     (m1_out),
	.en    (1'b1)
	);

fp_mult mul2 (			
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (p0),
	.b     (Y),
	.q     (m2_out),
	.en    (1'b1)
	);

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
			Y_value_0 <= 32'b0;
			Y_value_1 <= 32'b0;
			Y_value_2 <= 32'b0;
	end else begin 
			Y_value_0 <= m2_out;
			Y_value_1 <= Y_value_0;
			Y_value_2 <= Y_value_1;
	end 
end

fp_add a0 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (m0_out),
	.b     (m1_out),
	.q     (a0_out),
	.en    (1'b1)
	);

fp_add a1 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (a0_out),
	.b     (Y_value_2),
	.q     (a1_out),
	.en    (1'b1)
	);

//lambda choose
always @ (*) 
begin 
	if ((H_in == 8'h4E) || (R_in == 8'h4E) || (R_in == H_in)) lambda = lambda1;
	else lambda = lambda2;
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
			lambda_0 <= 32'b0;
			lambda_1 <= 32'b0;
			lambda_2 <= 32'b0;
			lambda_3 <= 32'b0;
			lambda_4 <= 32'b0;
			lambda_5 <= 32'b0;
			lambda_6 <= 32'b0;
			lambda_7 <= 32'b0;
			lambda_8 <= 32'b0;			
	end else begin 
			lambda_0 <= lambda;
			lambda_1 <= lambda_0;
			lambda_2 <= lambda_1;
			lambda_3 <= lambda_2;
			lambda_4 <= lambda_3;
			lambda_5 <= lambda_4;
			lambda_6 <= lambda_5;
			lambda_7 <= lambda_6;
			lambda_8 <= lambda_7;
	end 
end

fp_mult mul3 (			
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (a1_out),
	.b     (lambda_8),
	.q     (m3_out),
	.en    (1'b1)
	);

//calculate X
fp_mult mul4 (			
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (M),
	.b     (p_mx),
	.q     (m4_out),
	.en    (1'b1)
	);

fp_mult mul5 (			
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (X),
	.b     (p1),
	.q     (m5_out),
	.en    (1'b1)
	);

fp_add a2 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (m4_out),
	.b     (m5_out),
	.q     (a2_out),
	.en    (1'b1)
	);

//calculate Y
fp_mult mul6 (			
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (M),
	.b     (p_my),
	.q     (m6_out),
	.en    (1'b1)
	);

fp_mult mul7 (			
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (Y),
	.b     (p1),
	.q     (m7_out),
	.en    (1'b1)
	);

fp_add a3 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (m6_out),
	.b     (m7_out),
	.q     (a3_out),
	.en    (1'b1)
	);

//calculate SUM
fp_add a4 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (M_out),
	.b     (X_out),
	.q     (a4_out),
	.en    (1'b1)
	);

fp_add a5 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (SUM_2),
	.b     (a4_out),
	.q     (a5_out),
	.en    (1'b1)
	);

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
			SUM_2 <= 32'b0;
	end 
	else if (SUM_start_reg_2) begin 
			SUM_2 <= 32'b0;
	end
	else begin 
			SUM_2 <= SUM_1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
			SUM_0 <= 32'b0;
			SUM_1 <= 32'b0;
	end 
	else begin 
			SUM_0 <= a5_out;
			SUM_1 <= SUM_0;
	end 
end

assign Init_out = Init_in_5;
assign H_out = H_in_5;

assign M_out = m3_out;
assign X_out = a2_out;
assign Y_out = a3_out;

assign SUM_out = a5_out;

assign SUM_start_out = SUM_start_reg_5;

endmodule 