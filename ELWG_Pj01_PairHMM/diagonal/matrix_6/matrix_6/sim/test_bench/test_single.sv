`timescale 1ns/1ps
module test;
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 0;



reg sys_clk;
reg sys_rst_n;



test_pkt u0(
	.sys_clk        (sys_clk),
	.sys_rst_n      (sys_rst_n),
	.result_fifo_rdat()
	);




always #5  sys_clk   = ~sys_clk;



initial begin
	   sys_rst_n = 1'b0; 
	   sys_clk   = 1'b0;	  
#31  sys_rst_n = 1'b1;

@(posedge sys_clk);
repeat(600000)
@(posedge sys_clk);
$stop;
end



initial begin 
  forever begin 
    @ (posedge sys_clk);
    if (test.u0.m0.sum_vld) begin 
      $display ("sum:%016x",test.u0.m0.sum);
    end

    if (!test.u0.m0.s0.init) begin 
      $display ("read_cnt:%016x",test.u0.m0.s0.read_cnt);
   	end
  end
end




initial begin
//wait(sys_rst_n);	
	$fsdbDumpfile("./test_data_pkt_top.fsdb");
 	// $fsdbDumpvars(1,test.uut.u_read_analyze.calculate_p_inst); 
    $fsdbDumpvars(5,test);
end


// Local Variables:
// verilog-library-files:("../source/test_phy.v" )
// End:
endmodule // test