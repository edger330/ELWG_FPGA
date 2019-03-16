
`timescale 1ns / 1ps

module save_send(
	//input
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
parameter PE_NUM = 8'd32;

parameter ADDR_R    = 9'd0  ;
parameter ADDR_H    = 9'd128;
parameter ADDR_QIDC = 9'd256;

parameter IDLE         = 8'b00000001;
parameter GET_PKT_INFO = 8'b00000010;
parameter GET_R        = 8'b00000100;
parameter GET_H        = 8'b00001000;
parameter GET_QIDC     = 8'b00010000;
parameter PREPARE      = 8'b00100000;
parameter CALCULATE    = 8'b01000000;
parameter DONE         = 8'b10000000;

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
input         sys_clk           ;
input         sys_rst_n           ;
input         matrix_memory_sop ;
input         matrix_memory_eop ;
input         matrix_memory_vld ;
input  [31:0] matrix_memory_data;
input         result_fifo_rden  ;
//outpu;
output       	pkt_receive_enable;
output 	[127:0] result_fifo_rdat;
output 		result_fifo_empty;



/*-------------------------------------------------------------------*\
                          Reg/wire Description
\*-------------------------------------------------------------------*/
reg [7:0] current_state    ;
reg [7:0] next_state       ;
reg       get_pkt_info_done;
reg       get_R_done       ;
reg       get_H_done       ;
reg       get_qidc_done    ;
reg       prepare_done     ;
reg       calculate_done   ;
reg       all_done         ;
reg 	  busy 			   ;

reg       f_matrix_memory_sop ;
reg       f_matrix_memory_eop ;
reg       f_matrix_memory_vld ;
reg [31:0]f_matrix_memory_data;

reg [63:0] head         ;
reg [ 7:0] read_len     ;
reg [ 8:0] hap_len      ;
reg [ 5:0] read_len_mv_2;
reg [ 6:0] hap_len_mv_2 ;
reg [31:0] y_initial    ;
reg [5:0 ] sum_save_R;
reg [6:0 ] sum_save_H;

reg [7:0] addr_check0;
reg [7:0] addr_check1;
reg [7:0] addr_check2;

reg         check0_en      ;
reg         check1_en      ;
reg         check2_en      ;
wire [31:0] check0_data_out;
wire [31:0] check1_data_out;
wire [31:0] check2_data_out;
reg  [31:0] data_in        ;
reg  [ 8:0] wraddress      ;
reg  [ 8:0] rdaddress      ;
reg         wren           ;
reg         rden           ;
wire [31:0] data_out       ;

reg  [ 6:0] hap_cnt_mv_2;
reg  [ 5:0] read_cnt_mv_2;



reg [ 1:0] read_pos  ;
reg [ 1:0] hap_pos   ;
reg [ 7:0] r         ;
reg [ 7:0] h         ;
reg [ 7:0] q,i,d,c;
reg [31:0] float_i_0 ;
reg [31:0] float_i_1 ;
reg [31:0] float_d_0 ;
reg [31:0] float_q_1 ;
reg [31:0] float_q_2 ;
reg [ 5:0] sum_select;
reg        mode      ;
reg [ 5:0] circle_cnt;
reg [ 5:0] circle_sum;
reg [ 5:0] circle_left; 
reg [ 7:0] read_cnt  ;
reg [ 8:0] hap_cnt   ;
reg [ 5:0] pe_cnt 	 ;
reg 	   read_done ;
wire 	   init 	 ;
reg [ 5:0] cal_done_cnt;
reg [ 2:0] son_cnt;


reg [31:0] sub_a;
reg [31:0] sub_b;
wire[31:0] sub_q;

reg [8:0] cal_current_state;
reg [8:0] cal_next_state;
reg [7:0] pu_cnt;
reg [2:0] wait_cnt;

wire [31:0] sum ;
reg sum_vld;
reg temp_enable;
wire fifo_almost_full;


assign pkt_receive_enable = (!busy) & temp_enable;



always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable <= 1'b0;
	end else if (fifo_almost_full && matrix_memory_sop ) begin
		temp_enable <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable <= 1'b1;
end

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


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		current_state <= 8'b00000001;
	end else begin 
		current_state <= next_state;
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


//------------------------get_pkt_info------------------------//
reg [2:0] info_cnt;

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		busy <= 1'b0;
	end else if (matrix_memory_sop) begin 
		busy <= 1'b1;
	end else if ((current_state == DONE) & all_done) begin 
		busy <= 1'b0;
	end 
end


always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		info_cnt <= 3'd0;
	end else if (info_cnt == 3'd5) begin 
		info_cnt <= 3'd0;
	end else if (current_state == GET_PKT_INFO) begin
		info_cnt <= info_cnt + 1'b1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin 
		head <= 64'd0;
	end else if (current_state == GET_PKT_INFO && (info_cnt == 3'd0)) begin 
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
		circle_sum <= 6'd0;
	end else if ((info_cnt == 3'd5) & (read_len[4:0] == 2'd0) ) begin 
		circle_sum <= read_len >> 5;
	end else if ((info_cnt == 3'd5) & (read_len[4:0] != 2'd0) ) begin 
		circle_sum <= (read_len >> 5) + 1'b1;
	end 
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		circle_left <= 6'd0;
	end else if ((info_cnt == 3'd5) & (read_len[4:0] == 2'd0))begin
		circle_left <= PE_NUM;
	end else if (info_cnt == 3'd5) begin 
		circle_left <= read_len[4:0];
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



//------------------------GET_R  = current_state[2] ------------------------//
reg [5:0] r_cnt;

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		r_cnt <= 6'd0;
	end else if (r_cnt == sum_save_R - 1'b1) begin 
		r_cnt <= 6'd0;
	end else if (current_state == GET_R) begin 
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



//------------------------GET_H = current_state[3] ------------------------//
reg [6:0] h_cnt;
always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		h_cnt <= 7'd0;
	end else if (h_cnt == sum_save_H - 1'b1) begin 
		h_cnt <= 7'd0;
	end else if (current_state == GET_H) begin 
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

//------------------------ GET_QIDC -----------------------//
reg [7:0] qidc_cnt;
always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		qidc_cnt <= 8'd0;
	end else if (qidc_cnt == read_len - 1) begin 
		qidc_cnt <= 8'd0;
	end else if (current_state == GET_QIDC) begin 
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



//PREPARE
reg [2:0] prepare_cnt; 

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		prepare_cnt <= 3'd0;
	end else if (prepare_cnt == 3'd4) begin 
		prepare_cnt <= 3'd0;
	end else if (current_state == PREPARE) begin
		prepare_cnt <= prepare_cnt + 1'b1;
	end 
end


always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		prepare_done <= 1'b0;
	end else if (prepare_cnt == 3'd3) begin 
		prepare_done <= 1'b1;
	end else begin 
		prepare_done <= 1'b0;
	end
end


always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin
		q <= 8'd0;
		i <= 8'd0; 
		d <= 8'd0; 
	end else if ((prepare_cnt == 3'd3) | (cal_current_state == S4) | (wait_cnt == 3'd4)) begin 
		q <=  data_out[31:24];
		i <=  data_out[23:16];
		d <=  data_out[ 15:8];
	end
end



//------------------------CALCULATE------------------------//

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		cal_current_state <= 9'b0000001;
	end else begin 
		cal_current_state <= cal_next_state;
	end 
end

always @(*)
begin 
	cal_next_state = cal_current_state;
	case (cal_current_state)
		CAL_IDLE: begin 
			if (prepare_done) begin
				cal_next_state = S0;
			end
		end

		S0: begin 
			cal_next_state = S1;
		end

		S1: begin 
			cal_next_state = S2;
		end

		S2: begin 
			cal_next_state = S3;
		end

		S3: begin 
			cal_next_state = S4;
		end

		S4: begin 
			cal_next_state = S5;
		end

		S5: begin 
			if ((read_cnt == read_len) & (hap_cnt == hap_len - 1'b1)) begin 
				cal_next_state = CAL_DONE;
			end else if (hap_cnt == hap_len - 1'b1) begin 
				cal_next_state = WAIT_6;
			end else begin 
				cal_next_state = S0;
			end 
		end

		WAIT_6: begin 
			if (wait_cnt == 3'd5) begin 
				cal_next_state = S0;
			end 
		end

		CAL_DONE : begin
			if ((cal_done_cnt == circle_left + 1 ) & (son_cnt == 3'd5)) begin 
				cal_next_state = CAL_IDLE;
			end
		end
	endcase // cal_current_state
end


always @(posedge sys_clk  or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		calculate_done <= 1'b0;
	end else if ((cal_done_cnt == circle_left + 1) & (son_cnt == 3'd5)) begin 
		calculate_done <= 1'b1;
	end else begin 
		calculate_done <= 1'b0;
	end
end 


//S0




always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		r <= 8'd0;
	end else if (cal_current_state == S0) begin  
		case (read_pos)
			2'd0 : r <= data_out[31:24];
			2'd1 : r <= data_out[23:16];
 			2'd2 : r <= data_out[15:8 ];   
 			2'd3 : r <= data_out[7:0  ]; 
 			default: r <= 8'd0;
 		endcase
 	end 
end 





//S1
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		h <= 8'd0;
	end else if (cal_current_state == S1) begin 
		case (hap_pos)
			2'd0 : h <= data_out[31:24];
			2'd1 : h <= data_out[23:16];
 			2'd2 : h <= data_out[15:8 ];   
 			2'd3 : h <= data_out[7:0  ]; 
 			default: h <= 8'd0;
 		endcase
 	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		float_d_0 <= 32'd0;
	end else if(cal_current_state == S1) begin 
		float_d_0 <= check0_data_out;
	end
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		sub_a <= 32'd0;
	end else if (cal_current_state == S1) begin 
		sub_a <= check1_data_out;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		sub_b <= 32'd0;
	end else if (cal_current_state == S1) begin 
		sub_b <= check0_data_out;
	end 
end

//S2

//S3
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		float_i_0 <= 32'd0;
		float_q_1 <= 32'd0;
		float_q_2 <= 32'd0;
	end else if (cal_current_state == S3) begin 
		float_i_0 <= check0_data_out;
		float_q_1 <= check1_data_out;
		float_q_2 <= check2_data_out;
	end 
end

//S4
reg [31:0] pmx;
reg [31:0] pmy;
wire [31:0] pmm;
reg [31:0] lambda0;
reg [31:0] lambda1;
reg [31:0] pmy_reg_0;
reg [31:0] pmy_reg_1;
reg [31:0] pmy_reg_2;
reg [31:0] pmy_reg_3;
reg [31:0] pmy_reg_4;
reg [31:0] pmy_reg_5;


assign pmm = sub_q; 

always @(posedge sys_clk or negedge sys_rst_n)
	begin
		if (!sys_rst_n) begin
			pmx       <= 32'd0;
			pmy_reg_0 <= 32'd0;
		end else if (cal_current_state == S4) begin
			pmx       <= float_i_0;
			pmy_reg_0 <= float_d_0;
		end
	end 

always @(posedge sys_clk or negedge sys_rst_n)
	begin
		if (!sys_rst_n) begin
			pmy_reg_1 <= 32'd0;
			pmy_reg_2 <= 32'd0;
			pmy_reg_3 <= 32'd0;
			pmy_reg_4 <= 32'd0;
			pmy_reg_5 <= 32'd0;
			pmy       <= 32'd0;
		end else begin 
			pmy_reg_1 <= pmy_reg_0;
			pmy_reg_2 <= pmy_reg_1;
			pmy_reg_3 <= pmy_reg_2;
			pmy_reg_4 <= pmy_reg_3;
			pmy_reg_5 <= pmy_reg_4;
			pmy       <= pmy_reg_5;
		end 
	end



always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		lambda0 <= 32'd0;
		lambda1 <= 32'd0;
	end else if (cal_current_state == S4) begin 
		lambda0 <= float_q_1;
		lambda1 <= float_q_2;
	end
end	

//S5
reg parameter_vld;

reg [31:0] pmx_0    ;
reg [31:0] pmy_0    ;
reg [31:0] pmm_0    ;
reg [31:0] lambda0_0;
reg [31:0] lambda1_0;
reg [ 7:0] r_0      ;

reg [31:0] pmx_1    ;
reg [31:0] pmy_1    ;
reg [31:0] pmm_1    ;
reg [31:0] lambda0_1;
reg [31:0] lambda1_1;
reg [ 7:0] r_1      ;

reg [31:0] pmx_2    ;
reg [31:0] pmy_2    ;
reg [31:0] pmm_2    ;
reg [31:0] lambda0_2;
reg [31:0] lambda1_2;
reg [ 7:0] r_2      ;

reg [31:0] pmx_3    ;
reg [31:0] pmy_3    ;
reg [31:0] pmm_3    ;
reg [31:0] lambda0_3;
reg [31:0] lambda1_3;
reg [ 7:0] r_3      ;

reg [31:0] pmx_4    ;
reg [31:0] pmy_4    ;
reg [31:0] pmm_4    ;
reg [31:0] lambda0_4;
reg [31:0] lambda1_4;
reg [ 7:0] r_4      ;

reg [31:0] pmx_5    ;
reg [31:0] pmy_5    ;
reg [31:0] pmm_5    ;
reg [31:0] lambda0_5;
reg [31:0] lambda1_5;
reg [ 7:0] r_5      ;

reg [31:0] pmx_6    ;
reg [31:0] pmy_6    ;
reg [31:0] pmm_6    ;
reg [31:0] lambda0_6;
reg [31:0] lambda1_6;
reg [ 7:0] r_6      ;

reg [31:0] pmx_7    ;
reg [31:0] pmy_7    ;
reg [31:0] pmm_7    ;
reg [31:0] lambda0_7;
reg [31:0] lambda1_7;
reg [ 7:0] r_7      ;

reg [31:0] pmx_8    ;
reg [31:0] pmy_8    ;
reg [31:0] pmm_8    ;
reg [31:0] lambda0_8;
reg [31:0] lambda1_8;
reg [ 7:0] r_8      ;

reg [31:0] pmx_9    ;
reg [31:0] pmy_9    ;
reg [31:0] pmm_9    ;
reg [31:0] lambda0_9;
reg [31:0] lambda1_9;
reg [ 7:0] r_9      ;

reg [31:0] pmx_10    ;
reg [31:0] pmy_10    ;
reg [31:0] pmm_10    ;
reg [31:0] lambda0_10;
reg [31:0] lambda1_10;
reg [ 7:0] r_10      ;

reg [31:0] pmx_11   ;
reg [31:0] pmy_11   ;
reg [31:0] pmm_11   ;
reg [31:0] lambda0_11;
reg [31:0] lambda1_11;
reg [ 7:0] r_11     ;

reg [31:0] pmx_12   ;
reg [31:0] pmy_12   ;
reg [31:0] pmm_12   ;
reg [31:0] lambda0_12;
reg [31:0] lambda1_12;
reg [ 7:0] r_12     ;

reg [31:0] pmx_13   ;
reg [31:0] pmy_13   ;
reg [31:0] pmm_13   ;
reg [31:0] lambda0_13;
reg [31:0] lambda1_13;
reg [ 7:0] r_13     ;

reg [31:0] pmx_14    ;
reg [31:0] pmy_14    ;
reg [31:0] pmm_14    ;
reg [31:0] lambda0_14;
reg [31:0] lambda1_14;
reg [ 7:0] r_14      ;

reg [31:0] pmx_15    ;
reg [31:0] pmy_15    ;
reg [31:0] pmm_15    ;
reg [31:0] lambda0_15;
reg [31:0] lambda1_15;
reg [ 7:0] r_15      ;

reg [31:0] pmx_16    ;
reg [31:0] pmy_16    ;
reg [31:0] pmm_16    ;
reg [31:0] lambda0_16;
reg [31:0] lambda1_16;
reg [ 7:0] r_16      ;

reg [31:0] pmx_17    ;
reg [31:0] pmy_17    ;
reg [31:0] pmm_17    ;
reg [31:0] lambda0_17;
reg [31:0] lambda1_17;
reg [ 7:0] r_17      ;

reg [31:0] pmx_18    ;
reg [31:0] pmy_18    ;
reg [31:0] pmm_18    ;
reg [31:0] lambda0_18;
reg [31:0] lambda1_18;
reg [ 7:0] r_18      ;

reg [31:0] pmx_19    ;
reg [31:0] pmy_19    ;
reg [31:0] pmm_19    ;
reg [31:0] lambda0_19;
reg [31:0] lambda1_19;
reg [ 7:0] r_19      ;

reg [31:0] pmx_20    ;
reg [31:0] pmy_20    ;
reg [31:0] pmm_20    ;
reg [31:0] lambda0_20;
reg [31:0] lambda1_20;
reg [ 7:0] r_20      ;

reg [31:0] pmx_21    ;
reg [31:0] pmy_21    ;
reg [31:0] pmm_21    ;
reg [31:0] lambda0_21;
reg [31:0] lambda1_21;
reg [ 7:0] r_21      ;

reg [31:0] pmx_22    ;
reg [31:0] pmy_22    ;
reg [31:0] pmm_22    ;
reg [31:0] lambda0_22;
reg [31:0] lambda1_22;
reg [ 7:0] r_22      ;

reg [31:0] pmx_23    ;
reg [31:0] pmy_23    ;
reg [31:0] pmm_23    ;
reg [31:0] lambda0_23;
reg [31:0] lambda1_23;
reg [ 7:0] r_23      ;

reg [31:0] pmx_24    ;
reg [31:0] pmy_24    ;
reg [31:0] pmm_24    ;
reg [31:0] lambda0_24;
reg [31:0] lambda1_24;
reg [ 7:0] r_24      ;

reg [31:0] pmx_25    ;
reg [31:0] pmy_25    ;
reg [31:0] pmm_25    ;
reg [31:0] lambda0_25;
reg [31:0] lambda1_25;
reg [ 7:0] r_25      ;

reg [31:0] pmx_26    ;
reg [31:0] pmy_26    ;
reg [31:0] pmm_26    ;
reg [31:0] lambda0_26;
reg [31:0] lambda1_26;
reg [ 7:0] r_26      ;

reg [31:0] pmx_27    ;
reg [31:0] pmy_27    ;
reg [31:0] pmm_27    ;
reg [31:0] lambda0_27;
reg [31:0] lambda1_27;
reg [ 7:0] r_27      ;

reg [31:0] pmx_28    ;
reg [31:0] pmy_28    ;
reg [31:0] pmm_28    ;
reg [31:0] lambda0_28;
reg [31:0] lambda1_28;
reg [ 7:0] r_28      ;

reg [31:0] pmx_29    ;
reg [31:0] pmy_29    ;
reg [31:0] pmm_29    ;
reg [31:0] lambda0_29;
reg [31:0] lambda1_29;
reg [ 7:0] r_29      ;

reg [31:0] pmx_30    ;
reg [31:0] pmy_30    ;
reg [31:0] pmm_30    ;
reg [31:0] lambda0_30;
reg [31:0] lambda1_30;
reg [ 7:0] r_30      ;

reg [31:0] pmx_31    ;
reg [31:0] pmy_31    ;
reg [31:0] pmm_31    ;
reg [31:0] lambda0_31;
reg [31:0] lambda1_31;
reg [ 7:0] r_31      ;




reg [2:0] t_cnt    ;
reg       t_cnt_vld;
reg [7:0] H_in     ;

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		pmx_0     <= 32'd0;
		pmy_0     <= 32'd0;
		pmm_0     <= 32'd0;
		lambda0_0 <= 32'd0;
		lambda1_0 <= 32'd0;
		r_0       <= 8'd0;
		pmx_1     <= 32'd0;
		pmy_1     <= 32'd0;
		pmm_1     <= 32'd0;
		lambda0_1 <= 32'd0;
		lambda1_1 <= 32'd0;
		r_1       <= 8'd0;
		pmx_2     <= 32'd0;
		pmy_2     <= 32'd0;
		pmm_2     <= 32'd0;
		lambda0_2 <= 32'd0;
		lambda1_2 <= 32'd0;
		r_2       <= 8'd0;
		pmx_3     <= 32'd0;
		pmy_3     <= 32'd0;
		pmm_3     <= 32'd0;
		lambda0_3 <= 32'd0;
		lambda1_3 <= 32'd0;
		r_3       <= 8'd0;
		pmx_4     <= 0;
		pmy_4     <= 0;
		pmm_4     <= 0;
		lambda0_4 <= 0;
		lambda1_4 <= 0;
		r_4       <= 0;
		pmx_5     <= 0;
		pmy_5     <= 0;
		pmm_5     <= 0;
		lambda0_5 <= 0;
		lambda1_5 <= 0;
		r_5       <= 0;
		pmx_6     <= 0;
		pmy_6     <= 0;
		pmm_6     <= 0;
		lambda0_6 <= 0;
		lambda1_6 <= 0;
		r_6       <= 0;
		pmx_7     <= 0;
		pmy_7     <= 0;
		pmm_7     <= 0;
		lambda0_7 <= 0;
		lambda1_7 <= 0;
		r_7       <= 0;
		pmx_8     <= 0;
		pmy_8     <= 0;
		pmm_8     <= 0;
		lambda0_8 <= 0;
		lambda1_8 <= 0;
		r_8       <= 0;
		pmx_9     <= 0;
		pmy_9     <= 0;
		pmm_9     <= 0;
		lambda0_9 <= 0;
		lambda1_9 <= 0;
		r_9       <= 0;
		pmx_10     <= 0;
		pmy_10     <= 0;
		pmm_10     <= 0;
		lambda0_10 <= 0;
		lambda1_10 <= 0;
		r_10       <= 0;
		pmx_11    <= 0;
		pmy_11    <= 0;
		pmm_11    <= 0;
		lambda0_11 <= 0;
		lambda1_11 <= 0;
		r_11      <= 0;
		pmx_12    <= 0;
		pmy_12    <= 0;
		pmm_12    <= 0;
		lambda0_12 <= 0;
		lambda1_12 <= 0;
		r_12      <= 0;
		pmx_13    <= 0;
		pmy_13    <= 0;
		pmm_13    <= 0;
		lambda0_13 <= 0;
		lambda1_13 <= 0;
		r_13      <= 0;
		pmx_14     <= 0;
		pmy_14     <= 0;
		pmm_14     <= 0;
		lambda0_14 <= 0;
		lambda1_14 <= 0;
		r_14       <= 0;
		pmx_15     <= 0;
		pmy_15     <= 0;
		pmm_15     <= 0;
		lambda0_15 <= 0;
		lambda1_15 <= 0;
		r_15       <= 0;
		pmx_16     <= 0;
		pmy_16     <= 0;
		pmm_16     <= 0;
		lambda0_16 <= 0;
		lambda1_16 <= 0;
		r_16       <= 0;
		pmx_17     <= 0;
		pmy_17     <= 0;
		pmm_17     <= 0;
		lambda0_17 <= 0;
		lambda1_17 <= 0;
		r_17       <= 0;
		pmx_18     <= 0;
		pmy_18     <= 0;
		pmm_18     <= 0;
		lambda0_18 <= 0;
		lambda1_18 <= 0;
		r_18       <= 0;
		pmx_19     <= 0;
		pmy_19     <= 0;
		pmm_19     <= 0;
		lambda0_19 <= 0;
		lambda1_19 <= 0;
		r_19       <= 0;
		pmx_20     <= 0;
		pmy_20     <= 0;
		pmm_20     <= 0;
		lambda0_20 <= 0;
		lambda1_20 <= 0;
		r_20       <= 0;
		pmx_21     <= 0;
		pmy_21     <= 0;
		pmm_21     <= 0;
		lambda0_21 <= 0;
		lambda1_21 <= 0;
		r_21       <= 0;
		pmx_22     <= 0;
		pmy_22     <= 0;
		pmm_22     <= 0;
		lambda0_22 <= 0;
		lambda1_22 <= 0;
		r_22       <= 0;
		pmx_23     <= 0;
		pmy_23     <= 0;
		pmm_23     <= 0;
		lambda0_23 <= 0;
		lambda1_23 <= 0;
		r_23       <= 0;
		pmx_24     <= 0;
		pmy_24     <= 0;
		pmm_24     <= 0;
		lambda0_24 <= 0;
		lambda1_24 <= 0;
		r_24       <= 0;
		pmx_25     <= 0;
		pmy_25     <= 0;
		pmm_25     <= 0;
		lambda0_25 <= 0;
		lambda1_25 <= 0;
		r_25       <= 0;
		pmx_26     <= 0;
		pmy_26     <= 0;
		pmm_26     <= 0;
		lambda0_26 <= 0;
		lambda1_26 <= 0;
		r_26       <= 0;
		pmx_27     <= 0;
		pmy_27     <= 0;
		pmm_27     <= 0;
		lambda0_27 <= 0;
		lambda1_27 <= 0;
		r_27       <= 0;
		pmx_28     <= 0;
		pmy_28     <= 0;
		pmm_28     <= 0;
		lambda0_28 <= 0;
		lambda1_28 <= 0;
		r_28       <= 0;
		pmx_29     <= 0;
		pmy_29     <= 0;
		pmm_29     <= 0;
		lambda0_29 <= 0;
		lambda1_29 <= 0;
		r_29       <= 0;
		pmx_30     <= 0;
		pmy_30     <= 0;
		pmm_30     <= 0;
		lambda0_30 <= 0;
		lambda1_30 <= 0;
		r_30       <= 0;
		pmx_31     <= 0;
		pmy_31     <= 0;
		pmm_31     <= 0;
		lambda0_31 <= 0;
		lambda1_31 <= 0;
		r_31       <= 0;
	end else if (parameter_vld) begin 
		case (pe_cnt) 
			6'd0: begin 
				pmx_0     <= pmx    ;
				pmy_0     <= pmy    ;
				pmm_0     <= pmm    ;
				lambda0_0 <= lambda0;
				lambda1_0 <= lambda1;
				r_0       <= r      ;
			end

			6'd1: begin 
				pmx_1     <= pmx    ;
				pmy_1     <= pmy    ;
				pmm_1     <= pmm    ;
				lambda0_1 <= lambda0;
				lambda1_1 <= lambda1;
				r_1       <= r      ;
			end

			6'd2: begin 
				pmx_2     <= pmx    ;
				pmy_2     <= pmy    ;
				pmm_2     <= pmm    ;
				lambda0_2 <= lambda0;
				lambda1_2 <= lambda1;
				r_2       <= r      ;
			end

			6'd3: begin 
				pmx_3     <= pmx    ;
				pmy_3     <= pmy    ;
				pmm_3     <= pmm    ;
				lambda0_3 <= lambda0;
				lambda1_3 <= lambda1;
				r_3       <= r      ;

			end

			6'd4: begin 
				pmx_4  <= pmx;
				pmy_4  <= pmy;
				pmm_4  <= pmm;
				lambda0_4 <= lambda0;
				lambda1_4 <= lambda1;
				r_4 <= r;
			end
 
			6'd5: begin 
				pmx_5  <= pmx;
				pmy_5  <= pmy;
				pmm_5  <= pmm;
				lambda0_5 <= lambda0;
				lambda1_5 <= lambda1;
				r_5 <= r;
			end
 
			6'd6: begin 
				pmx_6  <= pmx;
				pmy_6  <= pmy;
				pmm_6  <= pmm;
				lambda0_6 <= lambda0;
				lambda1_6 <= lambda1;
				r_6 <= r;
			end
 
			6'd7: begin 
				pmx_7  <= pmx;
				pmy_7  <= pmy;
				pmm_7  <= pmm;
				lambda0_7 <= lambda0;
				lambda1_7 <= lambda1;
				r_7 <= r;
			end
 
			6'd8: begin 
				pmx_8  <= pmx;
				pmy_8  <= pmy;
				pmm_8  <= pmm;
				lambda0_8 <= lambda0;
				lambda1_8 <= lambda1;
				r_8 <= r;
			end
 
			6'd9: begin 
				pmx_9  <= pmx;
				pmy_9  <= pmy;
				pmm_9  <= pmm;
				lambda0_9 <= lambda0;
				lambda1_9 <= lambda1;
				r_9 <= r;
			end
 
			6'd10: begin 
				pmx_10  <= pmx;
				pmy_10  <= pmy;
				pmm_10  <= pmm;
				lambda0_10 <= lambda0;
				lambda1_10 <= lambda1;
				r_10 <= r;
			end
 
			6'd11: begin 
				pmx_11  <= pmx;
				pmy_11  <= pmy;
				pmm_11  <= pmm;
				lambda0_11 <= lambda0;
				lambda1_11 <= lambda1;
				r_11 <= r;
			end
 
			6'd12: begin 
				pmx_12  <= pmx;
				pmy_12  <= pmy;
				pmm_12  <= pmm;
				lambda0_12 <= lambda0;
				lambda1_12 <= lambda1;
				r_12 <= r;
			end
 
			6'd13: begin 
				pmx_13  <= pmx;
				pmy_13  <= pmy;
				pmm_13  <= pmm;
				lambda0_13 <= lambda0;
				lambda1_13 <= lambda1;
				r_13 <= r;
			end
 
			6'd14: begin 
				pmx_14  <= pmx;
				pmy_14  <= pmy;
				pmm_14  <= pmm;
				lambda0_14 <= lambda0;
				lambda1_14 <= lambda1;
				r_14 <= r;
			end
 
			6'd15: begin 
				pmx_15  <= pmx;
				pmy_15  <= pmy;
				pmm_15  <= pmm;
				lambda0_15 <= lambda0;
				lambda1_15 <= lambda1;
				r_15 <= r;
			end
 
			6'd16: begin 
				pmx_16  <= pmx;
				pmy_16  <= pmy;
				pmm_16  <= pmm;
				lambda0_16 <= lambda0;
				lambda1_16 <= lambda1;
				r_16 <= r;
			end
 
			6'd17: begin 
				pmx_17  <= pmx;
				pmy_17  <= pmy;
				pmm_17  <= pmm;
				lambda0_17 <= lambda0;
				lambda1_17 <= lambda1;
				r_17 <= r;
			end
 
			6'd18: begin 
				pmx_18  <= pmx;
				pmy_18  <= pmy;
				pmm_18  <= pmm;
				lambda0_18 <= lambda0;
				lambda1_18 <= lambda1;
				r_18 <= r;
			end
 
			6'd19: begin 
				pmx_19  <= pmx;
				pmy_19  <= pmy;
				pmm_19  <= pmm;
				lambda0_19 <= lambda0;
				lambda1_19 <= lambda1;
				r_19 <= r;
			end
 
			6'd20: begin 
				pmx_20  <= pmx;
				pmy_20  <= pmy;
				pmm_20  <= pmm;
				lambda0_20 <= lambda0;
				lambda1_20 <= lambda1;
				r_20 <= r;
			end
 
			6'd21: begin 
				pmx_21  <= pmx;
				pmy_21  <= pmy;
				pmm_21  <= pmm;
				lambda0_21 <= lambda0;
				lambda1_21 <= lambda1;
				r_21 <= r;
			end
 
			6'd22: begin 
				pmx_22  <= pmx;
				pmy_22  <= pmy;
				pmm_22  <= pmm;
				lambda0_22 <= lambda0;
				lambda1_22 <= lambda1;
				r_22 <= r;
			end
 
			6'd23: begin 
				pmx_23  <= pmx;
				pmy_23  <= pmy;
				pmm_23  <= pmm;
				lambda0_23 <= lambda0;
				lambda1_23 <= lambda1;
				r_23 <= r;
			end
 
			6'd24: begin 
				pmx_24  <= pmx;
				pmy_24  <= pmy;
				pmm_24  <= pmm;
				lambda0_24 <= lambda0;
				lambda1_24 <= lambda1;
				r_24 <= r;
			end
 
			6'd25: begin 
				pmx_25  <= pmx;
				pmy_25  <= pmy;
				pmm_25  <= pmm;
				lambda0_25 <= lambda0;
				lambda1_25 <= lambda1;
				r_25 <= r;
			end
 
			6'd26: begin 
				pmx_26  <= pmx;
				pmy_26  <= pmy;
				pmm_26  <= pmm;
				lambda0_26 <= lambda0;
				lambda1_26 <= lambda1;
				r_26 <= r;
			end
 
			6'd27: begin 
				pmx_27  <= pmx;
				pmy_27  <= pmy;
				pmm_27  <= pmm;
				lambda0_27 <= lambda0;
				lambda1_27 <= lambda1;
				r_27 <= r;
			end
 
			6'd28: begin 
				pmx_28  <= pmx;
				pmy_28  <= pmy;
				pmm_28  <= pmm;
				lambda0_28 <= lambda0;
				lambda1_28 <= lambda1;
				r_28 <= r;
			end
 
			6'd29: begin 
				pmx_29  <= pmx;
				pmy_29  <= pmy;
				pmm_29  <= pmm;
				lambda0_29 <= lambda0;
				lambda1_29 <= lambda1;
				r_29 <= r;
			end
 
			6'd30: begin 
				pmx_30  <= pmx;
				pmy_30  <= pmy;
				pmm_30  <= pmm;
				lambda0_30 <= lambda0;
				lambda1_30 <= lambda1;
				r_30 <= r;
			end
 
			6'd31: begin 
				pmx_31  <= pmx;
				pmy_31  <= pmy;
				pmm_31  <= pmm;
				lambda0_31 <= lambda0;
				lambda1_31 <= lambda1;
				r_31 <= r;
			end


		endcase // pe_cnt
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		H_in <= 8'd0;
	end else if (cal_current_state == S5) begin
		H_in <= h;
	end
end


reg [8:0] hap_cnt_pre ;
reg [1:0] hap_pos_pre ;
reg [7:0] read_cnt_pre;
reg [1:0] read_pos_pre;
reg [5:0] pe_cnt_pre  ;



always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		hap_cnt <= 9'd0;
		hap_pos <= 2'd0;
	end else if ((cal_current_state == S5) & (hap_cnt == hap_len - 1'b1)) begin 
		hap_cnt <= 9'd0;
		hap_pos <= 2'd0;
	end else if (cal_current_state == S5) begin 
		hap_cnt <= hap_cnt + 1'b1;
		hap_pos <= hap_pos + 1'b1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		hap_cnt_pre <= 9'd0;
		hap_pos_pre <= 2'd0;
	end else if ((cal_current_state == S5) & (hap_cnt_pre == hap_len - 1'b1)) begin 
		hap_cnt_pre <= 9'd0;
		hap_pos_pre <= 2'd0;
	end else if (cal_current_state == S5) begin 
		hap_cnt_pre <= hap_cnt_pre + 1'b1;
		hap_pos_pre <= hap_pos_pre + 1'b1;
	end else if (prepare_done | (wait_cnt == 3'd5)) begin 
		hap_cnt_pre <= 1'b1;
		hap_pos_pre <= 1'b1;
	end		
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		read_cnt <= 8'd0;
		read_pos <= 2'd0;
	end else if ((cal_current_state == S5) & (read_cnt == read_len) & (hap_cnt == hap_len - 1'b1)) begin
		read_cnt <= 8'd0;
		read_pos <= 2'd0;
	end else if ((cal_current_state == S5) & (pe_cnt <= sum_select)) begin 
		read_cnt <= read_cnt + 1'b1;
		read_pos <= read_pos + 1'b1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		read_cnt_pre <= 8'd0;
		read_pos_pre <= 2'd0;
	end else if ((cal_current_state == S5) & (read_cnt_pre == read_len - 1) & (hap_cnt_pre == hap_len - 1'b1)) begin
		read_cnt_pre <= 8'd0;
		read_pos_pre <= 2'd0;
	end else if ((cal_current_state == S5) & (pe_cnt_pre <= sum_select - 1)) begin 
		read_cnt_pre <= read_cnt_pre + 1'b1;
		read_pos_pre <= read_pos_pre + 1'b1;
	end else if (prepare_done | (wait_cnt == 3'd5)) begin 
		read_cnt_pre <= read_cnt + 1'b1;
		read_pos_pre <= read_pos + 1'b1;
	end
end

reg [5:0] read_cnt_mv_2_pre;
reg [6:0] hap_cnt_mv_2_pre;
always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		read_cnt_mv_2_pre <= 6'd0;
	end else begin 
		read_cnt_mv_2_pre <= read_cnt_pre >> 2;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		read_cnt_mv_2 <= 6'd0;
	end else begin 
		read_cnt_mv_2 <= read_cnt >> 2;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		hap_cnt_mv_2_pre <= 7'd0;
	end else begin 
		hap_cnt_mv_2_pre <= hap_cnt_pre >> 2;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin
	if (!sys_rst_n) begin
		hap_cnt_mv_2 <= 7'd0;
	end else begin 
		hap_cnt_mv_2 <= hap_cnt >> 2;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		parameter_vld <= 1'b0;
	end else if ((cal_current_state == S4) & pe_cnt <= sum_select) begin 
		parameter_vld <= 1'b1;
	end else begin 
		parameter_vld <= 1'b0;
	end
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		pe_cnt <= 6'd0;
	end else if ((cal_current_state == S5) & (hap_cnt == hap_len - 1)) begin 
		pe_cnt <= 6'd0;
	end else if ((cal_current_state == S5) & (pe_cnt <= sum_select)) begin 
		pe_cnt <= pe_cnt + 1'b1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		pe_cnt_pre <= 6'd0;
	end else if ((cal_current_state == S5) & (hap_cnt_pre == hap_len - 1)) begin 
		pe_cnt_pre <= 6'd0;
	end else if ((cal_current_state == S5) & (pe_cnt_pre <= sum_select)) begin 
		pe_cnt_pre <= pe_cnt_pre + 1'b1;
	end else if (prepare_done | wait_cnt == 3'd5) begin 
		pe_cnt_pre <= 1'b1;
	end
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		circle_cnt <= 6'd0;
	end else if ((cal_current_state == S5) & (circle_cnt == circle_sum - 1'b1) & (hap_cnt == hap_len - 1)) begin 
		circle_cnt <= 6'd0;
	end else if((cal_current_state == S5) & (hap_cnt == hap_len - 1)) begin 
		circle_cnt <= circle_cnt + 1'b1;
	end
end
reg en_sum;


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		en_sum <= 1'b0;
	end else if ((cal_current_state == S4) & (circle_cnt == circle_sum - 1'b1) & (hap_cnt == 2))begin 
		en_sum <= 1'b1;
	end else begin 
		en_sum <= 1'b0;
	end
end




// always @(posedge sys_clk or negedge sys_rst_n)
// begin 
// 	if (!sys_rst_n) begin
// 		read_done <= 1'b0;
// 	end else if ((cal_current_state == S5) & (read_cnt == read_len - 1'b1) & (hap_cnt == hap_len - 1'b1)) begin
// 		read_done <= 1'b1;
// 	end else begin
// 		read_done <= 1'b0;
// 	end
// end


//WAIT_6

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		wait_cnt <= 3'd0;
	end else if (wait_cnt == 3'd5) begin 
		wait_cnt <= 3'd0;
	end else if (cal_current_state == WAIT_6) begin 
		wait_cnt <= wait_cnt + 1'b1;
	end
end 


reg init_0;
reg init_1;
reg init_2;
reg init_3;
reg init_4;
reg init_5;


assign init = init_5;

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		init_0 <= 1'b0;
	end else if (cal_current_state == WAIT_6) begin 
		init_0 <= 1'b0;
	end else if (sum_vld) begin
		init_0 <= 1'b0;
	end else if ((cal_current_state == S0)) begin
		init_0 <= 1'b1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		init_1 <= 1'b0;
		init_2 <= 1'b0;
		init_3 <= 1'b0;
		init_4 <= 1'b0;
		init_5 <= 1'b0;
	end else if (sum_vld) begin 
		init_1 <= 1'b0;
		init_2 <= 1'b0;
		init_3 <= 1'b0;
		init_4 <= 1'b0;
		init_5 <= 1'b0;	
	end else begin
		init_1 <= init_0;
		init_2 <= init_1;
		init_3 <= init_2;
		init_4 <= init_3;
		init_5 <= init_4;
	end
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		mode <= 1'b0;
	end else if (current_state == DONE) begin 
		mode <= 1'b0;	
	end else if ((circle_cnt > 0) & (wait_cnt == 3'd5)) begin 
		mode <= 1'b1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		sum_select <= PE_NUM - 1;
	end else if (circle_cnt == circle_sum - 1'b1) begin 
		sum_select <= circle_left - 1;
	end else if (current_state == DONE) begin 
		sum_select <= PE_NUM - 1;
	end 
end  


//CAL_DONE
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		son_cnt <= 3'd0;
	end else if (son_cnt == 3'd5) begin
		son_cnt <= 3'd0;
	end else if (cal_current_state == CAL_DONE) begin
		son_cnt <= son_cnt + 1'b1;
	end
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		cal_done_cnt <= 6'd0;
	end else if ((cal_done_cnt == circle_left + 1) & (son_cnt == 3'd5)) begin 
		cal_done_cnt <= 6'd0;
	end else if (son_cnt == 3'd5) begin 
		cal_done_cnt <= cal_done_cnt + 1'b1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		sum_vld <= 1'b0;
	end else if ((cal_done_cnt == circle_left + 1) & (son_cnt == 3'd5)) begin 
		sum_vld <= 1'b1;
	end else begin 
		sum_vld <= 1'b0;
	end
end



//----------------------------- DONE ----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		all_done <= 1'b0;
	end else if (current_state == DONE) begin 
		all_done <= 1'b1;
	end else begin 
		all_done <= 1'b0;
	end
end




//----------------------------- RAM ROM Operations----------------------------//

//ROM_check0
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		addr_check0 <= 8'd0;
	end else if ((prepare_cnt == 3'd3) | (cal_current_state == S4) | (wait_cnt == 3'd4)) begin 
		addr_check0 <= data_out[15:8];
	end else if (cal_current_state == S0) begin
		addr_check0 <= i;
	end 
end

//ROM_check1
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		addr_check1 <= 8'd0;
	end else if ((prepare_cnt == 3'd3) | (cal_current_state == S4) | (wait_cnt == 3'd4)) begin 
		addr_check1 <= data_out[23:16];
	end else if (cal_current_state == S0) begin
		addr_check1 <= q;
	end 
end

//ROM_check2
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		addr_check2 <= 8'd0;
	end else if (cal_current_state == S0) begin
		addr_check2 <= q;
	end 
end


//ram_2port_512x32
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		wraddress <= 9'd0;
	end else if (current_state == GET_R) begin
		wraddress <= ADDR_R + r_cnt;
	end else if (current_state == GET_H) begin 
		wraddress <= ADDR_H + h_cnt;
	end else if (current_state == GET_QIDC) begin 
		wraddress <= ADDR_QIDC + qidc_cnt;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		wren <= 1'b0;
	end else if (current_state == GET_R) begin 
		wren <= 1'b1;
	end else if (current_state == PREPARE) begin 
		wren <= 1'b0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		data_in <= 32'd0;
	end else begin  
		data_in <= f_matrix_memory_data;
	end 
end


reg [8:0] prepare_addr;
reg [8:0] cal_addr;
reg [8:0] wait_addr;

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		prepare_addr <= 9'd0;
	end else if ((prepare_cnt == 3'd1)) begin 
		prepare_addr <= ADDR_R;
	end else if (prepare_cnt == 3'd2) begin 
		prepare_addr <= ADDR_H;
	end else if (prepare_cnt == 3'd0) begin 
		prepare_addr <= ADDR_QIDC;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		cal_addr <= 9'd0;
	end else if (cal_current_state == S0) begin 
		cal_addr <= ADDR_QIDC + read_cnt_pre;
	end else if (cal_current_state == S2) begin
		cal_addr <= ADDR_R + read_cnt_mv_2_pre;
	end else if (cal_current_state == S3) begin 
		cal_addr <= ADDR_H + hap_cnt_mv_2_pre;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		wait_addr <= 9'd0;
	end else if (wait_cnt == 3'd0) begin
		wait_addr <= ADDR_QIDC + read_cnt;
	end else if (wait_cnt == 3'd2) begin 
		wait_addr <= ADDR_R + read_cnt_mv_2;
	end else if (wait_cnt == 3'd3) begin 
		wait_addr <= ADDR_H ;
	end
end	

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		rdaddress <= 9'd0;
	end else if (current_state == PREPARE) begin 
		rdaddress <= prepare_addr;
	end else if ((current_state == CALCULATE) & (cal_current_state != WAIT_6)) begin
		rdaddress <= cal_addr;
	end else if ((current_state == CALCULATE) & (cal_current_state == WAIT_6 )) begin 
		rdaddress <= wait_addr;
	end
end




fp_sub sub_0 (
	.clk   (sys_clk), //    clk.clk
	.areset(1'b0   ), // areset.reset
	.a     (sub_a  ), //      a.a
	.b     (sub_b  ), //      b.b
	.q     (sub_q  )  //      q.q
);


Rom_Check0 check0(
	.clock(sys_clk),
	.address(addr_check0),
	.rden(1'b1),
	
	.q(check0_data_out)
);

Rom_Check1 check1(
	.clock(sys_clk),
	.address(addr_check1),
	.rden(1'b1),
	
	.q(check1_data_out)
);

Rom_Check2 check2(
	.clock(sys_clk),
	.address(addr_check2),
	.rden(1'b1),
	
	.q(check2_data_out)
);


ram_2port_512x32 ram(
	.data(data_in),
	.wraddress(wraddress),
	.rdaddress(rdaddress),
	.wren(wren),
	.rden(1'b1),
	.clock(sys_clk),
	
	.q(data_out)
);

PU32 P0(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.mode(mode),
	.SUM_select(sum_select),
	.SUM_valid(sum_vld),
	
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
	
	.p_mx_8(pmx_8),
	.p_my_8(pmy_8),
	.p_mm_8(pmm_8),
	
	.p_mx_9(pmx_9),
	.p_my_9(pmy_9),
	.p_mm_9(pmm_9),
	
	.p_mx_10(pmx_10),
	.p_my_10(pmy_10),
	.p_mm_10(pmm_10),
	
	.p_mx_11(pmx_11),
	.p_my_11(pmy_11),
	.p_mm_11(pmm_11),
	
	.p_mx_12(pmx_12),
	.p_my_12(pmy_12),
	.p_mm_12(pmm_12),
	
	.p_mx_13(pmx_13),
	.p_my_13(pmy_13),
	.p_mm_13(pmm_13),
	
	.p_mx_14(pmx_14),
	.p_my_14(pmy_14),
	.p_mm_14(pmm_14),
	
	.p_mx_15(pmx_15),
	.p_my_15(pmy_15),
	.p_mm_15(pmm_15),
	
	.p_mx_16(pmx_16),
	.p_my_16(pmy_16),
	.p_mm_16(pmm_16),
	
	.p_mx_17(pmx_17),
	.p_my_17(pmy_17),
	.p_mm_17(pmm_17),
	
	.p_mx_18(pmx_18),
	.p_my_18(pmy_18),
	.p_mm_18(pmm_18),
	
	.p_mx_19(pmx_19),
	.p_my_19(pmy_19),
	.p_mm_19(pmm_19),
	
	.p_mx_20(pmx_20),
	.p_my_20(pmy_20),
	.p_mm_20(pmm_20),
	
	.p_mx_21(pmx_21),
	.p_my_21(pmy_21),
	.p_mm_21(pmm_21),
	
	.p_mx_22(pmx_22),
	.p_my_22(pmy_22),
	.p_mm_22(pmm_22),
	
	.p_mx_23(pmx_23),
	.p_my_23(pmy_23),
	.p_mm_23(pmm_23),
	
	.p_mx_24(pmx_24),
	.p_my_24(pmy_24),
	.p_mm_24(pmm_24),
	
	.p_mx_25(pmx_25),
	.p_my_25(pmy_25),
	.p_mm_25(pmm_25),
	
	.p_mx_26(pmx_26),
	.p_my_26(pmy_26),
	.p_mm_26(pmm_26),
	
	.p_mx_27(pmx_27),
	.p_my_27(pmy_27),
	.p_mm_27(pmm_27),
	
	.p_mx_28(pmx_28),
	.p_my_28(pmy_28),
	.p_mm_28(pmm_28),
	
	.p_mx_29(pmx_29),
	.p_my_29(pmy_29),
	.p_mm_29(pmm_29),
	
	.p_mx_30(pmx_30),
	.p_my_30(pmy_30),
	.p_mm_30(pmm_30),
	
	.p_mx_31(pmx_31),
	.p_my_31(pmy_31),
	.p_mm_31(pmm_31),

	.lambda1_0(lambda0_0) ,
	.lambda2_0(lambda1_0) ,

	.lambda1_1(lambda0_1) ,
	.lambda2_1(lambda1_1) ,

	.lambda1_2(lambda0_2) ,
	.lambda2_2(lambda1_2) ,

	.lambda1_3(lambda0_3) ,
	.lambda2_3(lambda1_3) ,

	.lambda1_4(lambda0_4),
	.lambda2_4(lambda1_4),
	
	.lambda1_5(lambda0_5),
	.lambda2_5(lambda1_5),
	
	.lambda1_6(lambda0_6),
	.lambda2_6(lambda1_6),
	
	.lambda1_7(lambda0_7),
	.lambda2_7(lambda1_7),
	
	.lambda1_8(lambda0_8),
	.lambda2_8(lambda1_8),
	
	.lambda1_9(lambda0_9),
	.lambda2_9(lambda1_9),
	
	.lambda1_10(lambda0_10),
	.lambda2_10(lambda1_10),
	
	.lambda1_11(lambda0_11),
	.lambda2_11(lambda1_11),
	
	.lambda1_12(lambda0_12),
	.lambda2_12(lambda1_12),
	
	.lambda1_13(lambda0_13),
	.lambda2_13(lambda1_13),
	
	.lambda1_14(lambda0_14),
	.lambda2_14(lambda1_14),
	
	.lambda1_15(lambda0_15),
	.lambda2_15(lambda1_15),
	
	.lambda1_16(lambda0_16),
	.lambda2_16(lambda1_16),
	
	.lambda1_17(lambda0_17),
	.lambda2_17(lambda1_17),
	
	.lambda1_18(lambda0_18),
	.lambda2_18(lambda1_18),
	
	.lambda1_19(lambda0_19),
	.lambda2_19(lambda1_19),
	
	.lambda1_20(lambda0_20),
	.lambda2_20(lambda1_20),
	
	.lambda1_21(lambda0_21),
	.lambda2_21(lambda1_21),
	
	.lambda1_22(lambda0_22),
	.lambda2_22(lambda1_22),
	
	.lambda1_23(lambda0_23),
	.lambda2_23(lambda1_23),
	
	.lambda1_24(lambda0_24),
	.lambda2_24(lambda1_24),
	
	.lambda1_25(lambda0_25),
	.lambda2_25(lambda1_25),
	
	.lambda1_26(lambda0_26),
	.lambda2_26(lambda1_26),
	
	.lambda1_27(lambda0_27),
	.lambda2_27(lambda1_27),
	
	.lambda1_28(lambda0_28),
	.lambda2_28(lambda1_28),
	
	.lambda1_29(lambda0_29),
	.lambda2_29(lambda1_29),
	
	.lambda1_30(lambda0_30),
	.lambda2_30(lambda1_30),
	
	.lambda1_31(lambda0_31),
	.lambda2_31(lambda1_31),

	.H_in  (H_in),
	.R_in_0(r_0),
	.R_in_1(r_1),
	.R_in_2(r_2),
	.R_in_3(r_3),
	.R_in_4(r_4),
	.R_in_5(r_5),
	.R_in_6(r_6),
	.R_in_7(r_7),
	.R_in_8(r_8),
	.R_in_9(r_9),
	.R_in_10(r_10),
	.R_in_11(r_11),
	.R_in_12(r_12),
	.R_in_13(r_13),
	.R_in_14(r_14),
	.R_in_15(r_15),
	.R_in_16(r_16),
	.R_in_17(r_17),
	.R_in_18(r_18),
	.R_in_19(r_19),
	.R_in_20(r_20),
	.R_in_21(r_21),
	.R_in_22(r_22),
	.R_in_23(r_23),
	.R_in_24(r_24),
	.R_in_25(r_25),
	.R_in_26(r_26),
	.R_in_27(r_27),
	.R_in_28(r_28),
	.R_in_29(r_29),
	.R_in_30(r_30),
	.R_in_31(r_31),
	
	.Init_in(init),
	.Y_Init(y_initial),
	.SUM_out(sum),
	.SUM_start(en_sum)


	);
//---------------------------------------------------------------
wire [127:0] fifo_data_in          ;
wire [127:0] fifo_data_out         ;
wire [ 8:0] usedw                 ;
wire         fifo_write_en         ;

wire         full                  ;


fifo_512x128 u0 (
		.data   (fifo_data_in ), 
		.wrreq  (fifo_write_en), 
		.rdreq  (~result_fifo_empty), 
		.clock  (sys_clk      ), 
		.q      (result_fifo_rdat),
		.usedw  (usedw        ), 
		
		.full   (full         ), 
		.empty  (result_fifo_empty)  
	);


assign fifo_write_en = sum_vld;
assign fifo_data_in  = {32'b0,head,sum};

assign fifo_almost_full = (usedw >= 9'd485);

//---------------------------------------------------------------
(*noprune*)reg [31:0] sum_vld_cnt;

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		sum_vld_cnt <= 32'd0;
	end else if (sum_vld) begin 
		sum_vld_cnt <= sum_vld_cnt + 1'b1;
	end 
end




endmodule // save_send