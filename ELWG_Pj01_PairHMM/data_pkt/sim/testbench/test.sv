/*********************************************************************
//  Author:    jyb
//  Filename:  
//  Modified:
//  Version:   1.0
//
//  Description:
//
//  Copyright (c) 2006   Combrio Networks.
//
//  All Rights Reserved.
//
//
// -------------------------------------------------------------------
//  Modification History:
//
//  Date             Who            Description of change
//  ------------------------------------------------------------------
//  2015-02-01       jyb             initial version
//
**********************************************************************/
`timescale 1ns/1ps
module test;
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 2;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
reg sys_clk;
reg sys_rst_n;
reg cpu_pkt_done;
reg read_done;

wire [127:0] data_write_pcie;
wire [13:0] addr_write_pcie;
wire        en_write_pcie  ;
wire        max_data_num_done;
wire        data_done;
/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/
pair_hmm_top p0(
    //input 
     .sys_clk          (sys_clk),
     .sys_rst_n        (sys_rst_n),
     .cpu_pkt_done     (cpu_pkt_done),
     .read_done        (read_done),
    //output
     .data_write_pcie  (data_write_pcie),
     .addr_write_pcie  (addr_write_pcie),
     .en_write_pcie    (en_write_pcie),
     .max_data_num_done(max_data_num_done),
     .data_done        (data_done)
    );

always #5  sys_clk   = ~sys_clk;



initial begin
	   sys_rst_n = 1'b0; 
	   sys_clk   = 1'b0;	  
	   cpu_pkt_done = 0;
       read_done =0;
#31  sys_rst_n = 1'b1;
//@(posedge sys_clk);
//#10  cpu_pkt_vld = 1;
//	   cpu_pkt_waddr = 0;
//	   cpu_pkt_data = 128'd197121;
//@(posedge sys_clk);
//#10  cpu_pkt_vld = 0;
//	   cpu_pkt_waddr = 0;
//	   cpu_pkt_data = 0;
@(posedge sys_clk);
#10  cpu_pkt_done =1 ;
@(posedge sys_clk);     
#10  cpu_pkt_done =0;
repeat(80000) @(posedge sys_clk);
    read_done = 1;
#10 read_done = 0;

repeat(100000)@(posedge sys_clk);

$stop;
end





initial begin
//wait(sys_rst_n);	
	$fsdbDumpfile("./DebussFile/test_data_pkt_top.fsdb");
 	// $fsdbDumpvars(1,test.uut.u_read_analyze.calculate_p_inst); 
    $fsdbDumpvars(4,test);
end


// Local Variables:
// verilog-library-files:("../source/test_phy.v" )
// End:


endmodule   