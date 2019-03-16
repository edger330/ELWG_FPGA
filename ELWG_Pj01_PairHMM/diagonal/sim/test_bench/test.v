`timescale 1ns/1ps
module test;
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 0;



reg sys_clk;
reg sys_rst_n;
wire [127:0] result_fifo_rdat; 


test_pkt u0(
	.sys_clk        (sys_clk),
	.sys_rst_n      (sys_rst_n),
	.result_fifo_rdat(result_fifo_rdat)
	);




always #5  sys_clk   = ~sys_clk;



initial begin
	   sys_rst_n = 1'b0; 
	   sys_clk   = 1'b0;	  
#31  sys_rst_n = 1'b1;
end

endmodule // test