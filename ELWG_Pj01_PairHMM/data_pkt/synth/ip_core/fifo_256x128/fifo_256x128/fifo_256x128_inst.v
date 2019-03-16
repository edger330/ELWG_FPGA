	fifo_256x128 u0 (
		.data    (<connected-to-data>),    //  fifo_input.datain
		.wrreq   (<connected-to-wrreq>),   //            .wrreq
		.rdreq   (<connected-to-rdreq>),   //            .rdreq(ack)
		.wrclk   (<connected-to-wrclk>),   //            .wrclk
		.rdclk   (<connected-to-rdclk>),   //            .rdclk
		.q       (<connected-to-q>),       // fifo_output.dataout
		.rdusedw (<connected-to-rdusedw>), //            .rdusedw
		.wrusedw (<connected-to-wrusedw>), //            .wrusedw
		.rdempty (<connected-to-rdempty>), //            .rdempty
		.wrfull  (<connected-to-wrfull>)   //            .wrfull
	);

