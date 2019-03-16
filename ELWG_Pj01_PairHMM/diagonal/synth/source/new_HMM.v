module new_HMM(
	input sys_clk,
	input sys_rst_n
);

/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 0;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
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
wire [5:0] pkt_receive_enable;
wire                result_fifo_rden;
wire      [31:0]    result_fifo_rdat;
wire                result_fifo_empty;


/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/

ram_9600x128 u1(
	 .data                     (128'b0         ), 
	 .wraddress                (14'd0          ),
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

hmm hmm0 (
   .sys_clk                  (sys_clk        ),
   .sys_rst_n                (sys_rst_n      ),
   .matrix_memory_sop        (pkt_sop        ),
   .matrix_memory_eop        (pkt_eop        ),
   .matrix_memory_vld        (pkt_vld        ),
   .matrix_memory_data       (pkt_data       ),
   .pkt_receive_enable       (pkt_receive_enable),

   .result_fifo_rden         (~result_fifo_empty),
   .result_fifo_rdat         (result_fifo_rdat),
   .result_fifo_empty        (result_fifo_empty)

);

reg [7:0] counter;

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    counter <= 8'd0;
  end else if(counter == 8'd30) begin
    counter <= counter;
  end else begin
    counter <= counter + 1'b1;  	
  end 	
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pcie_write_done <= 1'b0;
  end else if(counter == 8'd20) begin
    pcie_write_done <= 1'b1;   
  end else begin
    pcie_write_done <= 1'b0;  	
  end 
end 

assign pkt_enable = (pkt_receive_enable == 6'b000000)? 1'b0 : 1'b1;

endmodule
