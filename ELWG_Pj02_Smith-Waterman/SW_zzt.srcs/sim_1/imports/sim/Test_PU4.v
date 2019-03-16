`timescale 1ns/1ps

module Test_PU4;

	parameter integer DATA_WIDTH     = 4;
	parameter integer SCORE_WIDTH    = 16;
	parameter integer LOCATION_WIDTH = 32;

	reg sys_clk   ;
	reg sys_rst_n ;
	reg mode      ;
	reg start_in  ;

	reg [DATA_WIDTH-1:0] Ns;
	reg [2:0] final_row_en;
	
	reg [DATA_WIDTH-1:0] Nr_0;
	reg [DATA_WIDTH-1:0] Nr_1;
	reg [DATA_WIDTH-1:0] Nr_2;
	reg [DATA_WIDTH-1:0] Nr_3;
	
	
	reg [LOCATION_WIDTH-1:0] location_in_0;
	reg [LOCATION_WIDTH-1:0] location_in_1;
	reg [LOCATION_WIDTH-1:0] location_in_2;
	reg [LOCATION_WIDTH-1:0] location_in_3;

	reg signed [SCORE_WIDTH-1:0] Score_Init;

	reg [3:0] mod7_cnt;
	reg [3:0] Y_cnt;

	wire start_out;
	wire [DATA_WIDTH-1:0] Ns_out;

	wire signed [SCORE_WIDTH-1:0] H_i_j_out;
	wire signed [SCORE_WIDTH-1:0] F_i_j_out;

	wire signed [SCORE_WIDTH-1:0] Score_out;

	wire signed [SCORE_WIDTH-1:0] H_row_max_last;
	wire [LOCATION_WIDTH-1:0]	H_row_max_last_location;

	wire signed [SCORE_WIDTH-1:0] H_max_out;
	wire [LOCATION_WIDTH-1:0] H_max_location;
	

		initial begin
			sys_clk <= 1'b0;
			sys_rst_n <= 1'b0;
			mode <= 1'b0;
			Nr_0 <= 4'b0001;
			Nr_1 <= 4'b0011;
			Nr_2 <= 4'b0010;
			Nr_3 <= 4'b0001;

			Score_Init <= 8'sb00010111;//23
			start_in <= 1'b0;

    		#25 sys_rst_n <= 1'b1;
		end

		always begin
			#5 sys_clk = ~sys_clk;
		end

		always @(posedge sys_clk or negedge sys_rst_n) begin
			if(!sys_rst_n) mod7_cnt <= 3'd6;
			else begin
				if(mod7_cnt == 3'd6) mod7_cnt <= 1'b0;
				else mod7_cnt <= mod7_cnt + 1'b1;
			end
		end

		always @(posedge sys_clk or negedge sys_rst_n) begin
			if(!sys_rst_n) Y_cnt <= 1'b0;
			else begin
				if(mod7_cnt == 3'd0) Y_cnt <= Y_cnt + 1'b1;
				else if (Y_cnt == 4'd10) Y_cnt <= 1'b0;
				else Y_cnt <= Y_cnt;
			end
		end

		always @(posedge sys_clk or negedge sys_rst_n) begin
			if(!sys_rst_n) Ns <= 1'b0;
			else begin
				if(Y_cnt == 4'd1) Ns <= 4'b0011;//3
				else if(Y_cnt == 4'd2) Ns <= 4'b0001;//1
				else if(Y_cnt == 4'd3) Ns <= 4'b0010;//2
				else if(Y_cnt == 4'd4) Ns <= 4'b0001;//1
				else if(Y_cnt == 4'd5) Ns <= 4'b0011;//3
				else if(Y_cnt == 4'd6) Ns <= 4'b0011;//3
				else if(Y_cnt == 4'd7) Ns <= 4'b0001;//1
				else if(Y_cnt == 4'd8) Ns <= 4'b0011;//3
				else Ns <= Ns;
			end
		end

		always @(posedge sys_clk or negedge sys_rst_n) begin
			if(!sys_rst_n) location_in_0 <= 32'h0000_0000;
			else begin
				if(mod7_cnt == 3'd0) location_in_0 <= location_in_0 + 1'b1;
				else location_in_0 <= location_in_0;
			end
		end

		always @(posedge sys_clk or negedge sys_rst_n) begin
			if(!sys_rst_n) location_in_1 <= 32'h0001_0000;
			else begin
				if(mod7_cnt == 3'd0) location_in_1 <= location_in_1 + 1'b1;
				else location_in_1 <= location_in_1;
			end
		end

		always @(posedge sys_clk or negedge sys_rst_n) begin
			if(!sys_rst_n) location_in_2 <= 32'h0002_0000;
			else begin
				if(mod7_cnt == 3'd0) location_in_2 <= location_in_2 + 1'b1;
				else location_in_2 <= location_in_2;
			end
		end

		always @(posedge sys_clk or negedge sys_rst_n) begin
			if(!sys_rst_n) location_in_3 <= 32'h0003_0000;
			else begin
				if(mod7_cnt == 3'd0) location_in_3 <= location_in_3 + 1'b1;
				else location_in_3 <= location_in_3;
			end
		end

//--------------------
always @(posedge sys_clk or negedge sys_rst_n) begin
    if(!sys_rst_n) start_in <= 1'b0;
    else begin
        if((mod7_cnt == 3'd1) && (Y_cnt == 4'd1)) start_in <= 1'b1;
        else start_in <= 1'b0;
    end
end

		always @(posedge sys_clk or negedge sys_rst_n) begin
			if(!sys_rst_n) final_row_en <= 3'b000;
			else begin
				if ((mod7_cnt == 3'd2) && (Y_cnt == 4'd9)) final_row_en <= 3'b110;
				else final_row_en <= 3'b011;
			end
		end

		PU4 PU4_INST(
			.sys_clk  (sys_clk                               ),
			.sys_rst_n (sys_rst_n                            ),
			
			.Ns (Ns                                          ),
			
			.Nr_0  (Nr_0                                     ),
			.Nr_1  (Nr_1                                     ),
			.Nr_2  (Nr_2                                     ),
			.Nr_3   (Nr_3                                    ),
			
			.Score_Init(Score_Init                           ),
			
			.mode        (mode                               ),
			.final_row_en(final_row_en                       ),
			.start_in  (start_in                             ),
			
			// .H_i_j_fifo(H_i_j_fifo                        ),
			// .F_i_j_fifo(F_i_j_fifo                        ),
			
			.location_in_0  (location_in_0                   ),
			.location_in_1  (location_in_1                   ),
			.location_in_2  (location_in_2                   ),
			.location_in_3  (location_in_3                   ),
			
			
			.Ns_out  (Ns_out                                 ),
			.H_i_j_out  (H_i_j_out                           ),
			.F_i_j_out (F_i_j_out                            ),
			.Score_out (Score_out                            ),
			
			.H_row_max_last         (H_row_max_last          ),
			.H_row_max_last_location(H_row_max_last_location ),
			
			.start_out              (start_out               ),
			.H_max_out              (H_max_out               ),
			.H_max_location(H_max_location                   )
        );

endmodule