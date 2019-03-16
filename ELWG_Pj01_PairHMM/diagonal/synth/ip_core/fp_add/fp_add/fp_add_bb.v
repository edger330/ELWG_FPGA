
module fp_add (
	a,
	areset,
	b,
	clk,
	q,
	en);	

	input	[31:0]	a;
	input		areset;
	input	[31:0]	b;
	input		clk;
	output	[31:0]	q;
	input	[0:0]	en;
endmodule
