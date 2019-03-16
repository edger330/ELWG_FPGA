 `timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/10/2018 10:06:11 AM
// Design Name: 
// Module Name: PE0
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


module PEx #(
	parameter integer DATA_WIDTH     = 4,
	parameter integer SCORE_WIDTH    = 16,
	parameter integer LOCATION_WIDTH = 32
)
(
//==========input===============//
    sys_clk    ,
    sys_rst_n  ,
    
    Ns         ,
    Nr         ,
    Score_in   ,
    
    H_i_j      ,
    F_i_j      ,
    
    start_in   ,
    location_in,

    max_en      ,
//==========output===============//
    H_out       ,   
    F_out       ,  
    
    H_max_out   ,
    Score_out   ,
    Ns_out      ,
    
    location_out,
    
    start_out
    );

/*-------------------------------------------------------------------*\
                            Port Description
\*-------------------------------------------------------------------*/ 
input wire sys_clk  ;
input wire sys_rst_n;

input wire start_in ;

input wire max_en    ;

input wire        [DATA_WIDTH-1: 0] Ns;
input wire        [DATA_WIDTH-1: 0] Nr;
input wire signed [SCORE_WIDTH-1:0] Score_in;

input wire signed [SCORE_WIDTH-1:0] H_i_j;
input wire signed [SCORE_WIDTH-1:0] F_i_j;

input wire signed [LOCATION_WIDTH-1:0] location_in;


output wire start_out;

output wire signed [SCORE_WIDTH-1:0   ] H_out;
output wire signed  [SCORE_WIDTH-1:0   ] F_out;

output wire signed  [SCORE_WIDTH-1:0   ] H_max_out;
output wire signed [SCORE_WIDTH-1:0   ] Score_out;
output wire        [DATA_WIDTH-1:0    ] Ns_out;

output wire signed  [LOCATION_WIDTH-1:0] location_out;
/*-------------------------------------------------------------------*\
                          Reg/Wire Description
\*-------------------------------------------------------------------*/

wire signed [SCORE_WIDTH-1:0] E_out;

wire signed [SCORE_WIDTH-1:0] S ;
wire signed [SCORE_WIDTH-1:0] const_zero   ;
wire signed [SCORE_WIDTH-1:0] const_oe_del ;
wire signed [SCORE_WIDTH-1:0] const_oe_ins ;
wire signed [SCORE_WIDTH-1:0] const_e_del  ;
wire signed [SCORE_WIDTH-1:0] const_e_ins  ;

wire signed [SCORE_WIDTH-1:0] M_temp;
wire signed [SCORE_WIDTH-1:0] M;
wire signed [SCORE_WIDTH-1:0] N;
wire signed [SCORE_WIDTH-1:0] H_temp;

wire signed [SCORE_WIDTH-1:0] H_out_temp;

wire signed [SCORE_WIDTH-1:0] M_minus_o;
wire signed [SCORE_WIDTH-1:0] E_temp;
wire signed [SCORE_WIDTH-1:0] E_0_temp;
wire signed [SCORE_WIDTH-1:0] E_minus_e;

wire signed [SCORE_WIDTH-1:0] F_0_temp;
wire signed [SCORE_WIDTH-1:0] F_temp;
wire signed [SCORE_WIDTH-1:0] F_minus_e;

wire signed [SCORE_WIDTH-1:0] Score_temp;

reg signed [SCORE_WIDTH-1:0] E_reg_0;
reg signed [SCORE_WIDTH-1:0] E_reg_1;
reg signed [SCORE_WIDTH-1:0] E_reg_2;

reg signed [SCORE_WIDTH-1:0] H_temp_reg_0;
reg signed [SCORE_WIDTH-1:0] H_temp_reg_1;
reg signed [SCORE_WIDTH-1:0] H_temp_reg_2;
reg signed [SCORE_WIDTH-1:0] H_temp_reg_3;

reg signed [SCORE_WIDTH-1:0] F_reg_0;
reg signed [SCORE_WIDTH-1:0] F_reg_1;
reg signed [SCORE_WIDTH-1:0] F_reg_2;

reg signed [SCORE_WIDTH-1:0] Score_temp_reg_0;
reg signed [SCORE_WIDTH-1:0] Score_temp_reg_1;
reg signed [SCORE_WIDTH-1:0] Score_temp_reg_2;
reg signed [SCORE_WIDTH-1:0] Score_temp_reg_3;
reg signed [SCORE_WIDTH-1:0] Score_temp_reg_4;

reg [DATA_WIDTH-1:0] Ns_reg_0;
reg [DATA_WIDTH-1:0] Ns_reg_1;
reg [DATA_WIDTH-1:0] Ns_reg_2;
reg [DATA_WIDTH-1:0] Ns_reg_3;
reg [DATA_WIDTH-1:0] Ns_reg_4;
reg [DATA_WIDTH-1:0] Ns_reg_5;
reg [DATA_WIDTH-1:0] Ns_reg_6;

reg start_reg_0;
reg start_reg_1;
reg start_reg_2;
reg start_reg_3;
reg start_reg_4;
reg start_reg_5;
reg start_reg_6;

reg signed [SCORE_WIDTH-1:0] N_reg_0;
reg signed [SCORE_WIDTH-1:0] N_reg_1;
reg signed [SCORE_WIDTH-1:0] N_reg_2;

reg signed [SCORE_WIDTH-1:0] H_out_reg_0;
reg signed [SCORE_WIDTH-1:0] H_out_reg_1;
reg signed [SCORE_WIDTH-1:0] H_out_reg_2;
reg signed [SCORE_WIDTH-1:0] H_out_reg_3;
reg signed [SCORE_WIDTH-1:0] H_out_reg_4;
reg signed [SCORE_WIDTH-1:0] H_out_reg_5;
reg signed [SCORE_WIDTH-1:0] H_out_reg_6;
reg signed [SCORE_WIDTH-1:0] H_out_reg_7;
reg signed [SCORE_WIDTH-1:0] H_out_reg_8;

reg [LOCATION_WIDTH-1:0] location_in_reg_0;
reg [LOCATION_WIDTH-1:0] location_in_reg_1;
reg [LOCATION_WIDTH-1:0] location_in_reg_2;
reg [LOCATION_WIDTH-1:0] location_in_reg_3;
reg [LOCATION_WIDTH-1:0] location_in_reg_4;
reg [LOCATION_WIDTH-1:0] location_in_reg_5;

assign const_zero   = 16'sh0000;
assign const_oe_del = 16'sh0007;
assign const_oe_ins = 16'sh0007;
assign const_e_del  = 16'sh0001;
assign const_e_ins  = 16'sh0001;

assign E_temp = (start_in == 1'b1) ? 8'sb0 : E_out;
assign H_temp = (start_in == 1'b1) ? Score_in : H_i_j;
assign F_temp = F_i_j;
//=======================H_OUT=================//
SEQ_CMP SEQ_CMP_INST(
    .clk  (sys_clk),
    .rst_n(sys_rst_n),
    .Ns   (Ns),
    .Nr   (Nr),
    .S    (S)
    );

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_temp_reg_0 <= 16'sb0000;    
    end
    else begin
        H_temp_reg_0 <= H_temp;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_temp_reg_1 <= 16'sb0000;    
    end
    else begin
        H_temp_reg_1 <= H_temp_reg_0;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_temp_reg_2 <= 16'sb0000;    
    end
    else begin
        H_temp_reg_2 <= H_temp_reg_1;
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_temp_reg_3 <= 16'sb0000;    
    end
    else begin
        H_temp_reg_3 <= H_temp_reg_2;
    end
end

ADD Add_S_and_H(
    .CLK (sys_clk),
    .SCLR(~sys_rst_n),
    .A   (S),
    .B   (H_temp_reg_0),
    .S   (M_temp)
    );

CMP CMP_M_and_0(
    .clk  (sys_clk),
    .rst_n(sys_rst_n),
    .num1 (const_zero),
    .num2 (M_temp),
    .max  (M)
    );

wire signed [SCORE_WIDTH-1:0] M_out;
assign M_out = (H_temp_reg_3 == 16'sh0000)? 16'sh0000 : M;

CMP CMP_E_and_F(
    .clk  (sys_clk),
    .rst_n(sys_rst_n),
    .num1 (F_i_j),
    .num2 (E_temp),
    .max  (N)
    );

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        N_reg_0 <= 16'sb0000;        
    end
    else begin
        N_reg_0 <= N;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin 
        N_reg_1 <= 16'sb0000;     
    end
    else begin
        N_reg_1 <= N_reg_0;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin 
        N_reg_2 <= 16'sb0000;     
    end
    else begin
        N_reg_2 <= N_reg_1;   
    end
end

CMP CMP_M_and_N(
    .clk  (sys_clk),
    .rst_n(sys_rst_n),
    .num1 (N_reg_2),
    .num2 (M_out),
    .max  (H_out_temp)
    );

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_0 <= 16'sb0000;        
    end
    else begin
        H_out_reg_0 <= H_out_temp;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_1 <= 16'sb0000;        
    end
    else begin
        H_out_reg_1 <= H_out_reg_0;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_2 <= 16'sb0000;        
    end
    else begin
        H_out_reg_2 <= H_out_reg_1;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_3 <= 16'sb0000;        
    end
    else begin
        H_out_reg_3 <= H_out_reg_2;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_4 <= 16'sb0000;        
    end
    else begin
        H_out_reg_4 <= H_out_reg_3;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_5 <= 16'sb0000;        
    end
    else begin
        H_out_reg_5 <= H_out_reg_4;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_6 <= 16'sb0000;        
    end
    else begin
        H_out_reg_6 <= H_out_reg_5;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_7 <= 16'sb0000;        
    end
    else begin
        H_out_reg_7 <= H_out_reg_6;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        H_out_reg_8 <= 16'sb0000;        
    end
    else begin
        H_out_reg_8 <= H_out_reg_7;   
    end
end

assign H_out = H_out_reg_8;

//=======================H_OUT_END=================//

//=====================E_OUT=================//
SUB Sub_M_minus_o(
    .CLK (sys_clk),
    .SCLR(~sys_rst_n),
    .A   (M_out),
    .B   (const_oe_del),
    .S   (M_minus_o)
    );

SUB Sub_E_minus_e(
    .CLK (sys_clk),
    .SCLR(~sys_rst_n),
    .A   (E_temp),
    .B   (const_e_del),
    .S   (E_minus_e)
    );

CMP CMP_E_and_0(
    .clk  (sys_clk),
    .rst_n(sys_rst_n),
    .num1 (E_minus_e),
    .num2 (const_zero),
    .max  (E_0_temp)
    );

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        E_reg_0 <= 16'sb0000;   
    end
    else begin
        E_reg_0 <= E_0_temp;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        E_reg_1 <= 16'sb0000;   
    end
    else begin
        E_reg_1 <= E_reg_0;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        E_reg_2 <= 16'sb0000;   
    end
    else begin
        E_reg_2 <= E_reg_1;   
    end
end

CMP CMP_E_and_M(
    .clk  (sys_clk),
    .rst_n(sys_rst_n),
    .num1 (E_reg_2),
    .num2 (M_minus_o),
    .max  (E_out)
    );

//=====================E N D=================//

//=====================F_OUT=================//
SUB Sub_F_minus_e(
    .CLK (sys_clk),
    .SCLR(~sys_rst_n),
    .A   (F_temp),
    .B   (const_e_del),
    .S   (F_minus_e)
    );

CMP CMP_F_and_0(
    .clk  (sys_clk),
    .rst_n(sys_rst_n),
    .num1 (F_minus_e),
    .num2 (const_zero),
    .max  (F_0_temp)
    );

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        F_reg_0 <= 16'sb0000;   
    end
    else begin
        F_reg_0 <= F_0_temp;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        F_reg_1 <= 16'sb0000;   
    end
    else begin
        F_reg_1 <= F_reg_0;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        F_reg_2 <= 16'sb0000;   
    end
    else begin
        F_reg_2 <= F_reg_1;   
    end
end

CMP CMP_F_and_M(
    .clk  (sys_clk),
    .rst_n(sys_rst_n),
    .num1 (F_reg_2),
    .num2 (M_minus_o),
    .max  (F_out)
    );
//=====================E N D=================//

//=====================Score_out============//

SUB sub_score(
    .CLK  (sys_clk),
    .SCLR (~sys_rst_n),
    .A    (Score_in),
    .B    (const_e_del),
    .S    (Score_temp)
    );

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Score_temp_reg_0 <= 16'sb0000;   
    end
    else begin
        Score_temp_reg_0 <= Score_temp;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Score_temp_reg_1 <= 16'sb0000;   
    end
    else begin
        Score_temp_reg_1 <= Score_temp_reg_0;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Score_temp_reg_2 <= 16'sb0000;   
    end
    else begin
        Score_temp_reg_2 <= Score_temp_reg_1;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Score_temp_reg_3 <= 16'sb0000;   
    end
    else begin
        Score_temp_reg_3 <= Score_temp_reg_2;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Score_temp_reg_4 <= 16'sb0000;   
    end
    else begin
        Score_temp_reg_4 <= Score_temp_reg_3;   
    end
end

assign Score_out = Score_temp_reg_4;

//===================E N D==================//

//=====================START_OUT===================//

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        start_reg_0 <= 1'b0;  
    end
    else begin
        start_reg_0 <= start_in;    
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        start_reg_1 <= 1'b0;     
    end
    else begin
        start_reg_1 <= start_reg_0;    
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        start_reg_2 <= 1'b0;     
    end
    else begin
        start_reg_2 <= start_reg_1;    
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        start_reg_3 <= 1'b0;     
    end
    else begin
        start_reg_3 <= start_reg_2;    
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        start_reg_4 <= 1'b0;     
    end
    else begin
        start_reg_4 <= start_reg_3;    
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        start_reg_5 <= 1'b0;     
    end
    else begin
        start_reg_5 <= start_reg_4;    
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        start_reg_6 <= 1'b0;     
    end
    else begin
        start_reg_6 <= start_reg_5;    
    end
end

assign start_out = start_reg_6;

//=====================E N D===================//

//=====================Ns_OUT===================//

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Ns_reg_0 <= 1'b0;     
    end
    else begin
        Ns_reg_0 <= Ns;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Ns_reg_1 <= 1'b0;     
    end
    else begin
        Ns_reg_1 <= Ns_reg_0;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Ns_reg_2 <= 1'b0;     
    end
    else begin
        Ns_reg_2 <= Ns_reg_1;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Ns_reg_3 <= 1'b0;     
    end
    else begin
        Ns_reg_3 <= Ns_reg_2;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Ns_reg_4 <= 1'b0;     
    end
    else begin
        Ns_reg_4 <= Ns_reg_3;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Ns_reg_5 <= 1'b0;     
    end
    else begin
        Ns_reg_5 <= Ns_reg_4;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        Ns_reg_6 <= 1'b0;     
    end
    else begin
        Ns_reg_6 <= Ns_reg_5;   
    end
end

assign Ns_out = Ns_reg_6;

//=====================E N D=======================//

//=====================H_MAX===================//
always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_in_reg_0 <= 1'b0;     
    end
    else begin
        location_in_reg_0 <= location_in;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_in_reg_1 <= 1'b0;     
    end
    else begin
        location_in_reg_1 <= location_in_reg_0;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_in_reg_2 <= 1'b0;     
    end
    else begin
        location_in_reg_2 <= location_in_reg_1;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_in_reg_3 <= 1'b0;     
    end
    else begin
        location_in_reg_3 <= location_in_reg_2;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_in_reg_4 <= 1'b0;     
    end
    else begin
        location_in_reg_4 <= location_in_reg_3;   
    end
end

always @(posedge sys_clk or negedge sys_rst_n) begin
    if (! sys_rst_n) begin
        location_in_reg_5 <= 1'b0;     
    end
    else begin
        location_in_reg_5 <= location_in_reg_4;   
    end
end

CMP_MAX MAX_cmp(
    .clk          (sys_clk           ),
    .rst_n        (sys_rst_n         ),
    .en           (max_en            ),
    .clear        (start_in          ),
    .location_in  (location_in_reg_5 ),
    .num          (H_out_reg_0       ),
    .location_out (location_out      ),
    .max          (H_max_out         )
    ); 

//=====================E N D=======================//

endmodule
