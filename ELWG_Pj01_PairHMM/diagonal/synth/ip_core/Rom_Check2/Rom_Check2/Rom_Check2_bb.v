
module Rom_Check2 (
	address,
	clock,
	rden,
	q);	

	input	[7:0]	address;
	input		clock;
	input		rden;
	output	[31:0]	q;
endmodule
