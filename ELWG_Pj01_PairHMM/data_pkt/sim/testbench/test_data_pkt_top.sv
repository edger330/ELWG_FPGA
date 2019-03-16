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
reg               sys_clk;
reg               sys_rst_n;
reg     [127:0]   cpu_pkt_data;
reg     [ 13:0]   cpu_pkt_waddr;
reg               cpu_pkt_vld;         
reg               cpu_pkt_done;

reg               matrix_enable;
/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/
always #5  sys_clk   = ~sys_clk;
always #3000 matrix_enable = ~matrix_enable;



initial begin
	   sys_rst_n = 1'b0; 
	   sys_clk   = 1'b0;	  
	   cpu_pkt_vld = 0;
	   cpu_pkt_waddr = 0;
	   cpu_pkt_data = 0;
	   cpu_pkt_done = 0;
	   matrix_enable= 0;
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

repeat(20000)@(posedge sys_clk);

$stop;
end


data_pkt_top uut(
    .sys_clk         (sys_clk),
    .sys_rst_n       (sys_rst_n),
    .cpu_pkt_data    (cpu_pkt_data),
    .cpu_pkt_waddr   (cpu_pkt_waddr),
    .cpu_pkt_vld     (cpu_pkt_vld),   
    .cpu_pkt_done    (cpu_pkt_done),
    .matrix_enable   (matrix_enable)
);   



initial begin
//wait(sys_rst_n);	
	$fsdbDumpfile("./DebussFile/test_data_pkt_top.fsdb");
 	// $fsdbDumpvars(1,test.uut.u_read_analyze.calculate_p_inst); 
    $fsdbDumpvars(3,test);
end


// Local Variables:
// verilog-library-files:("../source/test_phy.v" )
// End:


endmodule   