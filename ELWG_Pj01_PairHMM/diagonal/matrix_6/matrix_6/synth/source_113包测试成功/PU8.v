
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
//  2017-12-02       zzt             2.0 version
//
**********************************************************************/
`timescale 1ns/1ps
module PU8 (
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

			p_mx_4     ,
			p_my_4     ,
			p_mm_4     ,

 			p_mx_5     ,
			p_my_5     ,
			p_mm_5     ,

 			p_mx_6     ,
			p_my_6     ,
			p_mm_6     ,

 			p_mx_7     ,
			p_my_7     ,
			p_mm_7     ,

			lambda1_0  ,
			lambda2_0  ,

			lambda1_1  ,
			lambda2_1  ,

			lambda1_2  ,
			lambda2_2  ,

			lambda1_3  ,
			lambda2_3  ,

			lambda1_4  ,
			lambda2_4  ,

			lambda1_5  ,
			lambda2_5  ,

			lambda1_6  ,
			lambda2_6  ,

			lambda1_7  ,
			lambda2_7  ,

			H_in  	   ,

			R_in_0     ,
			R_in_1     ,
			R_in_2     ,
			R_in_3     ,
			R_in_4     ,
			R_in_5     ,
			R_in_6     ,
			R_in_7     ,

			Init_in  ,
			M_in,
			X_in,
					
		//output	
			SUM_out,
			Init_out,
			M_out,
			X_out  	    
);

/*-------------------------------------------------------------------*\
                            Port Description
\*-------------------------------------------------------------------*/	
input         sys_clk  ;
input         sys_rst_n;
input 		  mode;
input  [4:0]  SUM_select;

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

input  [31:0] p_mx_4     ;
input  [31:0] p_my_4     ;
input  [31:0] p_mm_4     ;

input  [31:0] p_mx_5     ;
input  [31:0] p_my_5     ;
input  [31:0] p_mm_5     ;

input  [31:0] p_mx_6     ;
input  [31:0] p_my_6     ;
input  [31:0] p_mm_6     ;

input  [31:0] p_mx_7     ;
input  [31:0] p_my_7     ;
input  [31:0] p_mm_7     ;

input  [31:0] lambda1_0  ;
input  [31:0] lambda2_0  ;

input  [31:0] lambda1_1  ;
input  [31:0] lambda2_1  ;

input  [31:0] lambda1_2  ;
input  [31:0] lambda2_2  ;

input  [31:0] lambda1_3  ;
input  [31:0] lambda2_3  ;

input  [31:0] lambda1_4  ; 
input  [31:0] lambda2_4  ;

input  [31:0] lambda1_5  ; 
input  [31:0] lambda2_5  ;

input  [31:0] lambda1_6  ; 
input  [31:0] lambda2_6  ;

input  [31:0] lambda1_7  ; 
input  [31:0] lambda2_7  ;

input  [7:0]  H_in       ;

input  [7:0]  R_in_0     ;
input  [7:0]  R_in_1     ;
input  [7:0]  R_in_2     ;
input  [7:0]  R_in_3     ;
input  [7:0]  R_in_4     ;
input  [7:0]  R_in_5     ;
input  [7:0]  R_in_6     ;
input  [7:0]  R_in_7     ;

input         Init_in  ;

input  [31:0] Y_Init   ;
input  [31:0] M_in;
input  [31:0] X_in;

//----------out-------------------

output 		  Init_out;
output [31:0] SUM_out  ;	
output [31:0] X_out;
output [31:0] M_out;


/*-------------------------------------------------------------------*\
                          Reg/Wire Description
\*-------------------------------------------------------------------*/

wire  [8:0] X_fifo_num	;
wire  [8:0] M_fifo_num	;

wire        Init_out ;


wire [31:0]   M_out_0		;
wire [31:0]   Y_out_0		;
wire [31:0]   X_out_0		;
wire 	   Init_out_0		;
wire [31:0] SUM_out_0		;
wire [7:0] 	  H_out_0		;
wire  SUM_start_out_0		;

wire [31:0] M_out_1		;
wire [31:0] Y_out_1		;
wire [31:0] X_out_1		;
wire 	 Init_out_1		;
wire [31:0] SUM_out_1	;
wire [7:0] 	H_out_1		;
wire 	SUM_start_out_1 ;

wire [31:0] M_out_2		;
wire [31:0] Y_out_2		;
wire [31:0] X_out_2		;
wire 	 Init_out_2		;
wire [31:0] SUM_out_2	;
wire [7:0] 	H_out_2		;
wire 	SUM_start_out_2 ;

wire [31:0] M_out_3		;
wire [31:0] Y_out_3		;
wire [31:0] X_out_3		;
wire 	 Init_out_3		;
wire [31:0] SUM_out_3	;
wire [7:0] 	H_out_3		;
wire 	SUM_start_out_3 ;

wire [31:0]   M_out_4		;
wire [31:0]   Y_out_4		;
wire [31:0]   X_out_4		;
wire 	   Init_out_4		;
wire [31:0] SUM_out_4		;
wire [7:0] 	  H_out_4		;
wire  SUM_start_out_4		;

wire [31:0]   M_out_5		;
wire [31:0]   Y_out_5		;
wire [31:0]   X_out_5		;
wire 	   Init_out_5		;
wire [31:0] SUM_out_5		;
wire [7:0] 	  H_out_5		;
wire  SUM_start_out_5		;

wire [31:0]   M_out_6		;
wire [31:0]   Y_out_6		;
wire [31:0]   X_out_6		;
wire 	   Init_out_6		;
wire [31:0] SUM_out_6		;
wire [7:0] 	  H_out_6		;
wire  SUM_start_out_6		;

wire [31:0]   M_out_7		;
wire [31:0]   Y_out_7		;
wire [31:0]   X_out_7		;
wire 	   Init_out_7		;
wire [31:0] SUM_out_7		;
wire [7:0] 	  H_out_7		;
wire  SUM_start_out_7		;

// wire 	rdreq			;
// wire 	wrreq			;

reg SUM_valid_0;
reg SUM_valid_1;
reg SUM_valid_2;
reg SUM_valid_3;
reg SUM_valid_4;
reg SUM_valid_5;
reg SUM_valid_6;
reg SUM_valid_7;

reg SUM_valid_reg_0;
reg SUM_valid_reg_1;
reg SUM_valid_reg_2;

reg [31:0] SUM_out_reg	;

//(*noprune*) reg infinity ;

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/

// assign rdreq = mode & Init_in;
// assign wrreq = Init_out;

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		SUM_valid_0  <= 1'b0;
		SUM_valid_1  <= 1'b0;
		SUM_valid_2  <= 1'b0;
		SUM_valid_3  <= 1'b0;
		SUM_valid_4  <= 1'b0;
		SUM_valid_5  <= 1'b0;
		SUM_valid_6  <= 1'b0;
		SUM_valid_7  <= 1'b0;
	end 
	else begin
		SUM_valid_0  <= SUM_valid;
		SUM_valid_1  <= SUM_valid;
		SUM_valid_2  <= SUM_valid;
		SUM_valid_3  <= SUM_valid;
		SUM_valid_4  <= SUM_valid;
		SUM_valid_5  <= SUM_valid;
		SUM_valid_6  <= SUM_valid;
		SUM_valid_7  <= SUM_valid;
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
		5'd0: SUM_out_reg = SUM_out_0;
		5'd1: SUM_out_reg = SUM_out_1;
		5'd2: SUM_out_reg = SUM_out_2;
		5'd3: SUM_out_reg = SUM_out_3;
		5'd4: SUM_out_reg = SUM_out_4;
		5'd5: SUM_out_reg = SUM_out_5;
		5'd6: SUM_out_reg = SUM_out_6;
		5'd7: SUM_out_reg = SUM_out_7;

		default: SUM_out_reg = SUM_out_7;
	endcase
end

		// fifo_X fifo_X (
		// 	.data (X_out_7  ), //  fifo_input.datain
		// 	.wrreq(wrreq     ), //            .wrreq
		// 	.rdreq(rdreq     ), //            .rdreq
		// 	.clock(sys_clk   ), //            .clk
		// 	.aclr (SUM_valid_reg_2), //            .aclr
		// 	.q    (X_i_j     ), // fifo_output.dataout
		// 	.usedw(X_fifo_num)
		// );

		// fifo_M fifo_M (
		// 	.data (M_out_7  ), //  fifo_input.datain
		// 	.wrreq(wrreq     ), //            .wrreq
		// 	.rdreq(rdreq     ), //            .rdreq
		// 	.clock(sys_clk   ), //            .clk
		// 	.aclr (SUM_valid_reg_2), //            .aclr
		// 	.q    (M_i_j     ), // fifo_output.dataout
		// 	.usedw(M_fifo_num)
		// );

/*-------------------------------------------------------------------*\
                             PE
\*-------------------------------------------------------------------*/

		PE0 PE0 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			.mode     (mode       ),

			.SUM_valid(SUM_valid_0),
			.SUM_start(SUM_start),
			
			.M_i_j    (M_in      ),
			.X_i_j    (X_in      ),
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

		PEx PE4 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_4),
			.SUM_start(SUM_start_out_3),
			
			.M_i_j    (M_out_3    ),
			.X_i_j    (X_out_3    ),
			.Y_i_j    (Y_out_4    ),
			
			.p_mx     (p_mx_4     ),
			.p_my     (p_my_4     ),
			.p_mm     (p_mm_4     ),
			
			.lambda1  (lambda1_4  ),
			.lambda2  (lambda2_4  ),
			
			.H_in     (H_out_3    ),
			.R_in     (R_in_4     ),
			
			.Init_in  (Init_out_3 ),
			
			.M_out    (M_out_4    ),
			.X_out    (X_out_4    ),
			.Y_out    (Y_out_4    ),
			.SUM_start_out(SUM_start_out_4),
			
			.Init_out (Init_out_4 ),
			.SUM_out  (SUM_out_4  ),
			.H_out    (H_out_4    )
		);

		PEx PE5 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_5),
			.SUM_start(SUM_start_out_4),
			
			.M_i_j    (M_out_4    ),
			.X_i_j    (X_out_4    ),
			.Y_i_j    (Y_out_5    ),
			
			.p_mx     (p_mx_5     ),
			.p_my     (p_my_5     ),
			.p_mm     (p_mm_5     ),
			
			.lambda1  (lambda1_5  ),
			.lambda2  (lambda2_5  ),
			
			.H_in     (H_out_4    ),
			.R_in     (R_in_5     ),
			
			.Init_in  (Init_out_4 ),
			
			.M_out    (M_out_5    ),
			.X_out    (X_out_5    ),
			.Y_out    (Y_out_5    ),
			.SUM_start_out(SUM_start_out_5),
			
			.Init_out (Init_out_5 ),
			.SUM_out  (SUM_out_5  ),
			.H_out    (H_out_5    )
		);

		PEx PE6 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_6),
			.SUM_start(SUM_start_out_5),
			
			.M_i_j    (M_out_5    ),
			.X_i_j    (X_out_5    ),
			.Y_i_j    (Y_out_6    ),
			
			.p_mx     (p_mx_6     ),
			.p_my     (p_my_6     ),
			.p_mm     (p_mm_6     ),
			
			.lambda1  (lambda1_6  ),
			.lambda2  (lambda2_6  ),
			
			.H_in     (H_out_5    ),
			.R_in     (R_in_6     ),
			
			.Init_in  (Init_out_5 ),
			
			.M_out    (M_out_6    ),
			.X_out    (X_out_6    ),
			.Y_out    (Y_out_6    ),
			.SUM_start_out(SUM_start_out_6),
			
			.Init_out (Init_out_6 ),
			.SUM_out  (SUM_out_6  ),
			.H_out    (H_out_6    )
		);

		PEx PE7 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_7),
			.SUM_start(SUM_start_out_6),
			
			.M_i_j    (M_out_6    ),
			.X_i_j    (X_out_6    ),
			.Y_i_j    (Y_out_7    ),
			
			.p_mx     (p_mx_7     ),
			.p_my     (p_my_7     ),
			.p_mm     (p_mm_7     ),
			
			.lambda1  (lambda1_7  ),
			.lambda2  (lambda2_7  ),
			
			.H_in     (H_out_6    ),
			.R_in     (R_in_7     ),
			
			.Init_in  (Init_out_6 ),
			
			.M_out    (M_out_7    ),
			.X_out    (X_out_7    ),
			.Y_out    (Y_out_7    ),
			.SUM_start_out(SUM_start_out_7),
			
			.Init_out (Init_out_7 ),
			.SUM_out  (SUM_out_7  ),
			.H_out    (H_out_7    )
		);

assign Init_out = Init_out_7;
assign SUM_out = SUM_out_reg;
assign M_out = M_out_7;
assign X_out = X_out_7;


endmodule 