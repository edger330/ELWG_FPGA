
module fifo_256x128_1024x32 (
	data,
	wrreq,
	rdreq,
	wrclk,
	rdclk,
	q,
	rdusedw,
	wrusedw,
	rdempty,
	wrfull,
	wrempty);	

	input	[127:0]	data;
	input		wrreq;
	input		rdreq;
	input		wrclk;
	input		rdclk;
	output	[31:0]	q;
	output	[9:0]	rdusedw;
	output	[7:0]	wrusedw;
	output		rdempty;
	output		wrfull;
	output		wrempty;
endmodule
