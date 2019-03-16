
module ram_2_port_1024_32 (
	data,
	wraddress,
	rdaddress,
	wren,
	clock,
	rden,
	q);	

	input	[31:0]	data;
	input	[9:0]	wraddress;
	input	[9:0]	rdaddress;
	input		wren;
	input		clock;
	input		rden;
	output	[31:0]	q;
endmodule
