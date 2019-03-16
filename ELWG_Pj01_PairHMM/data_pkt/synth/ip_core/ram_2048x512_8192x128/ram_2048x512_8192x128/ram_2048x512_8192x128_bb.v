
module ram_2048x512_8192x128 (
	data,
	wraddress,
	rdaddress,
	wren,
	wrclock,
	rdclock,
	rden,
	q);	

	input	[511:0]	data;
	input	[10:0]	wraddress;
	input	[12:0]	rdaddress;
	input		wren;
	input		wrclock;
	input		rdclock;
	input		rden;
	output	[127:0]	q;
endmodule
