// fifo_256x128_1024x32.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module fifo_256x128_1024x32 (
		input  wire [127:0] data,    //  fifo_input.datain
		input  wire         wrreq,   //            .wrreq
		input  wire         rdreq,   //            .rdreq(ack)
		input  wire         wrclk,   //            .wrclk
		input  wire         rdclk,   //            .rdclk
		output wire [31:0]  q,       // fifo_output.dataout
		output wire [9:0]   rdusedw, //            .rdusedw
		output wire [7:0]   wrusedw, //            .wrusedw
		output wire         rdempty, //            .rdempty
		output wire         wrfull,  //            .wrfull
		output wire         wrempty  //            .wrempty
	);

	fifo_256x128_1024x32_fifo_161_6ci2erq fifo_0 (
		.data    (data),    //  fifo_input.datain
		.wrreq   (wrreq),   //            .wrreq
		.rdreq   (rdreq),   //            .rdreq(ack)
		.wrclk   (wrclk),   //            .wrclk
		.rdclk   (rdclk),   //            .rdclk
		.q       (q),       // fifo_output.dataout
		.rdusedw (rdusedw), //            .rdusedw
		.wrusedw (wrusedw), //            .wrusedw
		.rdempty (rdempty), //            .rdempty
		.wrfull  (wrfull),  //            .wrfull
		.wrempty (wrempty)  //            .wrempty
	);

endmodule
