	ram_2048x512_8192x128 u0 (
		.data      (<connected-to-data>),      //  ram_input.datain
		.wraddress (<connected-to-wraddress>), //           .wraddress
		.rdaddress (<connected-to-rdaddress>), //           .rdaddress
		.wren      (<connected-to-wren>),      //           .wren
		.wrclock   (<connected-to-wrclock>),   //           .wrclock
		.rdclock   (<connected-to-rdclock>),   //           .rdclock
		.rden      (<connected-to-rden>),      //           .rden
		.q         (<connected-to-q>)          // ram_output.dataout
	);

