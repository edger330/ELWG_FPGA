`timescale 1ns / 1ps

module pip_top(
	//input
	sys_clk           ,
	sys_rst_n         ,

	matrix_memory_sop0  ,
	matrix_memory_eop0  ,
	matrix_memory_vld0  ,
	matrix_memory_data0 ,

	matrix_memory_sop1  ,
	matrix_memory_eop1  ,
	matrix_memory_vld1  ,
	matrix_memory_data1 ,
	
	matrix_memory_sop2  ,
	matrix_memory_eop2  ,
	matrix_memory_vld2  ,
	matrix_memory_data2 ,
	
	matrix_memory_sop3  ,
	matrix_memory_eop3  ,
	matrix_memory_vld3  ,
	matrix_memory_data3 ,
	
	matrix_memory_sop4  ,
	matrix_memory_eop4  ,
	matrix_memory_vld4  ,
	matrix_memory_data4 ,
	
	matrix_memory_sop5  ,
	matrix_memory_eop5  ,
	matrix_memory_vld5  ,
	matrix_memory_data5 ,
	
	result_fifo_rden  ,
	//output
	pkt_receive_enable_SS,
	result_fifo_rdat,
	result_fifo_empty
	);

/*-------------------------------------------------------------------*\
                          Parameter Description
\*-------------------------------------------------------------------*/
parameter T0 = 6'b000001;
parameter T1 = 6'b000010;
parameter T2 = 6'b000100;
parameter T3 = 6'b001000;
parameter T4 = 6'b010000;
parameter T5 = 6'b100000;


parameter CAL_IDLE = 9'b000000001;
parameter S0       = 9'b000000010;
parameter S1       = 9'b000000100;
parameter S2       = 9'b000001000;
parameter S3       = 9'b000010000;
parameter S4       = 9'b000100000;
parameter S5       = 9'b001000000;
parameter WAIT_6   = 9'b010000000;
parameter CAL_DONE = 9'b100000000;

/*-------------------------------------------------------------------*\
                          port Description                      
\*-------------------------------------------------------------------*/

input wire        sys_clk            ;
input wire        sys_rst_n          ;

input wire	matrix_memory_sop0         ;
input wire	matrix_memory_eop0         ;
input wire	matrix_memory_vld0         ;
input wire	[31:0] matrix_memory_data0 ;

input wire	matrix_memory_sop1         ;
input wire	matrix_memory_eop1         ;
input wire	matrix_memory_vld1         ;
input wire	[31:0] matrix_memory_data1 ;

input wire	matrix_memory_sop2         ;
input wire	matrix_memory_eop2         ;
input wire	matrix_memory_vld2         ;
input wire	[31:0] matrix_memory_data2 ;

input wire	matrix_memory_sop3         ;
input wire	matrix_memory_eop3         ;
input wire	matrix_memory_vld3         ;
input wire	[31:0] matrix_memory_data3 ;

input wire	matrix_memory_sop4         ;
input wire	matrix_memory_eop4         ;
input wire	matrix_memory_vld4         ;
input wire	[31:0] matrix_memory_data4 ;

input wire	matrix_memory_sop5         ;
input wire	matrix_memory_eop5         ;
input wire	matrix_memory_vld5         ;
input wire	[31:0] matrix_memory_data5 ;

input wire        result_fifo_rden   ;

//output;
output wire [5:0] pkt_receive_enable_SS ;
output wire [127:0] result_fifo_rdat    ;
output wire result_fifo_empty           ;

/*-------------------------------------------------------------------*\
                          Reg/wire Description
\*-------------------------------------------------------------------*/

reg mode             ;
reg [4:0] sum_select ;
reg sum_vld          ;

reg [31:0] pmx_0     ;
reg [31:0] pmy_0     ;
reg [31:0] pmm_0     ;
reg [31:0] lambda0_0 ;
reg [31:0] lambda1_0 ;
reg [ 7:0] r_0       ;

reg [31:0] pmx_1     ;
reg [31:0] pmy_1     ;
reg [31:0] pmm_1     ;
reg [31:0] lambda0_1 ;
reg [31:0] lambda1_1 ;
reg [ 7:0] r_1       ;

reg [31:0] pmx_2     ;
reg [31:0] pmy_2     ;
reg [31:0] pmm_2     ;
reg [31:0] lambda0_2 ;
reg [31:0] lambda1_2 ;
reg [ 7:0] r_2       ;

reg [31:0] pmx_3     ;
reg [31:0] pmy_3     ;
reg [31:0] pmm_3     ;
reg [31:0] lambda0_3 ;
reg [31:0] lambda1_3 ;
reg [ 7:0] r_3       ;

reg [31:0] pmx_4     ;
reg [31:0] pmy_4     ;
reg [31:0] pmm_4     ;
reg [31:0] lambda0_4 ;
reg [31:0] lambda1_4 ;
reg [ 7:0] r_4       ;

reg [31:0] pmx_5     ;
reg [31:0] pmy_5     ;
reg [31:0] pmm_5     ;
reg [31:0] lambda0_5 ;
reg [31:0] lambda1_5 ;
reg [ 7:0] r_5       ;

reg [31:0] pmx_6     ;
reg [31:0] pmy_6     ;
reg [31:0] pmm_6     ;
reg [31:0] lambda0_6 ;
reg [31:0] lambda1_6 ;
reg [ 7:0] r_6       ;

reg [31:0] pmx_7     ;
reg [31:0] pmy_7     ;
reg [31:0] pmm_7     ;
reg [31:0] lambda0_7 ;
reg [31:0] lambda1_7 ;
reg [ 7:0] r_7       ;

reg [7:0] H_in       ;
reg [31:0] y_initial ;
reg init            ;
wire [31:0] sum      ;
reg en_sum           ;

reg [31:0] SS_fifo_X_out;
reg [31:0] SS_fifo_M_out;

wire [31:0] X_i_j_out;
wire [31:0] M_i_j_out;

reg [5:0] current_state;
reg [5:0] next_state;

//----------------------------------------

wire [31:0] SS0_pmx_0;
wire [31:0] SS0_pmy_0;
wire [31:0] SS0_pmm_0;
wire [31:0] SS0_lambda0_0;
wire [31:0] SS0_lambda1_0;
wire [7:0] SS0_r_0;

wire [31:0] SS0_pmx_1;
wire [31:0] SS0_pmy_1;
wire [31:0] SS0_pmm_1;
wire [31:0] SS0_lambda0_1;
wire [31:0] SS0_lambda1_1;
wire [7:0] SS0_r_1;

wire [31:0] SS0_pmx_2;
wire [31:0] SS0_pmy_2;
wire [31:0] SS0_pmm_2;
wire [31:0] SS0_lambda0_2;
wire [31:0] SS0_lambda1_2;
wire [7:0] SS0_r_2;

wire [31:0] SS0_pmx_3;
wire [31:0] SS0_pmy_3;
wire [31:0] SS0_pmm_3;
wire [31:0] SS0_lambda0_3;
wire [31:0] SS0_lambda1_3;
wire [7:0] SS0_r_3;

wire [31:0] SS0_pmx_4;
wire [31:0] SS0_pmy_4;
wire [31:0] SS0_pmm_4;
wire [31:0] SS0_lambda0_4;
wire [31:0] SS0_lambda1_4;
wire [7:0] SS0_r_4;

wire [31:0] SS0_pmx_5;
wire [31:0] SS0_pmy_5;
wire [31:0] SS0_pmm_5;
wire [31:0] SS0_lambda0_5;
wire [31:0] SS0_lambda1_5;
wire [7:0] SS0_r_5;

wire [31:0] SS0_pmx_6;
wire [31:0] SS0_pmy_6;
wire [31:0] SS0_pmm_6;
wire [31:0] SS0_lambda0_6;
wire [31:0] SS0_lambda1_6;
wire [7:0] SS0_r_6;

wire [31:0] SS0_pmx_7;
wire [31:0] SS0_pmy_7;
wire [31:0] SS0_pmm_7;
wire [31:0] SS0_lambda0_7;
wire [31:0] SS0_lambda1_7;
wire [7:0] SS0_r_7;

wire [31:0] SS1_pmx_0;
wire [31:0] SS1_pmy_0;
wire [31:0] SS1_pmm_0;
wire [31:0] SS1_lambda0_0;
wire [31:0] SS1_lambda1_0;
wire [7:0] SS1_r_0;

wire [31:0] SS1_pmx_1;
wire [31:0] SS1_pmy_1;
wire [31:0] SS1_pmm_1;
wire [31:0] SS1_lambda0_1;
wire [31:0] SS1_lambda1_1;
wire [7:0] SS1_r_1;

wire [31:0] SS1_pmx_2;
wire [31:0] SS1_pmy_2;
wire [31:0] SS1_pmm_2;
wire [31:0] SS1_lambda0_2;
wire [31:0] SS1_lambda1_2;
wire [7:0] SS1_r_2;

wire [31:0] SS1_pmx_3;
wire [31:0] SS1_pmy_3;
wire [31:0] SS1_pmm_3;
wire [31:0] SS1_lambda0_3;
wire [31:0] SS1_lambda1_3;
wire [7:0] SS1_r_3;

wire [31:0] SS1_pmx_4;
wire [31:0] SS1_pmy_4;
wire [31:0] SS1_pmm_4;
wire [31:0] SS1_lambda0_4;
wire [31:0] SS1_lambda1_4;
wire [7:0] SS1_r_4;

wire [31:0] SS1_pmx_5;
wire [31:0] SS1_pmy_5;
wire [31:0] SS1_pmm_5;
wire [31:0] SS1_lambda0_5;
wire [31:0] SS1_lambda1_5;
wire [7:0] SS1_r_5;

wire [31:0] SS1_pmx_6;
wire [31:0] SS1_pmy_6;
wire [31:0] SS1_pmm_6;
wire [31:0] SS1_lambda0_6;
wire [31:0] SS1_lambda1_6;
wire [7:0] SS1_r_6;

wire [31:0] SS1_pmx_7;
wire [31:0] SS1_pmy_7;
wire [31:0] SS1_pmm_7;
wire [31:0] SS1_lambda0_7;
wire [31:0] SS1_lambda1_7;
wire [7:0] SS1_r_7;

wire [31:0] SS2_pmx_0;
wire [31:0] SS2_pmy_0;
wire [31:0] SS2_pmm_0;
wire [31:0] SS2_lambda0_0;
wire [31:0] SS2_lambda1_0;
wire [7:0] SS2_r_0;

wire [31:0] SS2_pmx_1;
wire [31:0] SS2_pmy_1;
wire [31:0] SS2_pmm_1;
wire [31:0] SS2_lambda0_1;
wire [31:0] SS2_lambda1_1;
wire [7:0] SS2_r_1;

wire [31:0] SS2_pmx_2;
wire [31:0] SS2_pmy_2;
wire [31:0] SS2_pmm_2;
wire [31:0] SS2_lambda0_2;
wire [31:0] SS2_lambda1_2;
wire [7:0] SS2_r_2;

wire [31:0] SS2_pmx_3;
wire [31:0] SS2_pmy_3;
wire [31:0] SS2_pmm_3;
wire [31:0] SS2_lambda0_3;
wire [31:0] SS2_lambda1_3;
wire [7:0] SS2_r_3;

wire [31:0] SS2_pmx_4;
wire [31:0] SS2_pmy_4;
wire [31:0] SS2_pmm_4;
wire [31:0] SS2_lambda0_4;
wire [31:0] SS2_lambda1_4;
wire [7:0] SS2_r_4;

wire [31:0] SS2_pmx_5;
wire [31:0] SS2_pmy_5;
wire [31:0] SS2_pmm_5;
wire [31:0] SS2_lambda0_5;
wire [31:0] SS2_lambda1_5;
wire [7:0] SS2_r_5;

wire [31:0] SS2_pmx_6;
wire [31:0] SS2_pmy_6;
wire [31:0] SS2_pmm_6;
wire [31:0] SS2_lambda0_6;
wire [31:0] SS2_lambda1_6;
wire [7:0] SS2_r_6;

wire [31:0] SS2_pmx_7;
wire [31:0] SS2_pmy_7;
wire [31:0] SS2_pmm_7;
wire [31:0] SS2_lambda0_7;
wire [31:0] SS2_lambda1_7;
wire [7:0] SS2_r_7;

wire [31:0] SS3_pmx_0;
wire [31:0] SS3_pmy_0;
wire [31:0] SS3_pmm_0;
wire [31:0] SS3_lambda0_0;
wire [31:0] SS3_lambda1_0;
wire [7:0] SS3_r_0;

wire [31:0] SS3_pmx_1;
wire [31:0] SS3_pmy_1;
wire [31:0] SS3_pmm_1;
wire [31:0] SS3_lambda0_1;
wire [31:0] SS3_lambda1_1;
wire [7:0] SS3_r_1;

wire [31:0] SS3_pmx_2;
wire [31:0] SS3_pmy_2;
wire [31:0] SS3_pmm_2;
wire [31:0] SS3_lambda0_2;
wire [31:0] SS3_lambda1_2;
wire [7:0] SS3_r_2;

wire [31:0] SS3_pmx_3;
wire [31:0] SS3_pmy_3;
wire [31:0] SS3_pmm_3;
wire [31:0] SS3_lambda0_3;
wire [31:0] SS3_lambda1_3;
wire [7:0] SS3_r_3;

wire [31:0] SS3_pmx_4;
wire [31:0] SS3_pmy_4;
wire [31:0] SS3_pmm_4;
wire [31:0] SS3_lambda0_4;
wire [31:0] SS3_lambda1_4;
wire [7:0] SS3_r_4;

wire [31:0] SS3_pmx_5;
wire [31:0] SS3_pmy_5;
wire [31:0] SS3_pmm_5;
wire [31:0] SS3_lambda0_5;
wire [31:0] SS3_lambda1_5;
wire [7:0] SS3_r_5;

wire [31:0] SS3_pmx_6;
wire [31:0] SS3_pmy_6;
wire [31:0] SS3_pmm_6;
wire [31:0] SS3_lambda0_6;
wire [31:0] SS3_lambda1_6;
wire [7:0] SS3_r_6;

wire [31:0] SS3_pmx_7;
wire [31:0] SS3_pmy_7;
wire [31:0] SS3_pmm_7;
wire [31:0] SS3_lambda0_7;
wire [31:0] SS3_lambda1_7;
wire [7:0] SS3_r_7;

wire [31:0] SS4_pmx_0;
wire [31:0] SS4_pmy_0;
wire [31:0] SS4_pmm_0;
wire [31:0] SS4_lambda0_0;
wire [31:0] SS4_lambda1_0;
wire [7:0] SS4_r_0;

wire [31:0] SS4_pmx_1;
wire [31:0] SS4_pmy_1;
wire [31:0] SS4_pmm_1;
wire [31:0] SS4_lambda0_1;
wire [31:0] SS4_lambda1_1;
wire [7:0] SS4_r_1;

wire [31:0] SS4_pmx_2;
wire [31:0] SS4_pmy_2;
wire [31:0] SS4_pmm_2;
wire [31:0] SS4_lambda0_2;
wire [31:0] SS4_lambda1_2;
wire [7:0] SS4_r_2;

wire [31:0] SS4_pmx_3;
wire [31:0] SS4_pmy_3;
wire [31:0] SS4_pmm_3;
wire [31:0] SS4_lambda0_3;
wire [31:0] SS4_lambda1_3;
wire [7:0] SS4_r_3;

wire [31:0] SS4_pmx_4;
wire [31:0] SS4_pmy_4;
wire [31:0] SS4_pmm_4;
wire [31:0] SS4_lambda0_4;
wire [31:0] SS4_lambda1_4;
wire [7:0] SS4_r_4;

wire [31:0] SS4_pmx_5;
wire [31:0] SS4_pmy_5;
wire [31:0] SS4_pmm_5;
wire [31:0] SS4_lambda0_5;
wire [31:0] SS4_lambda1_5;
wire [7:0] SS4_r_5;

wire [31:0] SS4_pmx_6;
wire [31:0] SS4_pmy_6;
wire [31:0] SS4_pmm_6;
wire [31:0] SS4_lambda0_6;
wire [31:0] SS4_lambda1_6;
wire [7:0] SS4_r_6;

wire [31:0] SS4_pmx_7;
wire [31:0] SS4_pmy_7;
wire [31:0] SS4_pmm_7;
wire [31:0] SS4_lambda0_7;
wire [31:0] SS4_lambda1_7;
wire [7:0] SS4_r_7;

wire [31:0] SS5_pmx_0;
wire [31:0] SS5_pmy_0;
wire [31:0] SS5_pmm_0;
wire [31:0] SS5_lambda0_0;
wire [31:0] SS5_lambda1_0;
wire [7:0] SS5_r_0;

wire [31:0] SS5_pmx_1;
wire [31:0] SS5_pmy_1;
wire [31:0] SS5_pmm_1;
wire [31:0] SS5_lambda0_1;
wire [31:0] SS5_lambda1_1;
wire [7:0] SS5_r_1;

wire [31:0] SS5_pmx_2;
wire [31:0] SS5_pmy_2;
wire [31:0] SS5_pmm_2;
wire [31:0] SS5_lambda0_2;
wire [31:0] SS5_lambda1_2;
wire [7:0] SS5_r_2;

wire [31:0] SS5_pmx_3;
wire [31:0] SS5_pmy_3;
wire [31:0] SS5_pmm_3;
wire [31:0] SS5_lambda0_3;
wire [31:0] SS5_lambda1_3;
wire [7:0] SS5_r_3;

wire [31:0] SS5_pmx_4;
wire [31:0] SS5_pmy_4;
wire [31:0] SS5_pmm_4;
wire [31:0] SS5_lambda0_4;
wire [31:0] SS5_lambda1_4;
wire [7:0] SS5_r_4;

wire [31:0] SS5_pmx_5;
wire [31:0] SS5_pmy_5;
wire [31:0] SS5_pmm_5;
wire [31:0] SS5_lambda0_5;
wire [31:0] SS5_lambda1_5;
wire [7:0] SS5_r_5;

wire [31:0] SS5_pmx_6;
wire [31:0] SS5_pmy_6;
wire [31:0] SS5_pmm_6;
wire [31:0] SS5_lambda0_6;
wire [31:0] SS5_lambda1_6;
wire [7:0] SS5_r_6;

wire [31:0] SS5_pmx_7;
wire [31:0] SS5_pmy_7;
wire [31:0] SS5_pmm_7;
wire [31:0] SS5_lambda0_7;
wire [31:0] SS5_lambda1_7;
wire [7:0] SS5_r_7;

reg [31:0] SS0_fifo_X_in;
reg [31:0] SS0_fifo_M_in;
reg SS0_fifo_wrreq;
reg SS0_fifo_rdreq;
wire [31:0] SS0_X;
wire [31:0] SS0_M;
wire [4:0] SS0_sum_select;
wire SS0_sum_vld;
wire [7:0] SS0_H_in;

wire SS0_busy;
wire [8:0] SS0_cal_current_state;
wire SS0_init;
wire [31:0] SS0_y_initial;
reg [31:0] SS0_sum;
wire SS0_en_sum;
wire [63:0] SS0_head;

reg [31:0] SS1_fifo_X_in;
reg [31:0] SS1_fifo_M_in;
reg SS1_fifo_wrreq;
reg SS1_fifo_rdreq;
wire [31:0] SS1_X;
wire [31:0] SS1_M;
wire [4:0] SS1_sum_select;
wire SS1_sum_vld;
wire [7:0] SS1_H_in;

wire SS1_busy;
wire [8:0] SS1_cal_current_state;
wire SS1_init;
wire [31:0] SS1_y_initial;
reg [31:0] SS1_sum;
wire SS1_en_sum;
wire [63:0] SS1_head;

reg [31:0] SS2_fifo_X_in;
reg [31:0] SS2_fifo_M_in;
reg SS2_fifo_wrreq;
reg SS2_fifo_rdreq;
wire [31:0] SS2_X;
wire [31:0] SS2_M;
wire [4:0] SS2_sum_select;
wire SS2_sum_vld;
wire [7:0] SS2_H_in;

wire SS2_busy;
wire [8:0] SS2_cal_current_state;
wire SS2_init;
wire [31:0] SS2_y_initial;
reg [31:0] SS2_sum;
wire SS2_en_sum;
wire [63:0] SS2_head;

reg [31:0] SS3_fifo_X_in;
reg [31:0] SS3_fifo_M_in;
reg SS3_fifo_wrreq;
reg SS3_fifo_rdreq;
wire [31:0] SS3_X;
wire [31:0] SS3_M;
wire [4:0] SS3_sum_select;
wire SS3_sum_vld;
wire [7:0] SS3_H_in;

wire SS3_busy;
wire [8:0] SS3_cal_current_state;
wire SS3_init;
wire [31:0] SS3_y_initial;
reg [31:0] SS3_sum;
wire SS3_en_sum;
wire [63:0] SS3_head;

reg [31:0] SS4_fifo_X_in;
reg [31:0] SS4_fifo_M_in;
reg SS4_fifo_wrreq;
reg SS4_fifo_rdreq;
wire [31:0] SS4_X;
wire [31:0] SS4_M;
wire [4:0] SS4_sum_select;
wire SS4_sum_vld;
wire [7:0] SS4_H_in;

wire SS4_busy;
wire [8:0] SS4_cal_current_state;
wire SS4_init;
wire [31:0] SS4_y_initial;
reg [31:0] SS4_sum;
wire SS4_en_sum;
wire [63:0] SS4_head;

reg [31:0] SS5_fifo_X_in;
reg [31:0] SS5_fifo_M_in;
reg SS5_fifo_wrreq;
reg SS5_fifo_rdreq;
wire [31:0] SS5_X;
wire [31:0] SS5_M;
wire [4:0] SS5_sum_select;
wire SS5_sum_vld;
wire [7:0] SS5_H_in;

wire SS5_busy;
wire [8:0] SS5_cal_current_state;
wire SS5_init;
wire [31:0] SS5_y_initial;
reg [31:0] SS5_sum;
wire SS5_en_sum;
wire [63:0] SS5_head;

reg temp_enable0;
reg temp_enable1;
reg temp_enable2;
reg temp_enable3;
reg temp_enable4;
reg temp_enable5;

wire fifo_almost_full;

wire SS0_mode;
wire SS1_mode;
wire SS2_mode;
wire SS3_mode;
wire SS4_mode;
wire SS5_mode;

wire Init_out;

reg Init_out_reg;
reg Init_in_reg;

reg vld0;
reg vld1;
reg vld2;
reg vld3;
reg vld4;
reg vld5;
/*-------------------------------------------------------------------*\
                         		main code
\*-------------------------------------------------------------------*/
always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		Init_out_reg <= 1'b0;
	end else begin
		Init_out_reg <= Init_out;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		Init_in_reg <= 1'b0;
	end else begin
		Init_in_reg <= init;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		vld0 <= 1'b0;
	end else if (current_state == T0) begin
		vld0 <= 1'b1;
	end else begin
		vld0 <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		vld1 <= 1'b0;
	end else if (current_state == T1) begin
		vld1 <= 1'b1;
	end else begin
		vld1 <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		vld2 <= 1'b0;
	end else if (current_state == T2) begin
		vld2 <= 1'b1;
	end else begin
		vld2 <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		vld3 <= 1'b0;
	end else if (current_state == T3) begin
		vld3 <= 1'b1;
	end else begin
		vld3 <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		vld4 <= 1'b0;
	end else if (current_state == T4) begin
		vld4 <= 1'b1;
	end else begin
		vld4 <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		vld5 <= 1'b0;
	end else if (current_state == T5) begin
		vld5 <= 1'b1;
	end else begin
		vld5 <= 1'b0;
	end
end


always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable0 <= 1'b1;
	end else if (fifo_almost_full && matrix_memory_sop0) begin
		temp_enable0 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable0 <= 1'b1;
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable1 <= 1'b1;
	end else if (fifo_almost_full && matrix_memory_sop1) begin
		temp_enable1 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable1 <= 1'b1;
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable2 <= 1'b1;
	end else if (fifo_almost_full && matrix_memory_sop2) begin
		temp_enable2 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable2 <= 1'b1;
end


always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable3 <= 1'b1;
	end else if (fifo_almost_full && matrix_memory_sop3) begin
		temp_enable3 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable3 <= 1'b1;
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable4 <= 1'b1;
	end else if (fifo_almost_full && matrix_memory_sop4) begin
		temp_enable4 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable4 <= 1'b1;
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable5 <= 1'b1;
	end else if (fifo_almost_full && matrix_memory_sop5) begin
		temp_enable5 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable5 <= 1'b1;
end

assign pkt_receive_enable_SS[0] = (!SS0_busy) & temp_enable0;
assign pkt_receive_enable_SS[1] = (!SS1_busy) & temp_enable1;
assign pkt_receive_enable_SS[2] = (!SS2_busy) & temp_enable2;
assign pkt_receive_enable_SS[3] = (!SS3_busy) & temp_enable3;
assign pkt_receive_enable_SS[4] = (!SS4_busy) & temp_enable4;
assign pkt_receive_enable_SS[5] = (!SS5_busy) & temp_enable5;

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		current_state <= T0;
	end else begin 
		current_state <= next_state;
	end 
end 


always @(*)
begin 
	next_state = current_state;
	case (current_state)
		T0:
			begin 
				next_state = T1;
			end

		T1:
			begin 
				next_state = T2;
			end

		T2:
			begin 
				next_state = T3;
			end

		T3:
			begin
				next_state = T4;
			end

		T4:
			begin 
				next_state = T5;
			end

		T5:
			begin
				next_state = T0;
			end

	endcase // current_state
end

//need to be modified!
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS0_sum <= 32'b0;
		SS1_sum <= 32'b0;
		SS2_sum <= 32'b0;
		SS3_sum <= 32'b0;
		SS4_sum <= 32'b0;
		SS5_sum <= 32'b0;
	end else if ((current_state == T2)) begin 
		SS0_sum <= sum;
	end else if ((current_state == T3)) begin 
		SS1_sum <= sum;
	end else if ((current_state == T4)) begin 
		SS2_sum <= sum;
	end else if ((current_state == T5)) begin 
		SS3_sum <= sum;
	end else if ((current_state == T0)) begin 
		SS4_sum <= sum;
	end else if ((current_state == T1)) begin 
		SS5_sum <= sum;
	end else begin
		SS0_sum <= 32'b0;
		SS1_sum <= 32'b0;
		SS2_sum <= 32'b0;
		SS3_sum <= 32'b0;
		SS4_sum <= 32'b0;
		SS5_sum <= 32'b0;	
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		init <= 1'b0;
	end else if ((current_state == T1)) begin 
		init <= SS0_init;
	end else if ((current_state == T2)) begin 
		init <= SS1_init;
	end else if ((current_state == T3)) begin 
		init <= SS2_init;
	end else if ((current_state == T4)) begin 
		init <= SS3_init;
	end else if ((current_state == T5)) begin 
		init <= SS4_init;
	end else if ((current_state == T0)) begin 
		init <= SS5_init;
	end else begin
		init <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		mode <= 1'b0;
	end else if ((current_state == T1)) begin 
		mode <= SS0_mode;
	end else if ((current_state == T2)) begin 
		mode <= SS1_mode;
	end else if ((current_state == T3)) begin 
		mode <= SS2_mode;
	end else if ((current_state == T4)) begin 
		mode <= SS3_mode;
	end else if ((current_state == T5)) begin 
		mode <= SS4_mode;
	end else if ((current_state == T0)) begin 
		mode <= SS5_mode;
	end else begin
		mode <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		sum_select <= 5'b00111;
	end else if ((current_state == T0)) begin 
		sum_select <= SS0_sum_select;
	end else if ((current_state == T1)) begin 
		sum_select <= SS1_sum_select;
	end else if ((current_state == T2)) begin 
		sum_select <= SS2_sum_select;
	end else if ((current_state == T3)) begin 
		sum_select <= SS3_sum_select;
	end else if ((current_state == T4)) begin 
		sum_select <= SS4_sum_select;
	end else if ((current_state == T5)) begin 
		sum_select <= SS5_sum_select;
	end else begin
		sum_select <= 5'b00111;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		sum_vld <= 1'b0;
	end else if ((current_state == T0)) begin 
		sum_vld <= SS0_sum_vld;
	end else if ((current_state == T1)) begin 
		sum_vld <= SS1_sum_vld;
	end else if ((current_state == T2)) begin 
		sum_vld <= SS2_sum_vld;
	end else if ((current_state == T3)) begin 
		sum_vld <= SS3_sum_vld;
	end else if ((current_state == T4)) begin 
		sum_vld <= SS4_sum_vld;
	end else if ((current_state == T5)) begin 
		sum_vld <= SS5_sum_vld;
	end else begin
		sum_vld <= 1'b0;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		pmx_0 <= 32'b0;
		pmy_0 <= 32'b0;
		pmm_0 <= 32'b0;
		lambda0_0 <= 32'b0;
		lambda1_0 <= 32'b0;
		r_0 <= 8'b0;
	end else if ((current_state == T1)) begin 
		pmx_0 <= SS0_pmx_0;
		pmy_0 <= SS0_pmy_0;
		pmm_0 <= SS0_pmm_0;
		lambda0_0 <= SS0_lambda0_0;
		lambda1_0 <= SS0_lambda1_0;
		r_0 <= SS0_r_0;
	end else if ((current_state == T2)) begin 
		pmx_0 <= SS1_pmx_0;
		pmy_0 <= SS1_pmy_0;
		pmm_0 <= SS1_pmm_0;
		lambda0_0 <= SS1_lambda0_0;
		lambda1_0 <= SS1_lambda1_0;
		r_0 <= SS1_r_0;
	end else if ((current_state == T3)) begin 
		pmx_0 <= SS2_pmx_0;
		pmy_0 <= SS2_pmy_0;
		pmm_0 <= SS2_pmm_0;
		lambda0_0 <= SS2_lambda0_0;
		lambda1_0 <= SS2_lambda1_0;
		r_0 <= SS2_r_0;
	end else if ((current_state == T4)) begin 
		pmx_0 <= SS3_pmx_0;
		pmy_0 <= SS3_pmy_0;
		pmm_0 <= SS3_pmm_0;
		lambda0_0 <= SS3_lambda0_0;
		lambda1_0 <= SS3_lambda1_0;
		r_0 <= SS3_r_0;
	end else if ((current_state == T5)) begin 
		pmx_0 <= SS4_pmx_0;
		pmy_0 <= SS4_pmy_0;
		pmm_0 <= SS4_pmm_0;
		lambda0_0 <= SS4_lambda0_0;
		lambda1_0 <= SS4_lambda1_0;
		r_0 <= SS4_r_0;
	end else if ((current_state == T0)) begin 
		pmx_0 <= SS5_pmx_0;
		pmy_0 <= SS5_pmy_0;
		pmm_0 <= SS5_pmm_0;
		lambda0_0 <= SS5_lambda0_0;
		lambda1_0 <= SS5_lambda1_0;
		r_0 <= SS5_r_0;
	end else begin
		pmx_0 <= 32'b0;
		pmy_0 <= 32'b0;
		pmm_0 <= 32'b0;
		lambda0_0 <= 32'b0;
		lambda1_0 <= 32'b0;
		r_0 <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		pmx_1 <= 32'b0;
		pmy_1 <= 32'b0;
		pmm_1 <= 32'b0;
		lambda0_1 <= 32'b0;
		lambda1_1 <= 32'b0;
		r_1 <= 8'b0;
	end else if ((current_state == T1)) begin 
		pmx_1 <= SS0_pmx_1;
		pmy_1 <= SS0_pmy_1;
		pmm_1 <= SS0_pmm_1;
		lambda0_1 <= SS0_lambda0_1;
		lambda1_1 <= SS0_lambda1_1;
		r_1 <= SS0_r_1;
	end else if ((current_state == T2)) begin 
		pmx_1 <= SS1_pmx_1;
		pmy_1 <= SS1_pmy_1;
		pmm_1 <= SS1_pmm_1;
		lambda0_1 <= SS1_lambda0_1;
		lambda1_1 <= SS1_lambda1_1;
		r_1 <= SS1_r_1;
	end else if ((current_state == T3)) begin 
		pmx_1 <= SS2_pmx_1;
		pmy_1 <= SS2_pmy_1;
		pmm_1 <= SS2_pmm_1;
		lambda0_1 <= SS2_lambda0_1;
		lambda1_1 <= SS2_lambda1_1;
		r_1 <= SS2_r_1;
	end else if ((current_state == T4)) begin 
		pmx_1 <= SS3_pmx_1;
		pmy_1 <= SS3_pmy_1;
		pmm_1 <= SS3_pmm_1;
		lambda0_1 <= SS3_lambda0_1;
		lambda1_1 <= SS3_lambda1_1;
		r_1 <= SS3_r_1;
	end else if ((current_state == T5)) begin 
		pmx_1 <= SS4_pmx_1;
		pmy_1 <= SS4_pmy_1;
		pmm_1 <= SS4_pmm_1;
		lambda0_1 <= SS4_lambda0_1;
		lambda1_1 <= SS4_lambda1_1;
		r_1 <= SS4_r_1;
	end else if ((current_state == T0)) begin 
		pmx_1 <= SS5_pmx_1;
		pmy_1 <= SS5_pmy_1;
		pmm_1 <= SS5_pmm_1;
		lambda0_1 <= SS5_lambda0_1;
		lambda1_1 <= SS5_lambda1_1;
		r_1 <= SS5_r_1;
	end else begin
		pmx_1 <= 32'b0;
		pmy_1 <= 32'b0;
		pmm_1 <= 32'b0;
		lambda0_1 <= 32'b0;
		lambda1_1 <= 32'b0;
		r_1 <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		pmx_2 <= 32'b0;
		pmy_2 <= 32'b0;
		pmm_2 <= 32'b0;
		lambda0_2 <= 32'b0;
		lambda1_2 <= 32'b0;
		r_2 <= 8'b0;
	end else if ((current_state == T1)) begin 
		pmx_2 <= SS0_pmx_2;
		pmy_2 <= SS0_pmy_2;
		pmm_2 <= SS0_pmm_2;
		lambda0_2 <= SS0_lambda0_2;
		lambda1_2 <= SS0_lambda1_2;
		r_2 <= SS0_r_2;
	end else if ((current_state == T2)) begin 
		pmx_2 <= SS1_pmx_2;
		pmy_2 <= SS1_pmy_2;
		pmm_2 <= SS1_pmm_2;
		lambda0_2 <= SS1_lambda0_2;
		lambda1_2 <= SS1_lambda1_2;
		r_2 <= SS1_r_2;
	end else if ((current_state == T3)) begin 
		pmx_2 <= SS2_pmx_2;
		pmy_2 <= SS2_pmy_2;
		pmm_2 <= SS2_pmm_2;
		lambda0_2 <= SS2_lambda0_2;
		lambda1_2 <= SS2_lambda1_2;
		r_2 <= SS2_r_2;
	end else if ((current_state == T4)) begin 
		pmx_2 <= SS3_pmx_2;
		pmy_2 <= SS3_pmy_2;
		pmm_2 <= SS3_pmm_2;
		lambda0_2 <= SS3_lambda0_2;
		lambda1_2 <= SS3_lambda1_2;
		r_2 <= SS3_r_2;
	end else if ((current_state == T5)) begin 
		pmx_2 <= SS4_pmx_2;
		pmy_2 <= SS4_pmy_2;
		pmm_2 <= SS4_pmm_2;
		lambda0_2 <= SS4_lambda0_2;
		lambda1_2 <= SS4_lambda1_2;
		r_2 <= SS4_r_2;
	end else if ((current_state == T0)) begin 
		pmx_2 <= SS5_pmx_2;
		pmy_2 <= SS5_pmy_2;
		pmm_2 <= SS5_pmm_2;
		lambda0_2 <= SS5_lambda0_2;
		lambda1_2 <= SS5_lambda1_2;
		r_2 <= SS5_r_2;
	end else begin
		pmx_2 <= 32'b0;
		pmy_2 <= 32'b0;
		pmm_2 <= 32'b0;
		lambda0_2 <= 32'b0;
		lambda1_2 <= 32'b0;
		r_2 <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		pmx_3 <= 32'b0;
		pmy_3 <= 32'b0;
		pmm_3 <= 32'b0;
		lambda0_3 <= 32'b0;
		lambda1_3 <= 32'b0;
		r_3 <= 8'b0;
	end else if ((current_state == T1)) begin 
		pmx_3 <= SS0_pmx_3;
		pmy_3 <= SS0_pmy_3;
		pmm_3 <= SS0_pmm_3;
		lambda0_3 <= SS0_lambda0_3;
		lambda1_3 <= SS0_lambda1_3;
		r_3 <= SS0_r_3;
	end else if ((current_state == T2)) begin 
		pmx_3 <= SS1_pmx_3;
		pmy_3 <= SS1_pmy_3;
		pmm_3 <= SS1_pmm_3;
		lambda0_3 <= SS1_lambda0_3;
		lambda1_3 <= SS1_lambda1_3;
		r_3 <= SS1_r_3;
	end else if ((current_state == T3)) begin 
		pmx_3 <= SS2_pmx_3;
		pmy_3 <= SS2_pmy_3;
		pmm_3 <= SS2_pmm_3;
		lambda0_3 <= SS2_lambda0_3;
		lambda1_3 <= SS2_lambda1_3;
		r_3 <= SS2_r_3;
	end else if ((current_state == T4)) begin 
		pmx_3 <= SS3_pmx_3;
		pmy_3 <= SS3_pmy_3;
		pmm_3 <= SS3_pmm_3;
		lambda0_3 <= SS3_lambda0_3;
		lambda1_3 <= SS3_lambda1_3;
		r_3 <= SS3_r_3;
	end else if ((current_state == T5)) begin 
		pmx_3 <= SS4_pmx_3;
		pmy_3 <= SS4_pmy_3;
		pmm_3 <= SS4_pmm_3;
		lambda0_3 <= SS4_lambda0_3;
		lambda1_3 <= SS4_lambda1_3;
		r_3 <= SS4_r_3;
	end else if ((current_state == T0)) begin 
		pmx_3 <= SS5_pmx_3;
		pmy_3 <= SS5_pmy_3;
		pmm_3 <= SS5_pmm_3;
		lambda0_3 <= SS5_lambda0_3;
		lambda1_3 <= SS5_lambda1_3;
		r_3 <= SS5_r_3;
	end else begin
		pmx_3 <= 32'b0;
		pmy_3 <= 32'b0;
		pmm_3 <= 32'b0;
		lambda0_3 <= 32'b0;
		lambda1_3 <= 32'b0;
		r_3 <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		pmx_4 <= 32'b0;
		pmy_4 <= 32'b0;
		pmm_4 <= 32'b0;
		lambda0_4 <= 32'b0;
		lambda1_4 <= 32'b0;
		r_4 <= 8'b0;
	end else if ((current_state == T1)) begin 
		pmx_4 <= SS0_pmx_4;
		pmy_4 <= SS0_pmy_4;
		pmm_4 <= SS0_pmm_4;
		lambda0_4 <= SS0_lambda0_4;
		lambda1_4 <= SS0_lambda1_4;
		r_4 <= SS0_r_4;
	end else if ((current_state == T2)) begin 
		pmx_4 <= SS1_pmx_4;
		pmy_4 <= SS1_pmy_4;
		pmm_4 <= SS1_pmm_4;
		lambda0_4 <= SS1_lambda0_4;
		lambda1_4 <= SS1_lambda1_4;
		r_4 <= SS1_r_4;
	end else if ((current_state == T3)) begin 
		pmx_4 <= SS2_pmx_4;
		pmy_4 <= SS2_pmy_4;
		pmm_4 <= SS2_pmm_4;
		lambda0_4 <= SS2_lambda0_4;
		lambda1_4 <= SS2_lambda1_4;
		r_4 <= SS2_r_4;
	end else if ((current_state == T4)) begin 
		pmx_4 <= SS3_pmx_4;
		pmy_4 <= SS3_pmy_4;
		pmm_4 <= SS3_pmm_4;
		lambda0_4 <= SS3_lambda0_4;
		lambda1_4 <= SS3_lambda1_4;
		r_4 <= SS3_r_4;
	end else if ((current_state == T5)) begin 
		pmx_4 <= SS4_pmx_4;
		pmy_4 <= SS4_pmy_4;
		pmm_4 <= SS4_pmm_4;
		lambda0_4 <= SS4_lambda0_4;
		lambda1_4 <= SS4_lambda1_4;
		r_4 <= SS4_r_4;
	end else if ((current_state == T0)) begin 
		pmx_4 <= SS5_pmx_4;
		pmy_4 <= SS5_pmy_4;
		pmm_4 <= SS5_pmm_4;
		lambda0_4 <= SS5_lambda0_4;
		lambda1_4 <= SS5_lambda1_4;
		r_4 <= SS5_r_4;
	end else begin
		pmx_4 <= 32'b0;
		pmy_4 <= 32'b0;
		pmm_4 <= 32'b0;
		lambda0_4 <= 32'b0;
		lambda1_4 <= 32'b0;
		r_4 <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		pmx_5 <= 32'b0;
		pmy_5 <= 32'b0;
		pmm_5 <= 32'b0;
		lambda0_5 <= 32'b0;
		lambda1_5 <= 32'b0;
		r_5 <= 8'b0;
	end else if ((current_state == T1)) begin 
		pmx_5 <= SS0_pmx_5;
		pmy_5 <= SS0_pmy_5;
		pmm_5 <= SS0_pmm_5;
		lambda0_5 <= SS0_lambda0_5;
		lambda1_5 <= SS0_lambda1_5;
		r_5 <= SS0_r_5;
	end else if ((current_state == T2)) begin 
		pmx_5 <= SS1_pmx_5;
		pmy_5 <= SS1_pmy_5;
		pmm_5 <= SS1_pmm_5;
		lambda0_5 <= SS1_lambda0_5;
		lambda1_5 <= SS1_lambda1_5;
		r_5 <= SS1_r_5;
	end else if ((current_state == T3)) begin 
		pmx_5 <= SS2_pmx_5;
		pmy_5 <= SS2_pmy_5;
		pmm_5 <= SS2_pmm_5;
		lambda0_5 <= SS2_lambda0_5;
		lambda1_5 <= SS2_lambda1_5;
		r_5 <= SS2_r_5;
	end else if ((current_state == T4)) begin 
		pmx_5 <= SS3_pmx_5;
		pmy_5 <= SS3_pmy_5;
		pmm_5 <= SS3_pmm_5;
		lambda0_5 <= SS3_lambda0_5;
		lambda1_5 <= SS3_lambda1_5;
		r_5 <= SS3_r_5;
	end else if ((current_state == T5)) begin 
		pmx_5 <= SS4_pmx_5;
		pmy_5 <= SS4_pmy_5;
		pmm_5 <= SS4_pmm_5;
		lambda0_5 <= SS4_lambda0_5;
		lambda1_5 <= SS4_lambda1_5;
		r_5 <= SS4_r_5;
	end else if ((current_state == T0)) begin 
		pmx_5 <= SS5_pmx_5;
		pmy_5 <= SS5_pmy_5;
		pmm_5 <= SS5_pmm_5;
		lambda0_5 <= SS5_lambda0_5;
		lambda1_5 <= SS5_lambda1_5;
		r_5 <= SS5_r_5;
	end else begin
		pmx_5 <= 32'b0;
		pmy_5 <= 32'b0;
		pmm_5 <= 32'b0;
		lambda0_5 <= 32'b0;
		lambda1_5 <= 32'b0;
		r_5 <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		pmx_6 <= 32'b0;
		pmy_6 <= 32'b0;
		pmm_6 <= 32'b0;
		lambda0_6 <= 32'b0;
		lambda1_6 <= 32'b0;
		r_6 <= 8'b0;
	end else if ((current_state == T1)) begin 
		pmx_6 <= SS0_pmx_6;
		pmy_6 <= SS0_pmy_6;
		pmm_6 <= SS0_pmm_6;
		lambda0_6 <= SS0_lambda0_6;
		lambda1_6 <= SS0_lambda1_6;
		r_6 <= SS0_r_6;
	end else if ((current_state == T2)) begin 
		pmx_6 <= SS1_pmx_6;
		pmy_6 <= SS1_pmy_6;
		pmm_6 <= SS1_pmm_6;
		lambda0_6 <= SS1_lambda0_6;
		lambda1_6 <= SS1_lambda1_6;
		r_6 <= SS1_r_6;
	end else if ((current_state == T3)) begin 
		pmx_6 <= SS2_pmx_6;
		pmy_6 <= SS2_pmy_6;
		pmm_6 <= SS2_pmm_6;
		lambda0_6 <= SS2_lambda0_6;
		lambda1_6 <= SS2_lambda1_6;
		r_6 <= SS2_r_6;
	end else if ((current_state == T4)) begin 
		pmx_6 <= SS3_pmx_6;
		pmy_6 <= SS3_pmy_6;
		pmm_6 <= SS3_pmm_6;
		lambda0_6 <= SS3_lambda0_6;
		lambda1_6 <= SS3_lambda1_6;
		r_6 <= SS3_r_6;
	end else if ((current_state == T5)) begin 
		pmx_6 <= SS4_pmx_6;
		pmy_6 <= SS4_pmy_6;
		pmm_6 <= SS4_pmm_6;
		lambda0_6 <= SS4_lambda0_6;
		lambda1_6 <= SS4_lambda1_6;
		r_6 <= SS4_r_6;
	end else if ((current_state == T0)) begin 
		pmx_6 <= SS5_pmx_6;
		pmy_6 <= SS5_pmy_6;
		pmm_6 <= SS5_pmm_6;
		lambda0_6 <= SS5_lambda0_6;
		lambda1_6 <= SS5_lambda1_6;
		r_6 <= SS5_r_6;
	end else begin
		pmx_6 <= 32'b0;
		pmy_6 <= 32'b0;
		pmm_6 <= 32'b0;
		lambda0_6 <= 32'b0;
		lambda1_6 <= 32'b0;
		r_6 <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		pmx_7 <= 32'b0;
		pmy_7 <= 32'b0;
		pmm_7 <= 32'b0;
		lambda0_7 <= 32'b0;
		lambda1_7 <= 32'b0;
		r_7 <= 8'b0;
	end else if ((current_state == T1)) begin 
		pmx_7 <= SS0_pmx_7;
		pmy_7 <= SS0_pmy_7;
		pmm_7 <= SS0_pmm_7;
		lambda0_7 <= SS0_lambda0_7;
		lambda1_7 <= SS0_lambda1_7;
		r_7 <= SS0_r_7;
	end else if ((current_state == T2)) begin 
		pmx_7 <= SS1_pmx_7;
		pmy_7 <= SS1_pmy_7;
		pmm_7 <= SS1_pmm_7;
		lambda0_7 <= SS1_lambda0_7;
		lambda1_7 <= SS1_lambda1_7;
		r_7 <= SS1_r_7;
	end else if ((current_state == T3)) begin 
		pmx_7 <= SS2_pmx_7;
		pmy_7 <= SS2_pmy_7;
		pmm_7 <= SS2_pmm_7;
		lambda0_7 <= SS2_lambda0_7;
		lambda1_7 <= SS2_lambda1_7;
		r_7 <= SS2_r_7;
	end else if ((current_state == T4)) begin 
		pmx_7 <= SS3_pmx_7;
		pmy_7 <= SS3_pmy_7;
		pmm_7 <= SS3_pmm_7;
		lambda0_7 <= SS3_lambda0_7;
		lambda1_7 <= SS3_lambda1_7;
		r_7 <= SS3_r_7;
	end else if ((current_state == T5)) begin 
		pmx_7 <= SS4_pmx_7;
		pmy_7 <= SS4_pmy_7;
		pmm_7 <= SS4_pmm_7;
		lambda0_7 <= SS4_lambda0_7;
		lambda1_7 <= SS4_lambda1_7;
		r_7 <= SS4_r_7;
	end else if ((current_state == T0)) begin 
		pmx_7 <= SS5_pmx_7;
		pmy_7 <= SS5_pmy_7;
		pmm_7 <= SS5_pmm_7;
		lambda0_7 <= SS5_lambda0_7;
		lambda1_7 <= SS5_lambda1_7;
		r_7 <= SS5_r_7;
	end else begin
		pmx_7 <= 32'b0;
		pmy_7 <= 32'b0;
		pmm_7 <= 32'b0;
		lambda0_7 <= 32'b0;
		lambda1_7 <= 32'b0;
		r_7 <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		H_in <= 8'b0;
	end else if ((current_state == T1)) begin 
		H_in <= SS0_H_in;
	end else if ((current_state == T2)) begin 
		H_in <= SS1_H_in;
	end else if ((current_state == T3)) begin 
		H_in <= SS2_H_in;
	end else if ((current_state == T4)) begin 
		H_in <= SS3_H_in;
	end else if ((current_state == T5)) begin 
		H_in <= SS4_H_in;
	end else if ((current_state == T0)) begin 
		H_in <= SS5_H_in;
	end else begin
		H_in <= 8'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		y_initial <= 32'b0;
	end else if ((current_state == T1)) begin 
		y_initial <= SS0_y_initial;
	end else if ((current_state == T2)) begin 
		y_initial <= SS1_y_initial;
	end else if ((current_state == T3)) begin 
		y_initial <= SS2_y_initial;
	end else if ((current_state == T4)) begin 
		y_initial <= SS3_y_initial;
	end else if ((current_state == T5)) begin 
		y_initial <= SS4_y_initial;
	end else if ((current_state == T0)) begin 
		y_initial <= SS5_y_initial;
	end else begin
		y_initial <= 32'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		en_sum <= 1'b0;
	end else if ((SS0_cal_current_state == S5) & (current_state == T0)) begin 
		en_sum <= SS0_en_sum;
	end else if ((SS1_cal_current_state == S5) & (current_state == T1)) begin 
		en_sum <= SS1_en_sum;
	end else if ((SS2_cal_current_state == S5) & (current_state == T2)) begin 
		en_sum <= SS2_en_sum;
	end else if ((SS3_cal_current_state == S5) & (current_state == T3)) begin 
		en_sum <= SS3_en_sum;
	end else if ((SS4_cal_current_state == S5) & (current_state == T4)) begin 
		en_sum <= SS4_en_sum;
	end else if ((SS5_cal_current_state == S5) & (current_state == T5)) begin 
		en_sum <= SS5_en_sum;
	end else begin
		en_sum <= 1'b0;
	end
end

//need to be modified!------------------------------------------------------------
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS_fifo_X_out <= 32'b0;
	end else if ((SS0_cal_current_state == S0) & (current_state == T1)) begin 
		SS_fifo_X_out <= SS0_X;
	end else if ((SS1_cal_current_state == S0) & (current_state == T2)) begin 
		SS_fifo_X_out <= SS1_X;
	end else if ((SS2_cal_current_state == S0) & (current_state == T3)) begin 
		SS_fifo_X_out <= SS2_X;
	end else if ((SS3_cal_current_state == S0) & (current_state == T4)) begin 
		SS_fifo_X_out <= SS3_X;
	end else if ((SS4_cal_current_state == S0) & (current_state == T5)) begin 
		SS_fifo_X_out <= SS4_X;
	end else if ((SS5_cal_current_state == S0) & (current_state == T0)) begin 
		SS_fifo_X_out <= SS5_X;
	end else begin
		SS_fifo_X_out <= 32'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS_fifo_M_out <= 32'b0;
	end else if ((SS0_cal_current_state == S0) & (current_state == T1)) begin 
		SS_fifo_M_out <= SS0_M;
	end else if ((SS1_cal_current_state == S0) & (current_state == T2)) begin 
		SS_fifo_M_out <= SS1_M;
	end else if ((SS2_cal_current_state == S0) & (current_state == T3)) begin 
		SS_fifo_M_out <= SS2_M;
	end else if ((SS3_cal_current_state == S0) & (current_state == T4)) begin 
		SS_fifo_M_out <= SS3_M;
	end else if ((SS4_cal_current_state == S0) & (current_state == T5)) begin 
		SS_fifo_M_out <= SS4_M;
	end else if ((SS5_cal_current_state == S0) & (current_state == T0)) begin 
		SS_fifo_M_out <= SS5_M;
	end else begin
		SS_fifo_M_out <= 32'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS0_fifo_X_in <= 32'b0;
		SS1_fifo_X_in <= 32'b0;
		SS2_fifo_X_in <= 32'b0;
		SS3_fifo_X_in <= 32'b0;
		SS4_fifo_X_in <= 32'b0;
		SS5_fifo_X_in <= 32'b0;
	end else if ((SS0_cal_current_state == S2) & (current_state == T3)) begin 
		SS0_fifo_X_in <= X_i_j_out;
	end else if ((SS1_cal_current_state == S2) & (current_state == T4)) begin 
		SS1_fifo_X_in <= X_i_j_out;
	end else if ((SS2_cal_current_state == S2) & (current_state == T5)) begin 
		SS2_fifo_X_in <= X_i_j_out;
	end else if ((SS3_cal_current_state == S2) & (current_state == T0)) begin 
		SS3_fifo_X_in <= X_i_j_out;
	end else if ((SS4_cal_current_state == S2) & (current_state == T1)) begin 
		SS4_fifo_X_in <= X_i_j_out;
	end else if ((SS5_cal_current_state == S2) & (current_state == T2)) begin 
		SS5_fifo_X_in <= X_i_j_out;
	end else begin
		SS0_fifo_X_in <= 32'b0;
		SS1_fifo_X_in <= 32'b0;
		SS2_fifo_X_in <= 32'b0;
		SS3_fifo_X_in <= 32'b0;
		SS4_fifo_X_in <= 32'b0;
		SS5_fifo_X_in <= 32'b0;
	end
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS0_fifo_M_in <= 32'b0;
		SS1_fifo_M_in <= 32'b0;
		SS2_fifo_M_in <= 32'b0;
		SS3_fifo_M_in <= 32'b0;
		SS4_fifo_M_in <= 32'b0;
		SS5_fifo_M_in <= 32'b0;
	end else if ((SS0_cal_current_state == S2) & (current_state == T3)) begin 
		SS0_fifo_M_in <= M_i_j_out;
	end else if ((SS1_cal_current_state == S2) & (current_state == T4)) begin 
		SS1_fifo_M_in <= M_i_j_out;
	end else if ((SS2_cal_current_state == S2) & (current_state == T5)) begin 
		SS2_fifo_M_in <= M_i_j_out;
	end else if ((SS3_cal_current_state == S2) & (current_state == T0)) begin 
		SS3_fifo_M_in <= M_i_j_out;
	end else if ((SS4_cal_current_state == S2) & (current_state == T1)) begin 
		SS4_fifo_M_in <= M_i_j_out;
	end else if ((SS5_cal_current_state == S2) & (current_state == T2)) begin 
		SS5_fifo_M_in <= M_i_j_out;
	end else begin
		SS0_fifo_M_in <= 32'b0;
		SS1_fifo_M_in <= 32'b0;
		SS2_fifo_M_in <= 32'b0;
		SS3_fifo_M_in <= 32'b0;
		SS4_fifo_M_in <= 32'b0;
		SS5_fifo_M_in <= 32'b0;
	end
end

//---------------wrreq------------------------------------------------------------------------
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS0_fifo_wrreq <= 1'b0;
	end else if ((SS0_cal_current_state == S2) & (current_state == T3) & (Init_out_reg)) begin 
		SS0_fifo_wrreq <= 1'b1;
	end else if ((SS0_cal_current_state == S2) & (current_state == T3) & (!Init_out_reg)) begin 
		SS0_fifo_wrreq <= 1'b0;
	end else begin
		SS0_fifo_wrreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS1_fifo_wrreq <= 1'b0;
	end else if ((SS1_cal_current_state == S2) & (current_state == T4) & (Init_out_reg)) begin 
		SS1_fifo_wrreq <= 1'b1;
	end else if ((SS1_cal_current_state == S2) & (current_state == T4) & (!Init_out_reg)) begin 
		SS1_fifo_wrreq <= 1'b0;
	end else begin
		SS1_fifo_wrreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS2_fifo_wrreq <= 1'b0;
	end else if ((SS2_cal_current_state == S2) & (current_state == T5) & (Init_out_reg)) begin 
		SS2_fifo_wrreq <= 1'b1;
	end else if ((SS2_cal_current_state == S2) & (current_state == T5) & (!Init_out_reg)) begin 
		SS2_fifo_wrreq <= 1'b0;
	end else begin
		SS2_fifo_wrreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS3_fifo_wrreq <= 1'b0;
	end else if ((SS3_cal_current_state == S2) & (current_state == T0) & (Init_out_reg)) begin 
		SS3_fifo_wrreq <= 1'b1;
	end else if ((SS3_cal_current_state == S2) & (current_state == T0) & (!Init_out_reg)) begin 
		SS3_fifo_wrreq <= 1'b0;
	end else begin
		SS3_fifo_wrreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS4_fifo_wrreq <= 1'b0;
	end else if ((SS4_cal_current_state == S2) & (current_state == T1) & (Init_out_reg)) begin 
		SS4_fifo_wrreq <= 1'b1;
	end else if ((SS4_cal_current_state == S2) & (current_state == T1) & (!Init_out_reg)) begin 
		SS4_fifo_wrreq <= 1'b0;
	end else begin
		SS4_fifo_wrreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS5_fifo_wrreq <= 1'b0;
	end else if ((SS5_cal_current_state == S2) & (current_state == T2) & (Init_out_reg)) begin 
		SS5_fifo_wrreq <= 1'b1;
	end else if ((SS5_cal_current_state == S2) & (current_state == T2) & (!Init_out_reg)) begin 
		SS5_fifo_wrreq <= 1'b0;
	end else begin
		SS5_fifo_wrreq <= 1'b0;
	end
end


//--------rdreq-------------------------------------------------------------------------------
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS0_fifo_rdreq <= 1'b0;
	end else if ((SS0_cal_current_state == WAIT_6) & (current_state == T3)) begin 
		SS0_fifo_rdreq <= 1'b0;
	end else if ((SS0_cal_current_state == S2) & (current_state == T3) & (SS0_mode) & (Init_in_reg)) begin 
		SS0_fifo_rdreq <= 1'b1;
	end else if ((SS0_cal_current_state == S2) & (current_state == T3) & (!SS0_mode)) begin 
		SS0_fifo_rdreq <= 1'b0;
	end else begin
		SS0_fifo_rdreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS1_fifo_rdreq <= 1'b0;
	end else if ((SS1_cal_current_state == WAIT_6) & (current_state == T4)) begin 
		SS1_fifo_rdreq <= 1'b0;
	end else if ((SS1_cal_current_state == S2) & (current_state == T4) & (SS1_mode) & (Init_in_reg)) begin 
		SS1_fifo_rdreq <= 1'b1;
	end else if ((SS1_cal_current_state == S2) & (current_state == T4) & (!SS1_mode)) begin 
		SS1_fifo_rdreq <= 1'b0;
	end else begin
		SS1_fifo_rdreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS2_fifo_rdreq <= 1'b0;
	end else if ((SS2_cal_current_state == WAIT_6) & (current_state == T5)) begin 
		SS2_fifo_rdreq <= 1'b0;
	end else if ((SS2_cal_current_state == S2) & (current_state == T5) & (SS2_mode) & (Init_in_reg)) begin 
		SS2_fifo_rdreq <= 1'b1;
	end else if ((SS2_cal_current_state == S2) & (current_state == T5) & (!SS2_mode)) begin 
		SS2_fifo_rdreq <= 1'b0;
	end else begin
		SS2_fifo_rdreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS3_fifo_rdreq <= 1'b0;
	end else if ((SS3_cal_current_state == WAIT_6) & (current_state == T0)) begin 
		SS3_fifo_rdreq <= 1'b0;
	end else if ((SS3_cal_current_state == S2) & (current_state == T0) & (SS3_mode) & (Init_in_reg)) begin 
		SS3_fifo_rdreq <= 1'b1;
	end else if ((SS3_cal_current_state == S2) & (current_state == T0) & (!SS3_mode)) begin 
		SS3_fifo_rdreq <= 1'b0;
	end else begin
		SS3_fifo_rdreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS4_fifo_rdreq <= 1'b0;
	end else if ((SS4_cal_current_state == WAIT_6) & (current_state == T1)) begin 
		SS4_fifo_rdreq <= 1'b0;
	end else if ((SS4_cal_current_state == S2) & (current_state == T1) & (SS4_mode) & (Init_in_reg)) begin 
		SS4_fifo_rdreq <= 1'b1;
	end else if ((SS4_cal_current_state == S2) & (current_state == T1) & (!SS4_mode)) begin 
		SS4_fifo_rdreq <= 1'b0;
	end else begin
		SS4_fifo_rdreq <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		SS5_fifo_rdreq <= 1'b0;
	end else if ((SS5_cal_current_state == WAIT_6) & (current_state == T2)) begin 
		SS5_fifo_rdreq <= 1'b0;
	end else if ((SS5_cal_current_state == S2) & (current_state == T2) & (SS5_mode) & (Init_in_reg)) begin 
		SS5_fifo_rdreq <= 1'b1;
	end else if ((SS5_cal_current_state == S2) & (current_state == T2) & (!SS5_mode)) begin 
		SS5_fifo_rdreq <= 1'b0;
	end else begin
		SS5_fifo_rdreq <= 1'b0;
	end
end

/*-------------------------------------------------------------------*\
                         		submodules
\*-------------------------------------------------------------------*/
PU8 P0(
	.sys_clk(sys_clk      ),
	.sys_rst_n(sys_rst_n  ),
	.mode(mode            ),
	.SUM_select(sum_select),
	.SUM_valid(sum_vld    ),
	
	.p_mx_0(pmx_0),
	.p_my_0(pmy_0),
	.p_mm_0(pmm_0),

	.p_mx_1(pmx_1),
	.p_my_1(pmy_1),
	.p_mm_1(pmm_1),

	.p_mx_2(pmx_2),
	.p_my_2(pmy_2),
	.p_mm_2(pmm_2),

	.p_mx_3(pmx_3),
	.p_my_3(pmy_3),
	.p_mm_3(pmm_3),

	.p_mx_4(pmx_4),
	.p_my_4(pmy_4),
	.p_mm_4(pmm_4),
	
	.p_mx_5(pmx_5),
	.p_my_5(pmy_5),
	.p_mm_5(pmm_5),
	
	.p_mx_6(pmx_6),
	.p_my_6(pmy_6),
	.p_mm_6(pmm_6),
	
	.p_mx_7(pmx_7),
	.p_my_7(pmy_7),
	.p_mm_7(pmm_7),

	.lambda1_0(lambda0_0),
	.lambda2_0(lambda1_0),
	
	.lambda1_1(lambda0_1),
	.lambda2_1(lambda1_1),
	
	.lambda1_2(lambda0_2),
	.lambda2_2(lambda1_2),
	
	.lambda1_3(lambda0_3),
	.lambda2_3(lambda1_3),
	
	.lambda1_4(lambda0_4),
	.lambda2_4(lambda1_4),
	
	.lambda1_5(lambda0_5),
	.lambda2_5(lambda1_5),
	
	.lambda1_6(lambda0_6),
	.lambda2_6(lambda1_6),
	
	.lambda1_7(lambda0_7),
	.lambda2_7(lambda1_7),

	.H_in(H_in ),
	.R_in_0(r_0),
	.R_in_1(r_1),
	.R_in_2(r_2),
	.R_in_3(r_3),
	.R_in_4(r_4),
	.R_in_5(r_5),
	.R_in_6(r_6),
	.R_in_7(r_7),
	
	.X_i_j_in(SS_fifo_X_out),
	.M_i_j_in(SS_fifo_M_out),

	.X_i_j_out(X_i_j_out),
	.M_i_j_out(M_i_j_out),

	.Init_in(init      ),
	.Init_out(Init_out ),
	.Y_Init(y_initial  ),
	.SUM_out(sum       ),
	.SUM_start(en_sum  )
	);

//-------------------------------------------
reg [127:0] fifo_data_in  ;
wire [127:0] fifo_data_out ;
wire [ 8:0 ] usedw         ;
wire         fifo_write_en ;
wire         full          ;

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		fifo_data_in <= 128'b0;
	end else if ((sum_vld) & (current_state == T2)) begin 
		fifo_data_in <= {32'b0,SS0_head,SS0_sum};
	end else if ((sum_vld) & (current_state == T3)) begin 
		fifo_data_in <= {32'b0,SS1_head,SS1_sum};
	end else if ((sum_vld) & (current_state == T4)) begin 
		fifo_data_in <= {32'b0,SS2_head,SS2_sum};
	end else if ((sum_vld) & (current_state == T5)) begin 
		fifo_data_in <= {32'b0,SS3_head,SS3_sum};
	end else if ((sum_vld) & (current_state == T0)) begin 
		fifo_data_in <= {32'b0,SS4_head,SS4_sum};
	end else if ((sum_vld) & (current_state == T1)) begin 
		fifo_data_in <= {32'b0,SS5_head,SS5_sum};
	end else begin
		fifo_data_in <= 128'b0;
	end
end

//fifo for save sum
fifo_512x128 u0 (
		.data (fifo_data_in     ), 
		.wrreq(fifo_write_en    ), 
		.rdreq(result_fifo_rden ), 
		.clock(sys_clk          ), 
		.q    (result_fifo_rdat ),
		.usedw(usedw            ), 
		.full (full             ), 
		.empty(result_fifo_empty)  
	);


assign fifo_write_en    = sum_vld & (~full);

assign fifo_almost_full = (usedw >= 9'd485);

//------------------------------------------


pipeline_SS SS0(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.matrix_memory_sop(matrix_memory_sop0),
	.matrix_memory_eop(matrix_memory_eop0),
	.matrix_memory_vld(matrix_memory_vld0),
	.matrix_memory_data(matrix_memory_data0),
	
	.SS_fifo_X_in(SS0_fifo_X_in),
	.SS_fifo_M_in(SS0_fifo_M_in),
	
	.SS_fifo_wrreq(SS0_fifo_wrreq),
	.SS_fifo_rdreq(SS0_fifo_rdreq),

	.vld(vld5),
	
	.SS_fifo_X_out(SS0_X),
	.SS_fifo_M_out(SS0_M),
	
	.mode(SS0_mode),
	.sum_select(SS0_sum_select),
	.sum_vld(SS0_sum_vld),
	
	.pmx_0(SS0_pmx_0),
	.pmy_0(SS0_pmy_0),
	.pmm_0(SS0_pmm_0),
	
	.pmx_1(SS0_pmx_1),
	.pmy_1(SS0_pmy_1),
	.pmm_1(SS0_pmm_1),
	
	.pmx_2(SS0_pmx_2),
	.pmy_2(SS0_pmy_2),
	.pmm_2(SS0_pmm_2),
	
	.pmx_3(SS0_pmx_3),
	.pmy_3(SS0_pmy_3),
	.pmm_3(SS0_pmm_3),
	
	.pmx_4(SS0_pmx_4),
	.pmy_4(SS0_pmy_4),
	.pmm_4(SS0_pmm_4),
	
	.pmx_5(SS0_pmx_5),
	.pmy_5(SS0_pmy_5),
	.pmm_5(SS0_pmm_5),
	
	.pmx_6(SS0_pmx_6),
	.pmy_6(SS0_pmy_6),
	.pmm_6(SS0_pmm_6),
	
	.pmx_7(SS0_pmx_7),
	.pmy_7(SS0_pmy_7),
	.pmm_7(SS0_pmm_7),
	
	.lambda1_0(SS0_lambda1_0),
	.lambda0_0(SS0_lambda0_0),
	
	.lambda1_1(SS0_lambda1_1),
	.lambda0_1(SS0_lambda0_1),
	
	.lambda1_2(SS0_lambda1_2),
	.lambda0_2(SS0_lambda0_2),
	
	.lambda1_3(SS0_lambda1_3),
	.lambda0_3(SS0_lambda0_3),
	
	.lambda1_4(SS0_lambda1_4),
	.lambda0_4(SS0_lambda0_4),
	
	.lambda1_5(SS0_lambda1_5),
	.lambda0_5(SS0_lambda0_5),
	
	.lambda1_6(SS0_lambda1_6),
	.lambda0_6(SS0_lambda0_6),
	
	.lambda1_7(SS0_lambda1_7),
	.lambda0_7(SS0_lambda0_7),
	
	.H_in(SS0_H_in),
	.r_0(SS0_r_0),
	.r_1(SS0_r_1),
	.r_2(SS0_r_2),
	.r_3(SS0_r_3),
	.r_4(SS0_r_4),
	.r_5(SS0_r_5),
	.r_6(SS0_r_6),
	.r_7(SS0_r_7),
	
	.busy(SS0_busy),
	.cal_current_state(SS0_cal_current_state),
	.head(SS0_head),
	.init(SS0_init),
	.y_initial(SS0_y_initial),
	.en_sum(SS0_en_sum)
);

pipeline_SS SS1(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.matrix_memory_sop(matrix_memory_sop1),
	.matrix_memory_eop(matrix_memory_eop1),
	.matrix_memory_vld(matrix_memory_vld1),
	.matrix_memory_data(matrix_memory_data1),
	
	.SS_fifo_X_in(SS1_fifo_X_in),
	.SS_fifo_M_in(SS1_fifo_M_in),
	
	.SS_fifo_wrreq(SS1_fifo_wrreq),
	.SS_fifo_rdreq(SS1_fifo_rdreq),

	.vld(vld0),
	
	.SS_fifo_X_out(SS1_X),
	.SS_fifo_M_out(SS1_M),
	
	.mode(SS1_mode),
	.sum_select(SS1_sum_select),
	.sum_vld(SS1_sum_vld),
	
	.pmx_0(SS1_pmx_0),
	.pmy_0(SS1_pmy_0),
	.pmm_0(SS1_pmm_0),
	
	.pmx_1(SS1_pmx_1),
	.pmy_1(SS1_pmy_1),
	.pmm_1(SS1_pmm_1),
	
	.pmx_2(SS1_pmx_2),
	.pmy_2(SS1_pmy_2),
	.pmm_2(SS1_pmm_2),
	
	.pmx_3(SS1_pmx_3),
	.pmy_3(SS1_pmy_3),
	.pmm_3(SS1_pmm_3),
	
	.pmx_4(SS1_pmx_4),
	.pmy_4(SS1_pmy_4),
	.pmm_4(SS1_pmm_4),
	
	.pmx_5(SS1_pmx_5),
	.pmy_5(SS1_pmy_5),
	.pmm_5(SS1_pmm_5),
	
	.pmx_6(SS1_pmx_6),
	.pmy_6(SS1_pmy_6),
	.pmm_6(SS1_pmm_6),
	
	.pmx_7(SS1_pmx_7),
	.pmy_7(SS1_pmy_7),
	.pmm_7(SS1_pmm_7),
	
	.lambda1_0(SS1_lambda1_0),
	.lambda0_0(SS1_lambda0_0),
	
	.lambda1_1(SS1_lambda1_1),
	.lambda0_1(SS1_lambda0_1),
	
	.lambda1_2(SS1_lambda1_2),
	.lambda0_2(SS1_lambda0_2),
	
	.lambda1_3(SS1_lambda1_3),
	.lambda0_3(SS1_lambda0_3),
	
	.lambda1_4(SS1_lambda1_4),
	.lambda0_4(SS1_lambda0_4),
	
	.lambda1_5(SS1_lambda1_5),
	.lambda0_5(SS1_lambda0_5),
	
	.lambda1_6(SS1_lambda1_6),
	.lambda0_6(SS1_lambda0_6),
	
	.lambda1_7(SS1_lambda1_7),
	.lambda0_7(SS1_lambda0_7),
	
	.H_in(SS1_H_in),
	.r_0(SS1_r_0),
	.r_1(SS1_r_1),
	.r_2(SS1_r_2),
	.r_3(SS1_r_3),
	.r_4(SS1_r_4),
	.r_5(SS1_r_5),
	.r_6(SS1_r_6),
	.r_7(SS1_r_7),
	
	.busy(SS1_busy),
	.cal_current_state(SS1_cal_current_state),
	.head(SS1_head),
	.init(SS1_init),
	.y_initial(SS1_y_initial),
	.en_sum(SS1_en_sum)
);

pipeline_SS SS2(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.matrix_memory_sop(matrix_memory_sop2),
	.matrix_memory_eop(matrix_memory_eop2),
	.matrix_memory_vld(matrix_memory_vld2),
	.matrix_memory_data(matrix_memory_data2),
	
	.SS_fifo_X_in(SS2_fifo_X_in),
	.SS_fifo_M_in(SS2_fifo_M_in),
	
	.SS_fifo_wrreq(SS2_fifo_wrreq),
	.SS_fifo_rdreq(SS2_fifo_rdreq),

	.vld(vld1),
	
	.SS_fifo_X_out(SS2_X),
	.SS_fifo_M_out(SS2_M),
	
	.mode(SS2_mode),
	.sum_select(SS2_sum_select),
	.sum_vld(SS2_sum_vld),
	
	.pmx_0(SS2_pmx_0),
	.pmy_0(SS2_pmy_0),
	.pmm_0(SS2_pmm_0),
	
	.pmx_1(SS2_pmx_1),
	.pmy_1(SS2_pmy_1),
	.pmm_1(SS2_pmm_1),
	
	.pmx_2(SS2_pmx_2),
	.pmy_2(SS2_pmy_2),
	.pmm_2(SS2_pmm_2),
	
	.pmx_3(SS2_pmx_3),
	.pmy_3(SS2_pmy_3),
	.pmm_3(SS2_pmm_3),
	
	.pmx_4(SS2_pmx_4),
	.pmy_4(SS2_pmy_4),
	.pmm_4(SS2_pmm_4),
	
	.pmx_5(SS2_pmx_5),
	.pmy_5(SS2_pmy_5),
	.pmm_5(SS2_pmm_5),
	
	.pmx_6(SS2_pmx_6),
	.pmy_6(SS2_pmy_6),
	.pmm_6(SS2_pmm_6),
	
	.pmx_7(SS2_pmx_7),
	.pmy_7(SS2_pmy_7),
	.pmm_7(SS2_pmm_7),
	
	.lambda1_0(SS2_lambda1_0),
	.lambda0_0(SS2_lambda0_0),
	
	.lambda1_1(SS2_lambda1_1),
	.lambda0_1(SS2_lambda0_1),
	
	.lambda1_2(SS2_lambda1_2),
	.lambda0_2(SS2_lambda0_2),
	
	.lambda1_3(SS2_lambda1_3),
	.lambda0_3(SS2_lambda0_3),
	
	.lambda1_4(SS2_lambda1_4),
	.lambda0_4(SS2_lambda0_4),
	
	.lambda1_5(SS2_lambda1_5),
	.lambda0_5(SS2_lambda0_5),
	
	.lambda1_6(SS2_lambda1_6),
	.lambda0_6(SS2_lambda0_6),
	
	.lambda1_7(SS2_lambda1_7),
	.lambda0_7(SS2_lambda0_7),
	
	.H_in(SS2_H_in),
	.r_0(SS2_r_0),
	.r_1(SS2_r_1),
	.r_2(SS2_r_2),
	.r_3(SS2_r_3),
	.r_4(SS2_r_4),
	.r_5(SS2_r_5),
	.r_6(SS2_r_6),
	.r_7(SS2_r_7),
	
	.busy(SS2_busy),
	.cal_current_state(SS2_cal_current_state),
	.head(SS2_head),
	.init(SS2_init),
	.y_initial(SS2_y_initial),
	.en_sum(SS2_en_sum)
);

pipeline_SS SS3(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.matrix_memory_sop(matrix_memory_sop3),
	.matrix_memory_eop(matrix_memory_eop3),
	.matrix_memory_vld(matrix_memory_vld3),
	.matrix_memory_data(matrix_memory_data3),
	
	.SS_fifo_X_in(SS3_fifo_X_in),
	.SS_fifo_M_in(SS3_fifo_M_in),
	
	.SS_fifo_wrreq(SS3_fifo_wrreq),
	.SS_fifo_rdreq(SS3_fifo_rdreq),

	.vld(vld2),
	
	.SS_fifo_X_out(SS3_X),
	.SS_fifo_M_out(SS3_M),
	
	.mode(SS3_mode),
	.sum_select(SS3_sum_select),
	.sum_vld(SS3_sum_vld),
	
	.pmx_0(SS3_pmx_0),
	.pmy_0(SS3_pmy_0),
	.pmm_0(SS3_pmm_0),
	
	.pmx_1(SS3_pmx_1),
	.pmy_1(SS3_pmy_1),
	.pmm_1(SS3_pmm_1),
	
	.pmx_2(SS3_pmx_2),
	.pmy_2(SS3_pmy_2),
	.pmm_2(SS3_pmm_2),
	
	.pmx_3(SS3_pmx_3),
	.pmy_3(SS3_pmy_3),
	.pmm_3(SS3_pmm_3),
	
	.pmx_4(SS3_pmx_4),
	.pmy_4(SS3_pmy_4),
	.pmm_4(SS3_pmm_4),
	
	.pmx_5(SS3_pmx_5),
	.pmy_5(SS3_pmy_5),
	.pmm_5(SS3_pmm_5),
	
	.pmx_6(SS3_pmx_6),
	.pmy_6(SS3_pmy_6),
	.pmm_6(SS3_pmm_6),
	
	.pmx_7(SS3_pmx_7),
	.pmy_7(SS3_pmy_7),
	.pmm_7(SS3_pmm_7),
	
	.lambda1_0(SS3_lambda1_0),
	.lambda0_0(SS3_lambda0_0),
	
	.lambda1_1(SS3_lambda1_1),
	.lambda0_1(SS3_lambda0_1),
	
	.lambda1_2(SS3_lambda1_2),
	.lambda0_2(SS3_lambda0_2),
	
	.lambda1_3(SS3_lambda1_3),
	.lambda0_3(SS3_lambda0_3),
	
	.lambda1_4(SS3_lambda1_4),
	.lambda0_4(SS3_lambda0_4),
	
	.lambda1_5(SS3_lambda1_5),
	.lambda0_5(SS3_lambda0_5),
	
	.lambda1_6(SS3_lambda1_6),
	.lambda0_6(SS3_lambda0_6),
	
	.lambda1_7(SS3_lambda1_7),
	.lambda0_7(SS3_lambda0_7),
	
	.H_in(SS3_H_in),
	.r_0(SS3_r_0),
	.r_1(SS3_r_1),
	.r_2(SS3_r_2),
	.r_3(SS3_r_3),
	.r_4(SS3_r_4),
	.r_5(SS3_r_5),
	.r_6(SS3_r_6),
	.r_7(SS3_r_7),
	
	.busy(SS3_busy),
	.cal_current_state(SS3_cal_current_state),
	.head(SS3_head),
	.init(SS3_init),
	.y_initial(SS3_y_initial),
	.en_sum(SS3_en_sum)
);

pipeline_SS SS4(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.matrix_memory_sop(matrix_memory_sop4),
	.matrix_memory_eop(matrix_memory_eop4),
	.matrix_memory_vld(matrix_memory_vld4),
	.matrix_memory_data(matrix_memory_data4),
	
	.SS_fifo_X_in(SS4_fifo_X_in),
	.SS_fifo_M_in(SS4_fifo_M_in),
	
	.SS_fifo_wrreq(SS4_fifo_wrreq),
	.SS_fifo_rdreq(SS4_fifo_rdreq),

	.vld(vld3),
	
	.SS_fifo_X_out(SS4_X),
	.SS_fifo_M_out(SS4_M),
	
	.mode(SS4_mode),
	.sum_select(SS4_sum_select),
	.sum_vld(SS4_sum_vld),
	
	.pmx_0(SS4_pmx_0),
	.pmy_0(SS4_pmy_0),
	.pmm_0(SS4_pmm_0),
	
	.pmx_1(SS4_pmx_1),
	.pmy_1(SS4_pmy_1),
	.pmm_1(SS4_pmm_1),
	
	.pmx_2(SS4_pmx_2),
	.pmy_2(SS4_pmy_2),
	.pmm_2(SS4_pmm_2),
	
	.pmx_3(SS4_pmx_3),
	.pmy_3(SS4_pmy_3),
	.pmm_3(SS4_pmm_3),
	
	.pmx_4(SS4_pmx_4),
	.pmy_4(SS4_pmy_4),
	.pmm_4(SS4_pmm_4),
	
	.pmx_5(SS4_pmx_5),
	.pmy_5(SS4_pmy_5),
	.pmm_5(SS4_pmm_5),
	
	.pmx_6(SS4_pmx_6),
	.pmy_6(SS4_pmy_6),
	.pmm_6(SS4_pmm_6),
	
	.pmx_7(SS4_pmx_7),
	.pmy_7(SS4_pmy_7),
	.pmm_7(SS4_pmm_7),
	
	.lambda1_0(SS4_lambda1_0),
	.lambda0_0(SS4_lambda0_0),
	
	.lambda1_1(SS4_lambda1_1),
	.lambda0_1(SS4_lambda0_1),
	
	.lambda1_2(SS4_lambda1_2),
	.lambda0_2(SS4_lambda0_2),
	
	.lambda1_3(SS4_lambda1_3),
	.lambda0_3(SS4_lambda0_3),
	
	.lambda1_4(SS4_lambda1_4),
	.lambda0_4(SS4_lambda0_4),
	
	.lambda1_5(SS4_lambda1_5),
	.lambda0_5(SS4_lambda0_5),
	
	.lambda1_6(SS4_lambda1_6),
	.lambda0_6(SS4_lambda0_6),
	
	.lambda1_7(SS4_lambda1_7),
	.lambda0_7(SS4_lambda0_7),
	
	.H_in(SS4_H_in),
	.r_0(SS4_r_0),
	.r_1(SS4_r_1),
	.r_2(SS4_r_2),
	.r_3(SS4_r_3),
	.r_4(SS4_r_4),
	.r_5(SS4_r_5),
	.r_6(SS4_r_6),
	.r_7(SS4_r_7),
	
	.busy(SS4_busy),
	.cal_current_state(SS4_cal_current_state),
	.head(SS4_head),
	.init(SS4_init),
	.y_initial(SS4_y_initial),
	.en_sum(SS4_en_sum)
);

pipeline_SS SS5(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.matrix_memory_sop(matrix_memory_sop5),
	.matrix_memory_eop(matrix_memory_eop5),
	.matrix_memory_vld(matrix_memory_vld5),
	.matrix_memory_data(matrix_memory_data5),
	
	.SS_fifo_X_in(SS5_fifo_X_in),
	.SS_fifo_M_in(SS5_fifo_M_in),
	
	.SS_fifo_wrreq(SS5_fifo_wrreq),
	.SS_fifo_rdreq(SS5_fifo_rdreq),

	.vld(vld4),
	
	.SS_fifo_X_out(SS5_X),
	.SS_fifo_M_out(SS5_M),
	
	.mode(SS5_mode),
	.sum_select(SS5_sum_select),
	.sum_vld(SS5_sum_vld),
	
	.pmx_0(SS5_pmx_0),
	.pmy_0(SS5_pmy_0),
	.pmm_0(SS5_pmm_0),
	
	.pmx_1(SS5_pmx_1),
	.pmy_1(SS5_pmy_1),
	.pmm_1(SS5_pmm_1),
	
	.pmx_2(SS5_pmx_2),
	.pmy_2(SS5_pmy_2),
	.pmm_2(SS5_pmm_2),
	
	.pmx_3(SS5_pmx_3),
	.pmy_3(SS5_pmy_3),
	.pmm_3(SS5_pmm_3),
	
	.pmx_4(SS5_pmx_4),
	.pmy_4(SS5_pmy_4),
	.pmm_4(SS5_pmm_4),
	
	.pmx_5(SS5_pmx_5),
	.pmy_5(SS5_pmy_5),
	.pmm_5(SS5_pmm_5),
	
	.pmx_6(SS5_pmx_6),
	.pmy_6(SS5_pmy_6),
	.pmm_6(SS5_pmm_6),
	
	.pmx_7(SS5_pmx_7),
	.pmy_7(SS5_pmy_7),
	.pmm_7(SS5_pmm_7),
	
	.lambda1_0(SS5_lambda1_0),
	.lambda0_0(SS5_lambda0_0),
	
	.lambda1_1(SS5_lambda1_1),
	.lambda0_1(SS5_lambda0_1),
	
	.lambda1_2(SS5_lambda1_2),
	.lambda0_2(SS5_lambda0_2),
	
	.lambda1_3(SS5_lambda1_3),
	.lambda0_3(SS5_lambda0_3),
	
	.lambda1_4(SS5_lambda1_4),
	.lambda0_4(SS5_lambda0_4),
	
	.lambda1_5(SS5_lambda1_5),
	.lambda0_5(SS5_lambda0_5),
	
	.lambda1_6(SS5_lambda1_6),
	.lambda0_6(SS5_lambda0_6),
	
	.lambda1_7(SS5_lambda1_7),
	.lambda0_7(SS5_lambda0_7),
	
	.H_in(SS5_H_in),
	.r_0(SS5_r_0),
	.r_1(SS5_r_1),
	.r_2(SS5_r_2),
	.r_3(SS5_r_3),
	.r_4(SS5_r_4),
	.r_5(SS5_r_5),
	.r_6(SS5_r_6),
	.r_7(SS5_r_7),
	
	.busy(SS5_busy),
	.cal_current_state(SS5_cal_current_state),
	.head(SS5_head),
	.init(SS5_init),
	.y_initial(SS5_y_initial),
	.en_sum(SS5_en_sum)
);

endmodule