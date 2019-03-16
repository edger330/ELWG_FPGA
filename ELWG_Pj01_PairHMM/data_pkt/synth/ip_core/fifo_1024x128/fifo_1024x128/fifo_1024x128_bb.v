
module fifo_1024x128 (
	data,
	wrreq,
	rdreq,
	wrclk,
	rdclk,
	q,
	wrusedw,
	rdempty,
	wrfull);	

	input	[127:0]	data;
	input		wrreq;
	input		rdreq;
	input		wrclk;
	input		rdclk;
	output	[127:0]	q;
	output	[9:0]	wrusedw;
	output		rdempty;
	output		wrfull;
endmodule
