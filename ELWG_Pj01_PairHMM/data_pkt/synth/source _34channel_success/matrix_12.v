

/*********************************************************************
//  Author:    cz
//  Filename:  matrix_9
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

module matrix_12 (
	//input
   core_clk,
	sys_clk           ,
	sys_rst_n           ,
	matrix_memory_sop ,
	matrix_memory_eop ,
	matrix_memory_vld ,
	matrix_memory_data,
	result_fifo_rden  ,
	//output
	pkt_receive_enable,
	result_fifo_rdat,
	result_fifo_empty
	
);



/*-------------------------------------------------------------------*\
                          Parameter Description
\*-------------------------------------------------------------------*/
parameter MAX_DATA_NUM = 10240;
parameter MAX_TIME_OUT = 32'd30000000;
parameter ADDR_MOVE    = 14'h0;//14'h2800;


/*-------------------------------------------------------------------*\
                          Reg/wire Description
\*-------------------------------------------------------------------*/
input              core_clk;
input              sys_clk           ;
input              sys_rst_n           ;
input              matrix_memory_sop ;
input              matrix_memory_eop ;
input              matrix_memory_vld ;
input    [31:0]    matrix_memory_data;
input              result_fifo_rden  ;
//outpu;
output       	    pkt_receive_enable;
output 	[127:0]   result_fifo_rdat;
output 		       result_fifo_empty;

/*-------------------------------C0----------------------------------*/


reg  [31:0] m_i1_j1   ;
reg  [31:0] m_i1_j    ;
reg  [31:0] x_i1_j1   ;
reg  [31:0] x_i1_j    ;
reg  [31:0] y_i1_j1   ;
reg  [31:0] p_mx      ;
reg  [31:0] p_my      ;
reg  [31:0] float_q_0 ;
reg  [63:0] head      ;
reg         flag_lam  ;
reg         sum_vld   ;
reg  [ 8:0] col_cnt   ;
reg         en_sum    ;
wire [31:0] m_i_j     ;
wire [31:0] x_i_j     ;
wire [31:0] y_i_j     ;
wire [95:0] result    ;
wire        result_vld;


/*-------------------------------C1----------------------------------*/

reg  [ 7:0] r        ;
reg  [ 7:0] h        ;
reg  [31:0] float_i_0  ;
reg  [31:0] float_q_1  ;
reg  [31:0] float_d_1  ;
wire [31:0] lambda   ;
wire [31:0] p_mm     ;


/*--------------------------------m0----------------------------------*/
reg         matrix_memory_sop_0 ;
reg         matrix_memory_eop_0 ;
reg         matrix_memory_vld_0 ;
reg  [31:0] matrix_memory_data_0;
reg  [31:0] m_i_j_0             ;
reg  [31:0] x_i_j_0             ;
reg  [31:0] y_i_j_0             ;

reg 		vld_0 ;
wire        busy_0              ;
wire [31:0] m_i1_j1_0           ;
wire [31:0] m_i1_j_0            ;
wire [31:0] x_i1_j1_0           ;
wire [31:0] x_i1_j_0            ;
wire [31:0] y_i1_j1_0           ;
wire [31:0] float_i_0_0         ;
wire [31:0] float_q_0_0         ;
wire [31:0] float_q_1_0         ;
wire [31:0] float_d_1_0         ;
wire [31:0] p_mx_0              ;
wire [31:0] p_my_0              ;
wire        sum_vld_0           ;
wire [63:0] head_0              ;
wire        flag_lam_0          ;
wire        en_sum_0            ;
wire [ 8:0] col_cnt_0           ;

/*--------------------------------m1----------------------------------*/
reg         matrix_memory_sop_1 ;
reg         matrix_memory_eop_1 ;
reg         matrix_memory_vld_1 ;
reg  [31:0] matrix_memory_data_1;
reg  [31:0] m_i_j_1             ;
reg  [31:0] x_i_j_1             ;
reg  [31:0] y_i_j_1             ;

reg 		vld_1;
wire        busy_1              ;
wire [31:0] m_i1_j1_1           ;
wire [31:0] m_i1_j_1            ;
wire [31:0] x_i1_j1_1           ;
wire [31:0] x_i1_j_1            ;
wire [31:0] y_i1_j1_1           ;
wire [31:0] float_i_0_1         ;
wire [31:0] float_q_0_1         ;
wire [31:0] float_q_1_1         ;
wire [31:0] float_d_1_1         ;
wire [31:0] p_mx_1              ;
wire [31:0] p_my_1              ;
wire        sum_vld_1           ;
wire [63:0] head_1              ;
wire        flag_lam_1          ;
wire        en_sum_1            ;
wire [ 8:0] col_cnt_1           ;

/*--------------------------------m2----------------------------------*/
reg         matrix_memory_sop_2 ;
reg         matrix_memory_eop_2 ;
reg         matrix_memory_vld_2 ;
reg  [31:0] matrix_memory_data_2;
reg  [31:0] m_i_j_2             ;
reg  [31:0] x_i_j_2             ;
reg  [31:0] y_i_j_2             ;

reg 		vld_2;
wire        busy_2              ;
wire [31:0] m_i1_j1_2           ;
wire [31:0] m_i1_j_2            ;
wire [31:0] x_i1_j1_2           ;
wire [31:0] x_i1_j_2            ;
wire [31:0] y_i1_j1_2           ;
wire [31:0] float_i_0_2         ;
wire [31:0] float_q_0_2         ;
wire [31:0] float_q_1_2         ;
wire [31:0] float_d_1_2         ;
wire [31:0] p_mx_2              ;
wire [31:0] p_my_2              ;
wire        sum_vld_2           ;
wire [63:0] head_2              ;
wire        flag_lam_2          ;
wire        en_sum_2            ;
wire [ 8:0] col_cnt_2           ;


/*--------------------------------m3----------------------------------*/
reg         matrix_memory_sop_3 ;
reg         matrix_memory_eop_3 ;
reg         matrix_memory_vld_3 ;
reg  [31:0] matrix_memory_data_3;
reg  [31:0] m_i_j_3             ;
reg  [31:0] x_i_j_3             ;
reg  [31:0] y_i_j_3             ;

reg 		vld_3;
wire        busy_3              ;
wire [31:0] m_i1_j1_3           ;
wire [31:0] m_i1_j_3            ;
wire [31:0] x_i1_j1_3           ;
wire [31:0] x_i1_j_3            ;
wire [31:0] y_i1_j1_3           ;
wire [31:0] float_i_0_3         ;
wire [31:0] float_q_0_3         ;
wire [31:0] float_q_1_3         ;
wire [31:0] float_d_1_3         ;
wire [31:0] p_mx_3              ;
wire [31:0] p_my_3              ;
wire        sum_vld_3           ;
wire [63:0] head_3              ;
wire        flag_lam_3          ;
wire        en_sum_3            ;
wire [ 8:0] col_cnt_3           ;

/*--------------------------------m4----------------------------------*/
reg         matrix_memory_sop_4 ;
reg         matrix_memory_eop_4 ;
reg         matrix_memory_vld_4 ;
reg  [31:0] matrix_memory_data_4;
reg  [31:0] m_i_j_4             ;
reg  [31:0] x_i_j_4             ;
reg  [31:0] y_i_j_4             ;

reg 		vld_4;
wire        busy_4              ;
wire [31:0] m_i1_j1_4           ;
wire [31:0] m_i1_j_4            ;
wire [31:0] x_i1_j1_4           ;
wire [31:0] x_i1_j_4            ;
wire [31:0] y_i1_j1_4           ;
wire [31:0] float_i_0_4         ;
wire [31:0] float_q_0_4         ;
wire [31:0] float_q_1_4         ;
wire [31:0] float_d_1_4         ;
wire [31:0] p_mx_4              ;
wire [31:0] p_my_4              ;
wire        sum_vld_4           ;
wire [63:0] head_4              ;
wire        flag_lam_4          ;
wire        en_sum_4            ;
wire [ 8:0] col_cnt_4           ;


/*--------------------------------m5----------------------------------*/
reg         matrix_memory_sop_5 ;
reg         matrix_memory_eop_5 ;
reg         matrix_memory_vld_5 ;
reg  [31:0] matrix_memory_data_5;
reg  [31:0] m_i_j_5             ;
reg  [31:0] x_i_j_5             ;
reg  [31:0] y_i_j_5             ;

reg 		vld_5;
wire        busy_5              ;
wire [31:0] m_i1_j1_5           ;
wire [31:0] m_i1_j_5            ;
wire [31:0] x_i1_j1_5           ;
wire [31:0] x_i1_j_5            ;
wire [31:0] y_i1_j1_5           ;
wire [31:0] float_i_0_5         ;
wire [31:0] float_q_0_5         ;
wire [31:0] float_q_1_5         ;
wire [31:0] float_d_1_5         ;
wire [31:0] p_mx_5              ;
wire [31:0] p_my_5              ;
wire        sum_vld_5           ;
wire [63:0] head_5              ;
wire        flag_lam_5          ;
wire        en_sum_5            ;
wire [ 8:0] col_cnt_5           ;

/*--------------------------------m6----------------------------------*/
reg         matrix_memory_sop_6 ;
reg         matrix_memory_eop_6 ;
reg         matrix_memory_vld_6 ;
reg  [31:0] matrix_memory_data_6;
reg  [31:0] m_i_j_6             ;
reg  [31:0] x_i_j_6             ;
reg  [31:0] y_i_j_6             ;

reg 		vld_6;
wire        busy_6              ;
wire [31:0] m_i1_j1_6           ;
wire [31:0] m_i1_j_6            ;
wire [31:0] x_i1_j1_6           ;
wire [31:0] x_i1_j_6            ;
wire [31:0] y_i1_j1_6           ;
wire [31:0] float_i_0_6         ;
wire [31:0] float_q_0_6         ;
wire [31:0] float_q_1_6         ;
wire [31:0] float_d_1_6         ;
wire [31:0] p_mx_6              ;
wire [31:0] p_my_6              ;
wire        sum_vld_6           ;
wire [63:0] head_6              ;
wire        flag_lam_6          ;
wire        en_sum_6            ;
wire [ 8:0] col_cnt_6           ;

/*--------------------------------m7----------------------------------*/
reg         matrix_memory_sop_7 ;
reg         matrix_memory_eop_7 ;
reg         matrix_memory_vld_7 ;
reg  [31:0] matrix_memory_data_7;
reg  [31:0] m_i_j_7             ;
reg  [31:0] x_i_j_7             ;
reg  [31:0] y_i_j_7             ;

reg 		vld_7;
wire        busy_7              ;
wire [31:0] m_i1_j1_7           ;
wire [31:0] m_i1_j_7            ;
wire [31:0] x_i1_j1_7           ;
wire [31:0] x_i1_j_7            ;
wire [31:0] y_i1_j1_7           ;
wire [31:0] float_i_0_7         ;
wire [31:0] float_q_0_7         ;
wire [31:0] float_q_1_7         ;
wire [31:0] float_d_1_7         ;
wire [31:0] p_mx_7              ;
wire [31:0] p_my_7              ;
wire        sum_vld_7           ;
wire [63:0] head_7              ;
wire        flag_lam_7          ;
wire        en_sum_7            ;
wire [ 8:0] col_cnt_7           ;

/*--------------------------------m8----------------------------------*/
reg         matrix_memory_sop_8 ;
reg         matrix_memory_eop_8 ;
reg         matrix_memory_vld_8 ;
reg  [31:0] matrix_memory_data_8;
reg  [31:0] m_i_j_8             ;
reg  [31:0] x_i_j_8             ;
reg  [31:0] y_i_j_8             ;

reg 		vld_8;
wire        busy_8              ;
wire [31:0] m_i1_j1_8           ;
wire [31:0] m_i1_j_8            ;
wire [31:0] x_i1_j1_8           ;
wire [31:0] x_i1_j_8            ;
wire [31:0] y_i1_j1_8           ;
wire [31:0] float_i_0_8         ;
wire [31:0] float_q_0_8         ;
wire [31:0] float_q_1_8         ;
wire [31:0] float_d_1_8         ;
wire [31:0] p_mx_8              ;
wire [31:0] p_my_8              ;
wire        sum_vld_8           ;
wire [63:0] head_8              ;
wire        flag_lam_8          ;
wire        en_sum_8            ;
wire [ 8:0] col_cnt_8           ;

/*--------------------------------m9----------------------------------*/
reg         matrix_memory_sop_9 ;
reg         matrix_memory_eop_9 ;
reg         matrix_memory_vld_9 ;
reg  [31:0] matrix_memory_data_9;
reg  [31:0] m_i_j_9             ;
reg  [31:0] x_i_j_9             ;
reg  [31:0] y_i_j_9             ;

reg 		vld_9;
wire        busy_9              ;
wire [31:0] m_i1_j1_9           ;
wire [31:0] m_i1_j_9            ;
wire [31:0] x_i1_j1_9           ;
wire [31:0] x_i1_j_9            ;
wire [31:0] y_i1_j1_9           ;
wire [31:0] float_i_0_9         ;
wire [31:0] float_q_0_9         ;
wire [31:0] float_q_1_9         ;
wire [31:0] float_d_1_9         ;
wire [31:0] p_mx_9              ;
wire [31:0] p_my_9              ;
wire        sum_vld_9           ;
wire [63:0] head_9              ;
wire        flag_lam_9          ;
wire        en_sum_9            ;
wire [ 8:0] col_cnt_9           ;

/*--------------------------------m10----------------------------------*/
reg         matrix_memory_sop_10 ;
reg         matrix_memory_eop_10 ;
reg         matrix_memory_vld_10 ;
reg  [31:0] matrix_memory_data_10;
reg  [31:0] m_i_j_10             ;
reg  [31:0] x_i_j_10             ;
reg  [31:0] y_i_j_10             ;

reg 		vld_10;
wire        busy_10              ;
wire [31:0] m_i1_j1_10           ;
wire [31:0] m_i1_j_10            ;
wire [31:0] x_i1_j1_10           ;
wire [31:0] x_i1_j_10            ;
wire [31:0] y_i1_j1_10           ;
wire [31:0] float_i_0_10         ;
wire [31:0] float_q_0_10         ;
wire [31:0] float_q_1_10         ;
wire [31:0] float_d_1_10         ;
wire [31:0] p_mx_10              ;
wire [31:0] p_my_10              ;
wire        sum_vld_10           ;
wire [63:0] head_10              ;
wire        flag_lam_10          ;
wire        en_sum_10            ;
wire [ 8:0] col_cnt_10           ;

/*--------------------------------m11----------------------------------*/
reg         matrix_memory_sop_11 ;
reg         matrix_memory_eop_11 ;
reg         matrix_memory_vld_11 ;
reg  [31:0] matrix_memory_data_11;
reg  [31:0] m_i_j_11             ;
reg  [31:0] x_i_j_11             ;
reg  [31:0] y_i_j_11             ;

reg 		vld_11;
wire        busy_11              ;
wire [31:0] m_i1_j1_11           ;
wire [31:0] m_i1_j_11            ;
wire [31:0] x_i1_j1_11           ;
wire [31:0] x_i1_j_11            ;
wire [31:0] y_i1_j1_11           ;
wire [31:0] float_i_0_11         ;
wire [31:0] float_q_0_11         ;
wire [31:0] float_q_1_11         ;
wire [31:0] float_d_1_11         ;
wire [31:0] p_mx_11              ;
wire [31:0] p_my_11              ;
wire        sum_vld_11           ;
wire [63:0] head_11              ;
wire        flag_lam_11          ;
wire        en_sum_11            ;
wire [ 8:0] col_cnt_11           ;


reg [3:0 ] i ;
reg [3:0 ] j ;
reg 	  enable ;
reg temp_enable1;
reg temp_enable2;
wire[11:0]busy_all;
wire [ 13:0] fifo_almost_full      ;


assign busy_all = {busy_11,busy_10,busy_9,busy_8,busy_7,busy_6,busy_5,busy_4,busy_3,busy_2,busy_1,busy_0};

//always @(posedge sys_clk or negedge sys_rst_n) begin 
//	if(~sys_rst_n) begin
//		temp_enable2 <= 1'b0;
//	end else if (fifo_almost_full && matrix_memory_sop ) begin
//		temp_enable2 <= 1'b1;
//	end else if (!fifo_almost_full)
//		temp_enable2 <= 1'b1;
//end


always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable2 <= 1'b0;
	end else if (fifo_almost_full && matrix_memory_sop ) begin
		temp_enable2 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable2 <= 1'b1;
end


assign pkt_receive_enable = temp_enable1 & temp_enable2;

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		i <= 4'd0;
		matrix_memory_sop_0  <= 0;
		matrix_memory_eop_0  <= 0;
		matrix_memory_vld_0  <= 0;
		matrix_memory_data_0 <= 32'd0;

	 	matrix_memory_sop_1  <= 0;
	 	matrix_memory_eop_1  <= 0;
	 	matrix_memory_vld_1  <= 0;
	 	matrix_memory_data_1 <= 32'd0;
 
	 	matrix_memory_sop_2  <= 0;
	 	matrix_memory_eop_2  <= 0;
	 	matrix_memory_vld_2  <= 0;
	 	matrix_memory_data_2 <= 32'd0;
 
	 	matrix_memory_sop_3   <= 0;
	 	matrix_memory_eop_3   <= 0;
	 	matrix_memory_vld_3  <= 0;
	 	matrix_memory_data_3   <= 32'd0		;
 
	 	matrix_memory_sop_4    <=0;
	 	matrix_memory_eop_4    <=0;
	 	matrix_memory_vld_4   <=0;
	 	matrix_memory_data_4   <=32'd0;
    
	 	matrix_memory_sop_5    <=0;
	 	matrix_memory_eop_5    <=0;
	 	matrix_memory_vld_5   <=0;
	 	matrix_memory_data_5   <=32'd0;
    
	 	matrix_memory_sop_6    <=0;
	 	matrix_memory_eop_6    <=0;
	 	matrix_memory_vld_6   <=0;
	 	matrix_memory_data_6   <=32'd0;
    
	 	matrix_memory_sop_7    <=0;
	 	matrix_memory_eop_7    <=0;
	 	matrix_memory_vld_7   <=0;
	 	matrix_memory_data_7   <=32'd0;
    
	 	matrix_memory_sop_8    <=0;
	 	matrix_memory_eop_8    <=0;
	 	matrix_memory_vld_8   <=0;
	 	matrix_memory_data_8   <=32'd0;
    
	 	matrix_memory_sop_9    <=0;
	 	matrix_memory_eop_9    <=0;
	 	matrix_memory_vld_9   <=0;
	 	matrix_memory_data_9   <=32'd0;
    
	 	matrix_memory_sop_10    <=0;
	 	matrix_memory_eop_10    <=0;
	 	matrix_memory_vld_10   <=0;
	 	matrix_memory_data_10   <=32'd0;
    
	 	matrix_memory_sop_11    <=0;
	 	matrix_memory_eop_11    <=0;
	 	matrix_memory_vld_11   <=0;
	 	matrix_memory_data_11   <=32'd0;

	end else begin 
		case (i)
			4'd0: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_0 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_0;

				matrix_memory_sop_11  <=	0;
				matrix_memory_eop_11  <=	0;
				matrix_memory_vld_11  <=	0;
				matrix_memory_data_11 <=	32'd0;

				matrix_memory_sop_0  <= matrix_memory_sop;
				matrix_memory_eop_0  <= matrix_memory_eop;
				matrix_memory_vld_0  <= matrix_memory_vld;
				matrix_memory_data_0 <= matrix_memory_data;	
			end

			4'd1: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_1 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_1;

				matrix_memory_sop_0  <=	0;
				matrix_memory_eop_0  <=	0;
				matrix_memory_vld_0  <=	0;
				matrix_memory_data_0 <=	32'd0;

				matrix_memory_sop_1  <= matrix_memory_sop;
				matrix_memory_eop_1  <= matrix_memory_eop;
				matrix_memory_vld_1  <= matrix_memory_vld;
				matrix_memory_data_1 <= matrix_memory_data;
			end

			4'd2: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_2 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_2;

				matrix_memory_sop_1  <=	0;
				matrix_memory_eop_1  <=	0;
				matrix_memory_vld_1  <=	0;
				matrix_memory_data_1 <=	32'd0;

				matrix_memory_sop_2  <= matrix_memory_sop;
				matrix_memory_eop_2  <= matrix_memory_eop;
				matrix_memory_vld_2  <= matrix_memory_vld;
				matrix_memory_data_2 <= matrix_memory_data;		
			end

			4'd3: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_3 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_3;

				matrix_memory_sop_2  <=	0;
				matrix_memory_eop_2  <=	0;
				matrix_memory_vld_2  <=	0;
				matrix_memory_data_2 <=	32'd0;

				matrix_memory_sop_3  <= matrix_memory_sop;
				matrix_memory_eop_3  <= matrix_memory_eop;
				matrix_memory_vld_3  <= matrix_memory_vld;
				matrix_memory_data_3 <= matrix_memory_data;	
			end

			4'd4: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_4 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_4;

				matrix_memory_sop_3  <=	0;
				matrix_memory_eop_3  <=	0;
				matrix_memory_vld_3  <=	0;
				matrix_memory_data_3 <=	32'd0;

				matrix_memory_sop_4  <= matrix_memory_sop;
				matrix_memory_eop_4  <= matrix_memory_eop;
				matrix_memory_vld_4  <= matrix_memory_vld;
				matrix_memory_data_4 <= matrix_memory_data;	
			end

			4'd5: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_5 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_5;

				matrix_memory_sop_4  <=	0;
				matrix_memory_eop_4  <=	0;
				matrix_memory_vld_4  <=	0;
				matrix_memory_data_4 <=	32'd0;

				matrix_memory_sop_5  <= matrix_memory_sop;
				matrix_memory_eop_5  <= matrix_memory_eop;
				matrix_memory_vld_5  <= matrix_memory_vld;
				matrix_memory_data_5 <= matrix_memory_data;			
			end


			4'd6: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_6 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_6;

				matrix_memory_sop_5  <=	0;
				matrix_memory_eop_5  <=	0;
				matrix_memory_vld_5  <=	0;
				matrix_memory_data_5 <=	32'd0;

				matrix_memory_sop_6  <= matrix_memory_sop;
				matrix_memory_eop_6  <= matrix_memory_eop;
				matrix_memory_vld_6  <= matrix_memory_vld;
				matrix_memory_data_6 <= matrix_memory_data;	
			end

			4'd7: begin
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_7 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_7;

				matrix_memory_sop_6  <=	0;
				matrix_memory_eop_6  <=	0;
				matrix_memory_vld_6  <=	0;
				matrix_memory_data_6 <=	32'd0;

				matrix_memory_sop_7  <= matrix_memory_sop;
				matrix_memory_eop_7  <= matrix_memory_eop;
				matrix_memory_vld_7  <= matrix_memory_vld;
				matrix_memory_data_7 <= matrix_memory_data;
			end


			4'd8: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_8 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_8;

				matrix_memory_sop_7  <=	0;
				matrix_memory_eop_7  <=	0;
				matrix_memory_vld_7  <=	0;
				matrix_memory_data_7 <=	32'd0;

				matrix_memory_sop_8  <= matrix_memory_sop;
				matrix_memory_eop_8  <= matrix_memory_eop;
				matrix_memory_vld_8  <= matrix_memory_vld;
				matrix_memory_data_8 <= matrix_memory_data;
			end


			4'd9: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_9 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_9;

				matrix_memory_sop_8  <=	0;
				matrix_memory_eop_8  <=	0;
				matrix_memory_vld_8  <=	0;
				matrix_memory_data_8 <=	32'd0;

				matrix_memory_sop_9  <= matrix_memory_sop;
				matrix_memory_eop_9  <= matrix_memory_eop;
				matrix_memory_vld_9  <= matrix_memory_vld;
				matrix_memory_data_9 <= matrix_memory_data;
			end

			4'd10: begin 
				if (matrix_memory_eop) begin 
					i <= i + 1'b1;
				end else if ((busy_10 == 1) && matrix_memory_vld != 1) begin 
					i <= i + 1'b1;
				end
				temp_enable1 <= !busy_10;

				matrix_memory_sop_9  <=	0;
				matrix_memory_eop_9  <=	0;
				matrix_memory_vld_9  <=	0;
				matrix_memory_data_9 <=	32'd0;

				matrix_memory_sop_10  <= matrix_memory_sop;
				matrix_memory_eop_10  <= matrix_memory_eop;
				matrix_memory_vld_10  <= matrix_memory_vld;
				matrix_memory_data_10 <= matrix_memory_data;
			end

			4'd11: begin 
				if (matrix_memory_eop) begin 
					i <= 4'd0;
				end else if ((busy_11 == 1) && matrix_memory_vld != 1) begin 
					i <= 4'd0;
				end
				temp_enable1 <= !busy_11;

				matrix_memory_sop_10  <= 0;
				matrix_memory_eop_10  <= 0;
				matrix_memory_vld_10  <= 0;
				matrix_memory_data_10 <= 32'd0;

				matrix_memory_sop_11  <= matrix_memory_sop;
				matrix_memory_eop_11  <= matrix_memory_eop;
				matrix_memory_vld_11  <= matrix_memory_vld;
				matrix_memory_data_11 <= matrix_memory_data;
			end
		endcase // i				
	end
end



always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		j <= 4'd0;
		{vld_0,vld_1,vld_2,vld_3,vld_4,vld_5,vld_6,vld_7,vld_8,vld_9,vld_10,vld_11} <= 12'b0;
		
		m_i_j_0 <= 32'd0;
		x_i_j_0 <= 32'd0;
		y_i_j_0 <= 32'd0;

		m_i_j_1 <= 32'd0;
		x_i_j_1 <= 32'd0;
		y_i_j_1 <= 32'd0;	

		m_i_j_2 <= 32'd0;
		x_i_j_2 <= 32'd0;
		y_i_j_2 <= 32'd0;

		m_i_j_3 <= 32'd0;
		x_i_j_3 <= 32'd0;
		y_i_j_3 <= 32'd0;

		m_i_j_4 <= 32'd0;
		x_i_j_4 <= 32'd0;
		y_i_j_4 <= 32'd0;

		m_i_j_5 <= 32'd0;
		x_i_j_5 <= 32'd0;
		y_i_j_5 <= 32'd0;

		m_i_j_6 <= 32'd0;
		x_i_j_6 <= 32'd0;
		y_i_j_6 <= 32'd0;

		m_i_j_7 <= 32'd0;
		x_i_j_7 <= 32'd0;
		y_i_j_7 <= 32'd0;

		m_i_j_8 <= 32'd0;
		x_i_j_8 <= 32'd0;
		y_i_j_8 <= 32'd0;

		m_i_j_9 <= 32'd0;
		x_i_j_9 <= 32'd0;
		y_i_j_9 <= 32'd0;

		m_i_j_10 <= 32'd0;
		x_i_j_10 <= 32'd0;
		y_i_j_10 <= 32'd0;

		m_i_j_11 <= 32'd0;
		x_i_j_11 <= 32'd0;
		y_i_j_11 <= 32'd0;

		m_i1_j1  <= 32'd0;
		m_i1_j   <= 32'd0;
		x_i1_j1  <= 32'd0;
		x_i1_j   <= 32'd0;
		y_i1_j1  <= 32'd0;	

		p_mx     <= 32'd0;
		p_my     <= 32'd0;
		float_q_0<= 32'd0;
		float_i_0<= 32'd0;
		float_q_1<= 32'd0;
		float_d_1<= 32'd0;

		head   	 <= 64'd0;
		flag_lam <= 1'b0;
		sum_vld  <= 1'b0;
		col_cnt  <=	9'd0;
		en_sum   <=	1'b0;

	end else begin 
		case (j) 
			4'd0: begin 
			vld_11<= 1'b0;
			vld_0 <= 1'b1;

			m_i1_j1  <= m_i1_j1_9  ;
			m_i1_j   <= m_i1_j_9   ;
			x_i1_j1  <= x_i1_j1_9  ;
			x_i1_j   <= x_i1_j_9   ;
			y_i1_j1  <= y_i1_j1_9  ;
			p_mx     <= p_mx_9     ;
			p_my     <= p_my_9     ;
			float_q_0<= float_q_0_9;
			head   	 <= head_9   	;
			flag_lam <= flag_lam_9 ;
			sum_vld  <= sum_vld_9  ;
			col_cnt  <=	col_cnt_9  ;
			en_sum   <=	en_sum_9   ;

			m_i_j_8	 <= m_i_j;
			x_i_j_8	 <= x_i_j;
			y_i_j_8	 <= y_i_j;

			float_i_0 <= float_i_0_1;
			float_q_1 <= float_q_1_1;
			float_d_1 <= float_d_1_1;

			j <= j + 1'b1;
		end

			4'd1:begin 
			vld_0 <= 1'b0;
			vld_1 <= 1'b1;

			m_i1_j1  <= m_i1_j1_10  ;
			m_i1_j   <= m_i1_j_10   ;
			x_i1_j1  <= x_i1_j1_10  ;
			x_i1_j   <= x_i1_j_10   ;
			y_i1_j1  <= y_i1_j1_10  ;
			p_mx     <= p_mx_10     ;
			p_my     <= p_my_10     ;
			float_q_0<= float_q_0_10;
			head   	 <= head_10   	;
			flag_lam <= flag_lam_10 ;
			sum_vld  <= sum_vld_10  ;
			col_cnt  <=	col_cnt_10  ;
			en_sum   <=	en_sum_10   ;

			m_i_j_9 <= m_i_j;
			x_i_j_9 <= x_i_j;
			y_i_j_9 <= y_i_j;

			float_i_0 <= float_i_0_2;
			float_q_1 <= float_q_1_2;
			float_d_1 <= float_d_1_2;

			j <= j + 1'b1;
			end

			4'd2: begin 
			vld_1 <= 1'b0;
			vld_2 <= 1'b1;

			m_i1_j1  <= m_i1_j1_11  ;
			m_i1_j   <= m_i1_j_11   ;
			x_i1_j1  <= x_i1_j1_11  ;
			x_i1_j   <= x_i1_j_11   ;
			y_i1_j1  <= y_i1_j1_11  ;
			p_mx     <= p_mx_11     ;
			p_my     <= p_my_11     ;
			float_q_0<= float_q_0_11;
			head   	 <= head_11   	;
			flag_lam <= flag_lam_11 ;
			sum_vld  <= sum_vld_11  ;
			col_cnt  <=	col_cnt_11  ;
			en_sum   <=	en_sum_11   ;

			m_i_j_10 <= m_i_j;
			x_i_j_10 <= x_i_j;
			y_i_j_10 <= y_i_j;

			float_i_0 <= float_i_0_3;
			float_q_1 <= float_q_1_3;
			float_d_1 <= float_d_1_3;

			j <= j + 1'b1;
		end

			4'd3: begin 
			vld_2 <= 1'b0;
			vld_3 <= 1'b1;

			m_i1_j1  <= m_i1_j1_0  ;
			m_i1_j   <= m_i1_j_0   ;
			x_i1_j1  <= x_i1_j1_0  ;
			x_i1_j   <= x_i1_j_0   ;
			y_i1_j1  <= y_i1_j1_0  ;
			p_mx     <= p_mx_0     ;
			p_my     <= p_my_0     ;
			float_q_0<= float_q_0_0;
			head   	 <= head_0   	;
			flag_lam <= flag_lam_0 ;
			sum_vld  <= sum_vld_0  ;
			col_cnt  <=	col_cnt_0  ;
			en_sum   <=	en_sum_0   ;

			m_i_j_11 <= m_i_j;
			x_i_j_11 <= x_i_j;
			y_i_j_11 <= y_i_j;

			float_i_0 <= float_i_0_4;
			float_q_1 <= float_q_1_4;
			float_d_1 <= float_d_1_4;
			j <= j + 1'b1;
		end
		
			4'd4: begin 
			vld_3 <= 1'b0;
			vld_4 <= 1'b1;

			m_i1_j1  <= m_i1_j1_1  ;
			m_i1_j   <= m_i1_j_1   ;
			x_i1_j1  <= x_i1_j1_1  ;
			x_i1_j   <= x_i1_j_1   ;
			y_i1_j1  <= y_i1_j1_1  ;
			p_mx     <= p_mx_1     ;
			p_my     <= p_my_1     ;
			float_q_0<= float_q_0_1;
			head   	 <= head_1   	;
			flag_lam <= flag_lam_1 ;
			sum_vld  <= sum_vld_1  ;
			col_cnt  <=	col_cnt_1  ;
			en_sum   <=	en_sum_1   ;

			m_i_j_0 <= m_i_j;
			x_i_j_0 <= x_i_j;
			y_i_j_0 <= y_i_j;

			float_i_0 <= float_i_0_5;
			float_q_1 <= float_q_1_5;
			float_d_1 <= float_d_1_5;

			j <= j + 1'b1;
		end

			4'd5: begin 
			vld_4 <= 1'b0;
			vld_5 <= 1'b1;

			m_i1_j1  <= m_i1_j1_2  ;
			m_i1_j   <= m_i1_j_2   ;
			x_i1_j1  <= x_i1_j1_2  ;
			x_i1_j   <= x_i1_j_2   ;
			y_i1_j1  <= y_i1_j1_2  ;
			p_mx     <= p_mx_2     ;
			p_my     <= p_my_2     ;
			float_q_0<= float_q_0_2;
			head   	 <= head_2   	;
			flag_lam <= flag_lam_2 ;
			sum_vld  <= sum_vld_2  ;
			col_cnt  <=	col_cnt_2  ;
			en_sum   <=	en_sum_2   ;

			m_i_j_1 <= m_i_j;
			x_i_j_1 <= x_i_j;
			y_i_j_1 <= y_i_j;

			float_i_0 <= float_i_0_6;
			float_q_1 <= float_q_1_6;
			float_d_1 <= float_d_1_6;

			j <= j + 1'b1;
		end

			4'd6: begin 
			vld_5 <= 1'b0;
			vld_6 <= 1'b1;

			m_i1_j1  <= m_i1_j1_3  ;
			m_i1_j   <= m_i1_j_3   ;
			x_i1_j1  <= x_i1_j1_3  ;
			x_i1_j   <= x_i1_j_3   ;
			y_i1_j1  <= y_i1_j1_3  ;
			p_mx     <= p_mx_3     ;
			p_my     <= p_my_3     ;
			float_q_0<= float_q_0_3;
			head   	 <= head_3   	;
			flag_lam <= flag_lam_3 ;
			sum_vld  <= sum_vld_3  ;
			col_cnt  <=	col_cnt_3  ;
			en_sum   <=	en_sum_3   ;

			m_i_j_2 <= m_i_j;
			x_i_j_2 <= x_i_j;
			y_i_j_2 <= y_i_j;

			float_i_0 <= float_i_0_7;
			float_q_1 <= float_q_1_7;
			float_d_1 <= float_d_1_7;

			j <= j + 1'b1;
		end

			4'd7: begin 
			vld_6 <= 1'b0;
			vld_7 <= 1'b1;

			m_i1_j1  <= m_i1_j1_4  ;
			m_i1_j   <= m_i1_j_4   ;
			x_i1_j1  <= x_i1_j1_4  ;
			x_i1_j   <= x_i1_j_4   ;
			y_i1_j1  <= y_i1_j1_4  ;
			p_mx     <= p_mx_4     ;
			p_my     <= p_my_4     ;
			float_q_0<= float_q_0_4;
			head   	 <= head_4   	;
			flag_lam <= flag_lam_4 ;
			sum_vld  <= sum_vld_4  ;
			col_cnt  <=	col_cnt_4  ;
			en_sum   <=	en_sum_4   ;

			m_i_j_3 <= m_i_j;
			x_i_j_3 <= x_i_j;
			y_i_j_3 <= y_i_j;

			float_i_0 <= float_i_0_8;
			float_q_1 <= float_q_1_8;
			float_d_1 <= float_d_1_8;

			j <= j + 1'b1;
		end

			4'd8: begin 
			vld_7 <= 1'b0;
			vld_8 <= 1'b1;

			m_i1_j1  <= m_i1_j1_5  ;
			m_i1_j   <= m_i1_j_5   ;
			x_i1_j1  <= x_i1_j1_5  ;
			x_i1_j   <= x_i1_j_5   ;
			y_i1_j1  <= y_i1_j1_5  ;
			p_mx     <= p_mx_5     ;
			p_my     <= p_my_5     ;
			float_q_0<= float_q_0_5;
			head   	 <= head_5   	;
			flag_lam <= flag_lam_5 ;
			sum_vld  <= sum_vld_5  ;
			col_cnt  <=	col_cnt_5  ;
			en_sum   <=	en_sum_5   ;

			m_i_j_4 <= m_i_j;
			x_i_j_4 <= x_i_j;
			y_i_j_4 <= y_i_j;

			float_i_0 <= float_i_0_9;
			float_q_1 <= float_q_1_9;
			float_d_1 <= float_d_1_9;

			j <= j + 1'b1;
		end

			4'd9: begin 
			vld_8 <= 1'b0;
			vld_9 <= 1'b1;

			m_i1_j1  <= m_i1_j1_6  ;
			m_i1_j   <= m_i1_j_6   ;
			x_i1_j1  <= x_i1_j1_6  ;
			x_i1_j   <= x_i1_j_6   ;
			y_i1_j1  <= y_i1_j1_6  ;
			p_mx     <= p_mx_6     ;
			p_my     <= p_my_6     ;
			float_q_0<= float_q_0_6;
			head   	 <= head_6   	;
			flag_lam <= flag_lam_6 ;
			sum_vld  <= sum_vld_6  ;
			col_cnt  <=	col_cnt_6  ;
			en_sum   <=	en_sum_6   ;

			m_i_j_5 <= m_i_j;
			x_i_j_5 <= x_i_j;
			y_i_j_5 <= y_i_j;

			float_i_0 <= float_i_0_10;
			float_q_1 <= float_q_1_10;
			float_d_1 <= float_d_1_10;

			j <= j + 1'b1;
		end


			4'd10: begin 
			vld_9 <= 1'b0;
			vld_10 <= 1'b1;

			m_i1_j1  <= m_i1_j1_7  ;
			m_i1_j   <= m_i1_j_7   ;
			x_i1_j1  <= x_i1_j1_7  ;
			x_i1_j   <= x_i1_j_7   ;
			y_i1_j1  <= y_i1_j1_7  ;
			p_mx     <= p_mx_7     ;
			p_my     <= p_my_7     ;
			float_q_0<= float_q_0_7;
			head   	 <= head_7   	;
			flag_lam <= flag_lam_7 ;
			sum_vld  <= sum_vld_7  ;
			col_cnt  <=	col_cnt_7  ;
			en_sum   <=	en_sum_7   ;

			m_i_j_6 <= m_i_j;
			x_i_j_6 <= x_i_j;
			y_i_j_6 <= y_i_j;

			float_i_0 <= float_i_0_11;
			float_q_1 <= float_q_1_11;
			float_d_1 <= float_d_1_11;

			j <= j + 1'b1;
		end

			4'd11: begin 
			vld_10 <= 1'b0;
			vld_11 <= 1'b1;

			m_i1_j1  <= m_i1_j1_8  ;
			m_i1_j   <= m_i1_j_8   ;
			x_i1_j1  <= x_i1_j1_8  ;
			x_i1_j   <= x_i1_j_8   ;
			y_i1_j1  <= y_i1_j1_8  ;
			p_mx     <= p_mx_8     ;
			p_my     <= p_my_8     ;
			float_q_0<= float_q_0_8;
			head   	 <= head_8   	;
			flag_lam <= flag_lam_8 ;
			sum_vld  <= sum_vld_8  ;
			col_cnt  <=	col_cnt_8  ;
			en_sum   <=	en_sum_8   ;

			m_i_j_7  <= m_i_j;
			x_i_j_7  <= x_i_j;
			y_i_j_7  <= y_i_j;

			float_i_0 <= float_i_0_0;
			float_q_1 <= float_q_1_0;
			float_d_1 <= float_d_1_0;

			j <= 4'd0;
		end

		endcase
	end
end




calculate_module c0 (
	.sys_clk   (sys_clk   ),
	.sys_rst_n (sys_rst_n ),
	.m_i1_j1   (m_i1_j1   ),
	.m_i1_j    (m_i1_j    ),
	.x_i1_j1   (x_i1_j1   ),
	.x_i1_j    (x_i1_j    ),
	.y_i1_j1   (y_i1_j1   ),
	.p_mx      (p_mx      ),
	.p_my      (p_my      ),
	.p_mm      (p_mm      ),
	.lambda    (lambda    ),
	.float_q_0 (float_q_0 ),
	.head      (head      ),
	.flag_lam  (flag_lam  ),
	.sum_vld   (sum_vld   ),
	.col_cnt   (col_cnt   ),
	.en_sum    (en_sum    ),
	.m_i_j     (m_i_j     ),
	.x_i_j     (x_i_j     ),
	.y_i_j     (y_i_j     ),
	.result    (result    ),
	.result_vld(result_vld)
);


calculate_p c1 (
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.float_i_0(float_i_0),
	.float_q_0(float_q_0),
	.float_q_1(float_q_1),
	.float_d_1(float_d_1),
	.lambda(lambda),
	.p_mm(p_mm)
	);


matrix_memory m0 (
	//input
	.matrix_memory_sop (matrix_memory_sop_0 ),
	.matrix_memory_eop (matrix_memory_eop_0 ),
	.matrix_memory_vld (matrix_memory_vld_0 ),
	.matrix_memory_data(matrix_memory_data_0),
	.m_i_j             (m_i_j_0             ),
	.x_i_j             (x_i_j_0             ),
	.y_i_j             (y_i_j_0             ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_0               ),
	.busy              (busy_0              ),
	.m_i1_j1           (m_i1_j1_0           ),
	.m_i1_j            (m_i1_j_0            ),
	.x_i1_j1           (x_i1_j1_0           ),
	.x_i1_j            (x_i1_j_0            ),
	.y_i1_j1           (y_i1_j1_0           ),
	.float_i_0         (float_i_0_0         ),
	.float_q_0         (float_q_0_0         ),
	.float_q_1         (float_q_1_0         ),
	.float_d_1         (float_d_1_0         ),
	.p_mx              (p_mx_0              ),
	.p_my              (p_my_0              ),
	.sum_vld           (sum_vld_0           ),
	.head              (head_0              ),
	.flag_lam          (flag_lam_0          ),
	.en_sum            (en_sum_0            ),
	.col_cnt           (col_cnt_0           )
);

matrix_memory m1 (
	//input
	.matrix_memory_sop (matrix_memory_sop_1 ),
	.matrix_memory_eop (matrix_memory_eop_1 ),
	.matrix_memory_vld (matrix_memory_vld_1 ),
	.matrix_memory_data(matrix_memory_data_1),
	.m_i_j             (m_i_j_1             ),
	.x_i_j             (x_i_j_1             ),
	.y_i_j             (y_i_j_1             ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_1               ),
	.busy              (busy_1              ),
	.m_i1_j1           (m_i1_j1_1           ),
	.m_i1_j            (m_i1_j_1            ),
	.x_i1_j1           (x_i1_j1_1           ),
	.x_i1_j            (x_i1_j_1            ),
	.y_i1_j1           (y_i1_j1_1           ),
	.float_i_0         (float_i_0_1         ),
	.float_q_0         (float_q_0_1         ),
	.float_q_1         (float_q_1_1         ),
	.float_d_1         (float_d_1_1         ),
	.p_mx              (p_mx_1              ),
	.p_my              (p_my_1              ),
	.sum_vld           (sum_vld_1           ),
	.head              (head_1              ),
	.flag_lam          (flag_lam_1          ),
	.en_sum            (en_sum_1            ),
	.col_cnt           (col_cnt_1           )
);

matrix_memory m2 (
	//input
	.matrix_memory_sop (matrix_memory_sop_2 ),
	.matrix_memory_eop (matrix_memory_eop_2 ),
	.matrix_memory_vld (matrix_memory_vld_2 ),
	.matrix_memory_data(matrix_memory_data_2),
	.m_i_j             (m_i_j_2             ),
	.x_i_j             (x_i_j_2             ),
	.y_i_j             (y_i_j_2             ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_2               ),
	.busy              (busy_2              ),
	.m_i1_j1           (m_i1_j1_2           ),
	.m_i1_j            (m_i1_j_2            ),
	.x_i1_j1           (x_i1_j1_2           ),
	.x_i1_j            (x_i1_j_2            ),
	.y_i1_j1           (y_i1_j1_2           ),
	.float_i_0         (float_i_0_2         ),
	.float_q_0         (float_q_0_2         ),
	.float_q_1         (float_q_1_2         ),
	.float_d_1         (float_d_1_2         ),
	.p_mx              (p_mx_2              ),
	.p_my              (p_my_2              ),
	.sum_vld           (sum_vld_2           ),
	.head              (head_2              ),
	.flag_lam          (flag_lam_2          ),
	.en_sum            (en_sum_2            ),
	.col_cnt           (col_cnt_2           )
);

matrix_memory m3 (
	//input
	.matrix_memory_sop (matrix_memory_sop_3 ),
	.matrix_memory_eop (matrix_memory_eop_3 ),
	.matrix_memory_vld (matrix_memory_vld_3 ),
	.matrix_memory_data(matrix_memory_data_3),
	.m_i_j             (m_i_j_3             ),
	.x_i_j             (x_i_j_3             ),
	.y_i_j             (y_i_j_3             ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_3               ),
	.busy              (busy_3              ),
	.m_i1_j1           (m_i1_j1_3           ),
	.m_i1_j            (m_i1_j_3            ),
	.x_i1_j1           (x_i1_j1_3           ),
	.x_i1_j            (x_i1_j_3            ),
	.y_i1_j1           (y_i1_j1_3           ),
	.float_i_0         (float_i_0_3         ),
	.float_q_0         (float_q_0_3         ),
	.float_q_1         (float_q_1_3         ),
	.float_d_1         (float_d_1_3         ),
	.p_mx              (p_mx_3              ),
	.p_my              (p_my_3              ),
	.sum_vld           (sum_vld_3           ),
	.head              (head_3              ),
	.flag_lam          (flag_lam_3          ),
	.en_sum            (en_sum_3            ),
	.col_cnt           (col_cnt_3           )
);


matrix_memory m4 (
	//input
	.matrix_memory_sop (matrix_memory_sop_4 ),
	.matrix_memory_eop (matrix_memory_eop_4 ),
	.matrix_memory_vld (matrix_memory_vld_4 ),
	.matrix_memory_data(matrix_memory_data_4),
	.m_i_j             (m_i_j_4             ),
	.x_i_j             (x_i_j_4             ),
	.y_i_j             (y_i_j_4             ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_4               ),
	.busy              (busy_4              ),
	.m_i1_j1           (m_i1_j1_4           ),
	.m_i1_j            (m_i1_j_4            ),
	.x_i1_j1           (x_i1_j1_4           ),
	.x_i1_j            (x_i1_j_4            ),
	.y_i1_j1           (y_i1_j1_4           ),
	.float_i_0         (float_i_0_4         ),
	.float_q_0         (float_q_0_4         ),
	.float_q_1         (float_q_1_4         ),
	.float_d_1         (float_d_1_4         ),
	.p_mx              (p_mx_4              ),
	.p_my              (p_my_4              ),
	.sum_vld           (sum_vld_4           ),
	.head              (head_4              ),
	.flag_lam          (flag_lam_4          ),
	.en_sum            (en_sum_4            ),
	.col_cnt           (col_cnt_4           )
);



matrix_memory m5 (
	//input
	.matrix_memory_sop (matrix_memory_sop_5 ),
	.matrix_memory_eop (matrix_memory_eop_5 ),
	.matrix_memory_vld (matrix_memory_vld_5 ),
	.matrix_memory_data(matrix_memory_data_5),
	.m_i_j             (m_i_j_5             ),
	.x_i_j             (x_i_j_5             ),
	.y_i_j             (y_i_j_5             ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_5               ),
	.busy              (busy_5              ),
	.m_i1_j1           (m_i1_j1_5           ),
	.m_i1_j            (m_i1_j_5            ),
	.x_i1_j1           (x_i1_j1_5           ),
	.x_i1_j            (x_i1_j_5            ),
	.y_i1_j1           (y_i1_j1_5           ),
	.float_i_0         (float_i_0_5         ),
	.float_q_0         (float_q_0_5         ),
	.float_q_1         (float_q_1_5         ),
	.float_d_1         (float_d_1_5         ),
	.p_mx              (p_mx_5              ),
	.p_my              (p_my_5              ),
	.sum_vld           (sum_vld_5           ),
	.head              (head_5              ),
	.flag_lam          (flag_lam_5          ),
	.en_sum            (en_sum_5            ),
	.col_cnt           (col_cnt_5           )
);



matrix_memory m6 (
	//input
	.matrix_memory_sop (matrix_memory_sop_6  ),
	.matrix_memory_eop (matrix_memory_eop_6  ),
	.matrix_memory_vld (matrix_memory_vld_6  ),
	.matrix_memory_data(matrix_memory_data_6 ),
	.m_i_j             (m_i_j_6              ),
	.x_i_j             (x_i_j_6              ),
	.y_i_j             (y_i_j_6              ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_6                ),
	.busy              (busy_6               ),
	.m_i1_j1           (m_i1_j1_6            ),
	.m_i1_j            (m_i1_j_6             ),
	.x_i1_j1           (x_i1_j1_6            ),
	.x_i1_j            (x_i1_j_6             ),
	.y_i1_j1           (y_i1_j1_6            ),
	.float_i_0         (float_i_0_6          ),
	.float_q_0         (float_q_0_6          ),
	.float_q_1         (float_q_1_6          ),
	.float_d_1         (float_d_1_6          ),
	.p_mx              (p_mx_6               ),
	.p_my              (p_my_6               ),
	.sum_vld           (sum_vld_6            ),
	.head              (head_6               ),
	.flag_lam          (flag_lam_6           ),
	.en_sum            (en_sum_6             ),
	.col_cnt           (col_cnt_6            )
);


matrix_memory m7 (
	//input
	.matrix_memory_sop (matrix_memory_sop_7  ),
	.matrix_memory_eop (matrix_memory_eop_7  ),
	.matrix_memory_vld (matrix_memory_vld_7  ),
	.matrix_memory_data(matrix_memory_data_7 ),
	.m_i_j             (m_i_j_7              ),
	.x_i_j             (x_i_j_7              ),
	.y_i_j             (y_i_j_7              ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_7                ),
	.busy              (busy_7               ),
	.m_i1_j1           (m_i1_j1_7            ),
	.m_i1_j            (m_i1_j_7             ),
	.x_i1_j1           (x_i1_j1_7            ),
	.x_i1_j            (x_i1_j_7             ),
	.y_i1_j1           (y_i1_j1_7            ),
	.float_i_0         (float_i_0_7          ),
	.float_q_0         (float_q_0_7          ),
	.float_q_1         (float_q_1_7          ),
	.float_d_1         (float_d_1_7          ),
	.p_mx              (p_mx_7               ),
	.p_my              (p_my_7               ),
	.sum_vld           (sum_vld_7            ),
	.head              (head_7               ),
	.flag_lam          (flag_lam_7           ),
	.en_sum            (en_sum_7             ),
	.col_cnt           (col_cnt_7            )
);


matrix_memory m8 (
	//input
	.matrix_memory_sop (matrix_memory_sop_8  ),
	.matrix_memory_eop (matrix_memory_eop_8  ),
	.matrix_memory_vld (matrix_memory_vld_8  ),
	.matrix_memory_data(matrix_memory_data_8 ),
	.m_i_j             (m_i_j_8              ),
	.x_i_j             (x_i_j_8              ),
	.y_i_j             (y_i_j_8              ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_8                ),
	.busy              (busy_8               ),
	.m_i1_j1           (m_i1_j1_8            ),
	.m_i1_j            (m_i1_j_8             ),
	.x_i1_j1           (x_i1_j1_8            ),
	.x_i1_j            (x_i1_j_8             ),
	.y_i1_j1           (y_i1_j1_8            ),
	.float_i_0         (float_i_0_8          ),
	.float_q_0         (float_q_0_8          ),
	.float_q_1         (float_q_1_8          ),
	.float_d_1         (float_d_1_8          ),
	.p_mx              (p_mx_8               ),
	.p_my              (p_my_8               ),
	.sum_vld           (sum_vld_8            ),
	.head              (head_8               ),
	.flag_lam          (flag_lam_8           ),
	.en_sum            (en_sum_8             ),
	.col_cnt           (col_cnt_8            )
);


matrix_memory m9 (
	//input
	.matrix_memory_sop (matrix_memory_sop_9  ),
	.matrix_memory_eop (matrix_memory_eop_9  ),
	.matrix_memory_vld (matrix_memory_vld_9  ),
	.matrix_memory_data(matrix_memory_data_9 ),
	.m_i_j             (m_i_j_9              ),
	.x_i_j             (x_i_j_9              ),
	.y_i_j             (y_i_j_9              ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_9                ),
	.busy              (busy_9               ),
	.m_i1_j1           (m_i1_j1_9            ),
	.m_i1_j            (m_i1_j_9             ),
	.x_i1_j1           (x_i1_j1_9            ),
	.x_i1_j            (x_i1_j_9             ),
	.y_i1_j1           (y_i1_j1_9            ),
	.float_i_0         (float_i_0_9          ),
	.float_q_0         (float_q_0_9          ),
	.float_q_1         (float_q_1_9          ),
	.float_d_1         (float_d_1_9          ),
	.p_mx              (p_mx_9               ),
	.p_my              (p_my_9               ),
	.sum_vld           (sum_vld_9            ),
	.head              (head_9               ),
	.flag_lam          (flag_lam_9           ),
	.en_sum            (en_sum_9             ),
	.col_cnt           (col_cnt_9            )
);



matrix_memory m10 (
	//input
	.matrix_memory_sop (matrix_memory_sop_10  ),
	.matrix_memory_eop (matrix_memory_eop_10  ),
	.matrix_memory_vld (matrix_memory_vld_10  ),
	.matrix_memory_data(matrix_memory_data_10 ),
	.m_i_j             (m_i_j_10              ),
	.x_i_j             (x_i_j_10              ),
	.y_i_j             (y_i_j_10              ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_10                ),
	.busy              (busy_10               ),
	.m_i1_j1           (m_i1_j1_10            ),
	.m_i1_j            (m_i1_j_10             ),
	.x_i1_j1           (x_i1_j1_10            ),
	.x_i1_j            (x_i1_j_10             ),
	.y_i1_j1           (y_i1_j1_10            ),
	.float_i_0         (float_i_0_10          ),
	.float_q_0         (float_q_0_10          ),
	.float_q_1         (float_q_1_10          ),
	.float_d_1         (float_d_1_10          ),
	.p_mx              (p_mx_10               ),
	.p_my              (p_my_10               ),
	.sum_vld           (sum_vld_10            ),
	.head              (head_10               ),
	.flag_lam          (flag_lam_10           ),
	.en_sum            (en_sum_10             ),
	.col_cnt           (col_cnt_10            )
);


matrix_memory m11 (
	//input
	.matrix_memory_sop (matrix_memory_sop_11  ),
	.matrix_memory_eop (matrix_memory_eop_11  ),
	.matrix_memory_vld (matrix_memory_vld_11  ),
	.matrix_memory_data(matrix_memory_data_11 ),
	.m_i_j             (m_i_j_11              ),
	.x_i_j             (x_i_j_11              ),
	.y_i_j             (y_i_j_11              ),
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.vld               (vld_11                ),
	.busy              (busy_11               ),
	.m_i1_j1           (m_i1_j1_11            ),
	.m_i1_j            (m_i1_j_11             ),
	.x_i1_j1           (x_i1_j1_11            ),
	.x_i1_j            (x_i1_j_11             ),
	.y_i1_j1           (y_i1_j1_11            ),
	.float_i_0         (float_i_0_11          ),
	.float_q_0         (float_q_0_11          ),
	.float_q_1         (float_q_1_11          ),
	.float_d_1         (float_d_1_11          ),
	.p_mx              (p_mx_11               ),
	.p_my              (p_my_11               ),
	.sum_vld           (sum_vld_11            ),
	.head              (head_11               ),
	.flag_lam          (flag_lam_11           ),
	.en_sum            (en_sum_11             ),
	.col_cnt           (col_cnt_11            )
);

//---------------------------------------------------------------
wire [127:0] fifo_data_in          ;
wire [127:0] fifo_data_out         ;
wire [ 8:0]  usedw                 ;
wire         fifo_write_en         ;
wire         full                  ;


//fifo_512x128 u0 (
//		.data   (fifo_data_in ), 
//		.wrreq  (fifo_write_en), 
//		.rdreq  (result_fifo_rden ), 
//		.clock  (sys_clk      ), 
//		.q      (result_fifo_rdat),
//		.usedw  (usedw        ), 
//		
//		.full   (full         ), 
//		.empty  (result_fifo_empty)  
//	);



fifo_512x128 u0 (
//write
      .wrclk    (sys_clk            ),
		.wrreq    (fifo_write_en      ), 
		.data     (fifo_data_in       ), 
      .wrusedw  (usedw              ),
		.wrfull   (full               ), 		
//read		
      .rdclk    (core_clk           ),		
		.rdreq    (result_fifo_rden   ), 
		.q        (result_fifo_rdat   ),
		.rdempty  (result_fifo_empty  )  
	);



assign fifo_write_en = result_vld && (~full);
assign fifo_data_in  = {32'b0,result};

assign fifo_almost_full = (usedw >= 9'd485);

//===============================================

//(*noprune*) reg   [31:0]   sop_cont;
//(*noprune*) reg   [31:0]   fifo_in_cont;
//(*noprune*) reg   [31:0]   fifo_out_cont;
//
//
//always @(posedge sys_clk or negedge sys_rst_n) 
//begin
//	if (!sys_rst_n) begin
//      sop_cont <= 32'd0;
//	end else if (matrix_memory_sop) begin
//      sop_cont <= sop_cont + 1;
//	end 
//end 
//
//
//always @(posedge sys_clk or negedge sys_rst_n) 
//begin
//	if (!sys_rst_n) begin
//      fifo_in_cont <= 32'd0;
//	end else if (fifo_write_en) begin
//      fifo_in_cont <= fifo_in_cont + 1;
//	end 
//end
//
//always @(posedge sys_clk or negedge sys_rst_n) 
//begin
//	if (!sys_rst_n) begin
//      fifo_out_cont <= 32'd0;
//	end else if (result_fifo_rden) begin
//      fifo_out_cont <= fifo_out_cont + 1;
//	end 
//end




//===============================================

endmodule // c0