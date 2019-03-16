
module ram_2port_512x32 (
	data,
	wraddress,
	rdaddress,
	wren,
	clock,
	rden,
	q);	

	input	[31:0]	data;
	input	[8:0]	wraddress;
	input	[8:0]	rdaddress;
	input		wren;
	input		clock;
	input		rden;
	output	[31:0]	q;
endmodule
