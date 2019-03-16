

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
//  2017-04-25       cz             initial version
//
**********************************************************************/
`timescale 1ns/1ps 

module matrix_9 (
	//input
	matrix_memory_sop,
	matrix_memory_eop,
	matrix_memory_vld,
	matrix_memory_data,
	sys_clk,
	sys_rst,
	read_done,
	//output 
	enable,
	data_write_pcie,
	addr_write_pcie,
	en_write_pcie,
	max_data_num_done
	);



/*-------------------------------------------------------------------*\
                          Parameter Description
\*-------------------------------------------------------------------*/
parameter D = 0.2;
parameter MAX_DATA_NUM = 10240;
// parameter MAX_TIME_OUT = 2667600;
parameter MAX_TIME_OUT = 32'd30000000;
parameter ADDR_MOVE    = 14'h0;//14'h2800;



/*-------------------------------------------------------------------*\
                            Port Description(reference)
\*-------------------------------------------------------------------*/
input               matrix_memory_sop ;
input               matrix_memory_eop ;
input               matrix_memory_vld ;
input     [31:0]    matrix_memory_data;
input               sys_clk;
input               sys_rst;
input 		          read_done;
output              enable;
output    [127:0]   data_write_pcie;
output    [ 13:0]   addr_write_pcie;
output              en_write_pcie;
output 		          max_data_num_done;


/*-------------------------------------------------------------------*\
                          Reg/wire Description
\*-------------------------------------------------------------------*/
reg       [8:0]     shift_reg_in;
wire      [127:0]   fifo_data_in;
wire      [127:0]   fifo_data_out;
wire      [ 13:0]   usedw;
wire                fifo_write_en;
wire                fifo_read_en ;
wire                full;
wire                empty;
reg       [13:0 ]   addr_write_pcie;
reg       [13:0 ]   temp_addr_write_pcie;
reg 		            max_data_num_done;
reg 		            temp_max_data_num_done;
reg                 fifo_read_vld ;
reg       [31 :0]   counter_empty;
reg                 en_counter_empty;
reg                 all_done;
reg                 en_write_pcie;
reg        [127:0]  data_write_pcie;
wire  [13:0]  fifo_almost_full;
/*-------------------------------C1----------------------------------*/

reg [31:0] p_mx;
reg [31:0] p_my;
reg [31:0] p_xx_yy;
reg [31:0] p_xm_ym;
reg [31:0] p_mm;
reg [ 3:0] counter_out_ready_ok;
reg [ 8:0] counter_row_scan1;
reg [31:0] m_i1_j1;
reg [31:0] m_i1_j;
reg [31:0] x_i1_j1;
reg [31:0] x_i1_j;
reg [31:0] y_i1_j1;
reg [ 8:0] counter_sum;
reg        en_counter_sum;
reg [4:0]  symbol;
reg [15:0] hap_len;
reg [95:0] head_read_hap_id;

wire [31:0]  m_i_j;
wire [31:0]  x_i_j;
wire [31:0]  y_i_j;
wire [127:0] result;
wire 		     result_vld;

/*--------------------------------m1----------------------------------*/

wire [31:0] matrix_memory_data_1  ;
wire        matrix_memory_eop_1   ;
wire        matrix_memory_sop_1   ;
wire        matrix_memory_vld_1   ;
wire [31:0] m_i_j_1               ;
wire [31:0] x_i_j_1               ;
wire [31:0] y_i_j_1               ;
wire [31:0] p_mx_1                ;
wire [31:0] p_my_1                ;
wire [31:0] p_xx_yy_1             ;
wire [31:0] p_xm_ym_1             ;
wire [31:0] p_mm_1                ;
wire [31:0] m_i1_j1_1             ;
wire [31:0] m_i1_j_1              ;
wire [31:0] x_i1_j1_1             ;
wire [31:0] x_i1_j_1              ;
wire [31:0] y_i1_j1_1             ;
wire [ 3:0] counter_out_ready_ok_1;
wire [ 8:0] counter_row_scan1_1   ;
wire [ 8:0] counter_sum_1         ;
wire        en_counter_sum_1      ;
wire        vld1                  ;
wire        busy_1                ;
wire [4:0]  symbol_1              ;
wire [15:0] hap_len_1             ;
wire [95:0] head_read_hap_id_1    ;
wire [ 4:0] counter_head_1        ;
wire        signal_1              ;
wire [4:0] 	number_1			  ;
/*---------------------------------m2----------------------------------*/

wire [31:0] matrix_memory_data_2  ;
wire        matrix_memory_eop_2   ;
wire        matrix_memory_sop_2   ;
wire        matrix_memory_vld_2   ;
wire [31:0] m_i_j_2               ;
wire [31:0] x_i_j_2               ;
wire [31:0] y_i_j_2               ;
wire [31:0] p_mx_2                ;
wire [31:0] p_my_2                ;
wire [31:0] p_xx_yy_2             ;
wire [31:0] p_xm_ym_2             ;
wire [31:0] p_mm_2                ;
wire [31:0] m_i1_j1_2             ;
wire [31:0] m_i1_j_2              ;
wire [31:0] x_i1_j1_2             ;
wire [31:0] x_i1_j_2              ;
wire [31:0] y_i1_j1_2             ;
wire [ 3:0] counter_out_ready_ok_2;
wire [ 8:0] counter_row_scan1_2   ;
wire [ 8:0] counter_sum_2         ;
wire        en_counter_sum_2      ;
wire        vld2                  ;
wire        busy_2                ;
wire [4:0] symbol_2               ;
wire [15:0] hap_len_2             ;
wire [95:0] head_read_hap_id_2    ;
wire [ 4:0] counter_head_2        ;
wire        signal_2              ;
wire [4:0] 	number_2			  ;
/*---------------------------------m3----------------------------------*/

wire [31:0] matrix_memory_data_3 ;
wire        matrix_memory_eop_3 ;
wire        matrix_memory_sop_3   ;
wire        matrix_memory_vld_3   ;
wire [31:0] m_i_j_3               ;
wire [31:0] x_i_j_3               ;
wire [31:0] y_i_j_3               ;
wire [31:0] p_mx_3                ;
wire [31:0] p_my_3                ;
wire [31:0] p_xx_yy_3             ;
wire [31:0] p_xm_ym_3             ;
wire [31:0] p_mm_3                ;
wire [31:0] m_i1_j1_3             ;
wire [31:0] m_i1_j_3              ;
wire [31:0] x_i1_j1_3             ;
wire [31:0] x_i1_j_3              ;
wire [31:0] y_i1_j1_3             ;
wire [ 3:0] counter_out_ready_ok_3;
wire [ 8:0] counter_row_scan1_3   ;
wire [ 8:0] counter_sum_3         ;
wire        en_counter_sum_3      ;
wire        vld3                  ;
wire        busy_3                ;
wire [4:0] symbol_3              ;
wire [15:0] hap_len_3             ;
wire [95:0] head_read_hap_id_3    ;
wire [ 4:0] counter_head_3        ;
wire        signal_3              ;
wire [4:0] 	number_3			  ;
/*---------------------------------m4----------------------------------*/

wire [31:0] matrix_memory_data_4 ;
wire        matrix_memory_eop_4 ;
wire        matrix_memory_sop_4   ;
wire        matrix_memory_vld_4   ;
wire [31:0] m_i_j_4               ;
wire [31:0] x_i_j_4               ;
wire [31:0] y_i_j_4               ;
wire [31:0] p_mx_4                ;
wire [31:0] p_my_4                ;
wire [31:0] p_xx_yy_4             ;
wire [31:0] p_xm_ym_4             ;
wire [31:0] p_mm_4                ;
wire [31:0] m_i1_j1_4             ;
wire [31:0] m_i1_j_4              ;
wire [31:0] x_i1_j1_4             ;
wire [31:0] x_i1_j_4              ;
wire [31:0] y_i1_j1_4             ;
wire [ 3:0] counter_out_ready_ok_4;
wire [ 8:0] counter_row_scan1_4   ;
wire [ 8:0] counter_sum_4         ;
wire        en_counter_sum_4      ;
wire        vld4                  ;
wire        busy_4                ;
wire [4:0] symbol_4              ;
wire [15:0] hap_len_4             ;
wire [95:0] head_read_hap_id_4    ;
wire [ 4:0] counter_head_4        ;
wire        signal_4              ;
wire [4:0] 	number_4			  ;
/*---------------------------------m5----------------------------------*/

wire [31:0] matrix_memory_data_5 ;
wire        matrix_memory_eop_5 ;
wire        matrix_memory_sop_5   ;
wire        matrix_memory_vld_5   ;
wire [31:0] m_i_j_5              ;
wire [31:0] x_i_j_5               ;
wire [31:0] y_i_j_5               ;
wire [31:0] p_mx_5                ;
wire [31:0] p_my_5                ;
wire [31:0] p_xx_yy_5             ;
wire [31:0] p_xm_ym_5             ;
wire [31:0] p_mm_5                ;
wire [31:0] m_i1_j1_5             ;
wire [31:0] m_i1_j_5              ;
wire [31:0] x_i1_j1_5             ;
wire [31:0] x_i1_j_5              ;
wire [31:0] y_i1_j1_5             ;
wire [ 3:0] counter_out_ready_ok_5;
wire [ 8:0] counter_row_scan1_5   ;
wire [ 8:0] counter_sum_5         ;
wire        en_counter_sum_5      ;
wire        vld5                  ;
wire        busy_5                ;
wire [4:0] symbol_5              ;
wire [15:0] hap_len_5             ;
wire [95:0] head_read_hap_id_5    ;
wire [ 4:0] counter_head_5        ;
wire        signal_5              ;
wire [4:0] 	number_5			  ;
/*---------------------------------m6----------------------------------*/

wire [31:0] matrix_memory_data_6  ;
wire        matrix_memory_eop_6   ;
wire        matrix_memory_sop_6   ;
wire        matrix_memory_vld_6   ;
wire [31:0] m_i_j_6               ;
wire [31:0] x_i_j_6               ;
wire [31:0] y_i_j_6               ;
wire [31:0] p_mx_6                ;
wire [31:0] p_my_6                ;
wire [31:0] p_xx_yy_6             ;
wire [31:0] p_xm_ym_6             ;
wire [31:0] p_mm_6                ;
wire [31:0] m_i1_j1_6             ;
wire [31:0] m_i1_j_6              ;
wire [31:0] x_i1_j1_6             ;
wire [31:0] x_i1_j_6              ;
wire [31:0] y_i1_j1_6             ;
wire [ 3:0] counter_out_ready_ok_6;
wire [ 8:0] counter_row_scan1_6   ;
wire [ 8:0] counter_sum_6         ;
wire        en_counter_sum_6      ;
wire        vld6                  ;
wire        busy_6                ;
wire [4:0] symbol_6              ;
wire [15:0] hap_len_6             ;
wire [95:0] head_read_hap_id_6    ;
wire [ 4:0] counter_head_6        ;
wire        signal_6              ;
wire [4:0] 	number_6			  ;
/*---------------------------------m7----------------------------------*/

wire [31:0] matrix_memory_data_7  ;
wire        matrix_memory_eop_7   ;
wire        matrix_memory_sop_7   ;
wire        matrix_memory_vld_7   ;
wire [31:0] m_i_j_7               ;
wire [31:0] x_i_j_7               ;
wire [31:0] y_i_j_7               ;
wire [31:0] p_mx_7                ;
wire [31:0] p_my_7                ;
wire [31:0] p_xx_yy_7             ;
wire [31:0] p_mm_7                ;
wire [31:0] m_i1_j1_7             ;
wire [31:0] m_i1_j_7              ;
wire [31:0] p_xm_ym_7             ;
wire [31:0] x_i1_j1_7             ;
wire [31:0] x_i1_j_7              ;
wire [31:0] y_i1_j1_7             ;
wire [ 3:0] counter_out_ready_ok_7;
wire [ 8:0] counter_row_scan1_7   ;
wire [ 8:0] counter_sum_7         ;
wire        en_counter_sum_7      ;
wire        vld7                  ;
wire        busy_7                ;
wire [4:0] symbol_7              ;
wire [15:0] hap_len_7             ;
wire [95:0] head_read_hap_id_7    ;
wire [ 4:0] counter_head_7        ;
wire        signal_7              ;
wire [4:0] 	number_7			  ;
/*---------------------------------m8----------------------------------*/

wire [31:0] matrix_memory_data_8  ;
wire        matrix_memory_eop_8   ;
wire        matrix_memory_sop_8   ;
wire        matrix_memory_vld_8   ;
wire [31:0] m_i_j_8               ;
wire [31:0] x_i_j_8               ;
wire [31:0] y_i_j_8               ;
wire [31:0] p_mx_8                ;
wire [31:0] p_my_8                ;
wire [31:0] p_xx_yy_8             ;
wire [31:0] p_xm_ym_8             ;
wire [31:0] p_mm_8                ;
wire [31:0] m_i1_j1_8             ;
wire [31:0] m_i1_j_8              ;
wire [31:0] x_i1_j1_8             ;
wire [31:0] x_i1_j_8              ;
wire [31:0] y_i1_j1_8             ;
wire [ 3:0] counter_out_ready_ok_8;
wire [ 8:0] counter_row_scan1_8   ;
wire [ 8:0] counter_sum_8         ;
wire        en_counter_sum_8      ;
wire        vld8                  ;
wire        busy_8                ;
wire [4:0] symbol_8              ;
wire [15:0] hap_len_8             ;
wire [95:0] head_read_hap_id_8    ;
wire [ 4:0] counter_head_8        ;
wire        signal_8              ;
wire [4:0] 	number_8			  ;
/*---------------------------------m9----------------------------------*/

wire [31:0] matrix_memory_data_9  ;
wire        matrix_memory_eop_9   ;
wire        matrix_memory_sop_9   ;
wire        matrix_memory_vld_9   ;
wire [31:0] m_i_j_9               ;
wire [31:0] x_i_j_9               ;
wire [31:0] y_i_j_9               ;
wire [31:0] p_mx_9                ;
wire [31:0] p_my_9                ;
wire [31:0] p_xx_yy_9             ;
wire [31:0] p_xm_ym_9             ;
wire [31:0] p_mm_9                ;
wire [31:0] m_i1_j1_9             ;
wire [31:0] m_i1_j_9              ;
wire [31:0] x_i1_j1_9             ;
wire [31:0] x_i1_j_9              ;
wire [31:0] y_i1_j1_9             ;
wire [ 3:0] counter_out_ready_ok_9;
wire [ 8:0] counter_row_scan1_9   ;
wire [ 8:0] counter_sum_9         ;
wire        en_counter_sum_9      ;
wire        vld9                  ;
wire        busy_9                ;
wire [4:0]  symbol_9              ;
wire [15:0] hap_len_9             ;
wire [95:0] head_read_hap_id_9    ;
wire [ 4:0] counter_head_9        ;
wire        signal_9              ;
wire [4:0] 	number_9			  ;

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/


/*----------------------------matrix_memory--------------------------*/

calculate_model c1 (
	//input
	.p_mx                (p_mx                ),
	.p_my                (p_my                ),
	.p_xx_yy             (p_xx_yy             ),
	.p_xm_ym             (p_xm_ym             ),
	.p_mm                (p_mm                ),
	.counter_out_ready_ok(counter_out_ready_ok),
	.counter_row_scan1   (counter_row_scan1   ),
	.sys_clk             (sys_clk             ),
	.sys_rst             (sys_rst             ),
	.m_i1_j1             (m_i1_j1             ),
	.m_i1_j              (m_i1_j              ),
	.x_i1_j1             (x_i1_j1             ),
	.x_i1_j              (x_i1_j              ),
	.y_i1_j1             (y_i1_j1             ),
	.counter_sum         (counter_sum         ),
	.en_counter_sum      (en_counter_sum      ),
	.symbol              (symbol              ),
	.hap_len             (hap_len             ),
	.head_read_hap_id 	 (head_read_hap_id    ),	
	//output
	.m_i_j               (m_i_j               ),
	.x_i_j               (x_i_j               ),
	.y_i_j               (y_i_j               ),
	.result              (result              ),
	.result_vld          (result_vld          )
);




matrix_memory m1 (
	.matrix_memory_sop   (matrix_memory_sop_1   ),
	.matrix_memory_eop   (matrix_memory_eop_1   ),
	.matrix_memory_vld   (matrix_memory_vld_1   ),
	.matrix_memory_data  (matrix_memory_data_1  ),
	.m_i_j               (m_i_j_1               ),
	.x_i_j               (x_i_j_1               ),
	.y_i_j               (y_i_j_1               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number(number_1),
	.p_mx                (p_mx_1                ),
	.p_my                (p_my_1                ),
	.p_xx_yy             (p_xx_yy_1             ),
	.p_xm_ym             (p_xm_ym_1             ),
	.p_mm                (p_mm_1                ),
	.m_i1_j1             (m_i1_j1_1             ),
	.m_i1_j              (m_i1_j_1              ),
	.x_i1_j1             (x_i1_j1_1             ),
	.x_i1_j              (x_i1_j_1              ),
	.y_i1_j1             (y_i1_j1_1             ),
	.counter_out_ready_ok(counter_out_ready_ok_1),
	.counter_row_scan1   (counter_row_scan1_1   ),
	.counter_sum         (counter_sum_1         ),
	.vld                 (vld1                  ),
	.busy                (busy_1                ),
	.en_counter_sum      (en_counter_sum_1      ),
	.hap_length          (hap_len_1             ),
	.symbol              (symbol_1              ),
	.head_read_hap_id    (head_read_hap_id_1    ),
	.counter_head        (counter_head_1        ),
	.signal              (signal_1              )
);


matrix_memory m2 (
	.matrix_memory_sop   (matrix_memory_sop_2   ),
	.matrix_memory_eop   (matrix_memory_eop_2   ),
	.matrix_memory_vld   (matrix_memory_vld_2   ),
	.matrix_memory_data  (matrix_memory_data_2  ),
	.m_i_j               (m_i_j_2               ),
	.x_i_j               (x_i_j_2               ),
	.y_i_j               (y_i_j_2               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number(number_2),
	.p_mx                (p_mx_2                ),
	.p_my                (p_my_2                ),
	.p_xx_yy             (p_xx_yy_2             ),
	.p_xm_ym             (p_xm_ym_2             ),
	.p_mm                (p_mm_2                ),
	.m_i1_j1             (m_i1_j1_2             ),
	.m_i1_j              (m_i1_j_2              ),
	.x_i1_j1             (x_i1_j1_2              ),
	.x_i1_j              (x_i1_j_2              ),
	.y_i1_j1             (y_i1_j1_2             ),
	.counter_out_ready_ok(counter_out_ready_ok_2),
	.counter_row_scan1   (counter_row_scan1_2   ),
	.counter_sum         (counter_sum_2         ),
	.vld 				 (vld2                  ),
	.busy                (busy_2				),
	.en_counter_sum      (en_counter_sum_2      ),
	.hap_length			 (hap_len_2			  	),
	.symbol			 	 (symbol_2				),
	.head_read_hap_id    (head_read_hap_id_2    ),
	.counter_head        (counter_head_2        ),
	.signal              (signal_2              )
);


matrix_memory m3 (
	.matrix_memory_sop   (matrix_memory_sop_3   ),
	.matrix_memory_eop   (matrix_memory_eop_3   ),
	.matrix_memory_vld   (matrix_memory_vld_3   ),
	.matrix_memory_data  (matrix_memory_data_3  ),
	.m_i_j               (m_i_j_3               ),
	.x_i_j               (x_i_j_3               ),
	.y_i_j               (y_i_j_3               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number(number_3),
	.p_mx                (p_mx_3                ),
	.p_my                (p_my_3                ),
	.p_xx_yy             (p_xx_yy_3             ),
	.p_xm_ym             (p_xm_ym_3             ),
	.p_mm                (p_mm_3                ),
	.m_i1_j1             (m_i1_j1_3             ),
	.m_i1_j              (m_i1_j_3              ),
	.x_i1_j1             (x_i1_j1_3              ),
	.x_i1_j              (x_i1_j_3              ),
	.y_i1_j1             (y_i1_j1_3             ),
	.counter_out_ready_ok(counter_out_ready_ok_3),
	.counter_row_scan1   (counter_row_scan1_3   ),
	.counter_sum         (counter_sum_3         ),
	.vld 				 (vld3                  ),
	.busy                (busy_3	     		),
	.en_counter_sum      (en_counter_sum_3      ),
	.hap_length			 (hap_len_3			  	),
	.symbol			 	 (symbol_3				),
	.head_read_hap_id    (head_read_hap_id_3    ),
	.counter_head        (counter_head_3        ),
	.signal              (signal_3              )
);

matrix_memory m4 (
	.matrix_memory_sop   (matrix_memory_sop_4   ),
	.matrix_memory_eop   (matrix_memory_eop_4   ),
	.matrix_memory_vld   (matrix_memory_vld_4   ),
	.matrix_memory_data  (matrix_memory_data_4  ),
	.m_i_j               (m_i_j_4               ),
	.x_i_j               (x_i_j_4               ),
	.y_i_j               (y_i_j_4               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number(number_4),
	.p_mx                (p_mx_4                ),
	.p_my                (p_my_4                ),
	.p_xx_yy             (p_xx_yy_4             ),
	.p_xm_ym             (p_xm_ym_4             ),
	.p_mm                (p_mm_4                ),
	.m_i1_j1             (m_i1_j1_4             ),
	.m_i1_j              (m_i1_j_4              ),
	.x_i1_j1             (x_i1_j1_4              ),
	.x_i1_j              (x_i1_j_4              ),
	.y_i1_j1             (y_i1_j1_4             ),
	.counter_out_ready_ok(counter_out_ready_ok_4),
	.counter_row_scan1   (counter_row_scan1_4   ),
	.counter_sum         (counter_sum_4         ),
	.vld 				 (vld4                  ),
	.busy                (busy_4			    ),
	.en_counter_sum      (en_counter_sum_4      ),
	.hap_length			 (hap_len_4			  	),
	.symbol			 	 (symbol_4				),
	.head_read_hap_id    (head_read_hap_id_4    ),
	.counter_head        (counter_head_4        ),
	.signal              (signal_4              )
);

matrix_memory m5 (
	.matrix_memory_sop   (matrix_memory_sop_5   ),
	.matrix_memory_eop   (matrix_memory_eop_5   ),
	.matrix_memory_vld   (matrix_memory_vld_5   ),
	.matrix_memory_data  (matrix_memory_data_5  ),
	.m_i_j               (m_i_j_5               ),
	.x_i_j               (x_i_j_5               ),
	.y_i_j               (y_i_j_5               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number(number_5),
	.p_mx                (p_mx_5                ),
	.p_my                (p_my_5                ),
	.p_xx_yy             (p_xx_yy_5             ),
	.p_xm_ym             (p_xm_ym_5             ),
	.p_mm                (p_mm_5                ),
	.m_i1_j1             (m_i1_j1_5             ),
	.m_i1_j              (m_i1_j_5              ),
	.x_i1_j1             (x_i1_j1_5              ),
	.x_i1_j              (x_i1_j_5              ),
	.y_i1_j1             (y_i1_j1_5             ),
	.counter_out_ready_ok(counter_out_ready_ok_5),
	.counter_row_scan1   (counter_row_scan1_5   ),
	.counter_sum         (counter_sum_5         ),
	.vld 				 (vld5                  ),
	.busy                (busy_5				),
	.en_counter_sum      (en_counter_sum_5      ),
	.hap_length			 (hap_len_5			  	),
	.symbol			 	 (symbol_5				),
	.head_read_hap_id    (head_read_hap_id_5    ),
	.counter_head        (counter_head_5        ),
	.signal              (signal_5              )
);


matrix_memory m6 (
	.matrix_memory_sop   (matrix_memory_sop_6   ),
	.matrix_memory_eop   (matrix_memory_eop_6   ),
	.matrix_memory_vld   (matrix_memory_vld_6   ),
	.matrix_memory_data  (matrix_memory_data_6  ),
	.m_i_j               (m_i_j_6               ),
	.x_i_j               (x_i_j_6               ),
	.y_i_j               (y_i_j_6               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number              (number_6              ),
	.p_mx                (p_mx_6                ),
	.p_my                (p_my_6                ),
	.p_xx_yy             (p_xx_yy_6             ),
	.p_xm_ym             (p_xm_ym_6             ),
	.p_mm                (p_mm_6                ),
	.m_i1_j1             (m_i1_j1_6             ),
	.m_i1_j              (m_i1_j_6              ),
	.x_i1_j1             (x_i1_j1_6             ),
	.x_i1_j              (x_i1_j_6              ),
	.y_i1_j1             (y_i1_j1_6             ),
	.counter_out_ready_ok(counter_out_ready_ok_6),
	.counter_row_scan1   (counter_row_scan1_6   ),
	.counter_sum         (counter_sum_6         ),
	.vld 				         (vld6                  ),
	.busy                (busy_6				        ),
	.en_counter_sum      (en_counter_sum_6      ),
	.hap_length			     (hap_len_6			  	    ),
	.symbol			 	       (symbol_6				      ),
	.head_read_hap_id    (head_read_hap_id_6    ),
	.counter_head        (counter_head_6        ),
	.signal              (signal_6              )
);


matrix_memory m7 (
	.matrix_memory_sop   (matrix_memory_sop_7   ),
	.matrix_memory_eop   (matrix_memory_eop_7   ),
	.matrix_memory_vld   (matrix_memory_vld_7   ),
	.matrix_memory_data  (matrix_memory_data_7  ),
	.m_i_j               (m_i_j_7               ),
	.x_i_j               (x_i_j_7               ),
	.y_i_j               (y_i_j_7               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number 			 (number_7),
	.p_mx                (p_mx_7                ),
	.p_my                (p_my_7                ),
	.p_xx_yy             (p_xx_yy_7             ),
	.p_xm_ym             (p_xm_ym_7             ),
	.p_mm                (p_mm_7                ),
	.m_i1_j1             (m_i1_j1_7             ),
	.m_i1_j              (m_i1_j_7              ),
	.x_i1_j1             (x_i1_j1_7              ),
	.x_i1_j              (x_i1_j_7              ),
	.y_i1_j1             (y_i1_j1_7             ),
	.counter_out_ready_ok(counter_out_ready_ok_7),
	.counter_row_scan1   (counter_row_scan1_7   ),
	.counter_sum         (counter_sum_7         ),
	.vld 				 (vld7                  ),
	.busy                (busy_7				),
	.en_counter_sum      (en_counter_sum_7      ),
	.hap_length			 (hap_len_7			  	),
	.symbol			 	 (symbol_7				),
	.head_read_hap_id    (head_read_hap_id_7    ),
	.counter_head        (counter_head_7        ),
	.signal              (signal_7              )
);


matrix_memory m8 (
	.matrix_memory_sop   (matrix_memory_sop_8   ),
	.matrix_memory_eop   (matrix_memory_eop_8   ),
	.matrix_memory_vld   (matrix_memory_vld_8   ),
	.matrix_memory_data  (matrix_memory_data_8  ),
	.m_i_j               (m_i_j_8               ),
	.x_i_j               (x_i_j_8               ),
	.y_i_j               (y_i_j_8               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number(number_8),
	.p_mx                (p_mx_8                ),
	.p_my                (p_my_8                ),
	.p_xx_yy             (p_xx_yy_8             ),
	.p_xm_ym             (p_xm_ym_8             ),
	.p_mm                (p_mm_8                ),
	.m_i1_j1             (m_i1_j1_8             ),
	.m_i1_j              (m_i1_j_8              ),
	.x_i1_j1             (x_i1_j1_8              ),
	.x_i1_j              (x_i1_j_8              ),
	.y_i1_j1             (y_i1_j1_8             ),
	.counter_out_ready_ok(counter_out_ready_ok_8),
	.counter_row_scan1   (counter_row_scan1_8   ),
	.counter_sum         (counter_sum_8         ),
	.vld 				 (vld8                  ),
	.busy                (busy_8				),
	.en_counter_sum      (en_counter_sum_8      ),
	.hap_length			 (hap_len_8			  	),
	.symbol			 	 (symbol_8				),
	.head_read_hap_id    (head_read_hap_id_8    ),
	.counter_head        (counter_head_8        ),
	.signal              (signal_8              )
);


matrix_memory m9 (
	.matrix_memory_sop   (matrix_memory_sop_9   ),
	.matrix_memory_eop   (matrix_memory_eop_9   ),
	.matrix_memory_vld   (matrix_memory_vld_9   ),
	.matrix_memory_data  (matrix_memory_data_9  ),
	.m_i_j               (m_i_j_9               ),
	.x_i_j               (x_i_j_9               ),
	.y_i_j               (y_i_j_9               ),
	.sys_clk             (sys_clk               ),
	.sys_rst             (sys_rst               ),
	.number(number_9),
	.p_mx                (p_mx_9                ),
	.p_my                (p_my_9                ),
	.p_xx_yy             (p_xx_yy_9             ),
	.p_xm_ym             (p_xm_ym_9             ),
	.p_mm                (p_mm_9                ),
	.m_i1_j1             (m_i1_j1_9             ),
	.m_i1_j              (m_i1_j_9              ),
	.x_i1_j1             (x_i1_j1_9              ),
	.x_i1_j              (x_i1_j_9              ),
	.y_i1_j1             (y_i1_j1_9             ),
	.counter_out_ready_ok(counter_out_ready_ok_9),
	.counter_row_scan1   (counter_row_scan1_9   ),
	.counter_sum         (counter_sum_9         ),
	.vld 				 (vld9                  ),
	.busy                (busy_9				),
	.en_counter_sum      (en_counter_sum_9      ),
	.hap_length			 (hap_len_9			  	),
	.symbol			 	 (symbol_9				),
	.head_read_hap_id    (head_read_hap_id_9    ),
	.counter_head        (counter_head_9        ),
	.signal              (signal_9              )
);


/*--------------------------control part-----------------------*/
reg  [8:0] shift_reg_m_c;
reg 	   enable;
wire [8:0] busy_all;

assign busy_all = {busy_9,busy_8,busy_7,busy_6,busy_5,busy_4,busy_3,busy_2,busy_1};


always @(posedge sys_clk or negedge sys_rst) //shift_reg_in 用来控制数据输入
begin 
	if (!sys_rst)
		shift_reg_in <= 9'b000000001;
	else if (matrix_memory_eop)
		shift_reg_in <= {shift_reg_in [7:0], shift_reg_in [8] }; 
	else if (((busy_all&shift_reg_in) == shift_reg_in) && matrix_memory_vld != 1)
		shift_reg_in <= {shift_reg_in [7:0], shift_reg_in [8] }; 
end
 
always @(posedge sys_clk or negedge sys_rst) //输入使能信号 enable
begin
	if (!sys_rst)
		enable <= 0;
	else if (fifo_almost_full)
	   enable <= 0;
	else if (matrix_memory_sop)
		enable <= 0;
	else if ((busy_all & shift_reg_in) == 9'b0)
		enable <= 1;
 end

/*--------------------------------------number --------------------------------------*/
assign number_1 = 5'd1;
assign number_2 = 5'd2;
assign number_3 = 5'd3;
assign number_4 = 5'd4;
assign number_5 = 5'd5;
assign number_6 = 5'd6;
assign number_7 = 5'd7;
assign number_8 = 5'd8;
assign number_9 = 5'd9;


/*-------------------------------------- m1 --------------------------------------*/
assign matrix_memory_data_1 = (shift_reg_in == 9'b000000001) ? matrix_memory_data : 0	;
assign matrix_memory_eop_1  = (shift_reg_in == 9'b000000001) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_1  = (shift_reg_in == 9'b000000001) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_1 	= (shift_reg_in == 9'b000000001) ? matrix_memory_vld  : 0	;
assign m_i_j_1 				= (shift_reg_m_c== 9'b000010000) ? m_i_j 			  : 0	;
assign x_i_j_1  			= (shift_reg_m_c== 9'b000010000) ? x_i_j 			  : 0	;
assign y_i_j_1  			= (shift_reg_m_c== 9'b000010000) ? y_i_j 			  : 0	;

/*-------------------------------------- m2 --------------------------------------*/
assign matrix_memory_data_2 = (shift_reg_in == 9'b000000010) ? matrix_memory_data : 0	;
assign matrix_memory_eop_2  = (shift_reg_in == 9'b000000010) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_2  = (shift_reg_in == 9'b000000010) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_2 	= (shift_reg_in == 9'b000000010) ? matrix_memory_vld  : 0	;
assign m_i_j_2 				= (shift_reg_m_c== 9'b000100000) ? m_i_j 			  : 0	;
assign x_i_j_2  			= (shift_reg_m_c== 9'b000100000) ? x_i_j 			  : 0	;
assign y_i_j_2  			= (shift_reg_m_c== 9'b000100000) ? y_i_j 			  : 0	;


/*-------------------------------------- m3 --------------------------------------*/
assign matrix_memory_data_3 = (shift_reg_in == 9'b000000100) ? matrix_memory_data : 0	;
assign matrix_memory_eop_3  = (shift_reg_in == 9'b000000100) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_3  = (shift_reg_in == 9'b000000100) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_3 	= (shift_reg_in == 9'b000000100) ? matrix_memory_vld  : 0	;
assign m_i_j_3 				= (shift_reg_m_c== 9'b001000000) ? m_i_j 			  : 0	;
assign x_i_j_3  			= (shift_reg_m_c== 9'b001000000) ? x_i_j 			  : 0	;
assign y_i_j_3  			= (shift_reg_m_c== 9'b001000000) ? y_i_j 			  : 0	;

/*-------------------------------------- m4 --------------------------------------*/
assign matrix_memory_data_4 = (shift_reg_in == 9'b000001000) ? matrix_memory_data : 0	;
assign matrix_memory_eop_4  = (shift_reg_in == 9'b000001000) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_4  = (shift_reg_in == 9'b000001000) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_4 	= (shift_reg_in == 9'b000001000) ? matrix_memory_vld  : 0	;
assign m_i_j_4 				= (shift_reg_m_c== 9'b010000000) ? m_i_j 			  : 0	;
assign x_i_j_4  			= (shift_reg_m_c== 9'b010000000) ? x_i_j 			  : 0	;
assign y_i_j_4  			= (shift_reg_m_c== 9'b010000000) ? y_i_j 			  : 0	;

/*-------------------------------------- m5 --------------------------------------*/
assign matrix_memory_data_5 = (shift_reg_in == 9'b000010000) ? matrix_memory_data : 0	;
assign matrix_memory_eop_5  = (shift_reg_in == 9'b000010000) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_5  = (shift_reg_in == 9'b000010000) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_5 	= (shift_reg_in == 9'b000010000) ? matrix_memory_vld  : 0	;
assign m_i_j_5 				= (shift_reg_m_c== 9'b100000000) ? m_i_j 			  : 0	;
assign x_i_j_5  			= (shift_reg_m_c== 9'b100000000) ? x_i_j 			  : 0	;
assign y_i_j_5  			= (shift_reg_m_c== 9'b100000000) ? y_i_j 			  : 0	;

/*-------------------------------------- m6 --------------------------------------*/
assign matrix_memory_data_6 = (shift_reg_in == 9'b000100000) ? matrix_memory_data : 0	;
assign matrix_memory_eop_6  = (shift_reg_in == 9'b000100000) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_6  = (shift_reg_in == 9'b000100000) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_6 	= (shift_reg_in == 9'b000100000) ? matrix_memory_vld  : 0	;
assign m_i_j_6 				= (shift_reg_m_c== 9'b000000001) ? m_i_j 			  : 0	;
assign x_i_j_6  			= (shift_reg_m_c== 9'b000000001) ? x_i_j 			  : 0	;
assign y_i_j_6  			= (shift_reg_m_c== 9'b000000001) ? y_i_j 			  : 0	;

/*-------------------------------------- m7 --------------------------------------*/
assign matrix_memory_data_7 = (shift_reg_in == 9'b001000000) ? matrix_memory_data : 0	;
assign matrix_memory_eop_7  = (shift_reg_in == 9'b001000000) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_7  = (shift_reg_in == 9'b001000000) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_7 	= (shift_reg_in == 9'b001000000) ? matrix_memory_vld  : 0	;
assign m_i_j_7 				= (shift_reg_m_c== 9'b000000010) ? m_i_j 			  : 0	;
assign x_i_j_7  			= (shift_reg_m_c== 9'b000000010) ? x_i_j 			  : 0	;
assign y_i_j_7  			= (shift_reg_m_c== 9'b000000010) ? y_i_j 			  : 0	;

/*-------------------------------------- m8 --------------------------------------*/
assign matrix_memory_data_8 = (shift_reg_in == 9'b010000000) ? matrix_memory_data : 0	;
assign matrix_memory_eop_8  = (shift_reg_in == 9'b010000000) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_8  = (shift_reg_in == 9'b010000000) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_8 	= (shift_reg_in == 9'b010000000) ? matrix_memory_vld  : 0	;
assign m_i_j_8 				= (shift_reg_m_c== 9'b000000100) ? m_i_j 			  : 0	;
assign x_i_j_8  			= (shift_reg_m_c== 9'b000000100) ? x_i_j 			  : 0	;
assign y_i_j_8  			= (shift_reg_m_c== 9'b000000100) ? y_i_j 			  : 0	;

/*-------------------------------------- m9 --------------------------------------*/
assign matrix_memory_data_9 = (shift_reg_in == 9'b100000000) ? matrix_memory_data : 0	;
assign matrix_memory_eop_9  = (shift_reg_in == 9'b100000000) ? matrix_memory_eop  : 0	;
assign matrix_memory_sop_9  = (shift_reg_in == 9'b100000000) ? matrix_memory_sop  : 0	;
assign matrix_memory_vld_9 	= (shift_reg_in == 9'b100000000) ? matrix_memory_vld  : 0	;
assign m_i_j_9 				= (shift_reg_m_c== 9'b000001000) ? m_i_j 			  : 0	;
assign x_i_j_9  			= (shift_reg_m_c== 9'b000001000) ? x_i_j 			  : 0	;
assign y_i_j_9  			= (shift_reg_m_c== 9'b000001000) ? y_i_j 			  : 0	;




assign {vld9,vld8,vld7,vld6,vld5,vld4,vld3,vld2,vld1} = shift_reg_m_c ;


/*----------------------------------m to c -------------------------------*/
always @(posedge sys_clk or negedge sys_rst) //shift_reg_m_c
begin 
	if (!sys_rst)
		shift_reg_m_c <= 9'b000000001;
	else 
		shift_reg_m_c <= {shift_reg_m_c [7:0] , shift_reg_m_c[8]};
end



always @ (*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : head_read_hap_id = head_read_hap_id_6;
		9'b000000010 : head_read_hap_id = head_read_hap_id_7;
		9'b000000100 : head_read_hap_id = head_read_hap_id_8;
		9'b000001000 : head_read_hap_id = head_read_hap_id_9;
		9'b000010000 : head_read_hap_id = head_read_hap_id_1;
		9'b000100000 : head_read_hap_id = head_read_hap_id_2;
		9'b001000000 : head_read_hap_id = head_read_hap_id_3;
		9'b010000000 : head_read_hap_id = head_read_hap_id_4;
		9'b100000000 : head_read_hap_id = head_read_hap_id_5;
		default		 : head_read_hap_id = 0		;
	endcase 
end


always @ (*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : p_mx = p_mx_6;
		9'b000000010 : p_mx = p_mx_7;
		9'b000000100 : p_mx = p_mx_8;
		9'b000001000 : p_mx = p_mx_9;
		9'b000010000 : p_mx = p_mx_1;
		9'b000100000 : p_mx = p_mx_2;
		9'b001000000 : p_mx = p_mx_3;
		9'b010000000 : p_mx = p_mx_4;
		9'b100000000 : p_mx = p_mx_5;
		default		 : p_mx = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : p_my = p_my_6;
		9'b000000010 : p_my = p_my_7;
		9'b000000100 : p_my = p_my_8;
		9'b000001000 : p_my = p_my_9;
		9'b000010000 : p_my = p_my_1;
		9'b000100000 : p_my = p_my_2;
		9'b001000000 : p_my = p_my_3;
		9'b010000000 : p_my = p_my_4;
		9'b100000000 : p_my = p_my_5;
		default		 : p_my = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : p_xx_yy = p_xx_yy_6;
		9'b000000010 : p_xx_yy = p_xx_yy_7;
		9'b000000100 : p_xx_yy = p_xx_yy_8;
		9'b000001000 : p_xx_yy = p_xx_yy_9;
		9'b000010000 : p_xx_yy = p_xx_yy_1;
		9'b000100000 : p_xx_yy = p_xx_yy_2;
		9'b001000000 : p_xx_yy = p_xx_yy_3;
		9'b010000000 : p_xx_yy = p_xx_yy_4;
		9'b100000000 : p_xx_yy = p_xx_yy_5;
		default		 : p_xx_yy = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : p_xm_ym = p_xm_ym_6;
		9'b000000010 : p_xm_ym = p_xm_ym_7;
		9'b000000100 : p_xm_ym = p_xm_ym_8;
		9'b000001000 : p_xm_ym = p_xm_ym_9;
		9'b000010000 : p_xm_ym = p_xm_ym_1;
		9'b000100000 : p_xm_ym = p_xm_ym_2;
		9'b001000000 : p_xm_ym = p_xm_ym_3;
		9'b010000000 : p_xm_ym = p_xm_ym_4;
		9'b100000000 : p_xm_ym = p_xm_ym_5;
		default		 : p_xm_ym = 0		;
	endcase 
end

always @ (*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : p_mm = p_mm_6;
		9'b000000010 : p_mm = p_mm_7;
		9'b000000100 : p_mm = p_mm_8;
		9'b000001000 : p_mm = p_mm_9;
		9'b000010000 : p_mm = p_mm_1;
		9'b000100000 : p_mm = p_mm_2;
		9'b001000000 : p_mm = p_mm_3;
		9'b010000000 : p_mm = p_mm_4;
		9'b100000000 : p_mm = p_mm_5;
		default		 : p_mm = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : counter_out_ready_ok = counter_out_ready_ok_6;
		9'b000000010 : counter_out_ready_ok = counter_out_ready_ok_7;
		9'b000000100 : counter_out_ready_ok = counter_out_ready_ok_8;
		9'b000001000 : counter_out_ready_ok = counter_out_ready_ok_9;
		9'b000010000 : counter_out_ready_ok = counter_out_ready_ok_1;
		9'b000100000 : counter_out_ready_ok = counter_out_ready_ok_2;
		9'b001000000 : counter_out_ready_ok = counter_out_ready_ok_3;
		9'b010000000 : counter_out_ready_ok = counter_out_ready_ok_4;
		9'b100000000 : counter_out_ready_ok = counter_out_ready_ok_5;
		default		 : counter_out_ready_ok = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : counter_row_scan1 = counter_row_scan1_6;
		9'b000000010 : counter_row_scan1 = counter_row_scan1_7;
		9'b000000100 : counter_row_scan1 = counter_row_scan1_8;
		9'b000001000 : counter_row_scan1 = counter_row_scan1_9;
		9'b000010000 : counter_row_scan1 = counter_row_scan1_1;
		9'b000100000 : counter_row_scan1 = counter_row_scan1_2;
		9'b001000000 : counter_row_scan1 = counter_row_scan1_3;
		9'b010000000 : counter_row_scan1 = counter_row_scan1_4;
		9'b100000000 : counter_row_scan1 = counter_row_scan1_5;
		default		 : counter_row_scan1 = 0		;
	endcase 
end




always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : m_i1_j1 = m_i1_j1_6;
		9'b000000010 : m_i1_j1 = m_i1_j1_7;
		9'b000000100 : m_i1_j1 = m_i1_j1_8;
		9'b000001000 : m_i1_j1 = m_i1_j1_9;
		9'b000010000 : m_i1_j1 = m_i1_j1_1;
		9'b000100000 : m_i1_j1 = m_i1_j1_2;
		9'b001000000 : m_i1_j1 = m_i1_j1_3;
		9'b010000000 : m_i1_j1 = m_i1_j1_4;
		9'b100000000 : m_i1_j1 = m_i1_j1_5;
		default		 : m_i1_j1 = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : m_i1_j = m_i1_j_6;
		9'b000000010 : m_i1_j = m_i1_j_7;
		9'b000000100 : m_i1_j = m_i1_j_8;
		9'b000001000 : m_i1_j = m_i1_j_9;
		9'b000010000 : m_i1_j = m_i1_j_1;
		9'b000100000 : m_i1_j = m_i1_j_2;
		9'b001000000 : m_i1_j = m_i1_j_3;
		9'b010000000 : m_i1_j = m_i1_j_4;
		9'b100000000 : m_i1_j = m_i1_j_5;
		default		 : m_i1_j = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : x_i1_j1 = x_i1_j1_6;
		9'b000000010 : x_i1_j1 = x_i1_j1_7;
		9'b000000100 : x_i1_j1 = x_i1_j1_8;
		9'b000001000 : x_i1_j1 = x_i1_j1_9;
		9'b000010000 : x_i1_j1 = x_i1_j1_1;
		9'b000100000 : x_i1_j1 = x_i1_j1_2;
		9'b001000000 : x_i1_j1 = x_i1_j1_3;
		9'b010000000 : x_i1_j1 = x_i1_j1_4;
		9'b100000000 : x_i1_j1 = x_i1_j1_5;
		default		 : x_i1_j1 = 0		;
	endcase 
end


always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : x_i1_j = x_i1_j_6;
		9'b000000010 : x_i1_j = x_i1_j_7;
		9'b000000100 : x_i1_j = x_i1_j_8;
		9'b000001000 : x_i1_j = x_i1_j_9;
		9'b000010000 : x_i1_j = x_i1_j_1;
		9'b000100000 : x_i1_j = x_i1_j_2;
		9'b001000000 : x_i1_j = x_i1_j_3;
		9'b010000000 : x_i1_j = x_i1_j_4;
		9'b100000000 : x_i1_j = x_i1_j_5;
		default		 : x_i1_j = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : y_i1_j1 = y_i1_j1_6;
		9'b000000010 : y_i1_j1 = y_i1_j1_7;
		9'b000000100 : y_i1_j1 = y_i1_j1_8;
		9'b000001000 : y_i1_j1 = y_i1_j1_9;
		9'b000010000 : y_i1_j1 = y_i1_j1_1;
		9'b000100000 : y_i1_j1 = y_i1_j1_2;
		9'b001000000 : y_i1_j1 = y_i1_j1_3;
		9'b010000000 : y_i1_j1 = y_i1_j1_4;
		9'b100000000 : y_i1_j1 = y_i1_j1_5;
		default		 : y_i1_j1 = 0		;
	endcase 
end


always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : counter_sum = counter_sum_6;
		9'b000000010 : counter_sum = counter_sum_7;
		9'b000000100 : counter_sum = counter_sum_8;
		9'b000001000 : counter_sum = counter_sum_9;
		9'b000010000 : counter_sum = counter_sum_1;
		9'b000100000 : counter_sum = counter_sum_2;
		9'b001000000 : counter_sum = counter_sum_3;
		9'b010000000 : counter_sum = counter_sum_4;
		9'b100000000 : counter_sum = counter_sum_5;
		default		 : counter_sum = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : en_counter_sum = en_counter_sum_6;
		9'b000000010 : en_counter_sum = en_counter_sum_7;
		9'b000000100 : en_counter_sum = en_counter_sum_8;
		9'b000001000 : en_counter_sum = en_counter_sum_9;
		9'b000010000 : en_counter_sum = en_counter_sum_1;
		9'b000100000 : en_counter_sum = en_counter_sum_2;
		9'b001000000 : en_counter_sum = en_counter_sum_3;
		9'b010000000 : en_counter_sum = en_counter_sum_4;
		9'b100000000 : en_counter_sum = en_counter_sum_5;
		default		 : en_counter_sum = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : symbol = symbol_6;
		9'b000000010 : symbol = symbol_7;
		9'b000000100 : symbol = symbol_8;
		9'b000001000 : symbol = symbol_9;
		9'b000010000 : symbol = symbol_1;
		9'b000100000 : symbol = symbol_2;
		9'b001000000 : symbol = symbol_3;
		9'b010000000 : symbol = symbol_4;
		9'b100000000 : symbol = symbol_5;
		default		 : symbol = 0		;
	endcase 
end

always @(*)
begin 
	case (shift_reg_m_c)
		9'b000000001 : hap_len = hap_len_6;
		9'b000000010 : hap_len = hap_len_7;
		9'b000000100 : hap_len = hap_len_8;
		9'b000001000 : hap_len = hap_len_9;
		9'b000010000 : hap_len = hap_len_1;
		9'b000100000 : hap_len = hap_len_2;
		9'b001000000 : hap_len = hap_len_3;
		9'b010000000 : hap_len = hap_len_4;
		9'b100000000 : hap_len = hap_len_5;
		default		 : hap_len = 0		;
	endcase 
end


/*-------------------------------------------------------------------*\
                            Port Description
\*-------------------------------------------------------------------*/

reg [79:0] map_head_1;
reg [79:0] map_head_2;
reg [79:0] map_head_3;
reg [79:0] map_head_4;
reg [79:0] map_head_5;
reg [79:0] map_head_6;
reg [79:0] map_head_7;
reg [79:0] map_head_8;
reg [79:0] map_head_9;
reg [79:0] map_head_10;
reg [79:0] map_head_11;
reg [79:0] map_head_12;
reg [79:0] map_head_13;
reg [79:0] map_head_14;
reg [79:0] map_head_15;
reg [79:0] map_head_16;
reg [79:0] map_head_17;
reg [79:0] map_head_18;
reg 	   signal		  ;

/*-------------------------------------------------------------------*\
                            main code
\*-------------------------------------------------------------------*/



/*-------------------------------------------------------------------*\
                            fifo 36x36
\*-------------------------------------------------------------------*/





fifo_16384x128 u0 (
		.data (fifo_data_in ), 
		.wrreq(fifo_write_en), 
		.rdreq(fifo_read_en ), 
		.clock(sys_clk      ), 
		.q    (fifo_data_out),
		.usedw(usedw        ), 
		.full (full         ), 
		.empty(empty        )  
	);

assign fifo_write_en = result_vld && (~full);
assign fifo_data_in  = result;

assign fifo_almost_full = (usedw >= 14'd16350);

always @(posedge sys_clk or negedge sys_rst) // fifo_read_vld
begin 
	if (!sys_rst)
		fifo_read_vld <= 1;
	else if (max_data_num_done)
		fifo_read_vld <= 0;
	else  if (read_done)
		fifo_read_vld <= 1;
end

assign fifo_read_en = fifo_read_vld && !empty; 



reg [127:0] full_result;
reg 		   full_result_vld_temp;
reg 		   full_result_vld;


always @(posedge sys_clk or negedge sys_rst) // counter_empty 判断超时的计数器
begin  
	if (!sys_rst)
		counter_empty <= 0;
	else if (!empty)
		counter_empty <= 0;
	else if (empty && counter_empty >= MAX_TIME_OUT)
		counter_empty <= counter_empty;
	else if (empty)
		counter_empty <= counter_empty+1;
end


always @(posedge sys_clk or negedge sys_rst) // all_done所有数据传输完毕的标志
begin 
	if (!sys_rst)
		all_done <= 0;
	else if (!empty)
		all_done <= 0;
	else if (counter_empty >= MAX_TIME_OUT) 
		all_done <= 1;

end



always @(posedge sys_clk or negedge sys_rst)//最终的输出结果full_result
begin 
	if (!sys_rst)
		full_result <= 128'b0;
	else 
		full_result <= fifo_data_out;
end



always @(posedge sys_clk or negedge sys_rst)//full_result_vld_temp
begin 
	if (!sys_rst)
		full_result_vld_temp <= 0;
	else if (fifo_read_en)
		full_result_vld_temp <= 1;
	else 
		full_result_vld_temp <= 0;
end



always @(posedge sys_clk or negedge sys_rst)//full_result_vld,最终输出结果的有效位
begin 
	if (!sys_rst)
		full_result_vld <= 0;
	else if (full_result_vld_temp)
		full_result_vld <= 1;
	else 
		full_result_vld <= 0;
end

wire temp_en_write_pcie ;

assign temp_en_write_pcie = (!all_done)? full_result_vld : ((temp_addr_write_pcie == 0) ? 0 : 1);

always @(posedge sys_clk or negedge sys_rst)//data_write_pcie
begin 
	if (!sys_rst)
		data_write_pcie <= 0;
	else 
		data_write_pcie = (all_done)? 128'hffffffffffffffffffffffffffffffff :full_result; 
end



always @(posedge sys_clk or negedge sys_rst)//en_write_pcie
begin 
	if (!sys_rst)
		en_write_pcie <= 0;
	else 
		en_write_pcie = temp_en_write_pcie;
end


always @(posedge sys_clk or negedge sys_rst)//addr_write_pcie [13:0]
begin 
	if (!sys_rst)
		temp_addr_write_pcie <= 0;
	else if (all_done && temp_addr_write_pcie  == 0)
		temp_addr_write_pcie <= temp_addr_write_pcie ;
	else if (temp_addr_write_pcie  == MAX_DATA_NUM - 1 && temp_en_write_pcie)
		temp_addr_write_pcie  <= 0;
	else if (temp_en_write_pcie)
		temp_addr_write_pcie  <= temp_addr_write_pcie  + 1;
end 

always @(posedge sys_clk or negedge sys_rst)//addr_write_pcie [13:0]
begin 
	if (!sys_rst)
		addr_write_pcie <= ADDR_MOVE;
	else 
		addr_write_pcie <= temp_addr_write_pcie + ADDR_MOVE;
end



always @(posedge sys_clk or negedge sys_rst)// temp_max_data_num_done
begin 
	if (!sys_rst)
		temp_max_data_num_done <= 0;
	else if (temp_addr_write_pcie  == MAX_DATA_NUM - 1 && temp_en_write_pcie)
		temp_max_data_num_done <= 1;
	else 
		temp_max_data_num_done <= 0;
end

always @(posedge sys_clk or negedge sys_rst)// max_data_num_done
begin 
	if (!sys_rst)
		max_data_num_done <= 0;
	else 
		max_data_num_done <= temp_max_data_num_done ;
end



endmodule // matrix_9