
module fifo_8x2_dis (
	data,
	wrreq,
	rdreq,
	clock,
	q,
	usedw,
	full,
	empty);	

	input	[1:0]	data;
	input		wrreq;
	input		rdreq;
	input		clock;
	output	[1:0]	q;
	output	[2:0]	usedw;
	output		full;
	output		empty;
endmodule
