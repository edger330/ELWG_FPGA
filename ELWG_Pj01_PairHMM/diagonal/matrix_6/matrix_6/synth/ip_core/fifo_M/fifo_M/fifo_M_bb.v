
module fifo_M (
	data,
	wrreq,
	rdreq,
	clock,
	aclr,
	q,
	usedw);	

	input	[31:0]	data;
	input		wrreq;
	input		rdreq;
	input		clock;
	input		aclr;
	output	[31:0]	q;
	output	[11:0]	usedw;
endmodule
