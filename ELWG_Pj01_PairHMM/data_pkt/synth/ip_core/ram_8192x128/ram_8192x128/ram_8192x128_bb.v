
module ram_8192x128 (
	data,
	wraddress,
	rdaddress,
	wren,
	wrclock,
	rdclock,
	rden,
	q);	

	input	[127:0]	data;
	input	[12:0]	wraddress;
	input	[12:0]	rdaddress;
	input		wren;
	input		wrclock;
	input		rdclock;
	input		rden;
	output	[127:0]	q;
endmodule
