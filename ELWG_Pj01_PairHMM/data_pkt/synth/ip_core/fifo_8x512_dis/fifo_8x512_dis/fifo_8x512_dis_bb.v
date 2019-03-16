
module fifo_8x512_dis (
	data,
	wrreq,
	rdreq,
	clock,
	q,
	usedw,
	full,
	empty);	

	input	[511:0]	data;
	input		wrreq;
	input		rdreq;
	input		clock;
	output	[511:0]	q;
	output	[2:0]	usedw;
	output		full;
	output		empty;
endmodule
