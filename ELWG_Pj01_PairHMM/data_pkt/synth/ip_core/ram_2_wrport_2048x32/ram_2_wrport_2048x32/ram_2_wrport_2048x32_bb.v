
module ram_2_wrport_2048x32 (
	data_a,
	data_b,
	address_a,
	address_b,
	wren_a,
	wren_b,
	clock,
	rden_a,
	rden_b,
	q_a,
	q_b);	

	input	[31:0]	data_a;
	input	[31:0]	data_b;
	input	[10:0]	address_a;
	input	[10:0]	address_b;
	input		wren_a;
	input		wren_b;
	input		clock;
	input		rden_a;
	input		rden_b;
	output	[31:0]	q_a;
	output	[31:0]	q_b;
endmodule
