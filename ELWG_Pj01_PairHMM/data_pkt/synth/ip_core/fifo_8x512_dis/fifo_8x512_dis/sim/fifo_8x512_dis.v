// fifo_8x512_dis.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module fifo_8x512_dis (
		input  wire [511:0] data,  //  fifo_input.datain
		input  wire         wrreq, //            .wrreq
		input  wire         rdreq, //            .rdreq(ack)
		input  wire         clock, //            .clk
		output wire [511:0] q,     // fifo_output.dataout
		output wire [2:0]   usedw, //            .usedw
		output wire         full,  //            .full
		output wire         empty  //            .empty
	);

	fifo_8x512_dis_fifo_161_niqd2pa fifo_0 (
		.data  (data),  //  fifo_input.datain
		.wrreq (wrreq), //            .wrreq
		.rdreq (rdreq), //            .rdreq(ack)
		.clock (clock), //            .clk
		.q     (q),     // fifo_output.dataout
		.usedw (usedw), //            .usedw
		.full  (full),  //            .full
		.empty (empty)  //            .empty
	);

endmodule
