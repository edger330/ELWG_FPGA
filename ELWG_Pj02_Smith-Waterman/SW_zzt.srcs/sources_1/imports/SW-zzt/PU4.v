`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/11/2018 04:55:05 PM
// Design Name: 
// Module Name: PU4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PU4 #(
	parameter integer DATA_WIDTH  = 4,
	parameter integer SCORE_WIDTH = 16,
	parameter integer LOCATION_WIDTH = 32
)
(
//==========input===============//
	sys_clk       ,
	sys_rst_n     ,
	
	Ns            ,

	Nr_0          ,
	Nr_1          ,
	Nr_2          ,
	Nr_3          ,

	Score_Init    ,
	
	mode          ,
	final_row_en  ,
	
	start_in      ,
	
	H_i_j_fifo    ,
	F_i_j_fifo    ,
	
	location_in_0 ,
	location_in_1 ,
	location_in_2 ,
	location_in_3 ,

//==========output===============//
    Ns_out                  ,
    H_i_j_out               ,
    F_i_j_out               ,
    Score_out               ,
    
    H_row_max_last          ,
    H_row_max_last_location ,
    
    start_out               ,
    H_max_out               ,
    H_max_location
	
    );



input wire sys_clk   ;
input wire sys_rst_n ;

input wire mode      ;
input wire start_in  ;

input wire [2:0] final_row_en;

input wire [DATA_WIDTH-1: 0] Ns;

input wire [DATA_WIDTH-1: 0] Nr_0;
input wire [DATA_WIDTH-1: 0] Nr_1;
input wire [DATA_WIDTH-1: 0] Nr_2;
input wire [DATA_WIDTH-1: 0] Nr_3;

input wire [LOCATION_WIDTH-1:0] location_in_0;
input wire [LOCATION_WIDTH-1:0] location_in_1;
input wire [LOCATION_WIDTH-1:0] location_in_2;
input wire [LOCATION_WIDTH-1:0] location_in_3;

input wire signed [SCORE_WIDTH-1:0] Score_Init;

input wire signed [SCORE_WIDTH-1:0] H_i_j_fifo;
input wire signed [SCORE_WIDTH-1:0] F_i_j_fifo;

output wire start_out;

output wire signed [DATA_WIDTH-1:0] Ns_out;
output wire signed [SCORE_WIDTH-1:0] H_i_j_out;
output wire signed [SCORE_WIDTH-1:0] F_i_j_out;
output wire signed [SCORE_WIDTH-1:0] Score_out;

output reg signed [SCORE_WIDTH-1:0] H_max_out;
output reg signed [LOCATION_WIDTH-1:0] H_max_location;

output reg signed  [SCORE_WIDTH-1:0] H_row_max_last;
output reg signed  [LOCATION_WIDTH-1:0] H_row_max_last_location;


wire [3:0] en_out;
//======================PE0================//

wire start_out_0;
wire signed [SCORE_WIDTH-1:0] H_out_0;
wire signed [SCORE_WIDTH-1:0] F_out_0;

wire signed [SCORE_WIDTH-1:0] H_row_max_0;
wire signed [SCORE_WIDTH-1:0] Score_out_0;
wire        [DATA_WIDTH-1:0 ] Ns_out_0;

wire [LOCATION_WIDTH-1:0] location_row_out_0;



PE0 pe0(
    .sys_clk    (sys_clk             ),
    .sys_rst_n  (sys_rst_n           ),
    
    .Ns         (Ns                  ),
    .Nr         (Nr_0                ),
    
    .Score_Init (Score_Init          ),
    .Score_in   (H_i_j_fifo          ),
    
    .H_i_j      (H_i_j_fifo          ),
    .F_i_j      (F_i_j_fifo          ),
    
    .mode       (mode                ),
    .start_in   (start_in            ),
    .location_in(location_in_0       ),
    
    .max_en     (en_out[0]           ),
    
    .H_out      (H_out_0             ),
    .F_out      (F_out_0             ),
    
    .H_max_out  (H_row_max_0         ),
    .Score_out  (Score_out_0         ),
    .Ns_out     (Ns_out_0            ),
    
    .location_out(location_row_out_0 ),
    .start_out  (start_out_0         )
    );
//=======================PE1=========================//
wire start_out_1;
wire signed [SCORE_WIDTH-1:0] H_out_1;
wire signed [SCORE_WIDTH-1:0] F_out_1;

wire signed [SCORE_WIDTH-1:0] H_row_max_1;
wire signed [SCORE_WIDTH-1:0] Score_out_1;
wire        [DATA_WIDTH-1:0 ] Ns_out_1;

wire [LOCATION_WIDTH-1:0] location_row_out_1;


PEx pe1(
	.sys_clk    (sys_clk             ),
	.sys_rst_n  (sys_rst_n           ),
	
	.Ns         (Ns_out_0            ),
	.Nr         (Nr_1                ),
	
	.Score_in   (Score_out_0         ),
	
	.H_i_j      (H_out_0             ),
	.F_i_j      (F_out_0             ),
	
	.start_in   (start_out_0         ),
	.location_in(location_in_1       ),

    .max_en     (en_out[1]           ),
	
	.H_out      (H_out_1             ),
	.F_out      (F_out_1             ),
	
	.H_max_out  (H_row_max_1         ),
	.Score_out  (Score_out_1         ),
	.Ns_out     (Ns_out_1            ),
	
	.location_out(location_row_out_1 ),
	.start_out  (start_out_1         )
    );

//==========================PE2 ====================//
wire start_out_2;
wire signed [SCORE_WIDTH-1:0] H_out_2;
wire signed [SCORE_WIDTH-1:0] F_out_2;

wire signed [SCORE_WIDTH-1:0] H_row_max_2;
wire signed [SCORE_WIDTH-1:0] Score_out_2;
wire        [DATA_WIDTH-1:0 ] Ns_out_2;

wire [LOCATION_WIDTH-1:0] location_row_out_2;


PEx pe2(
	.sys_clk    (sys_clk             ),
	.sys_rst_n  (sys_rst_n           ),
	
	.Ns         (Ns_out_1            ),
	.Nr         (Nr_2                ),
	
	.Score_in   (Score_out_1         ),
	
	.H_i_j      (H_out_1             ),
	.F_i_j      (F_out_1             ),
	
	.start_in   (start_out_1         ),
	.location_in(location_in_2       ),

    .max_en     (en_out[2]           ),
	
	.H_out      (H_out_2             ),
	.F_out      (F_out_2             ),
	
	.H_max_out  (H_row_max_2         ),
	.Score_out  (Score_out_2         ),
	.Ns_out     (Ns_out_2            ),
	
	.location_out(location_row_out_2 ),
	.start_out  (start_out_2         )
    );

//==========================PE3 ====================//
wire start_out_3;

wire signed [SCORE_WIDTH-1:0] H_row_max_3;
wire        [DATA_WIDTH-1:0 ] Ns_out_3;

wire [LOCATION_WIDTH-1:0] location_row_out_3;


PEx pe3(
	.sys_clk    (sys_clk             ),
	.sys_rst_n  (sys_rst_n           ),
	
	.Ns         (Ns_out_2            ),
	.Nr         (Nr_3                ),
	
	.Score_in   (Score_out_2         ),
	
	.H_i_j      (H_out_2             ),
	.F_i_j      (F_out_2             ),
	
	.start_in   (start_out_2         ),
	.location_in(location_in_3       ),

    .max_en     (en_out[3]           ),
	
	.H_out      (H_i_j_out           ),
	.F_out      (F_i_j_out           ),
	
	.H_max_out  (H_row_max_3         ),
	.Score_out  (Score_out           ),
	.Ns_out     (Ns_out_3            ),
	
	.location_out(location_row_out_3 ),
	.start_out  (start_out_3         )
    );

assign Ns_out    = Ns_out_3;
assign start_out = start_out_3;

//====================SCORE_MAX===================//
wire final_en;
wire [1:0] final_row_num;

assign final_en = final_row_en[2];
assign final_row_num = final_row_en[1:0];

MUX2to4 MUX2to4_INST(
    .clk     (sys_clk       ),
    .rst_n   (sys_rst_n     ),
    .code_in (final_row_num ),
    .en_out  (en_out        )
    );

//###############CMP0###################
wire signed [SCORE_WIDTH-1:0] H_max_out_0;
wire        [LOCATION_WIDTH-1:0] location_out_0;

reg [LOCATION_WIDTH-1:0] location_row_out_0_reg_0;
reg [LOCATION_WIDTH-1:0] location_row_out_0_reg_1;
reg [LOCATION_WIDTH-1:0] location_row_out_0_reg_2;
reg [LOCATION_WIDTH-1:0] location_row_out_0_reg_3;
reg [LOCATION_WIDTH-1:0] location_row_out_0_reg_4;
reg [LOCATION_WIDTH-1:0] location_row_out_0_reg_5;

reg signed  [SCORE_WIDTH-1:0] H_row_max_0_reg_0;
reg signed  [SCORE_WIDTH-1:0] H_row_max_0_reg_1;
reg signed  [SCORE_WIDTH-1:0] H_row_max_0_reg_2;
reg signed  [SCORE_WIDTH-1:0] H_row_max_0_reg_3;
reg signed  [SCORE_WIDTH-1:0] H_row_max_0_reg_4;
reg signed  [SCORE_WIDTH-1:0] H_row_max_0_reg_5;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_row_out_0_reg_0 <= 1'b0;   
    end
    else begin
        location_row_out_0_reg_0 <= H_max_location;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_row_out_0_reg_1 <= 1'b0;   
    end
    else begin
        location_row_out_0_reg_1 <= location_row_out_0_reg_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_row_out_0_reg_2 <= 1'b0;   
    end
    else begin
        location_row_out_0_reg_2 <= location_row_out_0_reg_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_row_out_0_reg_3 <= 1'b0;   
    end
    else begin
        location_row_out_0_reg_3 <= location_row_out_0_reg_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_row_out_0_reg_4 <= 1'b0;   
    end
    else begin
        location_row_out_0_reg_4 <= location_row_out_0_reg_3;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_row_out_0_reg_5 <= 1'b0;   
    end
    else begin
        location_row_out_0_reg_5 <= location_row_out_0_reg_4;  
    end
end

//----------------

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_row_max_0_reg_0 <= 16'sh0000;   
    end
    else begin
        H_row_max_0_reg_0 <= H_max_out;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_row_max_0_reg_1 <= 16'sh0000;   
    end
    else begin
        H_row_max_0_reg_1 <= H_row_max_0_reg_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_row_max_0_reg_2 <= 16'sh0000;   
    end
    else begin
        H_row_max_0_reg_2 <= H_row_max_0_reg_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_row_max_0_reg_3 <= 16'sh0000;   
    end
    else begin
        H_row_max_0_reg_3 <= H_row_max_0_reg_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_row_max_0_reg_4 <= 16'sh0000;   
    end
    else begin
        H_row_max_0_reg_4 <= H_row_max_0_reg_3;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_row_max_0_reg_5 <= 16'sh0000;   
    end
    else begin
        H_row_max_0_reg_5 <= H_row_max_0_reg_4;  
    end
end

CMP_LOCATION MAX_cmp_0(
    .clk (sys_clk                           ),
    .rst_n (sys_rst_n                       ),
    .location_in_0(location_row_out_0_reg_5 ),
    .value_0 (H_row_max_0_reg_5             ),
    .location_in_1(location_row_out_0       ),
    .value_1 (H_row_max_0                   ),
    .max(H_max_out_0                        ),
    .location_out (location_out_0           )
    ); 

//###############CMP1###################

wire signed [SCORE_WIDTH-1:0] H_max_out_1;
wire        [LOCATION_WIDTH-1:0] location_out_1;

reg [LOCATION_WIDTH-1:0] location_out_0_reg_0;
reg [LOCATION_WIDTH-1:0] location_out_0_reg_1;
reg [LOCATION_WIDTH-1:0] location_out_0_reg_2;
reg [LOCATION_WIDTH-1:0] location_out_0_reg_3;
reg [LOCATION_WIDTH-1:0] location_out_0_reg_4;
reg [LOCATION_WIDTH-1:0] location_out_0_reg_5;

reg signed [SCORE_WIDTH-1:0] H_max_out_0_reg_0;
reg signed [SCORE_WIDTH-1:0] H_max_out_0_reg_1;
reg signed [SCORE_WIDTH-1:0] H_max_out_0_reg_2;
reg signed [SCORE_WIDTH-1:0] H_max_out_0_reg_3;
reg signed [SCORE_WIDTH-1:0] H_max_out_0_reg_4;
reg signed [SCORE_WIDTH-1:0] H_max_out_0_reg_5;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_0_reg_0 <= 1'b0;   
    end
    else begin
        location_out_0_reg_0 <= location_out_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_0_reg_1 <= 1'b0;   
    end
    else begin
        location_out_0_reg_1 <= location_out_0_reg_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_0_reg_2 <= 1'b0;   
    end
    else begin
        location_out_0_reg_2 <= location_out_0_reg_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_0_reg_3 <= 1'b0;   
    end
    else begin
        location_out_0_reg_3 <= location_out_0_reg_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_0_reg_4 <= 1'b0;   
    end
    else begin
        location_out_0_reg_4 <= location_out_0_reg_3;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_0_reg_5 <= 1'b0;   
    end
    else begin
        location_out_0_reg_5 <= location_out_0_reg_4;  
    end
end

//----------------------

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_0_reg_0 <= 16'sh0000;   
    end
    else begin
        H_max_out_0_reg_0 <= H_max_out_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_0_reg_1 <= 16'sh0000;   
    end
    else begin
        H_max_out_0_reg_1 <= H_max_out_0_reg_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_0_reg_2 <= 16'sh0000;   
    end
    else begin
        H_max_out_0_reg_2 <= H_max_out_0_reg_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_0_reg_3 <= 16'sh0000;   
    end
    else begin
        H_max_out_0_reg_3 <= H_max_out_0_reg_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_0_reg_4 <= 16'sh0000;   
    end
    else begin
        H_max_out_0_reg_4 <= H_max_out_0_reg_3;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_0_reg_5 <= 16'sh0000;   
    end
    else begin
        H_max_out_0_reg_5 <= H_max_out_0_reg_4;  
    end
end

CMP_LOCATION MAX_cmp_1(
	.clk (sys_clk                       ),
	.rst_n (sys_rst_n                   ),
	.location_in_0(location_out_0_reg_5 ),
	.value_0 (H_max_out_0_reg_5         ),
	.location_in_1(location_row_out_1   ),
	.value_1 (H_row_max_1               ),
	.max(H_max_out_1                    ),
	.location_out (location_out_1       )
    ); 

//###############CMP2###################
//
wire signed [SCORE_WIDTH-1:0] H_max_out_2;
wire        [LOCATION_WIDTH-1:0] location_out_2;

reg [LOCATION_WIDTH-1:0] location_out_1_reg_0;
reg [LOCATION_WIDTH-1:0] location_out_1_reg_1;
reg [LOCATION_WIDTH-1:0] location_out_1_reg_2;
reg [LOCATION_WIDTH-1:0] location_out_1_reg_3;
reg [LOCATION_WIDTH-1:0] location_out_1_reg_4;
reg [LOCATION_WIDTH-1:0] location_out_1_reg_5;

reg signed [SCORE_WIDTH-1:0] H_max_out_1_reg_0;
reg signed [SCORE_WIDTH-1:0] H_max_out_1_reg_1;
reg signed [SCORE_WIDTH-1:0] H_max_out_1_reg_2;
reg signed [SCORE_WIDTH-1:0] H_max_out_1_reg_3;
reg signed [SCORE_WIDTH-1:0] H_max_out_1_reg_4;
reg signed [SCORE_WIDTH-1:0] H_max_out_1_reg_5;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_1_reg_0 <= 1'b0;   
    end
    else begin
        location_out_1_reg_0 <= location_out_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_1_reg_1 <= 1'b0;   
    end
    else begin
        location_out_1_reg_1 <= location_out_1_reg_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_1_reg_2 <= 1'b0;   
    end
    else begin
        location_out_1_reg_2 <= location_out_1_reg_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_1_reg_3 <= 1'b0;   
    end
    else begin
        location_out_1_reg_3 <= location_out_1_reg_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_1_reg_4 <= 1'b0;   
    end
    else begin
        location_out_1_reg_4 <= location_out_1_reg_3;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_1_reg_5 <= 1'b0;   
    end
    else begin
        location_out_1_reg_5 <= location_out_1_reg_4;  
    end
end

//----------------------

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_1_reg_0 <= 16'sh0000;   
    end
    else begin
        H_max_out_1_reg_0 <= H_max_out_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_1_reg_1 <= 16'sh0000;   
    end
    else begin
        H_max_out_1_reg_1 <= H_max_out_1_reg_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_1_reg_2 <= 16'sh0000;   
    end
    else begin
        H_max_out_1_reg_2 <= H_max_out_1_reg_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_1_reg_3 <= 16'sh0000;   
    end
    else begin
        H_max_out_1_reg_3 <= H_max_out_1_reg_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_1_reg_4 <= 16'sh0000;   
    end
    else begin
        H_max_out_1_reg_4 <= H_max_out_1_reg_3;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_1_reg_5 <= 16'sh0000;   
    end
    else begin
        H_max_out_1_reg_5 <= H_max_out_1_reg_4;  
    end
end

CMP_LOCATION MAX_cmp_2(
    .clk (sys_clk                       ),
    .rst_n (sys_rst_n                   ),
    .location_in_0(location_out_1_reg_5 ),
    .value_0 (H_max_out_1_reg_5         ),
    .location_in_1(location_row_out_2   ),
    .value_1 (H_row_max_2               ),
    .max(H_max_out_2                    ),
    .location_out (location_out_2       )
    );

//###############CMP3###################
wire signed [SCORE_WIDTH-1:0] H_max_out_3;
wire        [LOCATION_WIDTH-1:0] location_out_3;

reg [LOCATION_WIDTH-1:0] location_out_2_reg_0;
reg [LOCATION_WIDTH-1:0] location_out_2_reg_1;
reg [LOCATION_WIDTH-1:0] location_out_2_reg_2;
reg [LOCATION_WIDTH-1:0] location_out_2_reg_3;
reg [LOCATION_WIDTH-1:0] location_out_2_reg_4;
reg [LOCATION_WIDTH-1:0] location_out_2_reg_5;

reg signed [SCORE_WIDTH-1:0] H_max_out_2_reg_0;
reg signed [SCORE_WIDTH-1:0] H_max_out_2_reg_1;
reg signed [SCORE_WIDTH-1:0] H_max_out_2_reg_2;
reg signed [SCORE_WIDTH-1:0] H_max_out_2_reg_3;
reg signed [SCORE_WIDTH-1:0] H_max_out_2_reg_4;
reg signed [SCORE_WIDTH-1:0] H_max_out_2_reg_5;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_2_reg_0 <= 1'b0;   
    end
    else begin
        location_out_2_reg_0 <= location_out_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_2_reg_1 <= 1'b0;   
    end
    else begin
        location_out_2_reg_1 <= location_out_2_reg_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_2_reg_2 <= 1'b0;   
    end
    else begin
        location_out_2_reg_2 <= location_out_2_reg_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_2_reg_3 <= 1'b0;   
    end
    else begin
        location_out_2_reg_3 <= location_out_2_reg_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_2_reg_4 <= 1'b0;   
    end
    else begin
        location_out_2_reg_4 <= location_out_2_reg_3;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_out_2_reg_5 <= 1'b0;   
    end
    else begin
        location_out_2_reg_5 <= location_out_2_reg_4;  
    end
end

//----------------------

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_2_reg_0 <= 16'sh0000;   
    end
    else begin
        H_max_out_2_reg_0 <= H_max_out_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_2_reg_1 <= 16'sh0000;   
    end
    else begin
        H_max_out_2_reg_1 <= H_max_out_2_reg_0;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_2_reg_2 <= 16'sh0000;   
    end
    else begin
        H_max_out_2_reg_2 <= H_max_out_2_reg_1;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_2_reg_3 <= 16'sh0000;   
    end
    else begin
        H_max_out_2_reg_3 <= H_max_out_2_reg_2;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_2_reg_4 <= 16'sh0000;   
    end
    else begin
        H_max_out_2_reg_4 <= H_max_out_2_reg_3;  
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out_2_reg_5 <= 16'sh0000;   
    end
    else begin
        H_max_out_2_reg_5 <= H_max_out_2_reg_4;  
    end
end

CMP_LOCATION MAX_cmp_3(
    .clk (sys_clk                       ),
    .rst_n (sys_rst_n                   ),
    .location_in_0(location_out_2_reg_5 ),
    .value_0 (H_max_out_2_reg_5         ),
    .location_in_1(location_row_out_3   ),
    .value_1 (H_row_max_3               ),
    .max(H_max_out_3                    ),
    .location_out (location_out_3       )
    );

//###############H_row_max_last###############

reg signed [SCORE_WIDTH-1:0] H_row_max_last_reg;
reg signed [SCORE_WIDTH-1:0] H_row_max_last_location_reg;

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_row_max_last_reg <= 16'sh0000;   
    end
    else if (final_en) begin
        case (final_row_num)
        9'h000: H_row_max_last_reg <= H_row_max_0;
        9'h001: H_row_max_last_reg <= H_row_max_1;
        9'h002: H_row_max_last_reg <= H_row_max_2;
        9'h003: H_row_max_last_reg <= H_row_max_3;
        endcase
    end
    else begin
    	H_row_max_last_reg <= H_row_max_last_reg;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        H_row_max_last_location_reg <= 1'b0;   
    end
    else if (final_en) begin
        case (final_row_num)
        9'h000: H_row_max_last_location_reg <= location_row_out_0;
        9'h001: H_row_max_last_location_reg <= location_row_out_1;
        9'h002: H_row_max_last_location_reg <= location_row_out_2;
        9'h003: H_row_max_last_location_reg <= location_row_out_3;
        endcase
    end
    else begin
    	H_row_max_last_location_reg <= H_row_max_last_location_reg;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        H_row_max_last <= 16'sh0000;   
    end
    else begin
        H_row_max_last <= H_row_max_last_reg;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (!sys_rst_n) begin
        H_row_max_last_location <= 1'b0;   
    end
    else begin
        H_row_max_last_location <= H_row_max_last_location_reg;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_out <= 16'sh0000;   
    end
    else if (final_en) begin
        case (final_row_num)
        9'h000: H_max_out <= H_max_out_0;
        9'h001: H_max_out <= H_max_out_1;
        9'h002: H_max_out <= H_max_out_2;
        9'h003: H_max_out <= H_max_out_3;
        endcase
    end
    else begin
        H_max_out <= H_max_out;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_max_location <= 1'b0;   
    end
    else if (final_en) begin
        case (final_row_num)
        9'h000: H_max_location <= location_out_0;
        9'h001: H_max_location <= location_out_1;
        9'h002: H_max_location <= location_out_2;
        9'h003: H_max_location <= location_out_3;
        endcase
    end
    else begin
        H_max_location <= H_max_location;
    end
end

endmodule
