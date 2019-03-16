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
module matrix_ctl (
sys_clk,
sys_rst_n,

matrix_memory_sop,
matrix_memory_eop,
matrix_memory_vld,
matrix_memory_data,

pkt_enable, 
matrix_ctl_fifo_rden,  
matrix_ctl_fifo_rdat,  
matrix_ctl_fifo_empty

);


/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter  D  =  0.2;


//parameter MAX_TIME_OUT = 32'd500000000;
//parameter MAX_DATA_NUM = 14'd10240;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
//global signal
input               sys_clk;
input               sys_rst_n;
//
input               matrix_memory_sop ;
input               matrix_memory_eop ;
input               matrix_memory_vld ;
input     [31:0]    matrix_memory_data;
output              pkt_enable;
//
input               matrix_ctl_fifo_rden;  
output    [127:0]   matrix_ctl_fifo_rdat;  
output              matrix_ctl_fifo_empty;


/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/
wire      [8:0]    usedw;
wire                full;
wire                empty;
wire                fifo_almost_full;
wire                f0_fifo_write_en;
reg                 fifo_write_en;
wire      [127:0]   f0_fifo_data_in;
reg       [127:0]   fifo_data_in;


reg       [2:0]     shift_reg_in;
reg                 pkt_receive_enable;


reg                 pkt0_sop;
reg                 pkt0_eop;
reg                 pkt0_vld;
reg       [31:0]    pkt0_dat;
wire                pkt0_receive_enable;
wire                result0_fifo_rden;
wire      [127:0]   result0_fifo_rdat;
wire                result0_fifo_empty;

reg                 pkt1_sop;
reg                 pkt1_eop;
reg                 pkt1_vld;
reg       [31:0]    pkt1_dat;
wire                pkt1_receive_enable;
wire                result1_fifo_rden;
wire      [127:0]   result1_fifo_rdat;
wire                result1_fifo_empty;

reg                 pkt2_sop;
reg                 pkt2_eop;
reg                 pkt2_vld;
reg       [31:0]    pkt2_dat;
wire                pkt2_receive_enable;
wire                result2_fifo_rden;
wire      [127:0]   result2_fifo_rdat;
wire                result2_fifo_empty;

reg                 pkt3_sop;
reg                 pkt3_eop;
reg                 pkt3_vld;
reg       [31:0]    pkt3_dat;
wire                pkt3_receive_enable;
wire                result3_fifo_rden;
wire      [127:0]   result3_fifo_rdat;
wire                result3_fifo_empty;

//reg                 pkt4_sop;
//reg                 pkt4_eop;
//reg                 pkt4_vld;
//reg       [31:0]    pkt4_dat;
//wire                pkt4_receive_enable;
//wire                result4_fifo_rden;
//wire      [127:0]   result4_fifo_rdat;
//wire                result4_fifo_empty;

/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/
 

assign  pkt_enable =  pkt0_receive_enable || pkt1_receive_enable || pkt2_receive_enable || pkt3_receive_enable;// || pkt4_receive_enable;



always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt0_sop <= #D 1'b0;
	end else if (pkt0_receive_enable) begin 
		pkt0_sop <= #D matrix_memory_sop;
	end else begin 
		pkt0_sop <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt0_eop <= #D 1'b0;
	end else if (pkt0_vld) begin 
		pkt0_eop <= #D matrix_memory_eop;
	end else begin 
		pkt0_eop <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt0_vld <= #D 1'b0;
	end else if (pkt0_receive_enable && matrix_memory_sop) begin 
		pkt0_vld <= #D 1'b1;
	end else if (pkt0_eop) begin 
		pkt0_vld <= #D 1'b0;
	end
end



always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt0_dat <= #D 32'd0;
	end else if (pkt0_vld || (matrix_memory_sop && pkt0_receive_enable)) begin 
		pkt0_dat <= #D matrix_memory_data;
	end else begin 
		pkt0_dat <= #D 32'd0;
	end
end

//-----------



always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt1_sop <= #D 1'b0;
	end else if (~pkt0_receive_enable && pkt1_receive_enable) begin 
		pkt1_sop <= #D matrix_memory_sop;
	end else begin 
		pkt1_sop <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt1_eop <= #D 1'b0;
	end else if (pkt1_vld) begin 
		pkt1_eop <= #D matrix_memory_eop;
	end else begin 
		pkt1_eop <= #D 1'b0;
	end
end



always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt1_vld <= #D 1'b0;
	end else if (~pkt0_receive_enable && pkt1_receive_enable && matrix_memory_sop) begin 
		pkt1_vld <= #D 1'b1;
	end else if (pkt1_eop) begin 
		pkt1_vld <= #D 1'b0;
	end
end



always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt1_dat <= #D 32'd0;
	end else if (pkt1_vld || (matrix_memory_sop && pkt1_receive_enable)) begin 
		pkt1_dat <= #D matrix_memory_data;
	end else begin 
		pkt1_dat <= #D 32'd0;
	end
end
//////
////////----------
//////
//////
//////
always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt2_sop <= #D 1'b0;
	end else if (~pkt0_receive_enable && ~pkt1_receive_enable && pkt2_receive_enable) begin 
		pkt2_sop <= #D matrix_memory_sop;
	end else begin 
		pkt2_sop <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt2_eop <= #D 1'b0;
	end else if (pkt2_vld) begin 
		pkt2_eop <= #D matrix_memory_eop;
	end else begin 
		pkt2_eop <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt2_vld <= #D 1'b0;
	end else if (~pkt0_receive_enable && ~pkt1_receive_enable && pkt2_receive_enable && matrix_memory_sop) begin 
		pkt2_vld <= #D 1'b1;
	end else if (pkt2_eop) begin 
		pkt2_vld <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt2_dat <= #D 32'd0;
	end else if (pkt2_vld || (matrix_memory_sop && pkt2_receive_enable)) begin 
		pkt2_dat <= #D matrix_memory_data;
	end else begin 
		pkt2_dat <= #D 32'd0;
	end
end
//////// 
//////////-----------------------------------------------------------------------------------
////////
////
always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt3_sop <= #D 1'b0;
	end else if (~pkt0_receive_enable && ~pkt1_receive_enable && ~pkt2_receive_enable && pkt3_receive_enable) begin 
		pkt3_sop <= #D matrix_memory_sop;
	end else begin 
		pkt3_sop <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt3_eop <= #D 1'b0;
	end else if (pkt3_vld) begin 
		pkt3_eop <= #D matrix_memory_eop;
	end else begin 
		pkt3_eop <= #D 1'b0;
	end
end


always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt3_vld <= #D 1'b0;
	end else if (~pkt0_receive_enable && ~pkt1_receive_enable && ~pkt2_receive_enable && pkt3_receive_enable && matrix_memory_sop) begin 
		pkt3_vld <= #D 1'b1;
	end else if (pkt3_eop) begin 
		pkt3_vld <= #D 1'b0;
	end
end



always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		pkt3_dat <= #D 32'd0;
	end else if (pkt3_vld || (matrix_memory_sop && pkt3_receive_enable)) begin 
		pkt3_dat <= #D matrix_memory_data;
	end else begin 
		pkt3_dat <= #D 32'd0;
	end
end


//----------------------------------------------------------------------------------
//always @(posedge sys_clk  or negedge sys_rst_n) 
//begin 
//	if (!sys_rst_n) begin 
//		pkt4_sop <= #D 1'b0;
//	end else if (~pkt0_receive_enable && ~pkt1_receive_enable && ~pkt2_receive_enable && ~pkt3_receive_enable && pkt4_receive_enable) begin 
//		pkt4_sop <= #D matrix_memory_sop;
//	end else begin 
//		pkt4_sop <= #D 1'b0;
//	end
//end
//
//
//always @(posedge sys_clk  or negedge sys_rst_n) 
//begin 
//	if (!sys_rst_n) begin 
//		pkt4_eop <= #D 1'b0;
//	end else if (pkt4_vld) begin 
//		pkt4_eop <= #D matrix_memory_eop;
//	end else begin 
//		pkt4_eop <= #D 1'b0;
//	end
//end
//
//
//always @(posedge sys_clk  or negedge sys_rst_n) 
//begin 
//	if (!sys_rst_n) begin 
//		pkt4_vld <= #D 1'b0;
//	end else if (~pkt0_receive_enable && ~pkt1_receive_enable && ~pkt2_receive_enable && ~pkt3_receive_enable && pkt4_receive_enable && matrix_memory_sop) begin 
//		pkt4_vld <= #D 1'b1;
//	end else if (pkt4_eop) begin 
//		pkt4_vld <= #D 1'b0;
//	end
//end
//
//
//
//always @(posedge sys_clk  or negedge sys_rst_n) 
//begin 
//	if (!sys_rst_n) begin 
//		pkt4_dat <= #D 32'd0;
//	end else if (pkt4_vld || (matrix_memory_sop && pkt4_receive_enable)) begin 
//		pkt4_dat <= #D matrix_memory_data;
//	end else begin 
//		pkt4_dat <= #D 32'd0;
//	end
//end

//-----------------------------------------------------------------------------------
reg [3:0] fifo_select_cont;

always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		fifo_select_cont <= #D 4'd0;
	end else if (fifo_select_cont == 4'd3) begin 
		fifo_select_cont <= #D 4'd0;
	end else begin 
		fifo_select_cont <= #D fifo_select_cont + 1;
	end
end




assign result0_fifo_rden = (~result0_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd0);


assign result1_fifo_rden = (~result1_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd1);
//
//
assign result2_fifo_rden = (~result2_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd2);
//
//
assign result3_fifo_rden = (~result3_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd3);


//assign result4_fifo_rden = (~result4_fifo_empty && ~fifo_almost_full && fifo_select_cont==4'd4);

//---------------------------------------------------------------------------------------


assign  f0_fifo_write_en = result0_fifo_rden || result1_fifo_rden || result2_fifo_rden || result3_fifo_rden;// || result4_fifo_rden;

//assign  f0_fifo_data_in = (result0_fifo_rden)? result0_fifo_rdat : (
//                          (result1_fifo_rden)? result1_fifo_rdat : (
//                          (result2_fifo_rden)? result2_fifo_rdat : (
//                          (result3_fifo_rden)? result3_fifo_rdat : (
//                          (result4_fifo_rden)? result4_fifo_rdat : 0 ))));

assign  f0_fifo_data_in = (result0_fifo_rden)? result0_fifo_rdat : (
                          (result1_fifo_rden)? result1_fifo_rdat : (
                          (result2_fifo_rden)? result2_fifo_rdat : (
                          (result3_fifo_rden)? result3_fifo_rdat : 0)));


                        
                         
always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    fifo_write_en <=#D 1'b0;
  end else begin
    fifo_write_en <=#D f0_fifo_write_en;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    fifo_data_in <=#D 128'd0;
  end else begin
    fifo_data_in <=#D f0_fifo_data_in;
  end
end
 
wire [127:0] fifo_data_out;
//---------------------------------------------------------------------

fifo_512x128 matrix_ctl_fifo (                  
		.data   (fifo_data_in         ), 
		.wrreq  (fifo_write_en        ), 
		.rdreq  (matrix_ctl_fifo_rden ), 
		.clock  (sys_clk              ), 
		.q      (matrix_ctl_fifo_rdat ),
		.usedw  (usedw                ), 
		.full   (full                 ), 
		.empty  (empty                )  
	);

//----------------------------------------------------------------------

assign fifo_almost_full = (usedw >= 9'd500);  //6'd58

assign matrix_ctl_fifo_empty = empty;

//-----------------------------------------------------------------------------------

matrix_12 u_0 (
	.sys_clk             (sys_clk             ),
	.sys_rst_n             (sys_rst_n           ),
	.matrix_memory_sop   (pkt0_sop            ),
	.matrix_memory_eop   (pkt0_eop            ),
	.matrix_memory_vld   (pkt0_vld            ),
	.matrix_memory_data  (pkt0_dat            ), 
	//
	.pkt_receive_enable  (pkt0_receive_enable ),   
	.result_fifo_rden    (result0_fifo_rden   ), 
	.result_fifo_rdat    (result0_fifo_rdat   ),
   .result_fifo_empty   (result0_fifo_empty  )
); 


matrix_12 u_1 (
	.sys_clk             (sys_clk             ),
	.sys_rst_n             (sys_rst_n           ),
	.matrix_memory_sop   (pkt1_sop            ),
	.matrix_memory_eop   (pkt1_eop            ),
	.matrix_memory_vld   (pkt1_vld            ),
	.matrix_memory_data  (pkt1_dat            ), 
	//
	.pkt_receive_enable  (pkt1_receive_enable ),   
	.result_fifo_rden    (result1_fifo_rden   ), 
	.result_fifo_rdat    (result1_fifo_rdat   ),
   .result_fifo_empty   (result1_fifo_empty  )
); 
//
//
matrix_12 u_2 (
	.sys_clk             (sys_clk             ),
	.sys_rst_n             (sys_rst_n           ),
	.matrix_memory_sop   (pkt2_sop            ),
	.matrix_memory_eop   (pkt2_eop            ),
	.matrix_memory_vld   (pkt2_vld            ),
	.matrix_memory_data  (pkt2_dat            ), 
	//
	.pkt_receive_enable  (pkt2_receive_enable ),   
	.result_fifo_rden    (result2_fifo_rden   ), 
	.result_fifo_rdat    (result2_fifo_rdat   ),
   .result_fifo_empty   (result2_fifo_empty   )
); 
//
matrix_12 u_3 (
	.sys_clk             (sys_clk             ),
	.sys_rst_n             (sys_rst_n           ),
	.matrix_memory_sop   (pkt3_sop            ),
	.matrix_memory_eop   (pkt3_eop            ),
	.matrix_memory_vld   (pkt3_vld            ),
	.matrix_memory_data  (pkt3_dat            ), 
	//
	.pkt_receive_enable  (pkt3_receive_enable ),   
	.result_fifo_rden    (result3_fifo_rden   ), 
	.result_fifo_rdat    (result3_fifo_rdat   ),
   .result_fifo_empty   (result3_fifo_empty  )
); 


//matrix_12 u_4 (
//	.sys_clk             (sys_clk             ),
//	.sys_rst_n             (sys_rst_n           ),
//	.matrix_memory_sop   (pkt4_sop            ),
//	.matrix_memory_eop   (pkt4_eop            ),
//	.matrix_memory_vld   (pkt4_vld            ),
//	.matrix_memory_data  (pkt4_dat            ), 
//	//
//	.pkt_receive_enable  (pkt4_receive_enable ),   
//	.result_fifo_rden    (result4_fifo_rden   ), 
//	.result_fifo_rdat    (result4_fifo_rdat   ),
//   .result_fifo_empty   (result4_fifo_empty  )
//); 
//===============================================================



(*noprune*) reg [31:0]  sop_cont;
(*noprune*) reg [31:0]  fifo_in_cont;
(*noprune*) reg [31:0]  fifo_out_cont;

always @(posedge sys_clk or negedge sys_rst_n) 
begin
	if (!sys_rst_n) begin
      sop_cont <=#D 32'd0;
	end else if (matrix_memory_sop) begin
      sop_cont <=#D sop_cont + 1;
	end 
end 


always @(posedge sys_clk or negedge sys_rst_n) 
begin
	if (!sys_rst_n) begin
      fifo_in_cont <=#D 32'd0;
	end else if (fifo_write_en) begin
      fifo_in_cont <=#D fifo_in_cont + 1;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin
	if (!sys_rst_n) begin
      fifo_out_cont <=#D 32'd0;
	end else if (matrix_ctl_fifo_rden) begin
      fifo_out_cont <=#D fifo_out_cont + 1;
	end 
end


//=================================================================
endmodule 