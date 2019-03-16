
module fifo_1024x32 (
	data,
	wrreq,
	rdreq,
	clock,
	q,
	usedw,
	full,
	empty);	

	input	[31:0]	data;
	input		wrreq;
	input		rdreq;
	input		clock;
	output	[31:0]	q;
	output	[9:0]	usedw;
	output		full;
	output		empty;
endmodule
