
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
//  2017-11-24       zzt             initial version
//
**********************************************************************/
`timescale 1ns/1ps
module PU4 (
		//input
			sys_clk  ,
			sys_rst_n,
			mode,
			SUM_select,

			Y_Init   ,

			SUM_valid,
			SUM_start,

			p_mx_0     ,
			p_my_0     ,
			p_mm_0     ,

			p_mx_1     ,
			p_my_1     ,
			p_mm_1     ,

			p_mx_2     ,
			p_my_2     ,
			p_mm_2     ,

			p_mx_3     ,
			p_my_3     ,
			p_mm_3     ,
			
			lambda1_0  ,
			lambda2_0  ,

			lambda1_1  ,
			lambda2_1  ,

			lambda1_2  ,
			lambda2_2  ,

			lambda1_3  ,
			lambda2_3  ,

			H_in  	   ,

			R_in_0     ,
			R_in_1     ,
			R_in_2     ,
			R_in_3     ,

			Init_in  ,
					
		//output	
			SUM_out  	    
);

/*-------------------------------------------------------------------*\
                            Port Description
\*-------------------------------------------------------------------*/	
input         sys_clk  ;
input         sys_rst_n;
input 			mode;
input 	[2:0]  SUM_select;

input SUM_valid;
input SUM_start;

input  [31:0] p_mx_0     ;
input  [31:0] p_my_0     ;
input  [31:0] p_mm_0     ;

input  [31:0] p_mx_1     ;
input  [31:0] p_my_1     ;
input  [31:0] p_mm_1     ;

input  [31:0] p_mx_2     ;
input  [31:0] p_my_2     ;
input  [31:0] p_mm_2     ;

input  [31:0] p_mx_3     ;
input  [31:0] p_my_3     ;
input  [31:0] p_mm_3     ;

input  [31:0] lambda1_0  ;
input  [31:0] lambda2_0  ;

input  [31:0] lambda1_1  ;
input  [31:0] lambda2_1  ;

input  [31:0] lambda1_2  ;
input  [31:0] lambda2_2  ;

input  [31:0] lambda1_3  ;
input  [31:0] lambda2_3  ;

input  [7:0]  H_in       ;
input  [7:0]  R_in_0     ;
input  [7:0]  R_in_1     ;
input  [7:0]  R_in_2     ;
input  [7:0]  R_in_3     ;

input         Init_in  ;

input  [31:0] Y_Init   ;

//----------out-------------------


output [31:0] SUM_out  ;	


/*-------------------------------------------------------------------*\
                          Reg/Wire Description
\*-------------------------------------------------------------------*/

wire  [8:0] X_fifo_num	;
wire  [8:0] M_fifo_num	;

wire        Init_out ;

wire [31:0] X_i_j;
wire [31:0] M_i_j;

wire [31:0] M_out_0		;
wire [31:0] Y_out_0		;
wire [31:0] X_out_0		;
wire 	 Init_out_0		;
wire [31:0] SUM_out_0	;
wire [7:0] 	H_out_0		;
wire 	SUM_start_out_0;

wire [31:0] M_out_1		;
wire [31:0] Y_out_1		;
wire [31:0] X_out_1		;
wire 	 Init_out_1		;
wire [31:0] SUM_out_1	;
wire [7:0] 	H_out_1		;
wire 	SUM_start_out_1;

wire [31:0] M_out_2		;
wire [31:0] Y_out_2		;
wire [31:0] X_out_2		;
wire 	 Init_out_2		;
wire [31:0] SUM_out_2	;
wire [7:0] 	H_out_2		;
wire 	SUM_start_out_2;

wire [31:0] M_out_3		;
wire [31:0] Y_out_3		;
wire [31:0] X_out_3		;
wire 	 Init_out_3		;
wire [31:0] SUM_out_3	;
wire [7:0] 	H_out_3		;
wire 	SUM_start_out_3;

wire 	rdreq			;
wire 	wrreq			;

reg SUM_valid_0;
reg SUM_valid_1;
reg SUM_valid_2;
reg SUM_valid_3;

reg SUM_valid_reg_0;
reg SUM_valid_reg_1;
reg SUM_valid_reg_2;

// reg Init_out_reg_0;
// reg Init_out_reg_1;
// reg Init_out_reg_2;
// reg Init_out_reg_3;
// reg Init_out_reg_4;
// reg Init_out_reg_5;

reg [31:0] SUM_out_reg	;

//(*noprune*) reg infinity ;

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/

// always @(posedge sys_clk or negedge sys_rst_n)  //may have problems
// begin 
// 	if (!sys_rst_n) begin
// 			Init_out_reg_0 <= 1'b0;
// 			Init_out_reg_1 <= 1'b0;
// 			Init_out_reg_2 <= 1'b0;
// 			Init_out_reg_3 <= 1'b0;
// 			Init_out_reg_4 <= 1'b0;
// 			Init_out_reg_5 <= 1'b0;
// 	end
// 	else begin
// 		if (SUM_valid_0) begin
// 			Init_out_reg_0 <= 1'b0;
// 			Init_out_reg_1 <= 1'b0;
// 			Init_out_reg_2 <= 1'b0;
// 			Init_out_reg_3 <= 1'b0;
// 			Init_out_reg_4 <= 1'b0;
// 			Init_out_reg_5 <= 1'b0;
// 		end
// 		else begin
// 			Init_out_reg_0 <= Init_out_3;
// 			Init_out_reg_1 <= Init_out_reg_0;
// 			Init_out_reg_2 <= Init_out_reg_1;
// 			Init_out_reg_3 <= Init_out_reg_2;
// 			Init_out_reg_4 <= Init_out_reg_3;
// 			Init_out_reg_5 <= Init_out_reg_4;
// 		end
// 	end 
// end

// always @(posedge sys_clk or negedge sys_rst_n)  //may have problems
// begin 
// 	if (!sys_rst_n) rdreq <= 1'b0; 
// 	else begin
// 		if (X_fifo_num == 9'b000000000) rdreq <= 1'b0;
// 		else begin
// 			if ((mode) && (Init_in)) rdreq <= 1'b1;
// 			else rdreq <= 1'b0;
// 		end
// 	end 
// end
assign rdreq = mode & Init_in;

assign wrreq = Init_out;


// always @(posedge sys_clk or negedge sys_rst_n)
// begin 
// 	if (!sys_rst_n) wrreq <= 1'b0; 
// 	else begin
// 		if (X_fifo_num == 9'b111111111) wrreq <= 1'b0;
// 		else begin
// 			if(Init_out) wrreq <= 1'b1;
// 			else wrreq <= 1'b0;
// 		end
// 	end 
// end



always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		SUM_valid_0 <= 1'b0;
		SUM_valid_1 <= 1'b0;
		SUM_valid_2 <= 1'b0;
		SUM_valid_3 <= 1'b0;
	end 
	else begin
		SUM_valid_0 <= SUM_valid;
		SUM_valid_1 <= SUM_valid;
		SUM_valid_2 <= SUM_valid;
		SUM_valid_3 <= SUM_valid;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		SUM_valid_reg_0 <= 1'b0;
		SUM_valid_reg_1 <= 1'b0;
		SUM_valid_reg_2 <= 1'b0;
	end 
	else begin
		SUM_valid_reg_0 <= SUM_valid;
		SUM_valid_reg_1 <= SUM_valid_reg_0;
		SUM_valid_reg_2 <= SUM_valid_reg_1;
	end 
end

always @(*) begin 
	case (SUM_select)
		3'b000: SUM_out_reg = SUM_out_0;
		3'b001: SUM_out_reg = SUM_out_1;
		3'b010: SUM_out_reg = SUM_out_2;
		3'b011: SUM_out_reg = SUM_out_3;

		default: SUM_out_reg = SUM_out_3;
	endcase
end

		fifo_X fifo_X (
			.data (X_out_3   ), //  fifo_input.datain
			.wrreq(wrreq     ), //            .wrreq
			.rdreq(rdreq     ), //            .rdreq
			.clock(sys_clk   ), //            .clk
			.aclr (SUM_valid_reg_2), //            .aclr
			.q    (X_i_j     ), // fifo_output.dataout
			.usedw(X_fifo_num)
		);

		fifo_M fifo_M (
			.data (M_out_3   ), //  fifo_input.datain
			.wrreq(wrreq     ), //            .wrreq
			.rdreq(rdreq     ), //            .rdreq
			.clock(sys_clk   ), //            .clk
			.aclr (SUM_valid_reg_2), //            .aclr
			.q    (M_i_j     ), // fifo_output.dataout
			.usedw(M_fifo_num)
		);

/*-------------------------------------------------------------------*\
                             PE
\*-------------------------------------------------------------------*/

		PE0 PE0 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			.mode     (mode       ),

			.SUM_valid(SUM_valid_0),
			.SUM_start(SUM_start),
			
			.M_i_j    (M_i_j      ),
			.X_i_j    (X_i_j      ),
			.Y_i_j    (Y_out_0    ),
			.Y_Init   (Y_Init     ),
			
			.p_mx     (p_mx_0     ),
			.p_my     (p_my_0     ),
			.p_mm     (p_mm_0     ),
			
			.lambda1  (lambda1_0  ),
			.lambda2  (lambda2_0  ),
			
			.H_in     (H_in       ),
			.R_in     (R_in_0     ),
			
			.Init_in  (Init_in    ),
			
			.M_out    (M_out_0    ),
			.X_out    (X_out_0    ),
			.Y_out    (Y_out_0    ),

			.SUM_start_out(SUM_start_out_0),
			
			.Init_out (Init_out_0 ),
			.SUM_out  (SUM_out_0  ),
			.H_out    (H_out_0    )
		);

		PEx PE1 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_1),
			.SUM_start(SUM_start_out_0),
			
			.M_i_j    (M_out_0    ),
			.X_i_j    (X_out_0    ),
			.Y_i_j    (Y_out_1    ),
			
			.p_mx     (p_mx_1     ),
			.p_my     (p_my_1     ),
			.p_mm     (p_mm_1     ),
			
			.lambda1  (lambda1_1  ),
			.lambda2  (lambda2_1  ),
			
			.H_in     (H_out_0    ),
			.R_in     (R_in_1     ),
			
			.Init_in  (Init_out_0 ),
			
			.M_out    (M_out_1    ),
			.X_out    (X_out_1    ),
			.Y_out    (Y_out_1    ),

			.SUM_start_out(SUM_start_out_1),
			
			.Init_out (Init_out_1 ),
			.SUM_out  (SUM_out_1  ),
			.H_out    (H_out_1    )
		);

		PEx PE2 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_2),
			.SUM_start(SUM_start_out_1),
			
			.M_i_j    (M_out_1    ),
			.X_i_j    (X_out_1    ),
			.Y_i_j    (Y_out_2    ),
			
			.p_mx     (p_mx_2     ),
			.p_my     (p_my_2     ),
			.p_mm     (p_mm_2     ),
			
			.lambda1  (lambda1_2  ),
			.lambda2  (lambda2_2  ),
			
			.H_in     (H_out_1    ),
			.R_in     (R_in_2     ),
			
			.Init_in  (Init_out_1 ),
			
			.M_out    (M_out_2    ),
			.X_out    (X_out_2    ),
			.Y_out    (Y_out_2    ),

			.SUM_start_out(SUM_start_out_2),
			
			.Init_out (Init_out_2 ),
			.SUM_out  (SUM_out_2  ),
			.H_out    (H_out_2    )
		);

		PEx PE3 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_3),
			.SUM_start(SUM_start_out_2),
			
			.M_i_j    (M_out_2    ),
			.X_i_j    (X_out_2    ),
			.Y_i_j    (Y_out_3    ),
			
			.p_mx     (p_mx_3     ),
			.p_my     (p_my_3     ),
			.p_mm     (p_mm_3     ),
			
			.lambda1  (lambda1_3  ),
			.lambda2  (lambda2_3  ),
			
			.H_in     (H_out_2    ),
			.R_in     (R_in_3     ),
			
			.Init_in  (Init_out_2 ),
			
			.M_out    (M_out_3    ),
			.X_out    (X_out_3    ),
			.Y_out    (Y_out_3    ),
			.SUM_start_out(SUM_start_out_3),
			
			.Init_out (Init_out_3 ),
			.SUM_out  (SUM_out_3  ),
			.H_out    (H_out_3    )
		);

assign Init_out = Init_out_3;
assign SUM_out = SUM_out_reg;

endmodule 