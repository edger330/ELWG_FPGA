
module fifo_256x128 (
	data,
	wrreq,
	rdreq,
	wrclk,
	rdclk,
	q,
	rdusedw,
	wrusedw,
	rdempty,
	wrfull);	

	input	[127:0]	data;
	input		wrreq;
	input		rdreq;
	input		wrclk;
	input		rdclk;
	output	[511:0]	q;
	output	[5:0]	rdusedw;
	output	[7:0]	wrusedw;
	output		rdempty;
	output		wrfull;
endmodule
