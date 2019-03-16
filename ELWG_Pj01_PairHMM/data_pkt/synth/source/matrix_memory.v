

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

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/


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
		j 	 <= 5'd0;
		head <= 64'd0;
		hap_len  <= 16'd0;
		read_len <= 16'd0;
		y_initial<= 32'd0;
		sum_save_R <= 6'd0;
		sum_save_H <= 7'd0;

		rec_cnt 	 <= 8'd0;
		row_cnt 	 <= 8'd0;
		col_cnt 	 <= 9'd0;
		row_pos 	 <= 2'd0;
		col_pos 	 <= 2'd0;

		hap_len_plus_col_cnt <= 9'd0;

		r0_a_address <= 11'd0;
		wren_a 		 <= 1'b0;
		data_a  	 <= 32'd0;
		r0_b_address <= 32'd0;
		rden_b		 <= 1'b0;
		busy 		 <= 0;
		rden_a		 <= 0;
		flag_lam	 <= 0;

		{q,i,d,c} <= 32'd0;
		r 		  <= 8'd0;
		h 		  <= 8'd0;
		float_i_0 <= 32'd0;
		float_q_0 <= 32'd0;
		float_d_1 <= 32'd0;
		float_i_1 <= 32'd0;
		float_q_1 <= 32'd0;
		m_i1_j1   <= 32'd0;
		m_i1_j    <= 32'd0;
		x_i1_j1   <= 32'd0;
		x_i1_j    <= 32'd0;
		y_i1_j1   <= 32'd0;
		sum_vld	  <= 1'b0;
		en_sum 	  <= 1'b0;

		m_write	  <= 32'd0;
		x_write	  <= 32'd0;
		y_write	  <= 32'd0;

		row_cnt_mv_2 <= 8'd0;
		col_cnt_mv_2 <= 9'd0;
		hap_len_mv_2 <= 7'd0;
		read_len_mv_2<= 6'd0;

	end else begin 
		case (j)
			5'd0:  //head
			if (matrix_memory_sop) begin 
				head[63:32] <= matrix_memory_data;
				busy <= 1;
				j <= j + 1'b1;
			end
			
			5'd1:begin   //head 
				head[31:0] <= matrix_memory_data;
				j <= j + 1'b1;
			end

			5'd2:begin 
				j <= j + 1'b1;
			end

			5'd3: begin 
				j <= j + 1'b1;
			end


			5'd4: begin // hap_len  read_len
				hap_len <= matrix_memory_data[31:16];
				read_len <= matrix_memory_data[15:0];
				hap_len_mv_2 <= matrix_memory_data [31:16] >> 2;
				read_len_mv_2<= matrix_memory_data [15:0 ] >> 2; 
				j <= j + 1'b1;
			end

			5'd5: begin // y_initial
				y_initial <= matrix_memory_data;
				j <= j + 1'b1;
				//------------------------------------
				if ((read_len[1:0]) != 2'b0 ) begin 
					sum_save_R <= read_len_mv_2 + 1'b1 ;
				end else begin
					sum_save_R <= read_len_mv_2 ;
				end
				//------------------------------------
				if ((hap_len[1:0]) != 2'b0 ) begin 
					sum_save_H <= hap_len_mv_2 + 1'b1 ;
				end else begin
					sum_save_H <= hap_len_mv_2 ;
				end
			end

			5'd6: begin // save R in RAM
				if (rec_cnt == sum_save_R - 1'b1) begin 
					rec_cnt <= 8'd0;
					j 		<= j + 1'b1;
					wren_a 	<= 1;
					data_a  <= matrix_memory_data;
					r0_a_address <= ADDR_R + rec_cnt;
				end else begin 
					rec_cnt <= rec_cnt + 1'b1;
					wren_a  <= 1;
					data_a  <= matrix_memory_data;
					r0_a_address <= ADDR_R + rec_cnt;
				end
 			end

 			5'd7: begin // save H in RAM 
 				if (rec_cnt == sum_save_H - 1'b1) begin 
 					rec_cnt <= 8'd0;
 					j 		<= j + 1'b1;
 					wren_a  <= 1;
 					data_a  <= matrix_memory_data;
 					r0_a_address <= ADDR_H + rec_cnt;
 				end else begin 
 					rec_cnt <= rec_cnt + 1'b1;
 					wren_a  <= 1;
 					data_a  <= matrix_memory_data;
 					r0_a_address <= ADDR_H + rec_cnt;
 				end
 			end

 			5'd8: begin // save qidc in RAM
 				if (rec_cnt == read_len - 1'b1) begin
 					rec_cnt <= 8'd0;
 					j 		<= j + 1'b1;
 					wren_a  <= 1;
 					data_a  <= matrix_memory_data;
 					r0_a_address <= ADDR_QIDC + rec_cnt;
 				end else begin 
 					rec_cnt <= rec_cnt + 1'b1;
 					wren_a 	<= 1;
 					data_a  <= matrix_memory_data;
 					r0_a_address <= ADDR_QIDC + rec_cnt;
 				end
 			end

 			5'd9: begin // close wren_a
 				wren_a <= 0;
 				j 	   <= j + 1'b1;
 			end


 			5'd10: begin
 			if (vld) begin 	
 				r0_b_address <= ADDR_QIDC ; // prepare qidc  
 				rden_b 		 <= 1'b1;
 				j 			 <= j + 1'b1;
 			end
 			end

 			5'd11: begin
 				r0_b_address <= ADDR_R ; // prepare R
 				rden_b		 <= 1;
 				j 			 <= j + 1'b1;
 			end

 			5'd12: begin   		
 				r0_b_address <= ADDR_H ; // prepare H
 				rden_b		 <= 1'b1;
 				j 			 <= j + 1'b1;
 			end

 			5'd13: begin   // T=0
 				rden_b		 <= 1'b0;
 				//------------------------------------
 				{q,i,d,c} 	 <= r0_read_data_b;
 				
 				//------------------------------------
 				r0_a_address <= ADDR_M_1 + col_cnt;
 				rden_a 		 <= 1'b1;
 				//------------------------------------
 				j 			 <= j + 1'b1;
 			end

 			5'd14: begin   // T=1
 				rden_b		 <= 1'b1;
 				r0_b_address <= ADDR_LUT_0 + i;
 				//------------------------------------
 				case (row_pos)
 					2'd0 : r <= r0_read_data_b[31:24];
 					2'd1 : r <= r0_read_data_b[23:16];
 					2'd2 : r <= r0_read_data_b[15:8 ];   
 					2'd3 : r <= r0_read_data_b[7:0  ];
 					default : r <= 8'd0;
 				endcase // row_pos
 				//------------------------------------
 				r0_a_address <= ADDR_M + col_cnt;
 				rden_a 	     <= 1;
 				//------------------------------------
 				m_write 	 <= m_i_j;
 				x_write 	 <= x_i_j;
 				y_write 	 <= y_i_j;
 				//------------------------------------

 				j 			 <= j + 1'b1;
 			end



 			5'd15: begin   // T=2
 				rden_b		 <= 1'b1;
 				r0_b_address <= ADDR_LUT_1 + d;
 				//------------------------------------
 				case (col_pos)
 					2'd0 : h <= r0_read_data_b[31:24];
 					2'd1 : h <= r0_read_data_b[23:16];
 					2'd2 : h <= r0_read_data_b[15:8 ];   
 					2'd3 : h <= r0_read_data_b[7:0  ];
 					default : h <= 8'd0;
 				endcase // row_pos
 				//------------------------------------
 				r0_a_address <= ADDR_X_1 + col_cnt;
 				rden_a 	     <= 1;
	 			//------------------------------------
 				j 			 <= j + 1'b1;
 			end

 			5'd16: begin   // T = 3;
 				rden_b 		 <= 1'b1;
 				r0_b_address <= ADDR_LUT_1 + q;
 				//------------------------------------
 				flag_lam 	 <= (r == h)||(r == 8'h4e) || (h == 8'h4e); 
 				//------------------------------------
 				r0_a_address <= ADDR_X + col_cnt;
 				rden_a 		 <= 1;
 				//------------------------------------
 				if(col_cnt == 9'd0 || row_cnt == 8'd0) begin 
 					m_i1_j1  <= 32'd0;
 				end else begin 
 					m_i1_j1  <= r0_read_data_a;
 				end
 				//------------------------------------
 				j 			 <= j + 1'b1;
 			end

 			5'd17: begin   //T = 4
 				rden_b 		 <= 1'b1;
 				r0_b_address <= ADDR_LUT_1 + i;
 				//------------------------------------
 				float_i_0 	 <= r0_read_data_b;
 				//------------------------------------
 				r0_a_address <= ADDR_Y_1 + col_cnt;
 				rden_a 		 <= 1;
 				//------------------------------------
 				if (row_cnt == 8'd0) begin 
 					m_i1_j 	 <= 32'd0;
 				end else begin 
 					m_i1_j 	 <= r0_read_data_a;
 				end
 				//------------------------------------
 				hap_len_plus_col_cnt <= hap_len + col_cnt;
 				j 			 <= j + 1'b1;

 			end

 			5'd18: begin   //T = 5
 				rden_b 		 <= 1'b1;
 				r0_b_address <= ADDR_LUT_0 + q;
 				//------------------------------------
 				float_d_1 	 <= r0_read_data_b;
 				//------------------------------------
 				if (col_cnt <= 9'd1) begin
 					r0_a_address <= ADDR_M_2 + hap_len_plus_col_cnt;
 				end else begin
 					r0_a_address <= ADDR_M_2 + col_cnt;
 				end 
 				data_a 		 <= m_write;
 				rden_a 		 <= 0;
 				wren_a 		 <= 1;
 				//------------------------------------
 				if (row_cnt == 8'd0 || col_cnt == 9'd0) begin 
 					x_i1_j1  <= 32'd0;
 				end else begin 
 					x_i1_j1  <= r0_read_data_a;
 				end
 				//------------------------------------
 				j 	   		 <= j + 1'b1;
 			end

 			5'd19: begin   //T = 6
 				rden_b 	 	 <= 1'b0;
 				//------------------------------------
 				float_q_1    <= r0_read_data_b;
 				//------------------------------------
 				if (col_cnt <= 1) begin
 					r0_a_address <= ADDR_X_2 + hap_len_plus_col_cnt;
 				end else begin
 					r0_a_address <= ADDR_X_2 + col_cnt ;
 				end 
 				data_a 		 <= x_write;
 				rden_a 		 <= 0;
 				wren_a 		 <= 1;
 				//------------------------------------
 				if (row_cnt == 8'd0) begin 
 					x_i1_j   <= 32'd0;
 				end else begin 
 					x_i1_j   <= r0_read_data_a;
 				end
 				//------------------------------------
 				j 			 <= j + 1'b1;
 			end

 			5'd20: begin   // T = 7 
 				float_i_1    <= r0_read_data_b;
 				//------------------------------------
 				if (col_cnt <= 1) begin
 					r0_a_address <= ADDR_Y_2 + hap_len_plus_col_cnt;
 				end else begin
 					r0_a_address <= ADDR_Y_2 + col_cnt ;
 				end 
 				data_a 		 <= y_write;
 				rden_a 		 <= 0;
 				wren_a 		 <= 1;
 				//-----------------------------------
 				if (row_cnt == 8'd0 ) begin
 					y_i1_j1  <= y_initial;
 				end else if (row_cnt == 8'd0) begin 
 					y_i1_j1  <= 32'd0;
 				end else begin 
 					y_i1_j1  <= r0_read_data_a;
 				end
 				//-----------------------------------
 				j 	  <= j + 1'b1;
 			end

 			5'd21: begin   // T = 8
 				float_q_0 	 <= r0_read_data_b;

 				wren_a <= 0;
 				j 	   <= j + 1'b1;
 			end


 			5'd22: begin   // T = 9
 				rden_b 		 <= 1;
 				if((col_cnt == hap_len_sub_1_0) && (row_cnt == read_len_sub_1_0) ) begin 
 					r0_b_address <= ADDR_QIDC;
 				end else if ((col_cnt == hap_len_sub_1_0) && (row_cnt < read_len_sub_1_0) ) begin 
 					r0_b_address <= ADDR_QIDC_PLUS_1 + row_cnt; 
 				end else begin 
 					r0_b_address <= ADDR_QIDC + row_cnt ;
 				end
 				row_cnt_mv_2 <=  row_cnt >> 2;
 				j  <= j + 1'b1;
 			end

 			5'd23: begin   // T = 10  
 				rden_b	     <= 1;
 				if((col_cnt == hap_len_sub_1_1) && (row_cnt == read_len_sub_1_1) ) begin 
 					r0_b_address <= ADDR_R;
 				end else if ((col_cnt == hap_len_sub_1_1) && (row_cnt < read_len_sub_1_1) && (row_pos == 2'd3) ) begin 
 					r0_b_address <= ADDR_R_PLUS_1 + row_cnt_mv_2 ;
 				end else begin 
 					r0_b_address <= ADDR_R + row_cnt_mv_2;
 				end

 				if ((row_cnt == read_len_sub_1_1) && col_cnt == 9'd2) begin 
					en_sum <= 1'b1;
				end 

				col_cnt_mv_2 <= col_cnt >> 2;
 				j 	<= j + 1'b1;
 			end

 			5'd24: begin   // T = 11
 				rden_b 		 <= 1;
 				r0_b_address <= ADDR_H + col_cnt ;

 				if((col_cnt == hap_len_sub_1_2) && (row_cnt == read_len_sub_1_2) ) begin 
 					r0_b_address <= ADDR_H;
 				end else if ((col_cnt == hap_len_sub_1_2) && (row_cnt < read_len_sub_1_2) && (col_pos == 2'd3) ) begin 
 					r0_b_address <= ADDR_H;
 				end else if (col_pos == 2'd3) begin 
 					r0_b_address <= ADDR_H_PLUS_1 + col_cnt_mv_2;
 				end else begin 
 					r0_b_address <= ADDR_H + col_cnt_mv_2;
 				end



 				if((col_cnt == hap_len_sub_1_2) && (row_cnt == read_len_sub_1_2) ) begin 
 					col_cnt  <= 9'd0;
 					row_cnt  <= 8'd0;
 					row_pos	 <= 2'd0;
 					col_pos  <= 2'd0;
 					j 		 <= j + 1;  
 				end else if ((col_cnt == hap_len_sub_1_2) && (row_cnt < read_len_sub_1_2) ) begin 
 					col_cnt  <= 9'd0 ;
 					row_cnt  <= row_cnt + 1;
 					row_pos  <= row_pos + 1;
 					col_pos  <= 1'b0;
 					j 		 <= 5'd13; 
 				end else begin 
 					col_cnt  <= col_cnt + 1;
 					col_pos  <= col_pos + 1;
 					j 		 <= 5'd13; 
 				end

				
			end


 			5'd25:  begin
 				if (rec_cnt == 8'd22) begin 
 					rec_cnt 	<= 8'd0;
 					en_sum 		<= 1'b0;
 					sum_vld 	<= 1'b1;
 					j 	     	<= j + 1'b1;
 				end else begin 
 					rec_cnt 	<= rec_cnt + 1'b1;
 				end
 			end

			5'd26: begin
				sum_vld <= 1'b0;
				busy 	<= 1'b0;
				j    	<= 1'b0;
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


(*noprune*) reg hap_len_error;


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
      hap_len_error <= 1'b0;
   end else if(hap_len > 16'd400) begin
      hap_len_error <= 1'b1;     
   end
end 


endmodule 

















