
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
//  2017-04-10       cz             initial version
//
**********************************************************************/
`timescale 1ns/1ps
module calculate_module (
//input 
 sys_clk,
 sys_rst_n,
 m_i1_j1,
 m_i1_j,
 x_i1_j1,
 x_i1_j,
 y_i1_j1,

 p_mx,
 p_my,
 p_mm,
 lambda,
 float_q_0,

 head,
 flag_lam,
 sum_vld,
 col_cnt,
 en_sum,

 m_i_j,
 x_i_j,
 y_i_j,
 result,
 result_vld
);

/*-------------------------------------------------------------------*\
                          Parameter Description
\*-------------------------------------------------------------------*/	
parameter FLOAT_C_0 = 32'h3F666666;
parameter FLOAT_C_1 = 32'h3DCCCCCC;

/*-------------------------------------------------------------------*\
                            Port Description
\*-------------------------------------------------------------------*/	
input         sys_clk  ;
input         sys_rst_n;
input  [31:0] m_i1_j1  ;
input  [31:0] m_i1_j   ;
input  [31:0] x_i1_j1  ;
input  [31:0] x_i1_j   ;
input  [31:0] y_i1_j1  ;
input  [31:0] p_mx     ;
input  [31:0] p_my     ;
input  [31:0] p_mm     ;
input  [31:0] lambda   ;
input  [31:0] float_q_0;
input  [63:0] head     ;
input         flag_lam ;
input         sum_vld  ;
input  [ 8:0] col_cnt  ;
input         en_sum   ;
output [31:0] m_i_j    ;
output [31:0] x_i_j    ;
output [31:0] y_i_j    ;
output reg [95:0] result;
output reg	 result_vld;

/*-------------------------------------------------------------------*\
                          Reg/Wire Description
\*-------------------------------------------------------------------*/
wire [31:0] lambda_true;
reg  [31:0] p_xm_ym;
reg  [31:0] p_xx_yy;
wire [31:0] m_i_j1;
wire [31:0] y_i_j1;

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

reg [31:0] m2_out_0;
reg [31:0] m2_out_1;
reg [31:0] m2_out_2;

reg [31:0] lambda_0;
reg [31:0] lambda_1;
reg [31:0] lambda_2;
reg [31:0] lambda_3;
reg [31:0] lambda_4;
reg [31:0] lambda_5;
reg [31:0] lambda_6;
reg [31:0] lambda_7;
reg [31:0] lambda_8;

reg [31:0] a2_out_0;
reg [31:0] a2_out_1;
reg [31:0] a2_out_2;
reg [31:0] a2_out_3;
reg [31:0] a2_out_4;
reg [31:0] a2_out_5;

reg [31:0] a3_out_0;
reg [31:0] a3_out_1;
reg [31:0] a3_out_2;
reg [31:0] a3_out_3;
reg [31:0] a3_out_4;
reg [31:0] a3_out_5;

reg [31:0] m_i_j_for_sum;
reg [31:0] x_i_j_for_sum;
reg [31:0] x_add_m_0    ;
reg [31:0] x_add_m_1    ;
reg [31:0] x_add_m_2    ;
reg [31:0] x_add_m_3    ;
reg [31:0] x_add_m_4    ;
wire[31:0] x_add_m 		;

reg [31:0] sum_0   ;
reg [31:0] sum_1   ;
reg [31:0] sum_2   ;
reg [31:0] sum_3   ;
reg [31:0] sum_4   ;
reg [31:0] sum_5   ;
reg [31:0] sum_6   ;
reg [31:0] sum_7   ;
reg [31:0] sum_8   ;

reg [95:0] temp_result;
reg m_en;

(*noprune*) reg infinity ;

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/
assign lambda_true = (flag_lam)? float_q_0 : lambda;

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		p_xm_ym <= 32'd0;
	end else begin 
		p_xm_ym <= FLOAT_C_0;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		p_xx_yy <= 32'd0;
	end else begin 
		p_xx_yy <= FLOAT_C_1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		m_en <= 1'b0;
	end else begin
		m_en <= 1'b1;
	end 
end



fp_mult m0 (			//mi1,j1*pmm
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (p_mm),
	.b     (m_i1_j1),
	.q     (m0_out),
	.en    (m_en)
	);

fp_mult m1(				//xi1,j1 * pxm
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (p_xm_ym),
	.b     (x_i1_j1),
	.q     (m1_out),
	.en    (m_en)
	);

fp_mult m2 (			//yi1,j1 * pym
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (p_xm_ym),
	.b     (y_i1_j1),
	.q     (m2_out),
	.en    (m_en)
	);



fp_mult m3 (			//mi1,j * pmx
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (p_mx),
	.b     (m_i1_j),
	.q     (m3_out),
	.en    (m_en)
	);

fp_mult m4 (			//xi1,j * pxx
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (p_xx_yy),
	.b     (x_i1_j),
	.q     (m4_out),
	.en    (m_en)
	);

fp_mult m5 (			//mi_j1 * pmy
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (m_i_j1),
	.b     (p_my),
	.q     (m5_out),
	.en    (m_en)
	);

fp_mult m6 (			//p_xx_yy * yi_j1
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (y_i_j1),
	.b     (p_xx_yy),
	.q     (m6_out),
	.en    (m_en)
	) ;

fp_mult m7 (			//
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (lambda_8),
	.b     (a1_out),
	.q     (m7_out),
	.en    (m_en)
	);

fp_add  a0 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (m0_out),
	.b     (m1_out),
	.q     (a0_out),
	.en    (m_en)
	);

fp_add a1 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (a0_out),
	.b     (m2_out_2),
	.q     (a1_out),
	.en    (m_en)
	);

fp_add a2 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (m3_out),
	.b     (m4_out),
	.q     (a2_out),
	.en    (m_en)  
	);

fp_add a3 ( 
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (m5_out),
	.b     (m6_out),
	.q     (a3_out),
	.en    (m_en)
	);


always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		m2_out_0 <=  32'b0;
	else 
		m2_out_0 <=  m2_out;
end


always @ (posedge sys_clk or negedge sys_rst_n)//m2输出延迟第2拍
begin 
	if (!sys_rst_n)
		m2_out_1 <=  32'b0;
	else 
		m2_out_1 <=  m2_out_0;
end


always @ (posedge sys_clk or negedge sys_rst_n)//m2输出延迟第3拍
begin 
	if (!sys_rst_n)
		m2_out_2 <=  32'b0;
	else 
		m2_out_2 <=  m2_out_1;
end


always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_0 <=  32'b0;
	else 
		lambda_0 <=  lambda_true;
end

always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_1 <=  32'b0;
	else 
		lambda_1 <=  lambda_0;
end

always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_2 <=  32'b0;
	else 
		lambda_2 <=  lambda_1;
end

always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_3 <=  32'b0;
	else 
		lambda_3 <=  lambda_2;
end

always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_4 <=  32'b0;
	else 
		lambda_4 <=  lambda_3;
end

always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_5 <=  32'b0;
	else 
		lambda_5 <=  lambda_4;
end

always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_6 <=  32'b0;
	else 
		lambda_6 <=  lambda_5;
end

always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_7 <=  32'b0;
	else 
		lambda_7 <=  lambda_6;
end

always @ (posedge sys_clk , negedge sys_rst_n) //m2输出延迟第1拍
begin 
	if (!sys_rst_n)
		lambda_8 <=  32'b0;
	else 
		lambda_8 <=  lambda_7;
end


always @ (posedge sys_clk or negedge sys_rst_n) //a2输出延迟第1拍
begin 
	if (!sys_rst_n)
		a2_out_0 <=  32'b0;
	else 
		a2_out_0 <=  a2_out;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a2输出延迟第2拍
begin 
	if (!sys_rst_n)
		a2_out_1 <=  32'b0;
	else 
		a2_out_1 <=  a2_out_0;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a2输出延迟第3拍
begin 
	if (!sys_rst_n)
		a2_out_2 <=  32'b0;
	else 
		a2_out_2 <=  a2_out_1;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a2输出延迟第3拍
begin 
	if (!sys_rst_n)
		a2_out_3 <=  32'b0;
	else 
		a2_out_3 <=  a2_out_2;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a2输出延迟第4拍
begin 
	if (!sys_rst_n)
		a2_out_4 <=  32'b0;
	else 
		a2_out_4 <=  a2_out_3;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a2输出延迟第3拍
begin 
	if (!sys_rst_n)
		a2_out_5 <=  32'b0;
	else 
		a2_out_5 <=  a2_out_4;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a3输出延迟第1拍
begin 
	if (!sys_rst_n)
		a3_out_0 <=  32'b0;
	else 
		a3_out_0 <=  a3_out;
end


always @ (posedge sys_clk or negedge sys_rst_n) //a3输出延迟第2拍
begin 
	if (!sys_rst_n)
		a3_out_1 <=  32'b0;
	else 
		a3_out_1 <=  a3_out_0;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a3输出延迟第3拍
begin 
	if (!sys_rst_n)
		a3_out_2 <=  32'b0;
	else 
		a3_out_2 <=  a3_out_1;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a3输出延迟第4拍
begin 
	if (!sys_rst_n)
		a3_out_3 <=  32'b0;
	else 
		a3_out_3 <=  a3_out_2;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a3输出延迟第3拍
begin 
	if (!sys_rst_n)
		a3_out_4 <=  32'b0;
	else 
		a3_out_4 <=  a3_out_3;
end

always @ (posedge sys_clk or negedge sys_rst_n) //a3输出延迟第3拍
begin 
	if (!sys_rst_n)
		a3_out_5 <=  32'b0;
	else 
		a3_out_5 <=  a3_out_4;
end

assign m_i_j1 = (col_cnt == 0)? 0 : m_i_j;
assign y_i_j1 = (col_cnt == 0)? 0 : y_i_j;


assign m_i_j = m7_out;
assign x_i_j = a2_out_5;
assign y_i_j = a3_out_5;


wire [31:0] sum;
fp_add m_x_a4 (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (m_i_j_for_sum),
	.b     (x_i_j_for_sum),
	.q     (x_add_m),
	.en    (m_en)
	);

fp_add sum_all (
	.clk   (sys_clk),
	.areset(!sys_rst_n),
	.a     (x_add_m_4),
	.b     (sum_8),
	.q     (sum),
	.en    (m_en)
	);

always @ (posedge sys_clk or negedge sys_rst_n) // 准备进行累加的m_i_j_for_sum;
begin 
	if (!sys_rst_n)
		m_i_j_for_sum <=  0;
	else 
		m_i_j_for_sum <=  m_i_j;
end

always @(posedge sys_clk or negedge sys_rst_n) // 准备进行累加的x_i_j_for_sum;
begin 
 	if(!sys_rst_n) 
 		x_i_j_for_sum <=  0;
 	else 
 		x_i_j_for_sum <=  x_i_j;
end 


always @(posedge sys_clk or negedge sys_rst_n) // 
begin 
	if (!sys_rst_n)
		x_add_m_0 <= 0;
	else
		x_add_m_0 <= x_add_m;
end


always @(posedge sys_clk or negedge sys_rst_n) // 
begin 
	if (!sys_rst_n)
		x_add_m_1 <= 0;
	else
		x_add_m_1 <= x_add_m_0;
end

always @(posedge sys_clk or negedge sys_rst_n) // x_add_m_1
begin 
	if (!sys_rst_n)
		x_add_m_2 <= 0;
	else
		x_add_m_2 <= x_add_m_1;
end

always @(posedge sys_clk or negedge sys_rst_n) // x_add_m_1
begin 
	if (!sys_rst_n)
		x_add_m_3 <= 0;
	else
		x_add_m_3 <= x_add_m_2;
end

always @(posedge sys_clk or negedge sys_rst_n) // x_add_m_1
begin 
	if (!sys_rst_n)
		x_add_m_4 <= 0;
	else
		x_add_m_4 <= x_add_m_3;
end


always @(posedge sys_clk or negedge sys_rst_n) // sum_1做时延用
begin 
 	if(!sys_rst_n) 
 		sum_0 <=  32'b0;
 	else if (!en_sum)
 		sum_0 <=  0;
 	else 
 		sum_0 <=  sum;
end

always @(posedge sys_clk or negedge sys_rst_n) // 
begin 
 	if(!sys_rst_n) 
 		sum_1 <=  32'b0;
 	else  
 		sum_1 <=  sum_0;
end

always @(posedge sys_clk or negedge sys_rst_n) // 
begin 
 	if(!sys_rst_n) 
 		sum_2 <=  32'b0;
 	else  
 		sum_2 <=  sum_1;
end

always @(posedge sys_clk or negedge sys_rst_n) // 
begin 
 	if(!sys_rst_n) 
 		sum_3 <=  32'b0;
 	else  
 		sum_3 <=  sum_2;
end

always @(posedge sys_clk or negedge sys_rst_n) // sum_2
begin 
 	if(!sys_rst_n) 
 		sum_4 <=  32'b0;
 	else  
 		sum_4 <=  sum_3;
end

always @(posedge sys_clk or negedge sys_rst_n) // sum_2
begin 
 	if(!sys_rst_n) 
 		sum_5 <=  32'b0;
 	else  
 		sum_5 <=  sum_4;
end

always @(posedge sys_clk or negedge sys_rst_n) // sum_2
begin 
 	if(!sys_rst_n) 
 		sum_6 <=  32'b0;
 	else  
 		sum_6 <=  sum_5;
end

always @(posedge sys_clk or negedge sys_rst_n) // sum_2
begin 
 	if(!sys_rst_n) 
 		sum_7 <=  32'b0;
 	else  
 		sum_7 <=  sum_6;
end

always @(posedge sys_clk or negedge sys_rst_n) // sum_2
begin 
 	if(!sys_rst_n) 
 		sum_8 <=  32'b0;
 	else  
 		sum_8 <=  sum_7;
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n)
		result <= 96'd0;
	else if (sum_vld)
		result <= {head,sum};
	else 
		result <= 96'd0;
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n)
		result_vld <= 1'b0;
	else if (sum_vld)
		result_vld <= 1'b1;
	else 
		result_vld <= 1'b0;
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n)
		infinity <= 1'b0;
	else if (result_vld && (result[31:0] == 32'h7f800000))
		infinity <= 1'b1;
	else if (result_vld && (result[31:0] == 32'h7fc00000))
		infinity <= 1'b1;
	else 
		infinity <= 1'b0;
end



endmodule // calculate_module