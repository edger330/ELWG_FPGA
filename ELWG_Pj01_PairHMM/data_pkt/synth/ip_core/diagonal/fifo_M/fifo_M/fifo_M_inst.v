	fifo_M u0 (
		.data  (<connected-to-data>),  //  fifo_input.datain
		.wrreq (<connected-to-wrreq>), //            .wrreq
		.rdreq (<connected-to-rdreq>), //            .rdreq(ack)
		.clock (<connected-to-clock>), //            .clk
		.aclr  (<connected-to-aclr>),  //            .aclr
		.q     (<connected-to-q>),     // fifo_output.dataout
		.usedw (<connected-to-usedw>)  //            .usedw
	);

