
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
parameter PE_NUM = 8'd4;

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
	end else if ((info_cnt == 3'd5) & (read_len[1:0] == 2'd0) ) begin 
		circle_sum <= read_len >> 2;
	end else if ((info_cnt == 3'd5) & (read_len[1:0] != 2'd0) ) begin 
		circle_sum <= (read_len >> 2) + 1'b1;
	end 
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		circle_left <= 6'd0;
	end else if ((info_cnt == 3'd5) & (read_len[1:0] == 2'd0))begin
		circle_left <= PE_NUM;
	end else if (info_cnt == 3'd5) begin 
		circle_left <= read_len[1:0];
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

PU4 P0(
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

	.lambda1_0(lambda0_0) ,
	.lambda2_0(lambda1_0) ,

	.lambda1_1(lambda0_1) ,
	.lambda2_1(lambda1_1) ,

	.lambda1_2(lambda0_2) ,
	.lambda2_2(lambda1_2) ,

	.lambda1_3(lambda0_3) ,
	.lambda2_3(lambda1_3) ,

	.H_in  (H_in),
	.R_in_0(r_0),
	.R_in_1(r_1),
	.R_in_2(r_2),
	.R_in_3(r_3),
	
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

always @(posedge sys_clk or negedge sys_rst_n) begin  
	if (!sys_rst_n) begin 
		sum_vld_cnt <= 32'd0;
	end else if (sum_vld) begin 
		sum_vld_cnt <= sum_vld_cnt + 1'b1;
	end 
end




endmodule // save_send