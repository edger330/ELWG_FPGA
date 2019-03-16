

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

module matrix_memory (
	//input
	matrix_memory_sop ,
	matrix_memory_eop ,
	matrix_memory_vld ,
	matrix_memory_data,
	m_i_j             ,
	x_i_j             ,
	y_i_j             ,
	sys_clk           ,
	sys_rst_n         ,
	vld               ,
	busy              ,
	m_i1_j1           ,
	m_i1_j            ,
	x_i1_j1           ,
	x_i1_j            ,
	y_i1_j1           ,
	float_i_0         ,
	float_q_0         ,
	float_q_1         ,
	float_d_1         ,
	p_mx              ,
	p_my              ,
	sum_vld           ,
	head              ,
	flag_lam          ,
	en_sum            ,
	col_cnt           
);

/*-------------------------------------------------------------------*\
                          Parameter Description
\*-------------------------------------------------------------------*/
parameter ADDR_LUT_0         = 11'd0   ;
parameter ADDR_LUT_1         = 11'd256 ;
parameter ADDR_R             = 11'd512 ;
parameter ADDR_R_PLUS_1      = 11'd513 ;
parameter ADDR_H             = 11'd552 ;
parameter ADDR_H_PLUS_1 	 = 11'd553 ;
parameter ADDR_QIDC          = 11'd652 ;
parameter ADDR_QIDC_PLUS_1   = 11'd653 ;
parameter ADDR_M             = 11'd812 ;
parameter ADDR_M_1           = 11'd811 ;
parameter ADDR_M_2           = 11'd810 ;
parameter ADDR_X             = 11'd1212;
parameter ADDR_X_1           = 11'd1211;
parameter ADDR_X_2           = 11'd1210;
parameter ADDR_Y             = 11'd1612;
parameter ADDR_Y_1           = 11'd1611;
parameter ADDR_Y_2           = 11'd1610;

parameter IDLE		   = 8'b00000001;
parameter GET_PKT_INFO = 8'b00000010;
parameter GET_R 	   = 8'b00000100;
parameter GET_H 	   = 8'b00001000;
parameter GET_QIDC 	   = 8'b00010000;
parameter PREPARE 	   = 8'b00100000;
parameter CALCULATE    = 8'b01000000;
parameter DONE 		   = 8'b10000000;


parameter D 			= 2;  

/*-------------------------------------------------------------------*\
                          Port Description
\*-------------------------------------------------------------------*/
	input             matrix_memory_sop ;
	input             matrix_memory_eop ;
	input             matrix_memory_vld ;
	input      [31:0] matrix_memory_data;
	input      [31:0] m_i_j             ;
	input      [31:0] x_i_j             ;
	input      [31:0] y_i_j             ;
	input             sys_clk           ;
	input             sys_rst_n         ;
	input             vld               ;
	output reg        busy              ;
	output reg [31:0] m_i1_j1           ;
	output reg [31:0] m_i1_j            ;
	output reg [31:0] x_i1_j1           ;
	output reg [31:0] x_i1_j            ;
	output reg [31:0] y_i1_j1           ;
	output reg [31:0] float_i_0         ;
	output reg [31:0] float_q_0         ;
	output reg [31:0] float_q_1         ;
	output reg [31:0] float_d_1         ;
	output     [31:0] p_mx              ;
	output     [31:0] p_my              ;
	output reg        sum_vld           ;
	output reg [63:0] head              ;
	output reg        flag_lam          ;
	output reg        en_sum            ;
	output reg [ 8:0] col_cnt			;




/*-------------------------------------------------------------------*\
                          Reg/Wire Description
\*-------------------------------------------------------------------*/
reg [7:0] current_state;
reg [7:0] current_state_1;
reg [7:0] current_state_2;
reg[7:0] next_state;
reg get_pkt_info_done;
reg get_R_done;
reg get_H_done;
reg get_qidc_done;
reg prepare_done;
reg calculate_done;
reg all_done;

reg [31:0] f_matrix_memory_data;
reg f_matrix_memory_sop;
reg f_matrix_memory_vld;
reg f_matrix_memory_eop;

reg [4:0 ] j;

reg [15:0] read_len;
reg [7:0 ] read_len_sub_1_0;
reg [7:0 ] read_len_sub_1_1;
reg [7:0 ] read_len_sub_1_2;
reg [15:0] hap_len;
reg [8:0 ] hap_len_sub_1_0;
reg [8:0 ] hap_len_sub_1_1;
reg [8:0 ] hap_len_sub_1_2;
reg [31:0] y_initial;
reg [7:0 ] rec_cnt;
reg [7:0 ] row_cnt;
reg [ 8:0] col_cnt_1;
reg [ 8:0] col_cnt_2;
reg [ 8:0] col_cnt_3;
reg [8:0 ] hap_len_plus_col_cnt;

reg [1:0 ] row_pos;
reg [1:0 ] col_pos;
reg [5:0 ] sum_save_R;
reg [6:0 ] sum_save_H;
reg [7:0 ] q;
reg [7:0 ] i;
reg [7:0 ] d;
reg [7:0 ] c;
reg [7:0 ] r;
reg [7:0 ] h;
reg [31:0] m_write;
reg [31:0] x_write;
reg [31:0] y_write;

reg [31:0] float_i_1;





reg [31:0] data_a; // RAM PORT
reg [31:0] data_r0_b;
reg [10:0] r0_a_address;
reg [10:0] r0_b_address;
reg wren_a;
reg wren_b;
reg rden_b;
reg rden_a;
wire [31:0] r0_read_data_a;
wire [31:0] r0_read_data_b;

reg [7:0 ] row_cnt_mv_2;
reg [8:0 ] col_cnt_mv_2;
reg [5:0 ] read_len_mv_2;
reg [6:0 ] hap_len_mv_2;

reg [4:0] done_cnt;

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/

always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		f_matrix_memory_sop <= 1'b0;
		f_matrix_memory_eop <= 1'b0;
		f_matrix_memory_vld <= 1'b0;
		f_matrix_memory_data<= 32'd0;
	end else begin 
		f_matrix_memory_sop <= matrix_memory_sop;
		f_matrix_memory_eop <= matrix_memory_eop;
		f_matrix_memory_vld <= matrix_memory_vld;
		f_matrix_memory_data<= matrix_memory_data;
	end
end


assign p_mx = float_i_1;
assign p_my = float_d_1;


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		hap_len_sub_1_0 <= 9'd0;
		hap_len_sub_1_1 <= 9'd0;
		hap_len_sub_1_2 <= 9'd0;
	end	else begin 
		hap_len_sub_1_0 <= hap_len - 1'b1;
		hap_len_sub_1_1 <= hap_len - 1'b1;
		hap_len_sub_1_2 <= hap_len - 1'b1;
	end
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		read_len_sub_1_0 <= 8'd0;
		read_len_sub_1_1 <= 8'd0;
		read_len_sub_1_2 <= 8'd0;
	end	else begin 
		read_len_sub_1_0 <= read_len - 1'b1;
		read_len_sub_1_1 <= read_len - 1'b1;
		read_len_sub_1_2 <= read_len - 1'b1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		current_state 	<= IDLE;
		current_state_1 <= IDLE;
		current_state_2 <= IDLE;
	end else begin 
		current_state 	<= next_state;
		current_state_1 <= next_state;
		current_state_2 <= next_state;
	end
end

always @(*)
begin 
	next_state = current_state;
	case (current_state)
		IDLE:
			begin 
				if (matrix_memory_sop) begin
					next_state = GET_PKT_INFO ;
				end

			end

		GET_PKT_INFO :
			begin 
				if (get_pkt_info_done) begin 
					next_state = GET_R;
				end
			end

		GET_R :
			begin 
				if (get_R_done) begin 
					next_state = GET_H;
				end
			end

		GET_H :
			begin 
				if (get_H_done) begin 
					next_state = GET_QIDC;
				end
			end

		GET_QIDC :
			begin
				if (get_qidc_done) begin 
					next_state = PREPARE;
				end
			end

		PREPARE :
			begin
				if (prepare_done) begin 
					next_state = CALCULATE;
				end
			end

		CALCULATE :
			begin
				if (calculate_done) begin 
					next_state = DONE;
				end
			end

		DONE :
			begin 
				if (all_done) begin 
					next_state = IDLE;
				end
			end

	endcase // current_state
end

//get_pkt_info
reg [2:0] info_cnt;

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		busy <= 1'b0;
	end else if (matrix_memory_sop) begin 
		busy <= 1'b1;
	end else if (current_state[7] & all_done) begin 
		busy <= 1'b0;
	end 
end


always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		info_cnt <= 3'd0;
	end else if (info_cnt == 3'd5) begin 
		info_cnt <= 3'd0;
	end else if (current_state[1]) begin
		info_cnt <= info_cnt + 1'b1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		head <= 64'd0;
	end else if (current_state[1] && (info_cnt == 3'd0)) begin 
		head[63:32] <= f_matrix_memory_data;
	end else if (info_cnt == 3'd1) begin 
		head[31:0]  <= f_matrix_memory_data;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		hap_len <= 16'd0;
		read_len<= 16'd0;
		read_len_mv_2<= 6'd0;
		hap_len_mv_2 <= 7'd0;
	end else if (info_cnt == 3'd4) begin 
		hap_len <= f_matrix_memory_data[31:16];
		read_len<= f_matrix_memory_data[15:0 ];
		hap_len_mv_2 <= f_matrix_memory_data [31:16] >> 2;
		read_len_mv_2<= f_matrix_memory_data [15:0 ] >> 2;	
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		sum_save_R <= 6'd0;
	end else if ((read_len[1:0] !=2'b0) && (info_cnt == 3'd5)) begin 
		sum_save_R <= read_len_mv_2 + 1'b1;
	end else if (info_cnt == 3'd5) begin 
		sum_save_R <= read_len_mv_2;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		sum_save_H <= 7'd0;
	end else if ((hap_len[1:0] != 2'b0) && (info_cnt == 3'd5)) begin 
		sum_save_H <= hap_len_mv_2 + 1'b1;
	end else if (info_cnt == 3'd5) begin 
		sum_save_H <= hap_len_mv_2;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		y_initial <= 32'd0;
	end else if (info_cnt == 3'd5) begin 
		y_initial <= f_matrix_memory_data;
	end
end 


always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		get_pkt_info_done <= 1'b0;
	end else if (info_cnt == 3'd4) begin 
		get_pkt_info_done <= 1'b1;
	end else begin 
		get_pkt_info_done <= 1'b0;
	end
end


//GET_R  = current_state[2]
reg [5:0] r_cnt;

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		r_cnt <= 6'd0;
	end else if (r_cnt == sum_save_R - 1'b1) begin 
		r_cnt <= 6'd0;
	end else if (current_state[2]) begin 
		r_cnt <= r_cnt + 1'b1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		get_R_done <= 1'b0;
	end else if (r_cnt == sum_save_R - 6'd2) begin 
		get_R_done <= 1'b1;
	end else begin 
		get_R_done <= 1'b0;
	end
end


//GET_H = current_state[3]
reg [6:0] h_cnt;
always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		h_cnt <= 7'd0;
	end else if (h_cnt == sum_save_H - 1'b1) begin 
		h_cnt <= 7'd0;
	end else if (current_state[3]) begin 
		h_cnt <= h_cnt + 1'b1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		get_H_done <= 1'b0;
	end else if (h_cnt == sum_save_H - 7'd2) begin 
		get_H_done <= 1'b1;
	end else begin 
		get_H_done <= 1'b0;
	end
end

// GET_QIDC = current_state[4]
reg [7:0] qidc_cnt;
always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		qidc_cnt <= 8'd0;
	end else if (qidc_cnt == read_len - 1) begin 
		qidc_cnt <= 8'd0;
	end else if (current_state [4]) begin 
		qidc_cnt <= qidc_cnt + 1'b1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		get_qidc_done <= 1'b0;
	end else if (qidc_cnt == read_len - 2) begin 
		get_qidc_done <= 1'b1;
	end else begin 
		get_qidc_done <= 1'b0;
	end
end



//PREPARE = current_state[5]
reg [1:0] prepare_cnt; 

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		prepare_cnt <= 2'd0;
	end else if (prepare_cnt == 2'd2) begin 
		prepare_cnt <= 2'd0;
	end else if (current_state[5] & (prepare_cnt == 2'd0) & vld) begin 
		prepare_cnt <= prepare_cnt + 1'b1;
	end else if (current_state[5] & (prepare_cnt != 2'd0)) begin
		prepare_cnt <= prepare_cnt + 2'b1;
	end
end 

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		prepare_done <= 1'b0;
	end else if (prepare_cnt == 2'd1) begin 
		prepare_done <= 1'b1;
	end else begin 
		prepare_done <= 1'b0;
	end
end

//CALCULATE = current_state[6]
reg [11:0] cal_shift;
reg [11:0] cal_shift_1;
reg [11:0] cal_shift_2;


always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		cal_shift 	<= 12'b000000000001;
		cal_shift_1 <= 12'b000000000001;
		cal_shift_2 <= 12'b000000000001;
	end else if (current_state[6]) begin 
		cal_shift   <= {cal_shift[10:0],cal_shift[11]};
		cal_shift_1 <= {cal_shift_1[10:0],cal_shift_1[11]};
		cal_shift_2 <= {cal_shift_2[10:0],cal_shift_2[11]};
	end else begin 
		cal_shift  	<= 12'b000000000001;
		cal_shift_1 <= 12'b000000000001;
		cal_shift_2 <= 12'b000000000001;
	end 
end 

always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		calculate_done <= 1'b0;
	end else if (cal_shift[10] & (col_cnt == hap_len_sub_1_2) & (row_cnt == read_len_sub_1_2)) begin
		calculate_done <= 1'b1;
	end else begin 
		calculate_done <= 1'b0;
	end 
end

/*-------------------cal_shift[0]-------------------*/
always @ (posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		{q,i,d,c} <= 32'd0;
	end else if (cal_shift[0] & current_state[6]) begin 
		{q,i,d,c} <= r0_read_data_b;
	end 
end 



/*-------------------cal_shift[1]-------------------*/
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		m_write <= 32'd0;
		x_write <= 32'd0;
		y_write <= 32'd0;
	end else if (current_state[0]) begin  // IDLE
		m_write <= 32'd0;
		x_write <= 32'd0;
		y_write <= 32'd0;
	end else if (cal_shift[1]) begin 
		m_write <= m_i_j;
		x_write <= x_i_j;
		y_write <= y_i_j;
	end 
end 

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		r <= 8'd0;
	end else if (cal_shift[1]) begin  
		case (row_pos)
			2'd0 : r <= r0_read_data_b[31:24];
			2'd1 : r <= r0_read_data_b[23:16];
 			2'd2 : r <= r0_read_data_b[15:8 ];   
 			2'd3 : r <= r0_read_data_b[7:0  ]; 
 			default: r <= 8'd0;
 		endcase
 	end 
 end 

/*-------------------cal_shift[2]-------------------*/

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		h <= 8'd0;
	end else if (cal_shift[2]) begin 
		case (col_pos)
			2'd0 : h <= r0_read_data_b[31:24];
			2'd1 : h <= r0_read_data_b[23:16];
 			2'd2 : h <= r0_read_data_b[15:8 ];   
 			2'd3 : h <= r0_read_data_b[7:0  ]; 
 			default: h <= 8'd0;
 		endcase
 	end 
 end



/*-------------------cal_shift[3]-------------------*/
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		flag_lam <= 1'b0;
	end else if (cal_shift[3]) begin 
		flag_lam <= (r == h)||(r == 8'h4e) || (h == 8'h4e);  
	end 
end 

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		m_i1_j1 <= 32'd0;
	end else if (cal_shift[3] && (col_cnt == 9'd0 || row_cnt == 8'd0)) begin 
		m_i1_j1 <= 32'd0;
	end else if (cal_shift[3]) begin 
		m_i1_j1 <= r0_read_data_a;
	end 
end 
/*-------------------cal_shift[4]-------------------*/
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		float_i_0 <= 32'd0;
	end else if (cal_shift[4]) begin 
		float_i_0 <= r0_read_data_b;
	end 
end 


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		m_i1_j <= 32'd0;
	end else if (cal_shift[4] & (row_cnt == 8'd0)) begin 
		m_i1_j <= 32'd0;
	end else if (cal_shift[4]) begin 
		m_i1_j <= r0_read_data_a;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		hap_len_plus_col_cnt <= 9'd0;
	end else begin 
		hap_len_plus_col_cnt <= hap_len + col_cnt;
	end 
end






/*-------------------cal_shift[5]-------------------*/
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		float_d_1 <= 32'd0;
	end else if (cal_shift[5]) begin 
		float_d_1 <= r0_read_data_b;
	end 
end 

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		x_i1_j1 <= 32'd0;
	end else if (cal_shift[5] && (row_cnt == 8'd0 || col_cnt == 9'd0)) begin 
		x_i1_j1 <= 32'd0;
	end else if (cal_shift[5]) begin 
		x_i1_j1 <= r0_read_data_a;
	end
end 


/*-------------------cal_shift[6]-------------------*/
reg [31:0] y_temp;

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		float_q_1 <= 32'd0;
	end else if (cal_shift[6]) begin 
		float_q_1 <= r0_read_data_b;
	end 
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		x_i1_j <= 32'd0;
	end else if (cal_shift[6] & (row_cnt == 8'd0)) begin 
		x_i1_j <= 32'd0;
	end else if (cal_shift[6]) begin 
		x_i1_j <= r0_read_data_a;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		y_temp <= 32'd0;
	end else if (cal_shift[6] & (row_cnt == 8'd0)) begin 
		y_temp <= y_initial;
	end else if (cal_shift[6] & (col_cnt_1 == 9'd0)) begin 
		y_temp <= 32'd0;
	end 
end



/*-------------------cal_shift[7]-------------------*/
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		float_i_1 <= 32'd0;
	end else if (cal_shift[7]) begin 
		float_i_1 <= r0_read_data_b;
	end 
end 

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		y_i1_j1 <= 32'd0;
	end else if (cal_shift[7] & ((row_cnt == 8'd0) | (col_cnt_1 == 9'd0) )) begin 
		y_i1_j1 <= y_temp;
	// end else if (cal_shift [7] & (row_cnt == 8'd0)) begin 
	// 	y_i1_j1 <= y_initial;
	// end else if (cal_shift [7] & (col_cnt_1 == 9'd0)) begin 
	// 	y_i1_j1 <= 32'd0;
	end else if (cal_shift [7]) begin 
		y_i1_j1 <= r0_read_data_a;
	end 
end


/*-------------------cal_shift[8]-------------------*/

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		float_q_0 <= 32'd0;
	end else if (cal_shift[8]) begin 
		float_q_0 <= r0_read_data_b;
	end 
end 

/*-------------------cal_shift[9]-------------------*/
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		row_cnt_mv_2 <= 8'd0;
	end else begin 
		row_cnt_mv_2 <= row_cnt >> 2;
	end  
end







/*-------------------cal_shift[10]-------------------*/
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		en_sum <= 1'b0;
	end else if (cal_shift[10] && (row_cnt == read_len_sub_1_1) && col_cnt == 9'd2) begin 
		en_sum <= 1'b1;
	end else if (done_cnt == 5'd22) begin 
		en_sum <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		col_cnt_mv_2 <= 9'd0;
	end else begin 
		col_cnt_mv_2 <= col_cnt_1 >> 2;
	end
end





/*-------------------cal_shift[11]-------------------*/
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		col_cnt <= 9'd0;
		col_pos <= 2'd0;
	end else if (cal_shift[11] & (col_cnt == hap_len_sub_1_2))	begin 
		col_cnt <= 9'd0;
		col_pos <= 2'd0;
	end else if (cal_shift[11]) begin 
		col_cnt <= col_cnt + 1'b1;
		col_pos <= col_pos + 1'b1;
	end 
end 

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		col_cnt_1 <= 9'd0;
	end else if (cal_shift[11] & (col_cnt_1 == hap_len_sub_1_2))	begin 
		col_cnt_1 <= 9'd0;
	end else if (cal_shift[11]) begin 
		col_cnt_1 <= col_cnt_1 + 1'b1;
	end 
end 


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		col_cnt_2 <= 9'd0;
	end else if (cal_shift[11] & (col_cnt_2 == hap_len_sub_1_2))	begin 
		col_cnt_2 <= 9'd0;
	end else if (cal_shift[11]) begin 
		col_cnt_2 <= col_cnt_2 + 1'b1;
	end 
end 

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		col_cnt_3 <= 9'd0;
	end else if (cal_shift[11] & (col_cnt_3 == hap_len_sub_1_2))	begin 
		col_cnt_3 <= 9'd0;
	end else if (cal_shift[11]) begin 
		col_cnt_3 <= col_cnt_3 + 1'b1;
	end 
end 


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		row_cnt <= 8'd0;
		row_pos <= 2'd0;
	end else if (cal_shift[11] & (col_cnt == hap_len_sub_1_2) & (row_cnt == read_len_sub_1_2)) begin
		row_cnt <= 8'd0;
		row_pos <= 2'd0;
	end else if (cal_shift[11] & (col_cnt == hap_len_sub_1_2)) begin 
		row_cnt <= row_cnt + 1'b1;
		row_pos <= row_pos + 1'b1;
	end
end




//DONE = current[7]

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		done_cnt <= 5'd0;
	end else if (done_cnt == 5'd23) begin
		done_cnt <= 5'd0;
	end else if (current_state[7]) begin 
		done_cnt <= done_cnt + 1'b1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		all_done <= 1'b0;
	end else if (done_cnt == 5'd22) begin 
		all_done <= 1'b1;
	end else begin 
		all_done <= 1'b0;
	end 
end 

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		sum_vld <= 1'b0;
	end else if (done_cnt == 5'd22) begin
		sum_vld <= 1'b1;
	end else begin 
		sum_vld <= 1'b0;
	end  
end


/*---------------------------RAM operation-------------------------*/

always @(posedge sys_clk or negedge sys_rst_n) //wren_a
begin 
	if (!sys_rst_n)begin 
	 	wren_a <= 1'b0;
	 end else begin 
	 	case (current_state_1)
	 		IDLE : begin 
	 			wren_a <= 1'b0;
	 		end 

	 		//GET_PKT_INFO  keep 1'b0

	 		GET_R : begin 
	 			wren_a <= 1'b1;
	 		end 
	 		//GET_H	       keep 1'b1
	 		//GET_QIDC
	 		PREPARE : begin 
	 			wren_a <= 1'b0;
	 		end 

	 		CALCULATE : begin 
	 			if (cal_shift_1[7:5] != 3'd0) begin 
	 				wren_a <= 1'b1;
	 			end else begin 
	 				wren_a <= 1'b0;
	 			end
	 		end

	 		DONE : begin 
	 			wren_a <= 1'b0;
	 		end
	 	endcase
	 end
end




	// if ({current_state[7],current_state[5],current_state[1:0]} != 4'd0) wren_a <= 0; //DONE , PREPARE , GET_PKT_INFO , IDLE
	// if (current_state[4:2] != 3'd0) 									wren_a <= 1'b1;//GET_R , GET_H , GET_QIDC
	// if (cal_shift[7:5] != 3'd0 ) 										wren_a <= 1'b1;
	// if (cal_shift[8]) 			 										wren_a <= 1'b0;

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin  			
		rden_a <= 1'b0;
	end else if (cal_shift_1[4:0] != 5'd0) 	begin
		rden_a <= 1'b1;
	end else if (cal_shift_1[5]) begin 
		rden_a <= 1'b0;
	end
end 


always @(posedge sys_clk or negedge sys_rst_n)  // data_a
begin 
	if (!sys_rst_n) begin
		data_a <= 32'd0;
	end else begin 
		case (current_state_1)
			IDLE : begin 
				data_a <= 32'd0;
			end 

			//GET_PKT_INFO 

			GET_R: begin 
				data_a <= f_matrix_memory_data;
			end 

			GET_H: begin 
				data_a <= f_matrix_memory_data;
			end 

			GET_QIDC: begin 
				data_a <= f_matrix_memory_data;
			end

			CALCULATE:begin 
				case (cal_shift_1) 
					12'b000000100000 : data_a <= m_write;
					12'b000001000000 : data_a <= x_write;
					12'b000010000000 : data_a <= y_write;
					12'b000100000000 : data_a <= 32'd0;
				endcase
			end 

			IDLE : begin 
				data_a <= 32'd0;
			end 
		endcase
	end
end





	// if ({current_state[7],current_state[5],current_state[1:0]} != 4'd0) data_a <= 32'd0; //DONE , PREPARE , GET_PKT_INFO , IDLE
	// if (current_state[4:2] != 3'd0)  									data_a <= f_matrix_memory_data;//GET_R , GET_H , GET_QIDC
	// if (cal_shift [5])				 									data_a <= m_write;
	// if (cal_shift [6])				 									data_a <= x_write;
	// if (cal_shift [7]) 				 									data_a <= y_write;
	// if (cal_shift [8])	 			 									data_a <= 32'd0; 



reg [31:0] a_addr_reg;



always @(posedge sys_clk or negedge sys_rst_n)  // r0_a_address
begin 
	if (!sys_rst_n) begin 
		a_addr_reg <= 32'd0;
	end else begin 
		case (cal_shift_1)
			12'b000000000001: begin //cal_shift[0]
				a_addr_reg <= ADDR_M + col_cnt_2;
			end 

			12'b000000000010: begin //cal_shift[1]
				a_addr_reg <= ADDR_X_1 + col_cnt_2;
			end 

			12'b000000000100: begin //cal_shift[2]
				a_addr_reg <= ADDR_X + col_cnt_2;
			end 

			12'b000000001000: begin //cal_shift[3]
				a_addr_reg <= ADDR_Y_1 + col_cnt_2;
			end

			12'b000000010000: begin //cal_shift[4]
				if (col_cnt_2 <= 9'd1) begin 
					a_addr_reg <= ADDR_M_2 + hap_len_plus_col_cnt;
				end else begin 
					a_addr_reg <= ADDR_M_2 + col_cnt_2;
				end 
			end 

			12'b000000100000: begin // cal_shift[5]
				if (col_cnt_2 <= 1) begin 
					a_addr_reg <= ADDR_X_2 + hap_len_plus_col_cnt;
				end else begin 
					a_addr_reg <= ADDR_X_2 + col_cnt_2;
				end 
			end 

			12'b000001000000: begin //cal_shift[6]
				if (col_cnt_2 <= 1) begin 
					a_addr_reg <= ADDR_Y_2 + hap_len_plus_col_cnt;
				end else begin 
					a_addr_reg <= ADDR_Y_2 + col_cnt_2 ; 
				end 
			end 
		endcase
	end 
end 








always @(posedge sys_clk or negedge sys_rst_n)  // r0_a_address
begin 
	if (!sys_rst_n) begin 
		r0_a_address <= 11'd0;
	end else begin 
		case (current_state_1) 
			IDLE : begin 	
					r0_a_address <= 11'd0; 
			end 
			//GET_PKT_INFO :	begin r0_a_address <= 11'd0; end
			GET_R:	begin 	
						r0_a_address <= ADDR_R + r_cnt;  
			end

			GET_H:	begin 
				r0_a_address <= ADDR_H + h_cnt;
			end

			GET_QIDC: begin 
				r0_a_address <= ADDR_QIDC + qidc_cnt;
			end

			PREPARE: begin 
				r0_a_address <= 11'd0;
			end

			CALCULATE: begin 
				if (cal_shift_1[0]) begin 
					r0_a_address <= ADDR_M_1 + col_cnt_3;
				end else begin 
					r0_a_address <= a_addr_reg;
				end
			end

			DONE 	 : begin 
				r0_a_address <= 11'd0;
			end
		endcase
	end
end







always @(posedge sys_clk or negedge sys_rst_n) //rden_b
begin 
	if (!sys_rst_n) begin 
		rden_b <= 1'b0;
	end else begin
		case (current_state_2)
			IDLE : 
				rden_b <= 1'b0;

			// GET_PKT_INFO ,GET_R ,GET_H ,GET_QIDC ignored

			PREPARE : begin 
				if (vld) begin 
					rden_b <= 1'b1;
				end
			end

			CALCULATE : begin 
				if ({cal_shift_2[11:9],cal_shift_2[5:1]} != 8'd0) begin 
					rden_b <= 1'b1;
				end else begin 
					rden_b <= 1'b0;
				end
			end

			DONE : begin
				rden_b <= 1'b0;
			end
		endcase
	end
end



reg [31:0] b_addr_reg_CAL;









always @(posedge sys_clk or negedge sys_rst_n) // b_addr_reg_CAL
begin 
	if (!sys_rst_n) begin 
		b_addr_reg_CAL <= 32'd0;
	end else begin 
		case (cal_shift_2)
			12'b000000000001: begin
				b_addr_reg_CAL <=  ADDR_LUT_0 + r0_read_data_b[23:16] ; //ADDR_LUT_0 + i
			end 

			12'b000000000010: begin //cal_shift[1]
				b_addr_reg_CAL <= ADDR_LUT_1 + d;
			end 

			12'b000000000100: begin //cal_shift[2]
				b_addr_reg_CAL <= ADDR_LUT_1 + q;
			end 

			12'b000000001000: begin //cal_shift[3]
				b_addr_reg_CAL <= ADDR_LUT_1 + i;
			end 

			12'b000000010000: begin //cal_shift[4]
				b_addr_reg_CAL <= ADDR_LUT_0 + q;
			end 

			12'b000100000000: begin //cal_shift[8]
				if ((col_cnt_3 == hap_len_sub_1_0) & (row_cnt == read_len_sub_1_0)) begin 
					b_addr_reg_CAL <= ADDR_QIDC;
				end else if ((col_cnt_3 == hap_len_sub_1_0)) begin 
					b_addr_reg_CAL <= ADDR_QIDC_PLUS_1 + row_cnt; 
				end else begin 
					b_addr_reg_CAL <= ADDR_QIDC + row_cnt;
				end 
			end 

			12'b001000000000: begin 
				if ((col_cnt_3 == hap_len_sub_1_1) & (row_cnt == read_len_sub_1_1)) begin 
					b_addr_reg_CAL <= ADDR_R;
				end else if ((col_cnt_3 == hap_len_sub_1_1) & (row_pos == 2'd3)) begin 
					b_addr_reg_CAL <= ADDR_R_PLUS_1 + row_cnt_mv_2;
				end else begin 
					b_addr_reg_CAL <= ADDR_R + row_cnt_mv_2;
				end 
			end 

			12'b010000000000: begin
				if (col_cnt_3 == hap_len_sub_1_2) begin 
					b_addr_reg_CAL <= ADDR_H;
				end else if ((col_pos == 2'd3)) begin 
					b_addr_reg_CAL <= ADDR_H_PLUS_1 + col_cnt_mv_2;
				end else begin 
					b_addr_reg_CAL <= ADDR_H + col_cnt_mv_2;
				end 
			end 
		endcase 
	end 
end 






always @(posedge sys_clk or negedge sys_rst_n) //r0_b_address
begin 
	if (!sys_rst_n) begin 
		r0_b_address <= 11'b0;
	end else begin 
		case (current_state_2) 
			IDLE: begin 
				r0_b_address <= 11'd0;
			end
			//GET_PKT_INFO , GET_R,GET_H,GET_QIDC  ignored

			PREPARE: begin 
				case (prepare_cnt)
					2'd0 : r0_b_address <= ADDR_QIDC;
					2'd1 : r0_b_address <= ADDR_R;
					2'd2 : r0_b_address <= ADDR_H;
				endcase
			end 

			CALCULATE : begin 
				r0_b_address <= b_addr_reg_CAL;
			end

			DONE : begin 
				r0_b_address <= 11'd0;
			end
		endcase
	end
end













ram_2_wrport_2048x32 u0 (
	.data_a   (data_a         ), //  ram_input.datain_a
	.data_b   (data_r0_b       ), //           .datain_b
	.address_a(r0_a_address), //           .address_a
	.address_b(r0_b_address ), //           .address_b
	.wren_a   (wren_a         ), //           .wren_a
	.wren_b   (wren_b       ), //           .wren_b
	.clock    (sys_clk         ), //           .clock
	.rden_a   (rden_a       ), //           .rden_a
	.rden_b   (rden_b         ), //           .rden_b
	.q_a      (r0_read_data_a  ), // ram_output.dataout_a
	.q_b      (r0_read_data_b  )  //           .dataout_b
);






endmodule 

















