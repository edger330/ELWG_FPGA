
module ram_9600x128 (
	data,
	wraddress,
	rdaddress,
	wren,
	clock,
	rden,
	q);	

	input	[127:0]	data;
	input	[13:0]	wraddress;
	input	[15:0]	rdaddress;
	input		wren;
	input		clock;
	input		rden;
	output	[31:0]	q;
endmodule
