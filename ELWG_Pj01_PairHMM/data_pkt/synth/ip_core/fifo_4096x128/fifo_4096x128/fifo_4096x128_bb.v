
module fifo_4096x128 (
	data,
	wrreq,
	rdreq,
	clock,
	q,
	usedw,
	full,
	empty);	

	input	[127:0]	data;
	input		wrreq;
	input		rdreq;
	input		clock;
	output	[127:0]	q;
	output	[12:0]	usedw;
	output		full;
	output		empty;
endmodule
