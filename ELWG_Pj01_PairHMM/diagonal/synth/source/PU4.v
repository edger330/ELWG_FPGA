
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

reg [31:0] X_i_j;
reg [31:0] M_i_j;

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

wire [31:0] fifo_x_q;
wire [31:0] fifo_m_q;

reg SUM_valid_0;
reg SUM_valid_1;
reg SUM_valid_2;
reg SUM_valid_3;

reg SUM_valid_reg_0;
reg SUM_valid_reg_1;
reg SUM_valid_reg_2;

reg [31:0] SUM_out_reg;

reg [31:0] X_fifo_reg;
reg [31:0] M_fifo_reg;

reg Init_out_reg_0;

reg [2:0] cnt;
reg fifo_flag;

//(*noprune*) reg infinity ;

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/
assign rdreq = fifo_flag;

assign wrreq = Init_out;

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

always @(posedge sys_clk or negedge sys_rst_n)  //may have problems
begin 
	if (!sys_rst_n) begin
			Init_out_reg_0 <= 1'b0;
	end
	else begin
		if (SUM_valid_0) begin
			Init_out_reg_0 <= 1'b0;
		end
		else begin
			Init_out_reg_0 <= Init_out_3;
		end
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

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		X_fifo_reg <= 32'b0;
		M_fifo_reg <= 32'b0;
	end 
	else begin
		X_fifo_reg <= X_out_3;
		M_fifo_reg <= M_out_3;		
	end 
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		X_i_j <= 32'b0;
		M_i_j <= 32'b0;
	end 
	else begin
		X_i_j <= fifo_x_q;
		M_i_j <= fifo_m_q;		
	end 
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		fifo_flag <= 1'b0;
	end 
	else if ((cnt == 3'b110)||(cnt == 3'b111)) begin
		fifo_flag <= 1'b1;	
	end
	else if (!Init_in) begin
		fifo_flag <= 1'b0;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		cnt <= 3'b000;
	end
	else if (!mode) begin
		cnt <= 3'b010;
	end
	else if (!Init_in) begin
		cnt <= cnt + 1'b1;		
	end
	else begin
		cnt <= 3'b000;
	end
end

		fifo_X fifo_X (
			.data (X_fifo_reg), //  fifo_input.datain
			.wrreq(wrreq     ), //            .wrreq
			.rdreq(rdreq     ), //            .rdreq
			.clock(sys_clk   ), //            .clk
			.aclr (SUM_valid_reg_2), //            .aclr
			.q    (fifo_x_q ), // fifo_output.dataout
			.usedw(X_fifo_num)
		);

		fifo_M fifo_M (
			.data (M_fifo_reg), //  fifo_input.datain
			.wrreq(wrreq     ), //            .wrreq
			.rdreq(rdreq     ), //            .rdreq
			.clock(sys_clk   ), //            .clk
			.aclr (SUM_valid_reg_2), //            .aclr
			.q    (fifo_m_q ), // fifo_output.dataout
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

assign Init_out = Init_out_reg_0;
assign SUM_out = SUM_out_reg;

endmodule 