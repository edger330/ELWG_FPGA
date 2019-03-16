`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: zzt
// 
// Create Date: 2018/08/09 20:05:11
// Design Name: 
// Module Name: seedCollect
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

module test_SC_16channel;

//----parameters----
parameter integer C_DATAIN_WIDTH  = 128;
parameter integer C_DATAOUT_WIDTH = 128;
parameter integer C_BUS_WIDTH     = 16; 
parameter integer C_ID_WIDTH      = 5; 
parameter integer C_STATE_WIDTH   = 2;  

//----regs/wires----
reg clk;
reg rst_n;

wire m_axis_tvalid;
wire [C_DATAOUT_WIDTH-1:0] m_axis_tdata;
reg m_axis_tready;
wire m_axis_tlast;

reg s_axis_tvalid_0;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_0;
wire s_axis_tready_0;
reg s_axis_tlast_0;

reg s_axis_tvalid_1;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_1;
wire s_axis_tready_1;
reg s_axis_tlast_1;

reg s_axis_tvalid_2;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_2;
wire s_axis_tready_2;
reg s_axis_tlast_2;

reg s_axis_tvalid_3;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_3;
wire s_axis_tready_3;
reg s_axis_tlast_3;

reg s_axis_tvalid_4;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_4;
wire s_axis_tready_4;
reg s_axis_tlast_4;

reg s_axis_tvalid_5;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_5;
wire s_axis_tready_5;
reg s_axis_tlast_5;

reg s_axis_tvalid_6;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_6;
wire s_axis_tready_6;
reg s_axis_tlast_6;

reg s_axis_tvalid_7;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_7;
wire s_axis_tready_7;
reg s_axis_tlast_7;

reg s_axis_tvalid_8;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_8;
wire s_axis_tready_8;
reg s_axis_tlast_8;

reg s_axis_tvalid_9;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_9;
wire s_axis_tready_9;
reg s_axis_tlast_9;

reg s_axis_tvalid_10;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_10;
wire s_axis_tready_10;
reg s_axis_tlast_10;

reg s_axis_tvalid_11;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_11;
wire s_axis_tready_11;
reg s_axis_tlast_11;

reg s_axis_tvalid_12;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_12;
wire s_axis_tready_12;
reg s_axis_tlast_12;

reg s_axis_tvalid_13;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_13;
wire s_axis_tready_13;
reg s_axis_tlast_13;

reg s_axis_tvalid_14;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_14;
wire s_axis_tready_14;
reg s_axis_tlast_14;

reg s_axis_tvalid_15;
reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_15;
wire s_axis_tready_15;
reg s_axis_tlast_15;

//----logic----

initial begin
	clk = 1'b0;
	rst_n = 1'b0;
	#20 
	rst_n = 1'b1;
end

always @(posedge clk or negedge rst_n) begin 
	if(~rst_n) begin
		m_axis_tready = 1'b0;
	end
	else begin
		m_axis_tready = 1'b1;
	end
	
end

always begin
	#5 clk = ~clk;
end

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_0 <= 1'b0; 
   end 
   else if (s_axis_tlast_0 == 1'b1) begin 
       s_axis_tvalid_0 <= 1'b0; 
   end 
   else if (s_axis_tdata_0 <= 16'hFFFF) begin 
       s_axis_tvalid_0 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_0 <= 10'd0; 
   end 
   else begin 
       s_axis_tdata_0 <= s_axis_tdata_0 + 10'd1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_0 <= 1'b0; 
   end 
   else if (s_axis_tdata_0 > 16'hFFFF) begin 
       s_axis_tlast_0 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_0 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_1 <= 1'b0; 
   end 
   else if (s_axis_tlast_1 == 1'b1) begin 
       s_axis_tvalid_1 <= 1'b0; 
   end 
   else if (s_axis_tdata_1 <= 16'hFFFF) begin 
       s_axis_tvalid_1 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_1 <= 10'd1; 
   end 
   else begin 
       s_axis_tdata_1 <= s_axis_tdata_1 + 10'd2; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_1 <= 1'b0; 
   end 
   else if (s_axis_tdata_1 > 16'hFFFF) begin 
       s_axis_tlast_1 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_1 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_2 <= 1'b0; 
   end 
   else if (s_axis_tlast_2 == 1'b1) begin 
       s_axis_tvalid_2 <= 1'b0; 
   end 
   else if (s_axis_tdata_2 <= 16'hFFFF) begin 
       s_axis_tvalid_2 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_2 <= 10'd2; 
   end 
   else begin 
       s_axis_tdata_2 <= s_axis_tdata_2 + 10'd3; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_2 <= 1'b0; 
   end 
   else if (s_axis_tdata_2 > 16'hFFFF) begin 
       s_axis_tlast_2 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_2 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_3 <= 1'b0; 
   end 
   else if (s_axis_tlast_3 == 1'b1) begin 
       s_axis_tvalid_3 <= 1'b0; 
   end 
   else if (s_axis_tdata_3 <= 16'hFFFF) begin 
       s_axis_tvalid_3 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_3 <= 10'd3; 
   end 
   else begin 
       s_axis_tdata_3 <= s_axis_tdata_3 + 10'd4; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_3 <= 1'b0; 
   end 
   else if (s_axis_tdata_3 > 16'hFFFF) begin 
       s_axis_tlast_3 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_3 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_4 <= 1'b0; 
   end 
   else if (s_axis_tlast_4 == 1'b1) begin 
       s_axis_tvalid_4 <= 1'b0; 
   end 
   else if (s_axis_tdata_4 <= 16'hFFFF) begin 
       s_axis_tvalid_4 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_4 <= 10'd4; 
   end 
   else begin 
       s_axis_tdata_4 <= s_axis_tdata_4 + 10'd5; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_4 <= 1'b0; 
   end 
   else if (s_axis_tdata_4 > 16'hFFFF) begin 
       s_axis_tlast_4 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_4 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_5 <= 1'b0; 
   end 
   else if (s_axis_tlast_5 == 1'b1) begin 
       s_axis_tvalid_5 <= 1'b0; 
   end 
   else if (s_axis_tdata_5 <= 16'hFFFF) begin 
       s_axis_tvalid_5 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_5 <= 10'd5; 
   end 
   else begin 
       s_axis_tdata_5 <= s_axis_tdata_5 + 10'd6; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_5 <= 1'b0; 
   end 
   else if (s_axis_tdata_5 > 16'hFFFF) begin 
       s_axis_tlast_5 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_5 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_6 <= 1'b0; 
   end 
   else if (s_axis_tlast_6 == 1'b1) begin 
       s_axis_tvalid_6 <= 1'b0; 
   end 
   else if (s_axis_tdata_6 <= 16'hFFFF) begin 
       s_axis_tvalid_6 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_6 <= 10'd6; 
   end 
   else begin 
       s_axis_tdata_6 <= s_axis_tdata_6 + 10'd7; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_6 <= 1'b0; 
   end 
   else if (s_axis_tdata_6 > 16'hFFFF) begin 
       s_axis_tlast_6 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_6 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_7 <= 1'b0; 
   end 
   else if (s_axis_tlast_7 == 1'b1) begin 
       s_axis_tvalid_7 <= 1'b0; 
   end 
   else if (s_axis_tdata_7 <= 16'hFFFF) begin 
       s_axis_tvalid_7 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_7 <= 10'd7; 
   end 
   else begin 
       s_axis_tdata_7 <= s_axis_tdata_7 + 10'd8; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_7 <= 1'b0; 
   end 
   else if (s_axis_tdata_7 > 16'hFFFF) begin 
       s_axis_tlast_7 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_7 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_8 <= 1'b0; 
   end 
   else if (s_axis_tlast_8 == 1'b1) begin 
       s_axis_tvalid_8 <= 1'b0; 
   end 
   else if (s_axis_tdata_8 <= 16'hFFFF) begin 
       s_axis_tvalid_8 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_8 <= 10'd8; 
   end 
   else begin 
       s_axis_tdata_8 <= s_axis_tdata_8 + 10'd9; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_8 <= 1'b0; 
   end 
   else if (s_axis_tdata_8 > 16'hFFFF) begin 
       s_axis_tlast_8 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_8 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_9 <= 1'b0; 
   end 
   else if (s_axis_tlast_9 == 1'b1) begin 
       s_axis_tvalid_9 <= 1'b0; 
   end 
   else if (s_axis_tdata_9 <= 16'hFFFF) begin 
       s_axis_tvalid_9 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_9 <= 10'd9; 
   end 
   else begin 
       s_axis_tdata_9 <= s_axis_tdata_9 + 10'd10; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_9 <= 1'b0; 
   end 
   else if (s_axis_tdata_9 > 16'hFFFF) begin 
       s_axis_tlast_9 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_9 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_10 <= 1'b0; 
   end 
   else if (s_axis_tlast_10 == 1'b1) begin 
       s_axis_tvalid_10 <= 1'b0; 
   end 
   else if (s_axis_tdata_10 <= 16'hFFFF) begin 
       s_axis_tvalid_10 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_10 <= 10'd10; 
   end 
   else begin 
       s_axis_tdata_10 <= s_axis_tdata_10 + 10'd11; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_10 <= 1'b0; 
   end 
   else if (s_axis_tdata_10 > 16'hFFFF) begin 
       s_axis_tlast_10 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_10 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_11 <= 1'b0; 
   end 
   else if (s_axis_tlast_11 == 1'b1) begin 
       s_axis_tvalid_11 <= 1'b0; 
   end 
   else if (s_axis_tdata_11 <= 16'hFFFF) begin 
       s_axis_tvalid_11 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_11 <= 10'd11; 
   end 
   else begin 
       s_axis_tdata_11 <= s_axis_tdata_11 + 10'd12; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_11 <= 1'b0; 
   end 
   else if (s_axis_tdata_11 > 16'hFFFF) begin 
       s_axis_tlast_11 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_11 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_12 <= 1'b0; 
   end 
   else if (s_axis_tlast_12 == 1'b1) begin 
       s_axis_tvalid_12 <= 1'b0; 
   end 
   else if (s_axis_tdata_12 <= 16'hFFFF) begin 
       s_axis_tvalid_12 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_12 <= 10'd12; 
   end 
   else begin 
       s_axis_tdata_12 <= s_axis_tdata_12 + 10'd13; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_12 <= 1'b0; 
   end 
   else if (s_axis_tdata_12 > 16'hFFFF) begin 
       s_axis_tlast_12 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_12 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_13 <= 1'b0; 
   end 
   else if (s_axis_tlast_13 == 1'b1) begin 
       s_axis_tvalid_13 <= 1'b0; 
   end 
   else if (s_axis_tdata_13 <= 16'hFFFF) begin 
       s_axis_tvalid_13 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_13 <= 10'd13; 
   end 
   else begin 
       s_axis_tdata_13 <= s_axis_tdata_13 + 10'd14; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_13 <= 1'b0; 
   end 
   else if (s_axis_tdata_13 > 16'hFFFF) begin 
       s_axis_tlast_13 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_13 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_14 <= 1'b0; 
   end 
   else if (s_axis_tlast_14 == 1'b1) begin 
       s_axis_tvalid_14 <= 1'b0; 
   end 
   else if (s_axis_tdata_14 <= 16'hFFFF) begin 
       s_axis_tvalid_14 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_14 <= 10'd14; 
   end 
   else begin 
       s_axis_tdata_14 <= s_axis_tdata_14 + 10'd15; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_14 <= 1'b0; 
   end 
   else if (s_axis_tdata_14 > 16'hFFFF) begin 
       s_axis_tlast_14 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_14 <= 1'b0; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tvalid_15 <= 1'b0; 
   end 
   else if (s_axis_tlast_15 == 1'b1) begin 
       s_axis_tvalid_15 <= 1'b0; 
   end 
   else if (s_axis_tdata_15 <= 16'hFFFF) begin 
       s_axis_tvalid_15 <= 1'b1; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tdata_15 <= 10'd15; 
   end 
   else begin 
       s_axis_tdata_15 <= s_axis_tdata_15 + 10'd16; 
   end 
end 

always @(posedge clk or negedge rst_n) begin 
   if(~rst_n) begin 
       s_axis_tlast_15 <= 1'b0; 
   end 
   else if (s_axis_tdata_15 > 16'hFFFF) begin 
       s_axis_tlast_15 <= 1'b1; 
   end 
   else begin 
       s_axis_tlast_15 <= 1'b0; 
   end 
end 

// assign s_axis_tready_0  = 1'b1;
// assign s_axis_tready_1  = 1'b1;
// assign s_axis_tready_2  = 1'b1;
// assign s_axis_tready_3  = 1'b1;
// assign s_axis_tready_4  = 1'b1;
// assign s_axis_tready_5  = 1'b1;
// assign s_axis_tready_6  = 1'b1;
// assign s_axis_tready_7  = 1'b1;
// assign s_axis_tready_8  = 1'b1;
// assign s_axis_tready_9  = 1'b1;
// assign s_axis_tready_10 = 1'b1;
// assign s_axis_tready_11 = 1'b1;
// assign s_axis_tready_12 = 1'b1;
// assign s_axis_tready_13 = 1'b1;
// assign s_axis_tready_14 = 1'b1;
// assign s_axis_tready_15 = 1'b1;

//----modules----

seedCollect_16channel seedCollect_16channel_inst
(
.clk(clk),
.rst_n(rst_n),

.s_axis_tvalid_0(s_axis_tvalid_0),
.s_axis_tdata_0(s_axis_tdata_0),
.s_axis_tready_0(s_axis_tready_0),
.s_axis_tlast_0(s_axis_tlast_0),

.s_axis_tvalid_1(s_axis_tvalid_1),
.s_axis_tdata_1(s_axis_tdata_1),
.s_axis_tready_1(s_axis_tready_1),
.s_axis_tlast_1(s_axis_tlast_1),

.s_axis_tvalid_2(s_axis_tvalid_2),
.s_axis_tdata_2(s_axis_tdata_2),
.s_axis_tready_2(s_axis_tready_2),
.s_axis_tlast_2(s_axis_tlast_2),

.s_axis_tvalid_3(s_axis_tvalid_3),
.s_axis_tdata_3(s_axis_tdata_3),
.s_axis_tready_3(s_axis_tready_3),
.s_axis_tlast_3(s_axis_tlast_3),

.s_axis_tvalid_4(s_axis_tvalid_4),
.s_axis_tdata_4(s_axis_tdata_4),
.s_axis_tready_4(s_axis_tready_4),
.s_axis_tlast_4(s_axis_tlast_4),

.s_axis_tvalid_5(s_axis_tvalid_5),
.s_axis_tdata_5(s_axis_tdata_5),
.s_axis_tready_5(s_axis_tready_5),
.s_axis_tlast_5(s_axis_tlast_5),

.s_axis_tvalid_6(s_axis_tvalid_6),
.s_axis_tdata_6(s_axis_tdata_6),
.s_axis_tready_6(s_axis_tready_6),
.s_axis_tlast_6(s_axis_tlast_6),

.s_axis_tvalid_7(s_axis_tvalid_7),
.s_axis_tdata_7(s_axis_tdata_7),
.s_axis_tready_7(s_axis_tready_7),
.s_axis_tlast_7(s_axis_tlast_7),

.s_axis_tvalid_8(s_axis_tvalid_8),
.s_axis_tdata_8(s_axis_tdata_8),
.s_axis_tready_8(s_axis_tready_8),
.s_axis_tlast_8(s_axis_tlast_8),

.s_axis_tvalid_9(s_axis_tvalid_9),
.s_axis_tdata_9(s_axis_tdata_9),
.s_axis_tready_9(s_axis_tready_9),
.s_axis_tlast_9(s_axis_tlast_9),

.s_axis_tvalid_10(s_axis_tvalid_10),
.s_axis_tdata_10(s_axis_tdata_10),
.s_axis_tready_10(s_axis_tready_10),
.s_axis_tlast_10(s_axis_tlast_10),

.s_axis_tvalid_11(s_axis_tvalid_11),
.s_axis_tdata_11(s_axis_tdata_11),
.s_axis_tready_11(s_axis_tready_11),
.s_axis_tlast_11(s_axis_tlast_11),

.s_axis_tvalid_12(s_axis_tvalid_12),
.s_axis_tdata_12(s_axis_tdata_12),
.s_axis_tready_12(s_axis_tready_12),
.s_axis_tlast_12(s_axis_tlast_12),

.s_axis_tvalid_13(s_axis_tvalid_13),
.s_axis_tdata_13(s_axis_tdata_13),
.s_axis_tready_13(s_axis_tready_13),
.s_axis_tlast_13(s_axis_tlast_13),

.s_axis_tvalid_14(s_axis_tvalid_14),
.s_axis_tdata_14(s_axis_tdata_14),
.s_axis_tready_14(s_axis_tready_14),
.s_axis_tlast_14(s_axis_tlast_14),

.s_axis_tvalid_15(s_axis_tvalid_15),
.s_axis_tdata_15(s_axis_tdata_15),
.s_axis_tready_15(s_axis_tready_15),
.s_axis_tlast_15(s_axis_tlast_15),

.m_axis_tvalid(m_axis_tvalid),
.m_axis_tdata(m_axis_tdata),
.m_axis_tready(m_axis_tready),
.m_axis_tlast(m_axis_tlast)  
);

endmodule