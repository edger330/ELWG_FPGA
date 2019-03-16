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
//  2015-02-01        jyb             initial version
//
**********************************************************************/
`timescale 1ns/1ps
module test;
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 0;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
reg                 sys_clk;
reg                 sys_rst_n;
reg                 pcie_write_done;

wire                get_data_done;
wire                pcie_ram_ren; 
wire      [15:0]    pcie_ram_raddr;
wire      [31:0]    pcie_ram_rdat;
wire      [31:0]    pkt_data;
wire                pkt_sop;
wire                pkt_eop;
wire                pkt_vld;

wire                pkt_enable;
/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/

ram_9600x128 u1(
	 .data                     (128'b0              ), 
	 .wraddress                (0              ),
	 .rdaddress                (pcie_ram_raddr ),
	 .wren                     (1'b0           ),
	 .clock                    (sys_clk        ),
	 .rden                     (pcie_ram_ren   ),
	 .q                        (pcie_ram_rdat  )
);	


test_pkt u0(
//input 
   .sys_clk                  (sys_clk        ),
   .sys_rst_n                (sys_rst_n      ),
   .matrix_enable            (pkt_enable     ),
   .pcie_write_done          (pcie_write_done),     
   .pcie_ram_rdat            (pcie_ram_rdat  ),
//output
   .get_data_done            (get_data_done  ),
   .pcie_ram_ren             (pcie_ram_ren   ),
   .pcie_ram_raddr           (pcie_ram_raddr ),
   .pkt_data                 (pkt_data       ),
   .pkt_sop                  (pkt_sop        ), 
   .pkt_eop                  (pkt_eop        ),
   .pkt_vld                  (pkt_vld        )
);

save_send s0 (
   .sys_clk                  (sys_clk        ),
   .sys_rst_n                (sys_rst_n      ),
   .matrix_memory_sop        (pkt_sop        ),
   .matrix_memory_eop        (pkt_eop        ),
   .matrix_memory_vld        (pkt_vld        ),
   .matrix_memory_data       (pkt_data       ),
   .pkt_receive_enable       (pkt_enable     ),
   //
   .result_fifo_rden         (              ),
   .result_fifo_rdat         (               ),
   .result_fifo_empty        (               )

);





always #5  sys_clk   = ~sys_clk;


reg       [7:0]     counter;
always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    counter <=#D 8'd0;
  end else if(counter == 8'd30) begin
    counter <=#D counter;
  end else begin
    counter <=#D counter + 1;  	
  end 	
end

// always@(posedge sys_clk or negedge sys_rst_n)
// begin
//  if(!sys_rst_n)begin	
//    pcie_write_done <=#D 1'b0;
//  end else if(counter == 8'd20) begin
//    pcie_write_done <=#D 1'b1;   
//  end else if(get_data_done) begin
//    pcie_write_done <=#D 1'b1;   	
//  end else begin
//    pcie_write_done <=#D 1'b0;  	
//  end 
// end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pcie_write_done <=#D 1'b0;
  end else if(counter == 8'd20) begin
    pcie_write_done <=#D 1'b1;   
  end else begin
    pcie_write_done <=#D 1'b0;  	
  end 
end 


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
    if (test.s0.fifo_write_en) begin 
      $display ("data:%016x",test.s0.fifo_data_in);
    end
  end
end


initial begin
//wait(sys_rst_n);	
	$fsdbDumpfile("./test_data_pkt_top.fsdb");
 	// $fsdbDumpvars(1,test.uut.u_read_analyze.calculate_p_inst); 
    $fsdbDumpvars(4,test);
end


// Local Variables:
// verilog-library-files:("../source/test_phy.v" )
// End:


endmodule   