
module fifo_512x32 (
	data,
	wrreq,
	rdreq,
	clock,
	aclr,
	q,
	usedw,
	full,
	empty);	

	input	[31:0]	data;
	input		wrreq;
	input		rdreq;
	input		clock;
	input		aclr;
	output	[31:0]	q;
	output	[8:0]	usedw;
	output		full;
	output		empty;
endmodule
