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
//  2017-06-29       jyb             initial version
//
**********************************************************************/
module calculate_ctl_top (
core_clk,
sys_clk,
sys_rst_n,

matrix_memory_sop_0, 
matrix_memory_eop_0, 
matrix_memory_vld_0, 
matrix_memory_data_0,
pkt_enable_0,

matrix_memory_sop_1, 
matrix_memory_eop_1, 
matrix_memory_vld_1, 
matrix_memory_data_1,
pkt_enable_1,

matrix_memory_sop_2,
matrix_memory_eop_2,
matrix_memory_vld_2,
matrix_memory_data_2,
pkt_enable_2,

matrix_memory_sop_3 ,
matrix_memory_eop_3 ,
matrix_memory_vld_3 ,
matrix_memory_data_3,
pkt_enable_3,

matrix_memory_sop_4 ,
matrix_memory_eop_4 ,
matrix_memory_vld_4 ,
matrix_memory_data_4,
pkt_enable_4,

matrix_memory_sop_5 ,
matrix_memory_eop_5 ,
matrix_memory_vld_5 ,
matrix_memory_data_5,
pkt_enable_5,

matrix_memory_sop_6 ,
matrix_memory_eop_6 ,
matrix_memory_vld_6 ,
matrix_memory_data_6,
pkt_enable_6,

matrix_memory_sop_7 ,
matrix_memory_eop_7 ,
matrix_memory_vld_7 ,
matrix_memory_data_7,
pkt_enable_7,

data_write_pcie,
addr_write_pcie,
en_write_pcie,
pcie_read_en,
pcie_read_done_ack

);


/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter  D  =  0.2;


parameter MAX_TIME_OUT = 32'd500000000;
parameter MAX_DATA_NUM = 15'd19200;

/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
//global signal
input               core_clk;               
input               sys_clk;
input               sys_rst_n;
//
input               matrix_memory_sop_0 ;
input               matrix_memory_eop_0 ;
input               matrix_memory_vld_0 ;
input     [31:0]    matrix_memory_data_0;
output              pkt_enable_0;
//
input               matrix_memory_sop_1 ;
input               matrix_memory_eop_1 ;
input               matrix_memory_vld_1 ;
input     [31:0]    matrix_memory_data_1;
output              pkt_enable_1;
//
input               matrix_memory_sop_2 ;
input               matrix_memory_eop_2 ;
input               matrix_memory_vld_2 ;
input     [31:0]    matrix_memory_data_2;
output              pkt_enable_2;
//
input               matrix_memory_sop_3 ;
input               matrix_memory_eop_3 ;
input               matrix_memory_vld_3 ;
input     [31:0]    matrix_memory_data_3;
output              pkt_enable_3;
//
input               matrix_memory_sop_4 ;
input               matrix_memory_eop_4 ;
input               matrix_memory_vld_4 ;
input     [31:0]    matrix_memory_data_4;
output              pkt_enable_4;
//
input               matrix_memory_sop_5 ;
input               matrix_memory_eop_5 ;
input               matrix_memory_vld_5 ;
input     [31:0]    matrix_memory_data_5;
output              pkt_enable_5;
//
input               matrix_memory_sop_6 ;
input               matrix_memory_eop_6 ;
input               matrix_memory_vld_6 ;
input     [31:0]    matrix_memory_data_6;
output              pkt_enable_6;
//
input               matrix_memory_sop_7 ;
input               matrix_memory_eop_7 ;
input               matrix_memory_vld_7 ;
input     [31:0]    matrix_memory_data_7;
output              pkt_enable_7;
//
output  reg  [127:0]   data_write_pcie;
output  reg  [ 14:0]   addr_write_pcie;
output  reg            en_write_pcie;
//
output  reg 		    pcie_read_en;
input 		          pcie_read_done_ack;


/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/
wire      [9:0]     usedw;
wire                full;
wire                empty;
wire                fifo_almost_full;
reg                 f0_fifo_write_en;
reg                 fifo_write_en;
reg       [127:0]   f0_fifo_data_in;
reg       [127:0]   fifo_data_in;

reg                 max_data_num_done;


reg       [127:0]   full_result;
reg 		            full_result_vld_temp;
reg 		            full_result_vld;
reg                 result_all_done;

reg       [14:0 ]   temp_addr_write_pcie;
reg                 fifo_read_vld;

//
reg                 pkt0_sop;
reg                 pkt0_eop;
reg                 pkt0_vld;
reg       [31:0]    pkt0_dat;
wire                pkt0_receive_enable;
wire                result0_fifo_rden;
wire      [127:0]   result0_fifo_rdat;
wire                result0_fifo_empty;
//
reg                 pkt1_sop;
reg                 pkt1_eop;
reg                 pkt1_vld;
reg       [31:0]    pkt1_dat;
wire                pkt1_receive_enable;
wire                result1_fifo_rden;
wire      [127:0]   result1_fifo_rdat;
wire                result1_fifo_empty;
//
reg                 pkt2_sop;
reg                 pkt2_eop;
reg                 pkt2_vld;
reg       [31:0]    pkt2_dat;
wire                pkt2_receive_enable;
wire                result2_fifo_rden;
wire      [127:0]   result2_fifo_rdat;
wire                result2_fifo_empty;
//
reg                 pkt3_sop;
reg                 pkt3_eop;
reg                 pkt3_vld;
reg       [31:0]    pkt3_dat;
wire                pkt3_receive_enable;
wire                result3_fifo_rden;
wire      [127:0]   result3_fifo_rdat;
wire                result3_fifo_empty;
//
reg                 pkt4_sop;
reg                 pkt4_eop;
reg                 pkt4_vld;
reg       [31:0]    pkt4_dat;
wire                pkt4_receive_enable;
wire                result4_fifo_rden;
wire      [127:0]   result4_fifo_rdat;
wire                result4_fifo_empty;
//
reg                 pkt5_sop;
reg                 pkt5_eop;
reg                 pkt5_vld;
reg       [31:0]    pkt5_dat;
wire                pkt5_receive_enable;
wire                result5_fifo_rden;
wire      [127:0]   result5_fifo_rdat;
wire                result5_fifo_empty;
//
reg                 pkt6_sop;
reg                 pkt6_eop;
reg                 pkt6_vld;
reg       [31:0]    pkt6_dat;
wire                pkt6_receive_enable;
wire                result6_fifo_rden;
wire      [127:0]   result6_fifo_rdat;
wire                result6_fifo_empty;
//
reg                 pkt7_sop;
reg                 pkt7_eop;
reg                 pkt7_vld;
reg       [31:0]    pkt7_dat;
wire                pkt7_receive_enable;
wire                result7_fifo_rden;
wire      [127:0]   result7_fifo_rdat;
wire                result7_fifo_empty;
/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/
 

//assign  pkt_enable =  pkt0_receive_enable || pkt1_receive_enable;

assign  pkt_enable_0 = pkt0_receive_enable;

assign  pkt_enable_1 = pkt1_receive_enable;  

assign  pkt_enable_2 = pkt2_receive_enable;

assign  pkt_enable_3 = pkt3_receive_enable;  

assign  pkt_enable_4 = pkt4_receive_enable;

assign  pkt_enable_5 = pkt5_receive_enable;  

assign  pkt_enable_6 = pkt6_receive_enable;

assign  pkt_enable_7 = pkt7_receive_enable;  

//-----------------------------------------------------------------------

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt0_sop <= #D 1'b0;
	end else if (pkt0_receive_enable) begin 
		pkt0_sop <= #D matrix_memory_sop_0;
	end else begin 
		pkt0_sop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt0_eop <= #D 1'b0;
	end else if (pkt0_vld) begin 
		pkt0_eop <= #D matrix_memory_eop_0;
	end else begin 
		pkt0_eop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt0_vld <= #D 1'b0;
	end else if (pkt0_receive_enable && matrix_memory_sop_0) begin 
		pkt0_vld <= #D 1'b1;
	end else if (pkt0_eop) begin 
		pkt0_vld <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt0_dat <= #D 32'd0;
	end else if (pkt0_vld || (matrix_memory_sop_0 && pkt0_receive_enable)) begin 
		pkt0_dat <= #D matrix_memory_data_0;
	end else begin 
		pkt0_dat <= #D 32'd0;
	end
end

//-----------------------------------------------------------------------------------------------------

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt1_sop <= #D 1'b0;
	end else if (pkt1_receive_enable) begin 
		pkt1_sop <= #D matrix_memory_sop_1;
	end else begin 
		pkt1_sop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt1_eop <= #D 1'b0;
	end else if (pkt1_vld) begin 
		pkt1_eop <= #D matrix_memory_eop_1;
	end else begin 
		pkt1_eop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt1_vld <= #D 1'b0;
	end else if (pkt1_receive_enable && matrix_memory_sop_1) begin 
		pkt1_vld <= #D 1'b1;
	end else if (pkt1_eop) begin 
		pkt1_vld <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt1_dat <= #D 32'd0;
	end else if (pkt1_vld || (matrix_memory_sop_1 && pkt1_receive_enable)) begin 
		pkt1_dat <= #D matrix_memory_data_1;
	end else begin 
		pkt1_dat <= #D 32'd0;
	end
end

//-----------------------------------------------------------------------------------------------------

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt2_sop <= #D 1'b0;
	end else if (pkt2_receive_enable) begin 
		pkt2_sop <= #D matrix_memory_sop_2;
	end else begin 
		pkt2_sop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt2_eop <= #D 1'b0;
	end else if (pkt2_vld) begin 
		pkt2_eop <= #D matrix_memory_eop_2;
	end else begin 
		pkt2_eop <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt2_vld <= #D 1'b0;
	end else if (pkt2_receive_enable && matrix_memory_sop_2) begin 
		pkt2_vld <= #D 1'b1;
	end else if (pkt2_eop) begin 
		pkt2_vld <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt2_dat <= #D 32'd0;
	end else if (pkt2_vld || (matrix_memory_sop_2 && pkt2_receive_enable)) begin 
		pkt2_dat <= #D matrix_memory_data_2;
	end else begin 
		pkt2_dat <= #D 32'd0;
	end
end

//-----------------------------------------------------------------------------------------------------

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt3_sop <= #D 1'b0;
	end else if (pkt3_receive_enable) begin 
		pkt3_sop <= #D matrix_memory_sop_3;
	end else begin 
		pkt3_sop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt3_eop <= #D 1'b0;
	end else if (pkt3_vld) begin 
		pkt3_eop <= #D matrix_memory_eop_3;
	end else begin 
		pkt3_eop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt3_vld <= #D 1'b0;
	end else if (pkt3_receive_enable && matrix_memory_sop_3) begin 
		pkt3_vld <= #D 1'b1;
	end else if (pkt3_eop) begin 
		pkt3_vld <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt3_dat <= #D 32'd0;
	end else if (pkt3_vld || (matrix_memory_sop_3 && pkt3_receive_enable)) begin 
		pkt3_dat <= #D matrix_memory_data_3;
	end else begin 
		pkt3_dat <= #D 32'd0;
	end
end

//-----------------------------------------------------------------------------------------------------

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt4_sop <= #D 1'b0;
	end else if (pkt4_receive_enable) begin 
		pkt4_sop <= #D matrix_memory_sop_4;
	end else begin 
		pkt4_sop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt4_eop <= #D 1'b0;
	end else if (pkt4_vld) begin 
		pkt4_eop <= #D matrix_memory_eop_4;
	end else begin 
		pkt4_eop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt4_vld <= #D 1'b0;
	end else if (pkt4_receive_enable && matrix_memory_sop_4) begin 
		pkt4_vld <= #D 1'b1;
	end else if (pkt4_eop) begin 
		pkt4_vld <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt4_dat <= #D 32'd0;
	end else if (pkt4_vld || (matrix_memory_sop_4 && pkt4_receive_enable)) begin 
		pkt4_dat <= #D matrix_memory_data_4;
	end else begin 
		pkt4_dat <= #D 32'd0;
	end
end

//-----------------------------------------------------------------------------------------------------

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt5_sop <= #D 1'b0;
	end else if (pkt5_receive_enable) begin 
		pkt5_sop <= #D matrix_memory_sop_5;
	end else begin 
		pkt5_sop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt5_eop <= #D 1'b0;
	end else if (pkt5_vld) begin 
		pkt5_eop <= #D matrix_memory_eop_5;
	end else begin 
		pkt5_eop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt5_vld <= #D 1'b0;
	end else if (pkt5_receive_enable && matrix_memory_sop_5) begin 
		pkt5_vld <= #D 1'b1;
	end else if (pkt5_eop) begin 
		pkt5_vld <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt5_dat <= #D 32'd0;
	end else if (pkt5_vld || (matrix_memory_sop_5 && pkt5_receive_enable)) begin 
		pkt5_dat <= #D matrix_memory_data_5;
	end else begin 
		pkt5_dat <= #D 32'd0;
	end
end

//-----------------------------------------------------------------------------------------------------

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt6_sop <= #D 1'b0;
	end else if (pkt6_receive_enable) begin 
		pkt6_sop <= #D matrix_memory_sop_6;
	end else begin 
		pkt6_sop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt6_eop <= #D 1'b0;
	end else if (pkt6_vld) begin 
		pkt6_eop <= #D matrix_memory_eop_6;
	end else begin 
		pkt6_eop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt6_vld <= #D 1'b0;
	end else if (pkt6_receive_enable && matrix_memory_sop_6) begin 
		pkt6_vld <= #D 1'b1;
	end else if (pkt6_eop) begin 
		pkt6_vld <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt6_dat <= #D 32'd0;
	end else if (pkt6_vld || (matrix_memory_sop_6 && pkt6_receive_enable)) begin 
		pkt6_dat <= #D matrix_memory_data_6;
	end else begin 
		pkt6_dat <= #D 32'd0;
	end
end

//-----------------------------------------------------------------------------------------------------

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt7_sop <= #D 1'b0;
	end else if (pkt7_receive_enable) begin 
		pkt7_sop <= #D matrix_memory_sop_7;
	end else begin 
		pkt7_sop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt7_eop <= #D 1'b0;
	end else if (pkt7_vld) begin 
		pkt7_eop <= #D matrix_memory_eop_7;
	end else begin 
		pkt7_eop <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt7_vld <= #D 1'b0;
	end else if (pkt7_receive_enable && matrix_memory_sop_7) begin 
		pkt7_vld <= #D 1'b1;
	end else if (pkt7_eop) begin 
		pkt7_vld <= #D 1'b0;
	end
end

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt7_dat <= #D 32'd0;
	end else if (pkt7_vld || (matrix_memory_sop_7 && pkt7_receive_enable)) begin 
		pkt7_dat <= #D matrix_memory_data_7;
	end else begin 
		pkt7_dat <= #D 32'd0;
	end
end




//======================================================================================================

reg [3:0] fifo_select_cont;

always @(posedge core_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		fifo_select_cont <= #D 4'd0;
	end else if (fifo_select_cont == 4'd7) begin 
		fifo_select_cont <= #D 4'd0;
	end else begin 
		fifo_select_cont <= #D fifo_select_cont + 1;
	end
end


assign result0_fifo_rden = (~result0_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd0);

assign result1_fifo_rden = (~result1_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd1);

assign result2_fifo_rden = (~result2_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd2);

assign result3_fifo_rden = (~result3_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd3);

assign result4_fifo_rden = (~result4_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd4);

assign result5_fifo_rden = (~result5_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd5);

assign result6_fifo_rden = (~result6_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd6);

assign result7_fifo_rden = (~result7_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd7);




//assign  f0_fifo_write_en = result0_fifo_rden || result1_fifo_rden || result2_fifo_rden || result3_fifo_rden ||   
//                           result4_fifo_rden || result5_fifo_rden || result6_fifo_rden || result7_fifo_rden; 
//
//
//
//
//assign  f0_fifo_data_in = (result0_fifo_rden)? result0_fifo_rdat : (
//                          (result1_fifo_rden)? result1_fifo_rdat : (
//                          (result2_fifo_rden)? result2_fifo_rdat : (
//                          (result3_fifo_rden)? result3_fifo_rdat : (                          
//                          (result4_fifo_rden)? result4_fifo_rdat : (                          
//                          (result5_fifo_rden)? result5_fifo_rdat : (                          
//                          (result6_fifo_rden)? result6_fifo_rdat : (                          
//                          (result7_fifo_rden)? result7_fifo_rdat : 0)))))));                                    
 

always @(posedge core_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		f0_fifo_write_en <= 1'b0;
	end else begin
		f0_fifo_write_en <= result0_fifo_rden || result1_fifo_rden || result2_fifo_rden || result3_fifo_rden ||   
                          result4_fifo_rden || result5_fifo_rden || result6_fifo_rden || result7_fifo_rden; 
   end 
end


always @(posedge core_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		f0_fifo_data_in <= 128'b0;
	end else if(result0_fifo_rden) begin
		f0_fifo_data_in <= result0_fifo_rdat;
   end else if(result1_fifo_rden) begin
	   f0_fifo_data_in <= result1_fifo_rdat;
   end else if(result2_fifo_rden) begin
	   f0_fifo_data_in <= result2_fifo_rdat; 
   end else if(result3_fifo_rden) begin
	   f0_fifo_data_in <= result3_fifo_rdat; 
   end else if(result4_fifo_rden) begin
	   f0_fifo_data_in <= result4_fifo_rdat; 	
	end else if(result5_fifo_rden) begin
	   f0_fifo_data_in <= result5_fifo_rdat; 	
	end else if(result6_fifo_rden) begin
	   f0_fifo_data_in <= result6_fifo_rdat; 	
	end else if(result7_fifo_rden) begin
	   f0_fifo_data_in <= result7_fifo_rdat; 		
   end else begin
		f0_fifo_data_in <= 128'b0;	
	end 
end 

 
//---------------------------------------------------------------------

wire [127:0] fifo_data_out;
wire         fifo_read_en;



//fifo_1024x128 u_fifo_1024x128 (    
//		.data   (fifo_data_in ), 
//		.wrreq  (fifo_write_en), 
//		.rdreq  (fifo_read_en ), 
//		.clock  (sys_clk      ), 
//		.q      (fifo_data_out),
//		.usedw  (usedw        ), 
//		.full   (full         ), 
//		.empty  (empty        )  
//	);
//
//	
fifo_1024x128 u_fifo_1024x128 (
//write
      .wrclk    (core_clk           ),
		.wrreq    (fifo_write_en      ), 
		.data     (fifo_data_in       ), 
      .wrusedw  (usedw              ),
		.wrfull   (full               ), 		
//read		
      .rdclk    (core_clk           ),		
		.rdreq    (fifo_read_en       ), 
		.q        (fifo_data_out      ),
		.rdempty  (empty              )  
	);	
	
	
reg [31:0]    counter_empty;
reg           en_counter_empty;
reg [14:0]    num_read;
reg           temp_en_write_pcie;
reg           all_done;


assign fifo_almost_full = (usedw >= 10'd1010); 

//==============
(*noprune*) reg [15:0] cont_fifo_almost_full;

always @(posedge core_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n) begin
		cont_fifo_almost_full <= 16'b0;
	end else if (fifo_almost_full) begin
		cont_fifo_almost_full <= cont_fifo_almost_full + 1;
   end 
end

//==============


always @(posedge core_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n)
		en_counter_empty <= 1'b0;
	else if (f0_fifo_write_en)
		en_counter_empty <= 1'b1;
	else if (all_done)
		en_counter_empty <= 1'b0;
end

always @(posedge core_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n)
		counter_empty <= 32'b0;
	else if (f0_fifo_write_en || all_done)
		counter_empty <= 32'b0;
	else if ((!f0_fifo_write_en) && en_counter_empty)
		counter_empty <= counter_empty + 32'b1;
end

always @(posedge core_clk or negedge sys_rst_n)
begin 
	if (!sys_rst_n)
		all_done <= 1'b0;
	else if ((temp_addr_write_pcie == MAX_DATA_NUM - 1) && temp_en_write_pcie && all_done )
		all_done <= 1'b0;
	else if (counter_empty >= MAX_TIME_OUT)
		all_done <= 1'b1;
end

always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
  	fifo_data_in <= 128'b0;
  else if (f0_fifo_write_en)
  	fifo_data_in <= f0_fifo_data_in;
  else if  (all_done)
 	fifo_data_in <= 128'hffffffffffffffffffffffffffffffff;
  else 
 	fifo_data_in <= 128'b0;
end

always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
  	fifo_write_en <= 1'b0;
  else if (f0_fifo_write_en)
  	fifo_write_en <= 1'b1;
  else if (all_done && !fifo_almost_full)
    fifo_write_en <= 1'b1;
  else 
  	fifo_write_en <= 1'b0;
end


always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
  	fifo_read_vld <= 1'b1;
  else if ((num_read == MAX_DATA_NUM - 1) && fifo_read_en)
  	fifo_read_vld <= 1'b0;
  else if (pcie_read_done_ack)
  	fifo_read_vld <= 1'b1;
end



assign fifo_read_en = fifo_read_vld && (!empty);


always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
  	num_read <= 15'b0;
  else if ((num_read == MAX_DATA_NUM - 1) && fifo_read_en)
  	num_read <= 15'b0;
  else if (fifo_read_en)
  	num_read <=num_read + 15'b1;
 end

always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
  	temp_en_write_pcie <= 1'b0;
  else if (fifo_read_en)
  	temp_en_write_pcie <= 1'b1;
  else 
  	temp_en_write_pcie <= 1'b0;
end



always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
  	temp_addr_write_pcie <= 15'b0;
  else if ((temp_addr_write_pcie == MAX_DATA_NUM - 1) && temp_en_write_pcie)
  	temp_addr_write_pcie <= 15'b0;
  else if (temp_en_write_pcie)
  	temp_addr_write_pcie <= temp_addr_write_pcie + 15'b1;
end

always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)
  	max_data_num_done <= 1'b0;
  else if ((temp_addr_write_pcie == MAX_DATA_NUM - 1) && temp_en_write_pcie)
  	max_data_num_done <= 1'b1;
  else 
  	max_data_num_done <= 1'b0;
end



//assign pcie_read_en    = max_data_num_done;
//assign data_write_pcie = fifo_data_out;
//assign addr_write_pcie = temp_addr_write_pcie;
//assign en_write_pcie   = temp_en_write_pcie;


always@(posedge core_clk)
begin
  pcie_read_en <= max_data_num_done;
end

always@(posedge core_clk)
begin
  data_write_pcie <= fifo_data_out;
end

always@(posedge core_clk)
begin
  addr_write_pcie <= temp_addr_write_pcie;
end

always@(posedge core_clk)
begin
  en_write_pcie <= temp_en_write_pcie;
end


//-----------------------------------------------------------------------------------

calculate_channel_3 u0(
   .core_clk              (core_clk            ),
   .sys_clk               (sys_clk             ),
   .sys_rst_n             (sys_rst_n           ),
	 .matrix_memory_sop     (pkt0_sop            ),
	 .matrix_memory_eop     (pkt0_eop            ),
	 .matrix_memory_vld     (pkt0_vld            ),
	 .matrix_memory_data    (pkt0_dat            ), 
   .pkt_enable            (pkt0_receive_enable ), 
   .channel_fifo_rden     (result0_fifo_rden   ),  
   .channel_fifo_rdat     (result0_fifo_rdat   ),  
   .channel_fifo_empty    (result0_fifo_empty  )
);

calculate_channel u1(
   .core_clk              (core_clk            ),
   .sys_clk               (sys_clk             ),
   .sys_rst_n             (sys_rst_n           ),
	 .matrix_memory_sop     (pkt1_sop            ),
	 .matrix_memory_eop     (pkt1_eop            ),
	 .matrix_memory_vld     (pkt1_vld            ),
	 .matrix_memory_data    (pkt1_dat            ), 
   .pkt_enable            (pkt1_receive_enable ), 
   .channel_fifo_rden     (result1_fifo_rden   ),  
   .channel_fifo_rdat     (result1_fifo_rdat   ),  
   .channel_fifo_empty    (result1_fifo_empty  )
);

calculate_channel u2(
   .core_clk              (core_clk            ),
   .sys_clk               (sys_clk             ),
   .sys_rst_n             (sys_rst_n           ),
	 .matrix_memory_sop     (pkt2_sop            ),
	 .matrix_memory_eop     (pkt2_eop            ),
	 .matrix_memory_vld     (pkt2_vld            ),
	 .matrix_memory_data    (pkt2_dat            ), 
   .pkt_enable            (pkt2_receive_enable ), 
   .channel_fifo_rden     (result2_fifo_rden   ),  
   .channel_fifo_rdat     (result2_fifo_rdat   ),  
   .channel_fifo_empty    (result2_fifo_empty  )
);

calculate_channel u3(
   .core_clk              (core_clk            ),
   .sys_clk               (sys_clk             ),
   .sys_rst_n             (sys_rst_n           ),
	 .matrix_memory_sop     (pkt3_sop            ),
	 .matrix_memory_eop     (pkt3_eop            ),
	 .matrix_memory_vld     (pkt3_vld            ),
	 .matrix_memory_data    (pkt3_dat            ), 
   .pkt_enable            (pkt3_receive_enable ), 
   .channel_fifo_rden     (result3_fifo_rden   ),  
   .channel_fifo_rdat     (result3_fifo_rdat   ),  
   .channel_fifo_empty    (result3_fifo_empty  )
);


calculate_channel u4(
   .core_clk              (core_clk            ),
   .sys_clk               (sys_clk             ),
   .sys_rst_n             (sys_rst_n           ),
	 .matrix_memory_sop     (pkt4_sop            ),
	 .matrix_memory_eop     (pkt4_eop            ),
	 .matrix_memory_vld     (pkt4_vld            ),
	 .matrix_memory_data    (pkt4_dat            ), 
   .pkt_enable            (pkt4_receive_enable ), 
   .channel_fifo_rden     (result4_fifo_rden   ),  
   .channel_fifo_rdat     (result4_fifo_rdat   ),  
   .channel_fifo_empty    (result4_fifo_empty  )
);

calculate_channel u5(
   .core_clk              (core_clk            ),   
	.sys_clk               (sys_clk             ),
   .sys_rst_n             (sys_rst_n           ),
	 .matrix_memory_sop     (pkt5_sop            ),
	 .matrix_memory_eop     (pkt5_eop            ),
	 .matrix_memory_vld     (pkt5_vld            ),
	 .matrix_memory_data    (pkt5_dat            ), 
   .pkt_enable            (pkt5_receive_enable ), 
   .channel_fifo_rden     (result5_fifo_rden   ),  
   .channel_fifo_rdat     (result5_fifo_rdat   ),  
   .channel_fifo_empty    (result5_fifo_empty  )
);

calculate_channel u6(
   .core_clk              (core_clk            ),  
  .sys_clk               (sys_clk             ),
   .sys_rst_n             (sys_rst_n           ),
	 .matrix_memory_sop     (pkt6_sop            ),
	 .matrix_memory_eop     (pkt6_eop            ),
	 .matrix_memory_vld     (pkt6_vld            ),
	 .matrix_memory_data    (pkt6_dat            ), 
   .pkt_enable            (pkt6_receive_enable ), 
   .channel_fifo_rden     (result6_fifo_rden   ),  
   .channel_fifo_rdat     (result6_fifo_rdat   ),  
   .channel_fifo_empty    (result6_fifo_empty  )
);

calculate_channel u7(
   .core_clk              (core_clk            ),
   .sys_clk               (sys_clk             ),
   .sys_rst_n             (sys_rst_n           ),
	 .matrix_memory_sop     (pkt7_sop            ),
	 .matrix_memory_eop     (pkt7_eop            ),
	 .matrix_memory_vld     (pkt7_vld            ),
	 .matrix_memory_data    (pkt7_dat            ), 
   .pkt_enable            (pkt7_receive_enable ), 
   .channel_fifo_rden     (result7_fifo_rden   ),  
   .channel_fifo_rdat     (result7_fifo_rdat   ),  
   .channel_fifo_empty    (result7_fifo_empty  )
);
//===============================================================

//(*noprune*) reg [31:0]  sop_cont;
//(*noprune*) reg [31:0]  fifo_in_cont;
//(*noprune*) reg [31:0]  fifo_out_cont;

//always @(posedge sys_clk or negedge sys_rst_n) 
//begin
//	if (!sys_rst_n) begin
//      sop_cont <=#D 32'd0;
//	end else if (matrix_memory_sop_0 || matrix_memory_sop_1 || matrix_memory_sop_2 || matrix_memory_sop_3 ||
//	             matrix_memory_sop_4 || matrix_memory_sop_5 || matrix_memory_sop_6 || matrix_memory_sop_7 )begin
//      sop_cont <=#D sop_cont + 1;
//	end 
//end 
//
//
//always @(posedge sys_clk or negedge sys_rst_n) 
//begin
//	if (!sys_rst_n) begin
//      fifo_in_cont <=#D 32'd0;
//	end else if (fifo_write_en) begin
//      fifo_in_cont <=#D fifo_in_cont + 1;
//	end 
//end
//
//always @(posedge sys_clk or negedge sys_rst_n) 
//begin
//	if (!sys_rst_n) begin
//      fifo_out_cont <=#D 32'd0;
//	end else if (fifo_read_en) begin
//      fifo_out_cont <=#D fifo_out_cont + 1;
//	end 
//end


endmodule 


