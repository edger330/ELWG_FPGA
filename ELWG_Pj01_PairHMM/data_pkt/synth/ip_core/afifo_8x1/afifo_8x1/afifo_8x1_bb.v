
module afifo_8x1 (
	data,
	wrreq,
	rdreq,
	wrclk,
	rdclk,
	q,
	wrusedw,
	rdempty,
	wrfull);	

	input		data;
	input		wrreq;
	input		rdreq;
	input		wrclk;
	input		rdclk;
	output		q;
	output	[2:0]	wrusedw;
	output		rdempty;
	output		wrfull;
endmodule
