
module rom_256x32 (
	address,
	clock,
	rden,
	q);	

	input	[7:0]	address;
	input		clock;
	input		rden;
	output	[35:0]	q;
endmodule
