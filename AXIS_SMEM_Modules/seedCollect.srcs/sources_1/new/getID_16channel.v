`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/13 15:26:12
// Design Name: 
// Module Name: getID
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


module getID_16channel #(
	parameter integer C_BUS_WIDTH   = 16,
	parameter integer C_ID_WIDTH    = 5,
	parameter integer C_STATE_WIDTH = 2
)
(
	clk,
	rst_n,
	state,
	B_tvalid,
	ID
   );

input wire clk;
input wire rst_n;
input wire [C_BUS_WIDTH-1:0] B_tvalid ;
input wire [C_STATE_WIDTH-1:0] state  ;

output wire [C_ID_WIDTH-1:0] ID       ;

wire [C_ID_WIDTH-1:0] const_ID_0;
wire [C_ID_WIDTH-1:0] const_ID_1;
wire [C_ID_WIDTH-1:0] const_ID_2;
wire [C_ID_WIDTH-1:0] const_ID_3;
wire [C_ID_WIDTH-1:0] const_ID_4;
wire [C_ID_WIDTH-1:0] const_ID_5;
wire [C_ID_WIDTH-1:0] const_ID_6;
wire [C_ID_WIDTH-1:0] const_ID_7;
wire [C_ID_WIDTH-1:0] const_ID_8;
wire [C_ID_WIDTH-1:0] const_ID_9;
wire [C_ID_WIDTH-1:0] const_ID_10;
wire [C_ID_WIDTH-1:0] const_ID_11;
wire [C_ID_WIDTH-1:0] const_ID_12;
wire [C_ID_WIDTH-1:0] const_ID_13;
wire [C_ID_WIDTH-1:0] const_ID_14;
wire [C_ID_WIDTH-1:0] const_ID_15;

assign const_ID_0   = 10'd1;
assign const_ID_1   = 10'd2;
assign const_ID_2   = 10'd3;
assign const_ID_3   = 10'd4;
assign const_ID_4   = 10'd5;
assign const_ID_5   = 10'd6;
assign const_ID_6   = 10'd7;
assign const_ID_7   = 10'd8;
assign const_ID_8   = 10'd9;
assign const_ID_9   = 10'd10;
assign const_ID_10  = 10'd11;
assign const_ID_11  = 10'd12;
assign const_ID_12  = 10'd13;
assign const_ID_13  = 10'd14;
assign const_ID_14  = 10'd15;
assign const_ID_15  = 10'd16;

wire [C_ID_WIDTH-1:0] num0;
wire [C_ID_WIDTH-1:0] num1;
wire [C_ID_WIDTH-1:0] num2;
wire [C_ID_WIDTH-1:0] num3;
wire [C_ID_WIDTH-1:0] num4;
wire [C_ID_WIDTH-1:0] num5;
wire [C_ID_WIDTH-1:0] num6;
wire [C_ID_WIDTH-1:0] num7;
wire [C_ID_WIDTH-1:0] num8;
wire [C_ID_WIDTH-1:0] num9;
wire [C_ID_WIDTH-1:0] num10;
wire [C_ID_WIDTH-1:0] num11;
wire [C_ID_WIDTH-1:0] num12;
wire [C_ID_WIDTH-1:0] num13;
wire [C_ID_WIDTH-1:0] num14;
wire [C_ID_WIDTH-1:0] num15;

wire [C_ID_WIDTH-1:0] out1_0;
wire [C_ID_WIDTH-1:0] out1_1;
wire [C_ID_WIDTH-1:0] out1_2;
wire [C_ID_WIDTH-1:0] out1_3;
wire [C_ID_WIDTH-1:0] out1_4;
wire [C_ID_WIDTH-1:0] out1_5;
wire [C_ID_WIDTH-1:0] out1_6;
wire [C_ID_WIDTH-1:0] out1_7;

wire [C_ID_WIDTH-1:0] out2_0;
wire [C_ID_WIDTH-1:0] out2_1;
wire [C_ID_WIDTH-1:0] out2_2;
wire [C_ID_WIDTH-1:0] out2_3;

wire [C_ID_WIDTH-1:0] out3_0;
wire [C_ID_WIDTH-1:0] out3_1;

//----tvalid_detection-t--
tvalid_detection_ff td_ff_0(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[0]),
	.ID(const_ID_0),
	.num(num0)
);

tvalid_detection_ff td_ff_1(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[1]),
	.ID(const_ID_1),
	.num(num1)
);

tvalid_detection_ff td_ff_2(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[2]),
	.ID(const_ID_2),
	.num(num2)
);

tvalid_detection_ff td_ff_3(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[3]),
	.ID(const_ID_3),
	.num(num3)
);

tvalid_detection_ff td_ff_4(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[4]),
	.ID(const_ID_4),
	.num(num4)
);

tvalid_detection_ff td_ff_5(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[5]),
	.ID(const_ID_5),
	.num(num5)
);

tvalid_detection_ff td_ff_6(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[6]),
	.ID(const_ID_6),
	.num(num6)
);

tvalid_detection_ff td_ff_7(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[7]),
	.ID(const_ID_7),
	.num(num7)
);

tvalid_detection_ff td_ff_8(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[8]),
	.ID(const_ID_8),
	.num(num8)
);

tvalid_detection_ff td_ff_9(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[9]),
	.ID(const_ID_9),
	.num(num9)
);

tvalid_detection_ff td_ff_10(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[10]),
	.ID(const_ID_10),
	.num(num10)
);

tvalid_detection_ff td_ff_11(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[11]),
	.ID(const_ID_11),
	.num(num11)
);

tvalid_detection_ff td_ff_12(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[12]),
	.ID(const_ID_12),
	.num(num12)
);

tvalid_detection_ff td_ff_13(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[13]),
	.ID(const_ID_13),
	.num(num13)
);

tvalid_detection_ff td_ff_14(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[14]),
	.ID(const_ID_14),
	.num(num14)
);

tvalid_detection_ff td_ff_15(
	.clk(clk),
	.rst_n(rst_n),
	.state(state),
	.tvalid(B_tvalid[15]),
	.ID(const_ID_15),
	.num(num15)
);

//----cmp----

cmpID_ff cmp_ff1_0(
	.clk(clk),
	.rst_n(rst_n),
	.in1(num0),
	.in2(num1),
	.out(out1_0)
);

cmpID_ff cmp_ff1_1(
	.clk(clk),
	.rst_n(rst_n),
	.in1(num2),
	.in2(num3),
	.out(out1_1)
);

cmpID_ff cmp_ff1_2(
	.clk(clk),
	.rst_n(rst_n),
	.in1(num4),
	.in2(num5),
	.out(out1_2)
);

cmpID_ff cmp_ff1_3(
	.clk(clk),
	.rst_n(rst_n),
	.in1(num6),
	.in2(num7),
	.out(out1_3)
);

cmpID_ff cmp_ff1_4(
	.clk(clk),
	.rst_n(rst_n),
	.in1(num8),
	.in2(num9),
	.out(out1_4)
);

cmpID_ff cmp_ff1_5(
	.clk(clk),
	.rst_n(rst_n),
	.in1(num10),
	.in2(num11),
	.out(out1_5)
);

cmpID_ff cmp_ff1_6(
	.clk(clk),
	.rst_n(rst_n),
	.in1(num12),
	.in2(num13),
	.out(out1_6)
);

cmpID_ff cmp_ff1_7(
	.clk(clk),
	.rst_n(rst_n),
	.in1(num14),
	.in2(num15),
	.out(out1_7)
);

cmpID_ff cmp_ff2_0(
	.clk(clk),
	.rst_n(rst_n),
	.in1(out1_0),
	.in2(out1_1),
	.out(out2_0)
);

cmpID_ff cmp_ff2_1(
	.clk(clk),
	.rst_n(rst_n),
	.in1(out1_2),
	.in2(out1_3),
	.out(out2_1)
);

cmpID_ff cmp_ff2_2(
	.clk(clk),
	.rst_n(rst_n),
	.in1(out1_4),
	.in2(out1_5),
	.out(out2_2)
);

cmpID_ff cmp_ff2_3(
	.clk(clk),
	.rst_n(rst_n),
	.in1(out1_6),
	.in2(out1_7),
	.out(out2_3)
);

cmpID_ff cmp_ff3_0(
	.clk(clk),
	.rst_n(rst_n),
	.in1(out2_0),
	.in2(out2_1),
	.out(out3_0)
);

cmpID_ff cmp_ff3_1(
	.clk(clk),
	.rst_n(rst_n),
	.in1(out2_2),
	.in2(out2_3),
	.out(out3_1)
);

cmpID_ff cmp_ff4(
	.clk(clk),
	.rst_n(rst_n),
	.in1(out3_0),
	.in2(out3_1),
	.out(ID)
);

endmodule

