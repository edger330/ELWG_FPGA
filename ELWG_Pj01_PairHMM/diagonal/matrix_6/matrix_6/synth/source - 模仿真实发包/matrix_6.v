`timescale 1ns/1ps 

module matrix_6 (
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
parameter S0 = 6'b000001;
parameter S1 = 6'b000010;
parameter S2 = 6'b000100;
parameter S3 = 6'b001000;
parameter S4 = 6'b010000;
parameter S5 = 6'b100000;

parameter T0 = 6'b000001;
parameter T1 = 6'b000010;
parameter T2 = 6'b000100;
parameter T3 = 6'b001000;
parameter T4 = 6'b010000;
parameter T5 = 6'b100000;

/*-------------------------------------------------------------------*\
                          port Description                      
\*-------------------------------------------------------------------*/
input  wire        sys_clk           ;
input  wire        sys_rst_n           ;
input  wire        matrix_memory_sop ;
input  wire        matrix_memory_eop ;
input  wire        matrix_memory_vld ;
input  wire [31:0] matrix_memory_data;
input  wire        result_fifo_rden  ;
//outpuwire ;
output wire       	pkt_receive_enable;
output wire [127:0] result_fifo_rdat;
output wire 		result_fifo_empty;





/*-------------------------------------------------------------------*\
                          Reg/wire Description
\*-------------------------------------------------------------------*/
wire [31:0] sub_a;
wire [31:0] sub_b;
wire [31:0] sub_q;
reg  		temp_enable1;
reg  		temp_enable2;
wire 		fifo_almost_full; 


//-------------------------------p0------------------------------//
wire[31:0] sum;
wire       init_out;
reg         en_sum    ;
reg         mode      ;
reg  [ 5:0] sum_select;
reg         sum_vld   ;
reg  [31:0] y_initial ;
reg         init      ;
reg  [63:0] head      ;
reg  [ 7:0] h_in      ;
wire [31:0] M_write   ;
wire [31:0] X_write   ;
reg  [31:0] M_read    ;
reg  [31:0] X_read    ;

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

//-------------------------------s0------------------------------//
reg        matrix_memory_sop_0 ;
reg        matrix_memory_eop_0 ;
reg        matrix_memory_vld_0 ;
reg [31:0] matrix_memory_data_0;
reg [31:0] M_write_0           ;
reg [31:0] X_write_0            ;
reg        vld_0 				;
reg 		  init_out_0 			;

wire         pkt_receive_enable_0;
wire [ 31:0] ram_out_0           ;
wire [  7:0] q_0                 ;
wire [  7:0] i_0                 ;
wire [  7:0] R_0                 ;
wire [  7:0] H_0                 ;
wire [ 31:0] M_read_0            ;
wire [ 31:0] X_read_0            ;
wire         parameter_vld_0     ;
wire         en_sum_0            ;
wire         mode_0              ;
wire [5:0]   sum_select_0        ;
wire         sum_vld_0           ;
wire [ 31:0] y_initial_0         ;
wire         init_0              ;
wire [ 63:0] head_0              ;
wire [  5:0] pe_cnt_0 			 ;

reg [31:0] pmx_0_0    ;
reg [31:0] pmy_0_0    ;
reg [31:0] pmm_0_0    ;
reg [31:0] lambda0_0_0;
reg [31:0] lambda1_0_0;
reg [ 7:0] r_in_0_0   ;

reg [31:0] pmx_0_1    ;
reg [31:0] pmy_0_1    ;
reg [31:0] pmm_0_1    ;
reg [31:0] lambda0_0_1;
reg [31:0] lambda1_0_1;
reg [ 7:0] r_in_0_1   ;

reg [31:0] pmx_0_2    ;
reg [31:0] pmy_0_2    ;
reg [31:0] pmm_0_2    ;
reg [31:0] lambda0_0_2;
reg [31:0] lambda1_0_2;
reg [ 7:0] r_in_0_2   ;

reg [31:0] pmx_0_3    ;
reg [31:0] pmy_0_3    ;
reg [31:0] pmm_0_3    ;
reg [31:0] lambda0_0_3;
reg [31:0] lambda1_0_3;
reg [ 7:0] r_in_0_3   ;

reg [31:0] pmx_0_4    ;
reg [31:0] pmy_0_4    ;
reg [31:0] pmm_0_4    ;
reg [31:0] lambda0_0_4;
reg [31:0] lambda1_0_4;
reg [ 7:0] r_in_0_4   ;

reg [31:0] pmx_0_5    ;
reg [31:0] pmy_0_5    ;
reg [31:0] pmm_0_5    ;
reg [31:0] lambda0_0_5;
reg [31:0] lambda1_0_5;
reg [ 7:0] r_in_0_5   ;

reg [31:0] pmx_0_6    ;
reg [31:0] pmy_0_6    ;
reg [31:0] pmm_0_6    ;
reg [31:0] lambda0_0_6;
reg [31:0] lambda1_0_6;
reg [ 7:0] r_in_0_6   ;

reg [31:0] pmx_0_7    ;
reg [31:0] pmy_0_7    ;
reg [31:0] pmm_0_7    ;
reg [31:0] lambda0_0_7;
reg [31:0] lambda1_0_7;
reg [ 7:0] r_in_0_7   ;


//-------------------------------s1------------------------------//
reg        matrix_memory_sop_1 ;
reg        matrix_memory_eop_1 ;
reg        matrix_memory_vld_1 ;
reg [31:0] matrix_memory_data_1;
reg [31:0] M_write_1           ;
reg [31:0] X_write_1            ;
reg        vld_1 				;
reg 	   init_out_1 			;

wire         pkt_receive_enable_1;
wire [ 31:0] ram_out_1           ;
wire [  7:0] q_1                 ;
wire [  7:0] i_1                 ;
wire [  7:0] R_1                 ;
wire [  7:0] H_1                 ;
wire [ 31:0] M_read_1            ;
wire [ 31:0] X_read_1            ;
wire         parameter_vld_1     ;
wire         en_sum_1            ;
wire         mode_1              ;
wire [5:0]   sum_select_1        ;
wire         sum_vld_1           ;
wire [ 31:0] y_initial_1         ;
wire         init_1              ;
wire [ 63:0] head_1              ;
wire [  5:0] pe_cnt_1 			 ;


reg [31:0] pmx_1_0    ;
reg [31:0] pmy_1_0    ;
reg [31:0] pmm_1_0    ;
reg [31:0] lambda0_1_0;
reg [31:0] lambda1_1_0;
reg [ 7:0] r_in_1_0   ;

reg [31:0] pmx_1_1    ;
reg [31:0] pmy_1_1    ;
reg [31:0] pmm_1_1    ;
reg [31:0] lambda0_1_1;
reg [31:0] lambda1_1_1;
reg [ 7:0] r_in_1_1   ;

reg [31:0] pmx_1_2    ;
reg [31:0] pmy_1_2    ;
reg [31:0] pmm_1_2    ;
reg [31:0] lambda0_1_2;
reg [31:0] lambda1_1_2;
reg [ 7:0] r_in_1_2   ;

reg [31:0] pmx_1_3    ;
reg [31:0] pmy_1_3    ;
reg [31:0] pmm_1_3    ;
reg [31:0] lambda0_1_3;
reg [31:0] lambda1_1_3;
reg [ 7:0] r_in_1_3   ;

reg [31:0] pmx_1_4    ;
reg [31:0] pmy_1_4    ;
reg [31:0] pmm_1_4    ;
reg [31:0] lambda0_1_4;
reg [31:0] lambda1_1_4;
reg [ 7:0] r_in_1_4   ;

reg [31:0] pmx_1_5    ;
reg [31:0] pmy_1_5    ;
reg [31:0] pmm_1_5    ;
reg [31:0] lambda0_1_5;
reg [31:0] lambda1_1_5;
reg [ 7:0] r_in_1_5   ;

reg [31:0] pmx_1_6    ;
reg [31:0] pmy_1_6    ;
reg [31:0] pmm_1_6    ;
reg [31:0] lambda0_1_6;
reg [31:0] lambda1_1_6;
reg [ 7:0] r_in_1_6   ;

reg [31:0] pmx_1_7    ;
reg [31:0] pmy_1_7    ;
reg [31:0] pmm_1_7    ;
reg [31:0] lambda0_1_7;
reg [31:0] lambda1_1_7;
reg [ 7:0] r_in_1_7   ;



//-------------------------------s2------------------------------//
reg        matrix_memory_sop_2 ;
reg        matrix_memory_eop_2 ;
reg        matrix_memory_vld_2 ;
reg [31:0] matrix_memory_data_2;
reg [31:0] M_write_2           ;
reg [31:0] X_write_2            ;
reg        vld_2 				;
reg 	   init_out_2 			;

wire         pkt_receive_enable_2;
wire [ 31:0] ram_out_2           ;
wire [  7:0] q_2                 ;
wire [  7:0] i_2                 ;
wire [  7:0] R_2                 ;
wire [  7:0] H_2                 ;
wire [ 31:0] M_read_2            ;
wire [ 31:0] X_read_2            ;
wire         parameter_vld_2     ;
wire         en_sum_2            ;
wire         mode_2              ;
wire [5:0]   sum_select_2        ;
wire         sum_vld_2           ;
wire [ 31:0] y_initial_2         ;
wire         init_2              ;
wire [ 63:0] head_2              ;
wire [  5:0] pe_cnt_2 			 ;

reg [31:0] pmx_2_0    ;
reg [31:0] pmy_2_0    ;
reg [31:0] pmm_2_0    ;
reg [31:0] lambda0_2_0;
reg [31:0] lambda1_2_0;
reg [ 7:0] r_in_2_0   ;

reg [31:0] pmx_2_1    ;
reg [31:0] pmy_2_1    ;
reg [31:0] pmm_2_1    ;
reg [31:0] lambda0_2_1;
reg [31:0] lambda1_2_1;
reg [ 7:0] r_in_2_1   ;

reg [31:0] pmx_2_2    ;
reg [31:0] pmy_2_2    ;
reg [31:0] pmm_2_2    ;
reg [31:0] lambda0_2_2;
reg [31:0] lambda1_2_2;
reg [ 7:0] r_in_2_2   ;

reg [31:0] pmx_2_3    ;
reg [31:0] pmy_2_3    ;
reg [31:0] pmm_2_3    ;
reg [31:0] lambda0_2_3;
reg [31:0] lambda1_2_3;
reg [ 7:0] r_in_2_3   ;

reg [31:0] pmx_2_4    ;
reg [31:0] pmy_2_4    ;
reg [31:0] pmm_2_4    ;
reg [31:0] lambda0_2_4;
reg [31:0] lambda1_2_4;
reg [ 7:0] r_in_2_4   ;

reg [31:0] pmx_2_5    ;
reg [31:0] pmy_2_5    ;
reg [31:0] pmm_2_5    ;
reg [31:0] lambda0_2_5;
reg [31:0] lambda1_2_5;
reg [ 7:0] r_in_2_5   ;

reg [31:0] pmx_2_6    ;
reg [31:0] pmy_2_6    ;
reg [31:0] pmm_2_6    ;
reg [31:0] lambda0_2_6;
reg [31:0] lambda1_2_6;
reg [ 7:0] r_in_2_6   ;

reg [31:0] pmx_2_7    ;
reg [31:0] pmy_2_7    ;
reg [31:0] pmm_2_7    ;
reg [31:0] lambda0_2_7;
reg [31:0] lambda1_2_7;
reg [ 7:0] r_in_2_7   ;

//-------------------------------s3------------------------------//
reg        matrix_memory_sop_3 ;
reg        matrix_memory_eop_3 ;
reg        matrix_memory_vld_3 ;
reg [31:0] matrix_memory_data_3;
reg [31:0] M_write_3           ;
reg [31:0] X_write_3            ;
reg        vld_3 				;
reg 	   init_out_3 			;

wire         pkt_receive_enable_3;
wire [ 31:0] ram_out_3           ;
wire [  7:0] q_3                 ;
wire [  7:0] i_3                 ;
wire [  7:0] R_3                 ;
wire [  7:0] H_3                 ;
wire [ 31:0] M_read_3            ;
wire [ 31:0] X_read_3            ;
wire         parameter_vld_3     ;
wire         en_sum_3            ;
wire         mode_3              ;
wire [5:0]   sum_select_3        ;
wire         sum_vld_3           ;
wire [ 31:0] y_initial_3         ;
wire         init_3              ;
wire [ 63:0] head_3              ;
wire [  5:0] pe_cnt_3 			 ;


reg [31:0] pmx_3_0    ;
reg [31:0] pmy_3_0    ;
reg [31:0] pmm_3_0    ;
reg [31:0] lambda0_3_0;
reg [31:0] lambda1_3_0;
reg [ 7:0] r_in_3_0   ;

reg [31:0] pmx_3_1    ;
reg [31:0] pmy_3_1    ;
reg [31:0] pmm_3_1    ;
reg [31:0] lambda0_3_1;
reg [31:0] lambda1_3_1;
reg [ 7:0] r_in_3_1   ;

reg [31:0] pmx_3_2    ;
reg [31:0] pmy_3_2    ;
reg [31:0] pmm_3_2    ;
reg [31:0] lambda0_3_2;
reg [31:0] lambda1_3_2;
reg [ 7:0] r_in_3_2   ;

reg [31:0] pmx_3_3    ;
reg [31:0] pmy_3_3    ;
reg [31:0] pmm_3_3    ;
reg [31:0] lambda0_3_3;
reg [31:0] lambda1_3_3;
reg [ 7:0] r_in_3_3   ;

reg [31:0] pmx_3_4    ;
reg [31:0] pmy_3_4    ;
reg [31:0] pmm_3_4    ;
reg [31:0] lambda0_3_4;
reg [31:0] lambda1_3_4;
reg [ 7:0] r_in_3_4   ;

reg [31:0] pmx_3_5    ;
reg [31:0] pmy_3_5    ;
reg [31:0] pmm_3_5    ;
reg [31:0] lambda0_3_5;
reg [31:0] lambda1_3_5;
reg [ 7:0] r_in_3_5   ;

reg [31:0] pmx_3_6    ;
reg [31:0] pmy_3_6    ;
reg [31:0] pmm_3_6    ;
reg [31:0] lambda0_3_6;
reg [31:0] lambda1_3_6;
reg [ 7:0] r_in_3_6   ;

reg [31:0] pmx_3_7    ;
reg [31:0] pmy_3_7    ;
reg [31:0] pmm_3_7    ;
reg [31:0] lambda0_3_7;
reg [31:0] lambda1_3_7;
reg [ 7:0] r_in_3_7   ;



//-------------------------------s4------------------------------//
reg        matrix_memory_sop_4 ;
reg        matrix_memory_eop_4 ;
reg        matrix_memory_vld_4 ;
reg [31:0] matrix_memory_data_4;
reg [31:0] M_write_4           ;
reg [31:0] X_write_4            ;
reg        vld_4 				;
reg 	   init_out_4 			;

wire         pkt_receive_enable_4;
wire [ 31:0] ram_out_4           ;
wire [  7:0] q_4                 ;
wire [  7:0] i_4                 ;
wire [  7:0] R_4                 ;
wire [  7:0] H_4                 ;
wire [ 31:0] M_read_4            ;
wire [ 31:0] X_read_4            ;
wire         parameter_vld_4     ;
wire         en_sum_4            ;
wire         mode_4              ;
wire [5:0]   sum_select_4        ;
wire         sum_vld_4           ;
wire [ 31:0] y_initial_4         ;
wire         init_4              ;
wire [ 63:0] head_4              ;
wire [  5:0] pe_cnt_4 			 ;


reg [31:0] pmx_4_0    ;
reg [31:0] pmy_4_0    ;
reg [31:0] pmm_4_0    ;
reg [31:0] lambda0_4_0;
reg [31:0] lambda1_4_0;
reg [ 7:0] r_in_4_0   ;

reg [31:0] pmx_4_1    ;
reg [31:0] pmy_4_1    ;
reg [31:0] pmm_4_1    ;
reg [31:0] lambda0_4_1;
reg [31:0] lambda1_4_1;
reg [ 7:0] r_in_4_1   ;

reg [31:0] pmx_4_2    ;
reg [31:0] pmy_4_2    ;
reg [31:0] pmm_4_2    ;
reg [31:0] lambda0_4_2;
reg [31:0] lambda1_4_2;
reg [ 7:0] r_in_4_2   ;

reg [31:0] pmx_4_3    ;
reg [31:0] pmy_4_3    ;
reg [31:0] pmm_4_3    ;
reg [31:0] lambda0_4_3;
reg [31:0] lambda1_4_3;
reg [ 7:0] r_in_4_3   ;

reg [31:0] pmx_4_4    ;
reg [31:0] pmy_4_4    ;
reg [31:0] pmm_4_4    ;
reg [31:0] lambda0_4_4;
reg [31:0] lambda1_4_4;
reg [ 7:0] r_in_4_4   ;

reg [31:0] pmx_4_5    ;
reg [31:0] pmy_4_5    ;
reg [31:0] pmm_4_5    ;
reg [31:0] lambda0_4_5;
reg [31:0] lambda1_4_5;
reg [ 7:0] r_in_4_5   ;

reg [31:0] pmx_4_6    ;
reg [31:0] pmy_4_6    ;
reg [31:0] pmm_4_6    ;
reg [31:0] lambda0_4_6;
reg [31:0] lambda1_4_6;
reg [ 7:0] r_in_4_6   ;

reg [31:0] pmx_4_7    ;
reg [31:0] pmy_4_7    ;
reg [31:0] pmm_4_7    ;
reg [31:0] lambda0_4_7;
reg [31:0] lambda1_4_7;
reg [ 7:0] r_in_4_7   ;

//-------------------------------s5------------------------------//
reg        matrix_memory_sop_5 ;
reg        matrix_memory_eop_5 ;
reg        matrix_memory_vld_5 ;
reg [31:0] matrix_memory_data_5;
reg [31:0] M_write_5           ;
reg [31:0] X_write_5            ;
reg        vld_5 				;
reg 	   init_out_5 			;

wire         pkt_receive_enable_5;
wire [ 31:0] ram_out_5           ;
wire [  7:0] q_5                 ;
wire [  7:0] i_5                 ;
wire [  7:0] R_5                 ;
wire [  7:0] H_5                 ;
wire [ 31:0] M_read_5            ;
wire [ 31:0] X_read_5            ;
wire         parameter_vld_5     ;
wire         en_sum_5            ;
wire         mode_5              ;
wire [5:0]   sum_select_5        ;
wire         sum_vld_5           ;
wire [ 31:0] y_initial_5         ;
wire         init_5              ;
wire [ 63:0] head_5              ;
wire [  5:0] pe_cnt_5 			 ;

reg [31:0] pmx_5_0    ;
reg [31:0] pmy_5_0    ;
reg [31:0] pmm_5_0    ;
reg [31:0] lambda0_5_0;
reg [31:0] lambda1_5_0;
reg [ 7:0] r_in_5_0   ;

reg [31:0] pmx_5_1    ;
reg [31:0] pmy_5_1    ;
reg [31:0] pmm_5_1    ;
reg [31:0] lambda0_5_1;
reg [31:0] lambda1_5_1;
reg [ 7:0] r_in_5_1   ;

reg [31:0] pmx_5_2    ;
reg [31:0] pmy_5_2    ;
reg [31:0] pmm_5_2    ;
reg [31:0] lambda0_5_2;
reg [31:0] lambda1_5_2;
reg [ 7:0] r_in_5_2   ;

reg [31:0] pmx_5_3    ;
reg [31:0] pmy_5_3    ;
reg [31:0] pmm_5_3    ;
reg [31:0] lambda0_5_3;
reg [31:0] lambda1_5_3;
reg [ 7:0] r_in_5_3   ;

reg [31:0] pmx_5_4    ;
reg [31:0] pmy_5_4    ;
reg [31:0] pmm_5_4    ;
reg [31:0] lambda0_5_4;
reg [31:0] lambda1_5_4;
reg [ 7:0] r_in_5_4   ;

reg [31:0] pmx_5_5    ;
reg [31:0] pmy_5_5    ;
reg [31:0] pmm_5_5    ;
reg [31:0] lambda0_5_5;
reg [31:0] lambda1_5_5;
reg [ 7:0] r_in_5_5   ;

reg [31:0] pmx_5_6    ;
reg [31:0] pmy_5_6    ;
reg [31:0] pmm_5_6    ;
reg [31:0] lambda0_5_6;
reg [31:0] lambda1_5_6;
reg [ 7:0] r_in_5_6   ;

reg [31:0] pmx_5_7    ;
reg [31:0] pmy_5_7    ;
reg [31:0] pmm_5_7    ;
reg [31:0] lambda0_5_7;
reg [31:0] lambda1_5_7;
reg [ 7:0] r_in_5_7   ;


//-------------------------------check rom------------------------------//
reg  [ 7:0] addr_check0_a;
reg  [ 7:0] addr_check1_a; 

wire [31:0] check0_a_q;
wire [31:0] check1_a_q;

reg  [ 7:0] addr_check0_b;
reg  [ 7:0] addr_check1_b;
reg  [ 7:0] addr_check2_b;

wire [31:0] check0_b_q;
wire [31:0] check1_b_q;
wire [31:0] check2_b_q;

//-------------------------------reg and wire ------------------------------//
reg S0_done;
reg S1_done;
reg S2_done;
reg S3_done;
reg S4_done;
reg S5_done;


/*-------------------------------------------------------------------*\
                                 Main code       
\*-------------------------------------------------------------------*/
reg [5:0] current_state;
reg [5:0] next_state;


assign pkt_receive_enable = temp_enable1 & temp_enable2;



always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable2 <= 1'b0;
	end else if (fifo_almost_full && matrix_memory_sop ) begin
		temp_enable2 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable2 <= 1'b1;
end

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		current_state <= 6'b000001;
	end else begin 
		current_state <= next_state;
	end 
end


always @(*)
begin
	next_state = current_state;
	case (current_state)
		S0: begin 
			if (S0_done) begin 
				next_state = S1;
			end
		end


		S1: begin 
			if (S1_done) begin
				next_state = S2;
			end
		end

		S2: begin 
			if (S2_done) begin 
				next_state = S3;
			end
		end

		S3: begin 
			if (S3_done) begin 
				next_state = S4;
			end
		end

		S4: begin 
			if (S4_done) begin 
				next_state = S5;
			end
		end

		S5: begin 
			if (S5_done) begin 
				next_state = S0;
			end
		end
	endcase // current_state
end

 
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	case (current_state)
		S0: begin 
				temp_enable1 <= pkt_receive_enable_0;
			end

		S1: begin 
				temp_enable1 <= pkt_receive_enable_1;
			end

		S2: begin 
				temp_enable1 <= pkt_receive_enable_2;
			end

		S3: begin 
				temp_enable1 <= pkt_receive_enable_3;
			end

		S4: begin 
				temp_enable1 <= pkt_receive_enable_4;
			end

		S5: begin 
				temp_enable1 <= pkt_receive_enable_5;
			end
	endcase
end


/*--------------------------S0-------------------------*/
always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(!sys_rst_n) begin
		S0_done <= 1'b0;
	end else if ((!pkt_receive_enable_0) & (matrix_memory_vld != 1)) begin 
		S0_done <= 1'b1;
	end else begin 
		S0_done <= 1'b0;
	end
end
 
 
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		matrix_memory_sop_0  <= 1'b0;
		matrix_memory_eop_0  <= 1'b0;
		matrix_memory_vld_0  <= 1'b0;
		matrix_memory_data_0 <= 32'd0;
	end else if (current_state == S0) begin 
		matrix_memory_sop_0  <= matrix_memory_sop;
		matrix_memory_eop_0  <= matrix_memory_eop;
		matrix_memory_vld_0  <= matrix_memory_vld;
		matrix_memory_data_0 <= matrix_memory_data;
	end else if (current_state == S1) begin
		matrix_memory_sop_0  <= 1'b0;
		matrix_memory_eop_0  <= 1'b0;
		matrix_memory_vld_0  <= 1'b0;
		matrix_memory_data_0 <= 32'd0;
	end
end
/*--------------------------S1-------------------------*/
always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(!sys_rst_n) begin
		S1_done <= 1'b0;
	end else if ((!pkt_receive_enable_1) & (matrix_memory_vld != 1)) begin 
		S1_done <= 1'b1;
	end else begin 
		S1_done <= 1'b0;
	end
end
 
 
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		matrix_memory_sop_1  <= 1'b0;
		matrix_memory_eop_1  <= 1'b0;
		matrix_memory_vld_1  <= 1'b0;
		matrix_memory_data_1 <= 32'd0;
	end else if (current_state == S1) begin 
		matrix_memory_sop_1  <= matrix_memory_sop;
		matrix_memory_eop_1  <= matrix_memory_eop;
		matrix_memory_vld_1  <= matrix_memory_vld;
		matrix_memory_data_1 <= matrix_memory_data;
	end else if (current_state == S2) begin
		matrix_memory_sop_1  <= 1'b0;
		matrix_memory_eop_1  <= 1'b0;
		matrix_memory_vld_1  <= 1'b0;
		matrix_memory_data_1 <= 32'd0;
	end
end
/*--------------------------S2-------------------------*/
always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(!sys_rst_n) begin
		S2_done <= 1'b0;
	end else if ((!pkt_receive_enable_2) & (matrix_memory_vld != 1)) begin 
		S2_done <= 1'b1;
	end else begin 
		S2_done <= 1'b0;
	end
end
 
 
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		matrix_memory_sop_2  <= 1'b0;
		matrix_memory_eop_2  <= 1'b0;
		matrix_memory_vld_2  <= 1'b0;
		matrix_memory_data_2 <= 32'd0;
	end else if (current_state == S2) begin 
		matrix_memory_sop_2  <= matrix_memory_sop;
		matrix_memory_eop_2  <= matrix_memory_eop;
		matrix_memory_vld_2  <= matrix_memory_vld;
		matrix_memory_data_2 <= matrix_memory_data;
	end else if (current_state == S3) begin
		matrix_memory_sop_2  <= 1'b0;
		matrix_memory_eop_2  <= 1'b0;
		matrix_memory_vld_2  <= 1'b0;
		matrix_memory_data_2 <= 32'd0;
	end
end
/*--------------------------S3-------------------------*/
always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(!sys_rst_n) begin
		S3_done <= 1'b0;
	end else if ((!pkt_receive_enable_3) & (matrix_memory_vld != 1)) begin 
		S3_done <= 1'b1;
	end else begin 
		S3_done <= 1'b0;
	end
end
 
 
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		matrix_memory_sop_3  <= 1'b0;
		matrix_memory_eop_3  <= 1'b0;
		matrix_memory_vld_3  <= 1'b0;
		matrix_memory_data_3 <= 32'd0;
	end else if (current_state == S3) begin 
		matrix_memory_sop_3  <= matrix_memory_sop;
		matrix_memory_eop_3  <= matrix_memory_eop;
		matrix_memory_vld_3  <= matrix_memory_vld;
		matrix_memory_data_3 <= matrix_memory_data;
	end else if (current_state == S4) begin
		matrix_memory_sop_3  <= 1'b0;
		matrix_memory_eop_3  <= 1'b0;
		matrix_memory_vld_3  <= 1'b0;
		matrix_memory_data_3 <= 32'd0;
	end
end
/*--------------------------S4-------------------------*/
always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(!sys_rst_n) begin
		S4_done <= 1'b0;
	end else if ((!pkt_receive_enable_4) & (matrix_memory_vld != 1)) begin 
		S4_done <= 1'b1;
	end else begin 
		S4_done <= 1'b0;
	end
end
 
 
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		matrix_memory_sop_4  <= 1'b0;
		matrix_memory_eop_4  <= 1'b0;
		matrix_memory_vld_4  <= 1'b0;
		matrix_memory_data_4 <= 32'd0;
	end else if (current_state == S4) begin 
		matrix_memory_sop_4  <= matrix_memory_sop;
		matrix_memory_eop_4  <= matrix_memory_eop;
		matrix_memory_vld_4  <= matrix_memory_vld;
		matrix_memory_data_4 <= matrix_memory_data;
	end else if (current_state == S5) begin
		matrix_memory_sop_4  <= 1'b0;
		matrix_memory_eop_4  <= 1'b0;
		matrix_memory_vld_4  <= 1'b0;
		matrix_memory_data_4 <= 32'd0;
	end
end
/*--------------------------S5-------------------------*/
always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(!sys_rst_n) begin
		S5_done <= 1'b0;
	end else if ((!pkt_receive_enable_5) & (matrix_memory_vld != 1)) begin 
		S5_done <= 1'b1;
	end else begin 
		S5_done <= 1'b0;
	end
end
 
 
always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		matrix_memory_sop_5  <= 1'b0;
		matrix_memory_eop_5  <= 1'b0;
		matrix_memory_vld_5  <= 1'b0;
		matrix_memory_data_5 <= 32'd0;
	end else if (current_state == S5) begin 
		matrix_memory_sop_5  <= matrix_memory_sop;
		matrix_memory_eop_5  <= matrix_memory_eop;
		matrix_memory_vld_5  <= matrix_memory_vld;
		matrix_memory_data_5 <= matrix_memory_data;
	end else if (current_state == S0) begin
		matrix_memory_sop_5  <= 1'b0;
		matrix_memory_eop_5  <= 1'b0;
		matrix_memory_vld_5  <= 1'b0;
		matrix_memory_data_5 <= 32'd0;
	end
end


reg [5:0] shift_reg;


always @(posedge sys_clk or negedge sys_rst_n) begin
	if(!sys_rst_n) begin
		shift_reg <= 6'b000001;
	end else begin 
		shift_reg <= {shift_reg[4:0],shift_reg[5]};
	end 
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin	
		vld_0 <= 1'b0;
 	end else if (shift_reg == T0) begin
		vld_0 <= 1'b1;
	end else if (shift_reg == T1) begin
		vld_0 <= 1'b0;
	end
end
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin	
		vld_1 <= 1'b0;
 	end else if (shift_reg == T1) begin
		vld_1 <= 1'b1;
	end else if (shift_reg == T2) begin
		vld_1 <= 1'b0;
	end
end
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin	
		vld_2 <= 1'b0;
 	end else if (shift_reg == T2) begin
		vld_2 <= 1'b1;
	end else if (shift_reg == T3) begin
		vld_2 <= 1'b0;
	end
end
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin	
		vld_3 <= 1'b0;
 	end else if (shift_reg == T3) begin
		vld_3 <= 1'b1;
	end else if (shift_reg == T4) begin
		vld_3 <= 1'b0;
	end
end
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin	
		vld_4 <= 1'b0;
 	end else if (shift_reg == T4) begin
		vld_4 <= 1'b1;
	end else if (shift_reg == T5) begin
		vld_4 <= 1'b0;
	end
end
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin	
		vld_5 <= 1'b0;
 	end else if (shift_reg == T5) begin
		vld_5 <= 1'b1;
	end else if (shift_reg == T0) begin
		vld_5 <= 1'b0;
	end
end
/*-------------------------------------------------------------------*\
                          save_send to PU8
\*-------------------------------------------------------------------*/

//---------------------------check operation-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	case (shift_reg)
		T0 : begin 
				addr_check0_a <= ram_out_1[15:8];
				addr_check1_a <= ram_out_1[23:16];
				addr_check0_b <= i_4;
				addr_check1_b <= q_4;
				addr_check2_b <= q_4;

				en_sum        <= en_sum_0;
				mode  		  <= mode_0  ;
				sum_select    <= sum_select_0;
				sum_vld 	  <= sum_vld_0;
				y_initial 	  <= y_initial_0;
				init 		  <= init_0;
				head 		  <= head_0;
				M_read 		  <= M_read_0;
				h_in 		  <= H_0;
				M_read 		  <= M_read_0;
				X_read 		  <= X_read_0;
			end

		T1 : begin 
				addr_check0_a <= ram_out_2[15:8];
				addr_check1_a <= ram_out_2[23:16];
				addr_check0_b <= i_5;
				addr_check1_b <= q_5;
				addr_check2_b <= q_5;

				en_sum        <= en_sum_1;
				mode  		  <= mode_1  ;
				sum_select    <= sum_select_1;
				sum_vld 	  <= sum_vld_1;
				y_initial 	  <= y_initial_1;
				init 		  <= init_1;
				head 		  <= head_1;
				M_read 		  <= M_read_1;
				h_in 		  <= H_1;
				M_read 		  <= M_read_1;
				X_read 		  <= X_read_1;
			end

		T2 : begin 
				addr_check0_a <= ram_out_3[15:8];
				addr_check1_a <= ram_out_3[23:16];
				addr_check0_b <= i_0;
				addr_check1_b <= q_0;
				addr_check2_b <= q_0;

				en_sum        <= en_sum_2;
				mode  		  <= mode_2  ;
				sum_select    <= sum_select_2;
				sum_vld 	  <= sum_vld_2;
				y_initial 	  <= y_initial_2;
				init 		  <= init_2;
				head 		  <= head_2;
				M_read 		  <= M_read_2;
				h_in 		  <= H_2;
				M_read 		  <= M_read_2;
				X_read 		  <= X_read_2;
			end

		T3 : begin 
				addr_check0_a <= ram_out_4[15:8];
				addr_check1_a <= ram_out_4[23:16];
				addr_check0_b <= i_1;
				addr_check1_b <= q_1;
				addr_check2_b <= q_1;

				en_sum        <= en_sum_3;
				mode  		  <= mode_3  ;
				sum_select    <= sum_select_3;
				sum_vld 	  <= sum_vld_3;
				y_initial 	  <= y_initial_3;
				init 		  <= init_3;
				head 		  <= head_3;
				M_read 		  <= M_read_3;
				h_in 		  <= H_3;
				M_read 		  <= M_read_3;
				X_read 		  <= X_read_3;
			end

		T4 : begin 
				addr_check0_a <= ram_out_5[15:8];
				addr_check1_a <= ram_out_5[23:16];
				addr_check0_b <= i_2;
				addr_check1_b <= q_2;
				addr_check2_b <= q_2;

				en_sum        <= en_sum_4;
				mode  		  <= mode_4  ;
				sum_select    <= sum_select_4;
				sum_vld 	  <= sum_vld_4;
				y_initial 	  <= y_initial_4;
				init 		  <= init_4;
				head 		  <= head_4;
				M_read 		  <= M_read_4;
				h_in 		  <= H_4;
				M_read 		  <= M_read_4;
				X_read 		  <= X_read_4;
			end

		T5 : begin 
				addr_check0_a <= ram_out_0[15:8];
				addr_check1_a <= ram_out_0[23:16];
				addr_check0_b <= i_3;
				addr_check1_b <= q_3;
				addr_check2_b <= q_3;

				en_sum        <= en_sum_5;
				mode  		  <= mode_5  ;
				sum_select    <= sum_select_5;
				sum_vld 	  <= sum_vld_5;
				y_initial 	  <= y_initial_5;
				init 		  <= init_5;
				head 		  <= head_5;
				M_read 		  <= M_read_5;
				h_in 		  <= H_5;
				M_read 		  <= M_read_5;
				X_read 		  <= X_read_5;
			end
	endcase
end

reg [31:0] p_my_reg_0;
reg [31:0] p_my_reg_1;
reg [31:0] p_my_reg_2;
reg [31:0] p_my_reg_3;
reg [31:0] p_my_reg_4;
reg [31:0] p_my_reg_5;
reg [31:0] p_my_reg_6;
reg [31:0] p_my_reg_7;
reg [31:0] p_my_reg_8;

always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		p_my_reg_0 <= 32'd0;
		p_my_reg_1 <= 32'd0;
		p_my_reg_2 <= 32'd0;
		p_my_reg_3 <= 32'd0;
		p_my_reg_4 <= 32'd0;
		p_my_reg_5 <= 32'd0;
		p_my_reg_6 <= 32'd0;
		p_my_reg_7 <= 32'd0;
		p_my_reg_8 <= 32'd0;
	end else begin 
		p_my_reg_0 <= check0_a_q;
		p_my_reg_1 <= p_my_reg_0;
		p_my_reg_2 <= p_my_reg_1;
		p_my_reg_3 <= p_my_reg_2;
		p_my_reg_4 <= p_my_reg_3;
		p_my_reg_5 <= p_my_reg_4;
		p_my_reg_6 <= p_my_reg_5;
		p_my_reg_7 <= p_my_reg_6;
		p_my_reg_8 <= p_my_reg_7;
	end
end

//---------------------------T0-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		pmx_1_0     <= 32'd0;
		pmy_1_0     <= 32'd0;
		pmm_1_0     <= 32'd0;
		lambda0_1_0 <= 32'd0;
		lambda1_1_0 <= 32'd0;
		r_in_1_0    <= 8'd0 ;
		pmx_1_1     <= 32'd0;
		pmy_1_1     <= 32'd0;
		pmm_1_1     <= 32'd0;
		lambda0_1_1 <= 32'd0;
		lambda1_1_1 <= 32'd0;
		r_in_1_1    <= 8'd0 ;
		pmx_1_2     <= 32'd0;
		pmy_1_2     <= 32'd0;
		pmm_1_2     <= 32'd0;
		lambda0_1_2 <= 32'd0;
		lambda1_1_2 <= 32'd0;
		r_in_1_2    <= 8'd0 ;
		pmx_1_3     <= 32'd0;
		pmy_1_3     <= 32'd0;
		pmm_1_3     <= 32'd0;
		lambda0_1_3 <= 32'd0;
		lambda1_1_3 <= 32'd0;
		r_in_1_3    <= 8'd0 ;
		pmx_1_4  	<= 0 	;
		pmy_1_4  	<= 0 	;
		pmm_1_4  	<= 0 	;
		lambda0_1_4 <= 0 	;
		lambda1_1_4 <= 0 	;
		r_in_1_4 	<= 0 	;
		pmx_1_5  	<= 0 	;
		pmy_1_5  	<= 0 	;
		pmm_1_5  	<= 0 	;
		lambda0_1_5 <= 0 	;
		lambda1_1_5 <= 0 	;
		r_in_1_5 	<= 0 	;
		pmx_1_6  	<= 0 	;
		pmy_1_6  	<= 0 	;
		pmm_1_6  	<= 0 	;
		lambda0_1_6 <= 0 	;
		lambda1_1_6 <= 0 	;
		r_in_1_6 	<= 0 	;
		pmx_1_7  	<= 0 	;
		pmy_1_7  	<= 0 	;
		pmm_1_7  	<= 0 	;
		lambda0_1_7 <= 0 	;
		lambda1_1_7 <= 0 	;
		r_in_1_7 	<= 0 	;
	end else if (parameter_vld_1) begin 
		case (pe_cnt_1) 
			6'd0: begin 
				pmx_1_0     <= check0_b_q    ;
				pmy_1_0     <= p_my_reg_8    ;
				pmm_1_0     <= sub_q    	 ;
				lambda0_1_0 <= check1_b_q	 ;
				lambda1_1_0 <= check2_b_q 	 ;
				r_in_1_0    <= R_1      	 ;
			end

			6'd1: begin
				pmx_1_1     <=  check0_b_q   ;
				pmy_1_1     <=  p_my_reg_8   ;
				pmm_1_1     <=  sub_q    	 ;
				lambda0_1_1 <=  check1_b_q	 ;
				lambda1_1_1 <=  check2_b_q   ;
				r_in_1_1    <=  R_1      	 ;
			end

			6'd2: begin 
				pmx_1_2     <= check0_b_q    ;
				pmy_1_2     <= p_my_reg_8    ;
				pmm_1_2     <= sub_q    	 ;
				lambda0_1_2 <= check1_b_q	 ;
				lambda1_1_2 <= check2_b_q 	 ;
				r_in_1_2    <= R_1      	 ;
			end

			6'd3: begin 
				pmx_1_3     <= check0_b_q    ;
				pmy_1_3     <= p_my_reg_8    ;
				pmm_1_3     <= sub_q    	 ;
				lambda0_1_3 <= check1_b_q	 ;
				lambda1_1_3 <= check2_b_q 	 ;
				r_in_1_3    <= R_1      	 ;
			end

			6'd4: begin 
				pmx_1_4  	<= check0_b_q    ;
				pmy_1_4  	<= p_my_reg_8    ;
				pmm_1_4  	<= sub_q    	 ;
				lambda0_1_4 <= check1_b_q	 ;
				lambda1_1_4 <= check2_b_q 	 ;
				r_in_1_4 	<= R_1      	 ;
			end
 
			6'd5: begin 
				pmx_1_5  	<= check0_b_q    ;
				pmy_1_5  	<= p_my_reg_8    ;
				pmm_1_5  	<= sub_q    	 ;
				lambda0_1_5 <= check1_b_q	 ;
				lambda1_1_5 <= check2_b_q 	 ;
				r_in_1_5 	<= R_1      	 ;
			end
 
			6'd6: begin 
				pmx_1_6  	<= check0_b_q    ;
				pmy_1_6  	<= p_my_reg_8    ;
				pmm_1_6  	<= sub_q    	 ;
				lambda0_1_6 <= check1_b_q	 ;
				lambda1_1_6 <= check2_b_q 	 ;
				r_in_1_6 	<= R_1      	 ;
			end
 
			6'd7: begin 
				pmx_1_7  	<= check0_b_q    ;
				pmy_1_7  	<= p_my_reg_8    ;
				pmm_1_7  	<= sub_q    	 ;
				lambda0_1_7 <= check1_b_q	 ;
				lambda1_1_7 <= check2_b_q 	 ;
				r_in_1_7 	<= R_1      	 ;
			end

		endcase // pe_cnt
	end
end

//---------------------------T1-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		pmx_2_0     <= 32'd0;
		pmy_2_0     <= 32'd0;
		pmm_2_0     <= 32'd0;
		lambda0_2_0 <= 32'd0;
		lambda1_2_0 <= 32'd0;
		r_in_2_0    <= 8'd0;
		pmx_2_1     <= 32'd0;
		pmy_2_1     <= 32'd0;
		pmm_2_1     <= 32'd0;
		lambda0_2_1 <= 32'd0;
		lambda1_2_1 <= 32'd0;
		r_in_2_1    <= 8'd0;
		pmx_2_2     <= 32'd0;
		pmy_2_2     <= 32'd0;
		pmm_2_2     <= 32'd0;
		lambda0_2_2 <= 32'd0;
		lambda1_2_2 <= 32'd0;
		r_in_2_2    <= 8'd0;
		pmx_2_3     <= 32'd0;
		pmy_2_3     <= 32'd0;
		pmm_2_3     <= 32'd0;
		lambda0_2_3 <= 32'd0;
		lambda1_2_3 <= 32'd0;
		r_in_2_3    <= 8'd0;
		pmx_2_4  	<= 0;
		pmy_2_4  	<= 0;
		pmm_2_4  	<= 0;
		lambda0_2_4 <= 0;
		lambda1_2_4 <= 0;
		r_in_2_4 	<= 0;
		pmx_2_5  	<= 0;
		pmy_2_5  	<= 0;
		pmm_2_5  	<= 0;
		lambda0_2_5 <= 0;
		lambda1_2_5 <= 0;
		r_in_2_5 	<= 0;
		pmx_2_6  	<= 0;
		pmy_2_6  	<= 0;
		pmm_2_6  	<= 0;
		lambda0_2_6 <= 0;
		lambda1_2_6 <= 0;
		r_in_2_6 	<= 0;
		pmx_2_7  	<= 0;
		pmy_2_7  	<= 0;
		pmm_2_7  	<= 0;
		lambda0_2_7 <= 0;
		lambda1_2_7 <= 0;
		r_in_2_7 	<= 0;
	end else if (parameter_vld_2) begin 
		case (pe_cnt_2) 
			6'd0: begin 
				pmx_2_0     <= check0_b_q    ;
				pmy_2_0     <= p_my_reg_8    ;
				pmm_2_0     <= sub_q    	 ;
				lambda0_2_0 <= check1_b_q	 ;
				lambda1_2_0 <= check2_b_q 	 ;
				r_in_2_0    <= R_2           ;
			end

			6'd1: begin
				pmx_2_1     <=  check0_b_q   ;
				pmy_2_1     <=  p_my_reg_8   ;
				pmm_2_1     <=  sub_q    	 ;
				lambda0_2_1 <=  check1_b_q	 ;
				lambda1_2_1 <=  check2_b_q   ;
				r_in_2_1    <=  R_2   		 ;        
			end

			6'd2: begin 
				pmx_2_2     <= check0_b_q    ;
				pmy_2_2     <= p_my_reg_8    ;
				pmm_2_2     <= sub_q    	 ;
				lambda0_2_2 <= check1_b_q	 ;
				lambda1_2_2 <= check2_b_q 	 ;
				r_in_2_2    <= R_2           ;
			end

			6'd3: begin 
				pmx_2_3     <= check0_b_q    ;
				pmy_2_3     <= p_my_reg_8    ;
				pmm_2_3     <= sub_q    	 ;
				lambda0_2_3 <= check1_b_q	 ;
				lambda1_2_3 <= check2_b_q 	 ;
				r_in_2_3    <= R_2           ;
			end

			6'd4: begin 
				pmx_2_4  	<= check0_b_q    ;
				pmy_2_4  	<= p_my_reg_8    ;
				pmm_2_4  	<= sub_q    	 ;
				lambda0_2_4 <= check1_b_q	 ;
				lambda1_2_4 <= check2_b_q 	 ;
				r_in_2_4 	<= R_2           ;
			end
 
			6'd5: begin 
				pmx_2_5  	<= check0_b_q    ;
				pmy_2_5  	<= p_my_reg_8    ;
				pmm_2_5  	<= sub_q    	 ;
				lambda0_2_5 <= check1_b_q	 ;
				lambda1_2_5 <= check2_b_q 	 ;
				r_in_2_5 	<= R_2           ;
			end
 
			6'd6: begin 
				pmx_2_6  	<= check0_b_q    ;
				pmy_2_6  	<= p_my_reg_8    ;
				pmm_2_6  	<= sub_q    	 ;
				lambda0_2_6 <= check1_b_q	 ;
				lambda1_2_6 <= check2_b_q 	 ;
				r_in_2_6 	<= R_2           ;
			end
 
			6'd7: begin 
				pmx_2_7  	<= check0_b_q    ;
				pmy_2_7  	<= p_my_reg_8    ;
				pmm_2_7  	<= sub_q    	 ;
				lambda0_2_7 <= check1_b_q	 ;
				lambda1_2_7 <= check2_b_q 	 ;
				r_in_2_7 	<= R_2           ;
			end

		endcase // pe_cnt
	end
end


//---------------------------T2-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		pmx_3_0     <= 32'd0;
		pmy_3_0     <= 32'd0;
		pmm_3_0     <= 32'd0;
		lambda0_3_0 <= 32'd0;
		lambda1_3_0 <= 32'd0;
		r_in_3_0    <= 8'd0;
		pmx_3_1     <= 32'd0;
		pmy_3_1     <= 32'd0;
		pmm_3_1     <= 32'd0;
		lambda0_3_1 <= 32'd0;
		lambda1_3_1 <= 32'd0;
		r_in_3_1    <= 8'd0;
		pmx_3_2     <= 32'd0;
		pmy_3_2     <= 32'd0;
		pmm_3_2     <= 32'd0;
		lambda0_3_2 <= 32'd0;
		lambda1_3_2 <= 32'd0;
		r_in_3_2    <= 8'd0;
		pmx_3_3     <= 32'd0;
		pmy_3_3     <= 32'd0;
		pmm_3_3     <= 32'd0;
		lambda0_3_3 <= 32'd0;
		lambda1_3_3 <= 32'd0;
		r_in_3_3    <= 8'd0;
		pmx_3_4  	<= 0;
		pmy_3_4  	<= 0;
		pmm_3_4  	<= 0;
		lambda0_3_4 <= 0;
		lambda1_3_4 <= 0;
		r_in_3_4 	<= 0;
		pmx_3_5  	<= 0;
		pmy_3_5  	<= 0;
		pmm_3_5  	<= 0;
		lambda0_3_5 <= 0;
		lambda1_3_5 <= 0;
		r_in_3_5 	<= 0;
		pmx_3_6  	<= 0;
		pmy_3_6  	<= 0;
		pmm_3_6  	<= 0;
		lambda0_3_6 <= 0;
		lambda1_3_6 <= 0;
		r_in_3_6 	<= 0;
		pmx_3_7  	<= 0;
		pmy_3_7  	<= 0;
		pmm_3_7  	<= 0;
		lambda0_3_7 <= 0;
		lambda1_3_7 <= 0;
		r_in_3_7 	<= 0;
	end else if (parameter_vld_3) begin 
		case (pe_cnt_3) 
			6'd0: begin 
				pmx_3_0     <= check0_b_q    ;
				pmy_3_0     <= p_my_reg_8    ;
				pmm_3_0     <= sub_q    	 ;
				lambda0_3_0 <= check1_b_q	 ;
				lambda1_3_0 <= check2_b_q 	 ;
				r_in_3_0    <= R_3      	 ;
			end

			6'd1: begin
				pmx_3_1     <=  check0_b_q   ;
				pmy_3_1     <=  p_my_reg_8   ;
				pmm_3_1     <=  sub_q    	 ;
				lambda0_3_1 <=  check1_b_q	 ;
				lambda1_3_1 <=  check2_b_q   ;
				r_in_3_1    <=  R_3          ; 	 
			end

			6'd2: begin 
				pmx_3_2     <= check0_b_q    ;
				pmy_3_2     <= p_my_reg_8    ;
				pmm_3_2     <= sub_q    	 ;
				lambda0_3_2 <= check1_b_q	 ;
				lambda1_3_2 <= check2_b_q 	 ;
				r_in_3_2    <= R_3      	 ;
			end

			6'd3: begin 
				pmx_3_3     <= check0_b_q    ;
				pmy_3_3     <= p_my_reg_8    ;
				pmm_3_3     <= sub_q    	 ;
				lambda0_3_3 <= check1_b_q	 ;
				lambda1_3_3 <= check2_b_q 	 ;
				r_in_3_3    <= R_3      	 ;
			end

			6'd4: begin 
				pmx_3_4  	<= check0_b_q    ;
				pmy_3_4  	<= p_my_reg_8    ;
				pmm_3_4  	<= sub_q    	 ;
				lambda0_3_4 <= check1_b_q	 ;
				lambda1_3_4 <= check2_b_q 	 ;
				r_in_3_4 	<= R_3      	 ;
			end
 
			6'd5: begin 
				pmx_3_5  	<= check0_b_q    ;
				pmy_3_5  	<= p_my_reg_8    ;
				pmm_3_5  	<= sub_q    	 ;
				lambda0_3_5 <= check1_b_q	 ;
				lambda1_3_5 <= check2_b_q 	 ;
				r_in_3_5 	<= R_3      	 ;
			end
 
			6'd6: begin 
				pmx_3_6  	<= check0_b_q    ;
				pmy_3_6  	<= p_my_reg_8    ;
				pmm_3_6  	<= sub_q    	 ;
				lambda0_3_6 <= check1_b_q	 ;
				lambda1_3_6 <= check2_b_q 	 ;
				r_in_3_6 	<= R_3      	 ;
			end
 
			6'd7: begin 
				pmx_3_7  	<= check0_b_q    ;
				pmy_3_7  	<= p_my_reg_8    ;
				pmm_3_7  	<= sub_q    	 ;
				lambda0_3_7 <= check1_b_q	 ;
				lambda1_3_7 <= check2_b_q 	 ;
				r_in_3_7 	<= R_3      	 ;
			end

		endcase // pe_cnt
	end
end
//---------------------------T3-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		pmx_4_0     <= 32'd0;
		pmy_4_0     <= 32'd0;
		pmm_4_0     <= 32'd0;
		lambda0_4_0 <= 32'd0;
		lambda1_4_0 <= 32'd0;
		r_in_4_0    <= 8'd0;
		pmx_4_1     <= 32'd0;
		pmy_4_1     <= 32'd0;
		pmm_4_1     <= 32'd0;
		lambda0_4_1 <= 32'd0;
		lambda1_4_1 <= 32'd0;
		r_in_4_1    <= 8'd0;
		pmx_4_2     <= 32'd0;
		pmy_4_2     <= 32'd0;
		pmm_4_2     <= 32'd0;
		lambda0_4_2 <= 32'd0;
		lambda1_4_2 <= 32'd0;
		r_in_4_2    <= 8'd0;
		pmx_4_3     <= 32'd0;
		pmy_4_3     <= 32'd0;
		pmm_4_3     <= 32'd0;
		lambda0_4_3 <= 32'd0;
		lambda1_4_3 <= 32'd0;
		r_in_4_3    <= 8'd0;
		pmx_4_4  	<= 0;
		pmy_4_4  	<= 0;
		pmm_4_4  	<= 0;
		lambda0_4_4 <= 0;
		lambda1_4_4 <= 0;
		r_in_4_4 	<= 0;
		pmx_4_5  	<= 0;
		pmy_4_5  	<= 0;
		pmm_4_5  	<= 0;
		lambda0_4_5 <= 0;
		lambda1_4_5 <= 0;
		r_in_4_5 	<= 0;
		pmx_4_6  	<= 0;
		pmy_4_6  	<= 0;
		pmm_4_6  	<= 0;
		lambda0_4_6 <= 0;
		lambda1_4_6 <= 0;
		r_in_4_6 	<= 0;
		pmx_4_7  	<= 0;
		pmy_4_7  	<= 0;
		pmm_4_7  	<= 0;
		lambda0_4_7 <= 0;
		lambda1_4_7 <= 0;
		r_in_4_7 	<= 0;
	end else if (parameter_vld_4) begin 
		case (pe_cnt_4) 
			6'd0: begin 
				pmx_4_0     <= check0_b_q    ;
				pmy_4_0     <= p_my_reg_8    ;
				pmm_4_0     <= sub_q    	 ;
				lambda0_4_0 <= check1_b_q	 ;
				lambda1_4_0 <= check2_b_q 	 ;
				r_in_4_0    <= R_4      	 ;
			end

			6'd1: begin
				pmx_4_1     <=  check0_b_q   ;
				pmy_4_1     <=  p_my_reg_8   ;
				pmm_4_1     <=  sub_q    	 ;
				lambda0_4_1 <=  check1_b_q	 ;
				lambda1_4_1 <=  check2_b_q   ;
				r_in_4_1    <=  R_4      	 ;
			end

			6'd2: begin 
				pmx_4_2     <= check0_b_q    ;
				pmy_4_2     <= p_my_reg_8    ;
				pmm_4_2     <= sub_q    	 ;
				lambda0_4_2 <= check1_b_q	 ;
				lambda1_4_2 <= check2_b_q 	 ;
				r_in_4_2    <= R_4      	 ;
			end

			6'd3: begin 
				pmx_4_3     <= check0_b_q    ;
				pmy_4_3     <= p_my_reg_8    ;
				pmm_4_3     <= sub_q    	 ;
				lambda0_4_3 <= check1_b_q	 ;
				lambda1_4_3 <= check2_b_q 	 ;
				r_in_4_3    <= R_4      	 ;
			end

			6'd4: begin 
				pmx_4_4  	<= check0_b_q    ;
				pmy_4_4  	<= p_my_reg_8    ;
				pmm_4_4  	<= sub_q    	 ;
				lambda0_4_4 <= check1_b_q	 ;
				lambda1_4_4 <= check2_b_q 	 ;
				r_in_4_4 	<= R_4      	 ;
			end
 
			6'd5: begin 
				pmx_4_5  	<= check0_b_q    ;
				pmy_4_5  	<= p_my_reg_8    ;
				pmm_4_5  	<= sub_q    	 ;
				lambda0_4_5 <= check1_b_q	 ;
				lambda1_4_5 <= check2_b_q 	 ;
				r_in_4_5 	<= R_4      	 ;
			end
 
			6'd6: begin 
				pmx_4_6  	<= check0_b_q    ;
				pmy_4_6  	<= p_my_reg_8    ;
				pmm_4_6  	<= sub_q    	 ;
				lambda0_4_6 <= check1_b_q	 ;
				lambda1_4_6 <= check2_b_q 	 ;
				r_in_4_6 	<= R_4      	 ;
			end
 
			6'd7: begin 
				pmx_4_7  	<= check0_b_q    ;
				pmy_4_7  	<= p_my_reg_8    ;
				pmm_4_7  	<= sub_q    	 ;
				lambda0_4_7 <= check1_b_q	 ;
				lambda1_4_7 <= check2_b_q 	 ;
				r_in_4_7 	<= R_4      	 ;
			end

		endcase // pe_cnt
	end
end


//---------------------------T4-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		pmx_5_0     <= 32'd0;
		pmy_5_0     <= 32'd0;
		pmm_5_0     <= 32'd0;
		lambda0_5_0 <= 32'd0;
		lambda1_5_0 <= 32'd0;
		r_in_5_0    <= 8'd0;
		pmx_5_1     <= 32'd0;
		pmy_5_1     <= 32'd0;
		pmm_5_1     <= 32'd0;
		lambda0_5_1 <= 32'd0;
		lambda1_5_1 <= 32'd0;
		r_in_5_1    <= 8'd0;
		pmx_5_2     <= 32'd0;
		pmy_5_2     <= 32'd0;
		pmm_5_2     <= 32'd0;
		lambda0_5_2 <= 32'd0;
		lambda1_5_2 <= 32'd0;
		r_in_5_2    <= 8'd0;
		pmx_5_3     <= 32'd0;
		pmy_5_3     <= 32'd0;
		pmm_5_3     <= 32'd0;
		lambda0_5_3 <= 32'd0;
		lambda1_5_3 <= 32'd0;
		r_in_5_3    <= 8'd0;
		pmx_5_4  	<= 0;
		pmy_5_4  	<= 0;
		pmm_5_4  	<= 0;
		lambda0_5_4 <= 0;
		lambda1_5_4 <= 0;
		r_in_5_4 	<= 0;
		pmx_5_5  	<= 0;
		pmy_5_5  	<= 0;
		pmm_5_5  	<= 0;
		lambda0_5_5 <= 0;
		lambda1_5_5 <= 0;
		r_in_5_5 	<= 0;
		pmx_5_6  	<= 0;
		pmy_5_6  	<= 0;
		pmm_5_6  	<= 0;
		lambda0_5_6 <= 0;
		lambda1_5_6 <= 0;
		r_in_5_6 	<= 0;
		pmx_5_7  	<= 0;
		pmy_5_7  	<= 0;
		pmm_5_7  	<= 0;
		lambda0_5_7 <= 0;
		lambda1_5_7 <= 0;
		r_in_5_7 	<= 0;
	end else if (parameter_vld_5) begin 
		case (pe_cnt_5) 
			6'd0: begin 
				pmx_5_0     <= check0_b_q    ;
				pmy_5_0     <= p_my_reg_8    ;
				pmm_5_0     <= sub_q    	 ;
				lambda0_5_0 <= check1_b_q	 ;
				lambda1_5_0 <= check2_b_q 	 ;
				r_in_5_0    <= R_5      	 ;
			end

			6'd1: begin
				pmx_5_1     <=  check0_b_q   ;
				pmy_5_1     <=  p_my_reg_8   ;
				pmm_5_1     <=  sub_q    	 ;
				lambda0_5_1 <=  check1_b_q	 ;
				lambda1_5_1 <=  check2_b_q   ;
				r_in_5_1    <=  R_5      	 ;
			end

			6'd2: begin 
				pmx_5_2     <= check0_b_q    ;
				pmy_5_2     <= p_my_reg_8    ;
				pmm_5_2     <= sub_q    	 ;
				lambda0_5_2 <= check1_b_q	 ;
				lambda1_5_2 <= check2_b_q 	 ;
				r_in_5_2    <= R_5      	 ;
			end

			6'd3: begin 
				pmx_5_3     <= check0_b_q    ;
				pmy_5_3     <= p_my_reg_8    ;
				pmm_5_3     <= sub_q    	 ;
				lambda0_5_3 <= check1_b_q	 ;
				lambda1_5_3 <= check2_b_q 	 ;
				r_in_5_3    <= R_5      	 ;
			end

			6'd4: begin 
				pmx_5_4  	<= check0_b_q    ;
				pmy_5_4  	<= p_my_reg_8    ;
				pmm_5_4  	<= sub_q    	 ;
				lambda0_5_4 <= check1_b_q	 ;
				lambda1_5_4 <= check2_b_q 	 ;
				r_in_5_4 	<= R_5      	 ;
			end
 
			6'd5: begin 
				pmx_5_5  	<= check0_b_q    ;
				pmy_5_5  	<= p_my_reg_8    ;
				pmm_5_5  	<= sub_q    	 ;
				lambda0_5_5 <= check1_b_q	 ;
				lambda1_5_5 <= check2_b_q 	 ;
				r_in_5_5 	<= R_5      	 ;
			end
 
			6'd6: begin 
				pmx_5_6  	<= check0_b_q    ;
				pmy_5_6  	<= p_my_reg_8    ;
				pmm_5_6  	<= sub_q    	 ;
				lambda0_5_6 <= check1_b_q	 ;
				lambda1_5_6 <= check2_b_q 	 ;
				r_in_5_6 	<= R_5      	 ;
			end
 
			6'd7: begin 
				pmx_5_7  	<= check0_b_q    ;
				pmy_5_7  	<= p_my_reg_8    ;
				pmm_5_7  	<= sub_q    	 ;
				lambda0_5_7 <= check1_b_q	 ;
				lambda1_5_7 <= check2_b_q 	 ;
				r_in_5_7 	<= R_5      	 ;
			end

		endcase // pe_cnt
	end
end



//---------------------------T5-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		pmx_0_0     <= 32'd0;
		pmy_0_0     <= 32'd0;
		pmm_0_0     <= 32'd0;
		lambda0_0_0 <= 32'd0;
		lambda1_0_0 <= 32'd0;
		r_in_0_0    <= 8'd0;
		pmx_0_1     <= 32'd0;
		pmy_0_1     <= 32'd0;
		pmm_0_1     <= 32'd0;
		lambda0_0_1 <= 32'd0;
		lambda1_0_1 <= 32'd0;
		r_in_0_1    <= 8'd0;
		pmx_0_2     <= 32'd0;
		pmy_0_2     <= 32'd0;
		pmm_0_2     <= 32'd0;
		lambda0_0_2 <= 32'd0;
		lambda1_0_2 <= 32'd0;
		r_in_0_2    <= 8'd0;
		pmx_0_3     <= 32'd0;
		pmy_0_3     <= 32'd0;
		pmm_0_3     <= 32'd0;
		lambda0_0_3 <= 32'd0;
		lambda1_0_3 <= 32'd0;
		r_in_0_3    <= 8'd0;
		pmx_0_4  	<= 0;
		pmy_0_4  	<= 0;
		pmm_0_4  	<= 0;
		lambda0_0_4 <= 0;
		lambda1_0_4 <= 0;
		r_in_0_4 	<= 0;
		pmx_0_5  	<= 0;
		pmy_0_5  	<= 0;
		pmm_0_5  	<= 0;
		lambda0_0_5 <= 0;
		lambda1_0_5 <= 0;
		r_in_0_5 	<= 0;
		pmx_0_6  	<= 0;
		pmy_0_6  	<= 0;
		pmm_0_6  	<= 0;
		lambda0_0_6 <= 0;
		lambda1_0_6 <= 0;
		r_in_0_6 	<= 0;
		pmx_0_7  	<= 0;
		pmy_0_7  	<= 0;
		pmm_0_7  	<= 0;
		lambda0_0_7 <= 0;
		lambda1_0_7 <= 0;
		r_in_0_7 	<= 0;
	end else if (parameter_vld_0) begin 
		case (pe_cnt_0) 
			6'd0: begin 
				pmx_0_0     <= check0_b_q    ;
				pmy_0_0     <= p_my_reg_8    ;
				pmm_0_0     <= sub_q    	 ;
				lambda0_0_0 <= check1_b_q	 ;
				lambda1_0_0 <= check2_b_q 	 ;
				r_in_0_0    <= R_0      	 ;
			end

			6'd1: begin
				pmx_0_1     <=  check0_b_q   ;
				pmy_0_1     <=  p_my_reg_8   ;
				pmm_0_1     <=  sub_q    	 ;
				lambda0_0_1 <=  check1_b_q	 ;
				lambda1_0_1 <=  check2_b_q   ;
				r_in_0_1    <=  R_0      	 ;
			end

			6'd2: begin 
				pmx_0_2     <= check0_b_q    ;
				pmy_0_2     <= p_my_reg_8    ;
				pmm_0_2     <= sub_q    	 ;
				lambda0_0_2 <= check1_b_q	 ;
				lambda1_0_2 <= check2_b_q 	 ;
				r_in_0_2    <= R_0      	 ;
			end

			6'd3: begin 
				pmx_0_3     <= check0_b_q    ;
				pmy_0_3     <= p_my_reg_8    ;
				pmm_0_3     <= sub_q    	 ;
				lambda0_0_3 <= check1_b_q	 ;
				lambda1_0_3 <= check2_b_q 	 ;
				r_in_0_3    <= R_0      	 ;
			end

			6'd4: begin 
				pmx_0_4  	<= check0_b_q    ;
				pmy_0_4  	<= p_my_reg_8    ;
				pmm_0_4  	<= sub_q    	 ;
				lambda0_0_4 <= check1_b_q	 ;
				lambda1_0_4 <= check2_b_q 	 ;
				r_in_0_4 	<= R_0      	 ;
			end
 
			6'd5: begin 
				pmx_0_5  	<= check0_b_q    ;
				pmy_0_5  	<= p_my_reg_8    ;
				pmm_0_5  	<= sub_q    	 ;
				lambda0_0_5 <= check1_b_q	 ;
				lambda1_0_5 <= check2_b_q 	 ;
				r_in_0_5 	<= R_0      	 ;
			end
 
			6'd6: begin 
				pmx_0_6  	<= check0_b_q    ;
				pmy_0_6  	<= p_my_reg_8    ;
				pmm_0_6  	<= sub_q    	 ;
				lambda0_0_6 <= check1_b_q	 ;
				lambda1_0_6 <= check2_b_q 	 ;
				r_in_0_6 	<= R_0      	 ;
			end
 
			6'd7: begin 
				pmx_0_7  	<= check0_b_q    ;
				pmy_0_7  	<= p_my_reg_8    ;
				pmm_0_7  	<= sub_q    	 ;
				lambda0_0_7 <= check1_b_q	 ;
				lambda1_0_7 <= check2_b_q 	 ;
				r_in_0_7 	<= R_0      	 ;
			end

		endcase // pe_cnt
	end
end


always @(posedge sys_clk or negedge sys_rst_n)
begin 
	case (shift_reg) 
		T0 : begin 
				pmx_0     <= pmx_0_0     ;
				pmy_0     <= pmy_0_0     ;
				pmm_0     <= pmm_0_0     ;
				lambda0_0 <= lambda0_0_0 ;
				lambda1_0 <= lambda1_0_0 ;
				r_0       <= r_in_0_0    ;
				pmx_1     <= pmx_0_1     ;
				pmy_1     <= pmy_0_1     ;
				pmm_1     <= pmm_0_1     ;
				lambda0_1 <= lambda0_0_1 ;
				lambda1_1 <= lambda1_0_1 ;
				r_1       <= r_in_0_1    ;
				pmx_2     <= pmx_0_2     ;
				pmy_2     <= pmy_0_2     ;
				pmm_2     <= pmm_0_2     ;
				lambda0_2 <= lambda0_0_2 ;
				lambda1_2 <= lambda1_0_2 ;
				r_2       <= r_in_0_2    ;
				pmx_3     <= pmx_0_3     ;
				pmy_3     <= pmy_0_3     ;
				pmm_3     <= pmm_0_3     ;
				lambda0_3 <= lambda0_0_3 ;
				lambda1_3 <= lambda1_0_3 ;
				r_3       <= r_in_0_3    ;
				pmx_4  	  <= pmx_0_4  	 ;
				pmy_4  	  <= pmy_0_4  	 ;
				pmm_4  	  <= pmm_0_4  	 ;
				lambda0_4 <= lambda0_0_4 ;
				lambda1_4 <= lambda1_0_4 ;
				r_4   	  <= r_in_0_4 	 ;
				pmx_5  	  <= pmx_0_5  	 ;
				pmy_5  	  <= pmy_0_5  	 ;
				pmm_5  	  <= pmm_0_5  	 ;
				lambda0_5 <= lambda0_0_5 ;
				lambda1_5 <= lambda1_0_5 ;
				r_5 	  <= r_in_0_5 	 ;
				pmx_6  	  <= pmx_0_6  	 ;
				pmy_6  	  <= pmy_0_6  	 ;
				pmm_6  	  <= pmm_0_6  	 ;
				lambda0_6 <= lambda0_0_6 ;
				lambda1_6 <= lambda1_0_6 ;
				r_6 	  <= r_in_0_6 	 ;
				pmx_7  	  <= pmx_0_7  	 ;
				pmy_7  	  <= pmy_0_7  	 ;
				pmm_7  	  <= pmm_0_7  	 ;
				lambda0_7 <= lambda0_0_7 ;
				lambda1_7 <= lambda1_0_7 ;
				r_7 	  <= r_in_0_7 	 ;

			end

		T1: begin 
				pmx_0     <= pmx_1_0     ;
				pmy_0     <= pmy_1_0     ;
				pmm_0     <= pmm_1_0     ;
				lambda0_0 <= lambda0_1_0 ;
				lambda1_0 <= lambda1_1_0 ;
				r_0       <= r_in_1_0    ;
				pmx_1     <= pmx_1_1     ;
				pmy_1     <= pmy_1_1     ;
				pmm_1     <= pmm_1_1     ;
				lambda0_1 <= lambda0_1_1 ;
				lambda1_1 <= lambda1_1_1 ;
				r_1       <= r_in_1_1    ;
				pmx_2     <= pmx_1_2     ;
				pmy_2     <= pmy_1_2     ;
				pmm_2     <= pmm_1_2     ;
				lambda0_2 <= lambda0_1_2 ;
				lambda1_2 <= lambda1_1_2 ;
				r_2       <= r_in_1_2    ;
				pmx_3     <= pmx_1_3     ;
				pmy_3     <= pmy_1_3     ;
				pmm_3     <= pmm_1_3     ;
				lambda0_3 <= lambda0_1_3 ;
				lambda1_3 <= lambda1_1_3 ;
				r_3       <= r_in_1_3    ;
				pmx_4  	  <= pmx_1_4  	 ;
				pmy_4  	  <= pmy_1_4  	 ;
				pmm_4  	  <= pmm_1_4  	 ;
				lambda0_4 <= lambda0_1_4 ;
				lambda1_4 <= lambda1_1_4 ;
				r_4 	  <= r_in_1_4 	 ;
				pmx_5  	  <= pmx_1_5  	 ;
				pmy_5  	  <= pmy_1_5  	 ;
				pmm_5  	  <= pmm_1_5  	 ;
				lambda0_5 <= lambda0_1_5 ;
				lambda1_5 <= lambda1_1_5 ;
				r_5 	  <= r_in_1_5 	 ;
				pmx_6  	  <= pmx_1_6  	 ;
				pmy_6  	  <= pmy_1_6  	 ;
				pmm_6  	  <= pmm_1_6  	 ;
				lambda0_6 <= lambda0_1_6 ;
				lambda1_6 <= lambda1_1_6 ;
				r_6 	  <= r_in_1_6 	 ;
				pmx_7  	  <= pmx_1_7  	 ;
				pmy_7  	  <= pmy_1_7  	 ;
				pmm_7  	  <= pmm_1_7  	 ;
				lambda0_7 <= lambda0_1_7 ;
				lambda1_7 <= lambda1_1_7 ;
				r_7 	  <= r_in_1_7 	 ;
			end

		T2: begin 
				pmx_0     <= pmx_2_0     ;
				pmy_0     <= pmy_2_0     ;
				pmm_0     <= pmm_2_0     ;
				lambda0_0 <= lambda0_2_0 ;
				lambda1_0 <= lambda1_2_0 ;
				r_0       <= r_in_2_0    ;
				pmx_1     <= pmx_2_1     ;
				pmy_1     <= pmy_2_1     ;
				pmm_1     <= pmm_2_1     ;
				lambda0_1 <= lambda0_2_1 ;
				lambda1_1 <= lambda1_2_1 ;
				r_1       <= r_in_2_1    ;
				pmx_2     <= pmx_2_2     ;
				pmy_2     <= pmy_2_2     ;
				pmm_2     <= pmm_2_2     ;
				lambda0_2 <= lambda0_2_2 ;
				lambda1_2 <= lambda1_2_2 ;
				r_2       <= r_in_2_2    ;
				pmx_3     <= pmx_2_3     ;
				pmy_3     <= pmy_2_3     ;
				pmm_3     <= pmm_2_3     ;
				lambda0_3 <= lambda0_2_3 ;
				lambda1_3 <= lambda1_2_3 ;
				r_3       <= r_in_2_3    ;
				pmx_4  	  <= pmx_2_4  	 ;
				pmy_4  	  <= pmy_2_4  	 ;
				pmm_4  	  <= pmm_2_4  	 ;
				lambda0_4 <= lambda0_2_4 ;
				lambda1_4 <= lambda1_2_4 ;
				r_4   	  <= r_in_2_4 	 ;
				pmx_5  	  <= pmx_2_5  	 ;
				pmy_5  	  <= pmy_2_5  	 ;
				pmm_5  	  <= pmm_2_5  	 ;
				lambda0_5 <= lambda0_2_5 ;
				lambda1_5 <= lambda1_2_5 ;
				r_5 	  <= r_in_2_5 	 ;
				pmx_6  	  <= pmx_2_6  	 ;
				pmy_6  	  <= pmy_2_6  	 ;
				pmm_6  	  <= pmm_2_6  	 ;
				lambda0_6 <= lambda0_2_6 ;
				lambda1_6 <= lambda1_2_6 ;
				r_6 	  <= r_in_2_6 	 ;
				pmx_7  	  <= pmx_2_7  	 ;
				pmy_7  	  <= pmy_2_7  	 ;
				pmm_7  	  <= pmm_2_7  	 ;
				lambda0_7 <= lambda0_2_7 ;
				lambda1_7 <= lambda1_2_7 ;
				r_7 	  <= r_in_2_7 	 ;
			end

		T3:begin
				pmx_0     <= pmx_3_0     ;
				pmy_0     <= pmy_3_0     ;
				pmm_0     <= pmm_3_0     ;
				lambda0_0 <= lambda0_3_0 ;
				lambda1_0 <= lambda1_3_0 ;
				r_0       <= r_in_3_0    ;
				pmx_1     <= pmx_3_1     ;
				pmy_1     <= pmy_3_1     ;
				pmm_1     <= pmm_3_1     ;
				lambda0_1 <= lambda0_3_1 ;
				lambda1_1 <= lambda1_3_1 ;
				r_1       <= r_in_3_1    ;
				pmx_2     <= pmx_3_2     ;
				pmy_2     <= pmy_3_2     ;
				pmm_2     <= pmm_3_2     ;
				lambda0_2 <= lambda0_3_2 ;
				lambda1_2 <= lambda1_3_2 ;
				r_2       <= r_in_3_2    ;
				pmx_3     <= pmx_3_3     ;
				pmy_3     <= pmy_3_3     ;
				pmm_3     <= pmm_3_3     ;
				lambda0_3 <= lambda0_3_3 ;
				lambda1_3 <= lambda1_3_3 ;
				r_3       <= r_in_3_3    ;
				pmx_4  	  <= pmx_3_4  	 ;
				pmy_4  	  <= pmy_3_4  	 ;
				pmm_4  	  <= pmm_3_4  	 ;
				lambda0_4 <= lambda0_3_4 ;
				lambda1_4 <= lambda1_3_4 ;
				r_4  	  <= r_in_3_4 	 ;
				pmx_5  	  <= pmx_3_5  	 ;
				pmy_5  	  <= pmy_3_5  	 ;
				pmm_5  	  <= pmm_3_5  	 ;
				lambda0_5 <= lambda0_3_5 ;
				lambda1_5 <= lambda1_3_5 ;
				r_5  	  <= r_in_3_5 	 ;
				pmx_6  	  <= pmx_3_6  	 ;
				pmy_6  	  <= pmy_3_6  	 ;
				pmm_6  	  <= pmm_3_6  	 ;
				lambda0_6 <= lambda0_3_6 ;
				lambda1_6 <= lambda1_3_6 ;
				r_6 	  <= r_in_3_6 	 ;
				pmx_7  	  <= pmx_3_7  	 ;
				pmy_7  	  <= pmy_3_7  	 ;
				pmm_7  	  <= pmm_3_7  	 ;
				lambda0_7 <= lambda0_3_7 ;
				lambda1_7 <= lambda1_3_7 ;
				r_7 	  <= r_in_3_7 	 ;
			end			
		
		T4:begin
				pmx_0     <= pmx_4_0     ;
				pmy_0     <= pmy_4_0     ;
				pmm_0     <= pmm_4_0     ;
				lambda0_0 <= lambda0_4_0 ;
				lambda1_0 <= lambda1_4_0 ;
				r_0       <= r_in_4_0    ;
				pmx_1     <= pmx_4_1     ;
				pmy_1     <= pmy_4_1     ;
				pmm_1     <= pmm_4_1     ;
				lambda0_1 <= lambda0_4_1 ;
				lambda1_1 <= lambda1_4_1 ;
				r_1       <= r_in_4_1    ;
				pmx_2     <= pmx_4_2     ;
				pmy_2     <= pmy_4_2     ;
				pmm_2     <= pmm_4_2     ;
				lambda0_2 <= lambda0_4_2 ;
				lambda1_2 <= lambda1_4_2 ;
				r_2       <= r_in_4_2    ;
				pmx_3     <= pmx_4_3     ;
				pmy_3     <= pmy_4_3     ;
				pmm_3     <= pmm_4_3     ;
				lambda0_3 <= lambda0_4_3 ;
				lambda1_3 <= lambda1_4_3 ;
				r_3       <= r_in_4_3    ;
				pmx_4  	  <= pmx_4_4  	 ;
				pmy_4  	  <= pmy_4_4  	 ;
				pmm_4  	  <= pmm_4_4  	 ;
				lambda0_4 <= lambda0_4_4 ;
				lambda1_4 <= lambda1_4_4 ;
				r_4  	  <= r_in_4_4 	 ;
				pmx_5  	  <= pmx_4_5  	 ;
				pmy_5  	  <= pmy_4_5  	 ;
				pmm_5  	  <= pmm_4_5  	 ;
				lambda0_5 <= lambda0_4_5 ;
				lambda1_5 <= lambda1_4_5 ;
				r_5 	  <= r_in_4_5 	 ;
				pmx_6  	  <= pmx_4_6  	 ;
				pmy_6  	  <= pmy_4_6  	 ;
				pmm_6  	  <= pmm_4_6  	 ;
				lambda0_6 <= lambda0_4_6 ;
				lambda1_6 <= lambda1_4_6 ;
				r_6 	  <= r_in_4_6 	 ;
				pmx_7  	  <= pmx_4_7  	 ;
				pmy_7  	  <= pmy_4_7  	 ;
				pmm_7  	  <= pmm_4_7  	 ;
				lambda0_7 <= lambda0_4_7 ;
				lambda1_7 <= lambda1_4_7 ;
				r_7 	  <= r_in_4_7 	 ;
			end	

		T5:begin
				pmx_0     <= pmx_5_0     ;
				pmy_0     <= pmy_5_0     ;
				pmm_0     <= pmm_5_0     ;
				lambda0_0 <= lambda0_5_0 ;
				lambda1_0 <= lambda1_5_0 ;
				r_0       <= r_in_5_0    ;
				pmx_1     <= pmx_5_1     ;
				pmy_1     <= pmy_5_1     ;
				pmm_1     <= pmm_5_1     ;
				lambda0_1 <= lambda0_5_1 ;
				lambda1_1 <= lambda1_5_1 ;
				r_1       <= r_in_5_1    ;
				pmx_2     <= pmx_5_2     ;
				pmy_2     <= pmy_5_2     ;
				pmm_2     <= pmm_5_2     ;
				lambda0_2 <= lambda0_5_2 ;
				lambda1_2 <= lambda1_5_2 ;
				r_2       <= r_in_5_2    ;
				pmx_3     <= pmx_5_3     ;
				pmy_3     <= pmy_5_3     ;
				pmm_3     <= pmm_5_3     ;
				lambda0_3 <= lambda0_5_3 ;
				lambda1_3 <= lambda1_5_3 ;
				r_3       <= r_in_5_3    ;
				pmx_4  	  <= pmx_5_4  	 ;
				pmy_4  	  <= pmy_5_4  	 ;
				pmm_4  	  <= pmm_5_4  	 ;
				lambda0_4 <= lambda0_5_4 ;
				lambda1_4 <= lambda1_5_4 ;
				r_4  	  <= r_in_5_4 	 ;
				pmx_5  	  <= pmx_5_5  	 ;
				pmy_5  	  <= pmy_5_5  	 ;
				pmm_5  	  <= pmm_5_5  	 ;
				lambda0_5 <= lambda0_5_5 ;
				lambda1_5 <= lambda1_5_5 ;
				r_5 	  <= r_in_5_5 	 ;
				pmx_6  	  <= pmx_5_6  	 ;
				pmy_6  	  <= pmy_5_6  	 ;
				pmm_6  	  <= pmm_5_6  	 ;
				lambda0_6 <= lambda0_5_6 ;
				lambda1_6 <= lambda1_5_6 ;
				r_6 	  <= r_in_5_6 	 ;
				pmx_7  	  <= pmx_5_7  	 ;
				pmy_7  	  <= pmy_5_7  	 ;
				pmm_7  	  <= pmm_5_7  	 ;
				lambda0_7 <= lambda0_5_7 ;
				lambda1_7 <= lambda1_5_7 ;
				r_7 	  <= r_in_5_7 	 ;
			end		
	endcase // shift_reg			
end

/*-------------------------------------------------------------------*\
                          PU8 to save_send
\*-------------------------------------------------------------------*/

//---------------------------T0-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		M_write_5  <= 32'd0;
		X_write_5  <= 32'd0;
		init_out_5 <= 1'b0;
	end else if (shift_reg == T0)begin 
		M_write_5  <= M_write;
		X_write_5  <= X_write;
		init_out_5 <= init_out;
	end  
end 



//---------------------------T1-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		M_write_0  <= 32'd0;
		X_write_0  <= 32'd0;
		init_out_0 <= 1'b0;
	end else if (shift_reg == T1)begin 
		M_write_0  <= M_write;
		X_write_0  <= X_write;
		init_out_0 <= init_out;
	end  
end 

//---------------------------T2-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		M_write_1  <= 32'd0;
		X_write_1  <= 32'd0;
		init_out_1 <= 1'b0;
	end else if (shift_reg == T2)begin 
		M_write_1  <= M_write;
		X_write_1  <= X_write;
		init_out_1 <= init_out;
	end  
end 

//---------------------------T3-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		M_write_2  <= 32'd0;
		X_write_2  <= 32'd0;
		init_out_2 <= 1'b0;
	end else if (shift_reg == T3)begin 
		M_write_2  <= M_write;
		X_write_2  <= X_write;
		init_out_2 <= init_out;
	end  
end 

//---------------------------T4-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		M_write_3  <= 32'd0;
		X_write_3  <= 32'd0;
		init_out_3 <= 1'b0;
	end else if (shift_reg == T4)begin 
		M_write_3  <= M_write;
		X_write_3  <= X_write;
		init_out_3 <= init_out;
	end  
end 

//---------------------------T5-----------------------------//
always @(posedge sys_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin 
		M_write_4  <= 32'd0;
		X_write_4  <= 32'd0;
		init_out_4 <= 1'b0;
	end else if (shift_reg == T5)begin 
		M_write_4  <= M_write;
		X_write_4  <= X_write;
		init_out_4 <= init_out;
	end  
end 



assign sub_a = check1_a_q;
assign sub_b = check0_a_q;

fp_sub sub_0 (
	.clk   (sys_clk), //    clk.clk
	.areset(1'b0   ), // areset.reset
	.a     (sub_a  ), //      a.a
	.b     (sub_b  ), //      b.b
	.q     (sub_q  )  //      q.q
);



Rom_Check0 check0_a (
	.clock  (sys_clk      ),
	.address(addr_check0_a),
	.rden   (1'b1         ),
	.q      (check0_a_q   )
);

Rom_Check1 check1_a (
	.clock  (sys_clk      ),
	.address(addr_check1_a),
	.rden   (1'b1         ),
	.q      (check1_a_q   )
);


Rom_Check0 check0_b (
	.clock  (sys_clk      ),
	.address(addr_check0_b),
	.rden   (1'b1         ),
	.q      (check0_b_q   )
);

Rom_Check1 check1_b (
	.clock  (sys_clk      ),
	.address(addr_check1_b),
	.rden   (1'b1         ),
	.q      (check1_b_q   )
);

Rom_Check2 check2_b(
	.clock(sys_clk),
	.address(addr_check2_b),
	.rden(1'b1),
	.q(check2_b_q)
);

save_send s0 (
	//input
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.matrix_memory_sop (matrix_memory_sop_0 ),
	.matrix_memory_eop (matrix_memory_eop_0 ),
	.matrix_memory_vld (matrix_memory_vld_0 ),
	.matrix_memory_data(matrix_memory_data_0),
	.M_write           (M_write_0           ),
	.X_write           (X_write_0           ),
	//output
	.pkt_receive_enable(pkt_receive_enable_0),
	.ram_out           (ram_out_0           ),
	.q                 (q_0                 ),
	.i                 (i_0                 ),
	.r                 (R_0                 ),
	.h                 (H_0                 ),
	.M_read            (M_read_0            ),
	.X_read            (X_read_0            ),
	.parameter_vld     (parameter_vld_0     ),
	.en_sum            (en_sum_0            ),
	.mode              (mode_0              ),
	.sum_select        (sum_select_0        ),
	.sum_vld           (sum_vld_0           ),
	.y_initial         (y_initial_0         ),
	.init              (init_0              ),
	.head              (head_0              ),
	.vld 			   (vld_0 				),
	.init_out 	 	   (init_out_0 			),
	.pe_cnt 		   (pe_cnt_0 			)
);


save_send s1 (
	//input
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.matrix_memory_sop (matrix_memory_sop_1 ),
	.matrix_memory_eop (matrix_memory_eop_1 ),
	.matrix_memory_vld (matrix_memory_vld_1 ),
	.matrix_memory_data(matrix_memory_data_1),
	.M_write           (M_write_1           ),
	.X_write           (X_write_1           ),
	//output
	.pkt_receive_enable(pkt_receive_enable_1),
	.ram_out           (ram_out_1           ),
	.q                 (q_1                 ),
	.i                 (i_1                 ),
	.r                 (R_1                 ),
	.h                 (H_1                 ),
	.M_read            (M_read_1            ),
	.X_read            (X_read_1            ),
	.parameter_vld     (parameter_vld_1     ),
	.en_sum            (en_sum_1            ),
	.mode              (mode_1              ),
	.sum_select        (sum_select_1        ),
	.sum_vld           (sum_vld_1           ),
	.y_initial         (y_initial_1         ),
	.init              (init_1              ),
	.head              (head_1              ),
	.vld 			   (vld_1 				),
	.init_out 	 	   (init_out_1 			),
	.pe_cnt 		   (pe_cnt_1 			)
);

save_send s2 (
	//input
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.matrix_memory_sop (matrix_memory_sop_2 ),
	.matrix_memory_eop (matrix_memory_eop_2 ),
	.matrix_memory_vld (matrix_memory_vld_2 ),
	.matrix_memory_data(matrix_memory_data_2),
	.M_write           (M_write_2           ),
	.X_write           (X_write_2           ),
	//output
	.pkt_receive_enable(pkt_receive_enable_2),
	.ram_out           (ram_out_2           ),
	.q                 (q_2                 ),
	.i                 (i_2                 ),
	.r                 (R_2                 ),
	.h                 (H_2                 ),
	.M_read            (M_read_2            ),
	.X_read            (X_read_2            ),
	.parameter_vld     (parameter_vld_2     ),
	.en_sum            (en_sum_2            ),
	.mode              (mode_2              ),
	.sum_select        (sum_select_2        ),
	.sum_vld           (sum_vld_2           ),
	.y_initial         (y_initial_2         ),
	.init              (init_2              ),
	.head              (head_2              ),
	.vld 			   (vld_2 				),
	.init_out 	 	   (init_out_2 			),
	.pe_cnt 		   (pe_cnt_2 			)
);

save_send s3 (
	//input
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.matrix_memory_sop (matrix_memory_sop_3 ),
	.matrix_memory_eop (matrix_memory_eop_3 ),
	.matrix_memory_vld (matrix_memory_vld_3 ),
	.matrix_memory_data(matrix_memory_data_3),
	.M_write           (M_write_3           ),
	.X_write           (X_write_3           ),
	//output
	.pkt_receive_enable(pkt_receive_enable_3),
	.ram_out           (ram_out_3           ),
	.q                 (q_3                 ),
	.i                 (i_3                 ),
	.r                 (R_3                 ),
	.h                 (H_3                 ),
	.M_read            (M_read_3            ),
	.X_read            (X_read_3            ),
	.parameter_vld     (parameter_vld_3     ),
	.en_sum            (en_sum_3            ),
	.mode              (mode_3              ),
	.sum_select        (sum_select_3        ),
	.sum_vld           (sum_vld_3           ),
	.y_initial         (y_initial_3         ),
	.init              (init_3              ),
	.head              (head_3              ),
	.vld 			   (vld_3 				),
	.init_out 	 	   (init_out_3 			),
	.pe_cnt 		   (pe_cnt_3 			)
);


save_send s4 (
	//input
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.matrix_memory_sop (matrix_memory_sop_4 ),
	.matrix_memory_eop (matrix_memory_eop_4 ),
	.matrix_memory_vld (matrix_memory_vld_4 ),
	.matrix_memory_data(matrix_memory_data_4),
	.M_write           (M_write_4           ),
	.X_write           (X_write_4           ),
	//output
	.pkt_receive_enable(pkt_receive_enable_4),
	.ram_out           (ram_out_4           ),
	.q                 (q_4                 ),
	.i                 (i_4                 ),
	.r                 (R_4                 ),
	.h                 (H_4                 ),
	.M_read            (M_read_4            ),
	.X_read            (X_read_4            ),
	.parameter_vld     (parameter_vld_4     ),
	.en_sum            (en_sum_4            ),
	.mode              (mode_4              ),
	.sum_select        (sum_select_4        ),
	.sum_vld           (sum_vld_4           ),
	.y_initial         (y_initial_4         ),
	.init              (init_4              ),
	.head              (head_4              ),
	.vld 			   (vld_4 				),
	.init_out 	 	   (init_out_4 			),
	.pe_cnt 		   (pe_cnt_4 			)
);



save_send s5 (
	//input
	.sys_clk           (sys_clk             ),
	.sys_rst_n         (sys_rst_n           ),
	.matrix_memory_sop (matrix_memory_sop_5 ),
	.matrix_memory_eop (matrix_memory_eop_5 ),
	.matrix_memory_vld (matrix_memory_vld_5 ),
	.matrix_memory_data(matrix_memory_data_5),
	.M_write           (M_write_5           ),
	.X_write           (X_write_5           ),
	//output
	.pkt_receive_enable(pkt_receive_enable_5),
	.ram_out           (ram_out_5           ),
	.q                 (q_5                 ),
	.i                 (i_5                 ),
	.r                 (R_5                 ),
	.h                 (H_5                 ),
	.M_read            (M_read_5            ),
	.X_read            (X_read_5            ),
	.parameter_vld     (parameter_vld_5     ),
	.en_sum            (en_sum_5            ),
	.mode              (mode_5              ),
	.sum_select        (sum_select_5        ),
	.sum_vld           (sum_vld_5           ),
	.y_initial         (y_initial_5         ),
	.init              (init_5              ),
	.head              (head_5              ),
	.vld 			   (vld_5 				),
	.init_out 	 	   (init_out_5 			),
	.pe_cnt 		   (pe_cnt_5 			)
);




PU8 P0(
	.sys_clk(sys_clk),
	.sys_rst_n(sys_rst_n),
	.mode(mode),
	.SUM_select(sum_select),
	.Y_Init(y_initial),
	

	.SUM_valid(sum_vld),
	.SUM_start(en_sum),
	
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

	.lambda1_0(lambda0_0) ,
	.lambda2_0(lambda1_0) ,

	.lambda1_1(lambda0_1) ,
	.lambda2_1(lambda1_1) ,

	.lambda1_2(lambda0_2) ,
	.lambda2_2(lambda1_2) ,

	.lambda1_3(lambda0_3) ,
	.lambda2_3(lambda1_3) ,

	.lambda1_4(lambda0_4) ,
	.lambda2_4(lambda1_4) ,

	.lambda1_5(lambda0_5) ,
	.lambda2_5(lambda1_5) ,

	.lambda1_6(lambda0_6) ,
	.lambda2_6(lambda1_6) ,

	.lambda1_7(lambda0_7) ,
	.lambda2_7(lambda1_7) ,

	.H_in  (h_in),

	.R_in_0(r_0),
	.R_in_1(r_1),
	.R_in_2(r_2),
	.R_in_3(r_3),
	.R_in_4(r_4),
	.R_in_5(r_5),
	.R_in_6(r_6),
	.R_in_7(r_7),
	
	.Init_in(init),
	.M_in (M_read),
	.X_in(X_read),
	//output
	
	.SUM_out(sum),
	.Init_out  (init_out),
	.M_out (M_write),
	.X_out (X_write)
	);
//===================================================================
//-----------------------------FIFO------------------------------//
wire [127:0] fifo_data_in          ;
wire [127:0] fifo_data_out         ;
wire [ 8:0]  usedw                 ;
wire         fifo_write_en         ;

wire         full                  ;


fifo_512x128 u0 (
		.data   (fifo_data_in ), 
		.wrreq  (fifo_write_en), 
		.rdreq  (result_fifo_rden ), 
		.clock  (sys_clk      ), 
		.q      (result_fifo_rdat),
		.usedw  (usedw        ), 
		
		.full   (full         ), 
		.empty  (result_fifo_empty)  
	);
assign fifo_write_en = sum_vld & (~full);
assign fifo_data_in  = {32'b0,head,sum};

assign fifo_almost_full = (usedw > 9'd485);

//==================================================================== 

endmodule 