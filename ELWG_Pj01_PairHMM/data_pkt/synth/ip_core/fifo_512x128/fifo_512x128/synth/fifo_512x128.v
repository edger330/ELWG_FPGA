// fifo_512x128.v

// Generated using ACDS version 16.1 196

`timescale 1 ps / 1 ps
module fifo_512x128 (
		input  wire [127:0] data,    //  fifo_input.datain
		input  wire         wrreq,   //            .wrreq
		input  wire         rdreq,   //            .rdreq(ack)
		input  wire         wrclk,   //            .wrclk
		input  wire         rdclk,   //            .rdclk
		output wire [127:0] q,       // fifo_output.dataout
		output wire [8:0]   wrusedw, //            .wrusedw
		output wire         rdempty, //            .rdempty
		output wire         wrfull   //            .wrfull
	);

	fifo_512x128_fifo_161_2vzxxdi fifo_0 (
		.data    (data),    //  fifo_input.datain
		.wrreq   (wrreq),   //            .wrreq
		.rdreq   (rdreq),   //            .rdreq(ack)
		.wrclk   (wrclk),   //            .wrclk
		.rdclk   (rdclk),   //            .rdclk
		.q       (q),       // fifo_output.dataout
		.wrusedw (wrusedw), //            .wrusedw
		.rdempty (rdempty), //            .rdempty
		.wrfull  (wrfull)   //            .wrfull
	);

endmodule
