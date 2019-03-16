

/*********************************************************************
//  Author:    cz
//  Filename:  matrix_9
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
//  2017-12-7        cz             initial version
//
**********************************************************************/
`timescale 1ns/1ps 

module matrix_4 (
	//input
	core_clk,
	sys_clk           ,
	sys_rst_n           ,
	matrix_memory_sop ,
	matrix_memory_eop ,
	matrix_memory_vld ,
	matrix_memory_data,
	result_fifo_rden  ,
	//output
	pkt_receive_enable,
	result_fifo_rdat,
	result_fifo_empty
	
);
/*-------------------------------------------------------------------*\
                          Parameter Description
\*-------------------------------------------------------------------*/
parameter MAX_DATA_NUM = 10240;
parameter MAX_TIME_OUT = 32'd30000000;
parameter ADDR_MOVE    = 14'h0;//14'h2800;

parameter MAX_ADDR = 8'd113;
parameter S0 = 8'b00000001;
parameter S1 = 8'b00000010;
parameter S2 = 8'b00000100;
parameter S3 = 8'b00001000;
parameter S4 = 8'b00010000;
parameter S5 = 8'b00100000;
parameter S6 = 8'b01000000;
parameter S7 = 8'b10000000;


localparam IDLE = 2'b00;
localparam JUMP = 2'b01;
localparam READ = 2'b10;

/*-------------------------------------------------------------------*\
                          Reg/wire Description
\*-------------------------------------------------------------------*/
input  wire        core_clk;
input  wire        sys_clk           ;
input  wire        sys_rst_n           ;
input  wire        matrix_memory_sop ;
input  wire        matrix_memory_eop ;
input  wire        matrix_memory_vld ;
input  wire [31:0] matrix_memory_data;
input  wire        result_fifo_rden  ;
//outpuwire ;
output wire       	pkt_receive_enable;
output wire 	[127:0] result_fifo_rdat;
output wire 		result_fifo_empty;





reg [31:0] matrix_memory_data_0;
reg        matrix_memory_sop_0 ;
reg        matrix_memory_eop_0 ;
reg        matrix_memory_vld_0 ;

reg [31:0] matrix_memory_data_1;
reg matrix_memory_sop_1;
reg matrix_memory_eop_1;
reg matrix_memory_vld_1;

reg [31:0] matrix_memory_data_2;
reg matrix_memory_sop_2;
reg matrix_memory_eop_2;
reg matrix_memory_vld_2;

reg [31:0] matrix_memory_data_3;
reg matrix_memory_sop_3;
reg matrix_memory_eop_3;
reg matrix_memory_vld_3;

wire [3:0] save_send_enable;
wire fifo_almost_full;

reg [7:0] current_state;
reg [7:0] next_state;



reg temp_enable1;
reg temp_enable2;

assign pkt_receive_enable = temp_enable1 & temp_enable2;


always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin
  	temp_enable1 <= 1'b0;
  end else if ((save_send_enable & current_state) != 4'b0) begin 
  	temp_enable1 <= 1'b1;
  end else begin
  	temp_enable1 <= 1'b0;
  end
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if(~sys_rst_n) begin
		temp_enable2 <= 1'b0;
	end else if (fifo_almost_full && matrix_memory_sop ) begin
		temp_enable2 <= 1'b0;
	end else if (!fifo_almost_full)
		temp_enable2 <= 1'b1;
end




always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin 
    current_state <= S0 ;
  end else begin 
    current_state <= next_state;
  end 
end 



always @(*)
begin 
  next_state = current_state;
  case (current_state)
    S0 :begin 
           if ((!save_send_enable[0]) & (matrix_memory_vld_0 != 1)) begin
          		next_state = S1; 
        end
    end

    S1 :begin 
           	if ((!save_send_enable[1]) & (matrix_memory_vld_1 != 1)) begin
          		next_state = S2; 
        end
    end

    S2 :begin 
          	if ((!save_send_enable[2]) & (matrix_memory_vld_2 != 1)) begin
          		next_state = S3; 
        end
    end

    S3 :begin 
          	if ((!save_send_enable[3]) & (matrix_memory_vld_3 != 1)) begin
          		next_state = S0; 
          end
      end
  endcase // current_state
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin
    matrix_memory_sop_0 <= 1'b0;
    matrix_memory_eop_0 <= 1'b0;
    matrix_memory_vld_0 <= 1'b0;
    matrix_memory_data_0<= 32'd0;
  end else if (current_state == S0) begin 
    matrix_memory_sop_0 <= matrix_memory_sop;
    matrix_memory_eop_0 <= matrix_memory_eop;
    matrix_memory_vld_0 <= matrix_memory_vld;
    matrix_memory_data_0<= matrix_memory_data;
  end else begin 
    matrix_memory_sop_0 <= 1'b0;
    matrix_memory_eop_0 <= 1'b0;
    matrix_memory_vld_0 <= 1'b0;
    matrix_memory_data_0<= 32'd0;
  end
end


always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin
    matrix_memory_sop_1 <= 1'b0;
    matrix_memory_eop_1 <= 1'b0;
    matrix_memory_vld_1 <= 1'b0;
    matrix_memory_data_1<= 32'd0;
  end else if (current_state == S1) begin 
    matrix_memory_sop_1 <= matrix_memory_sop;
    matrix_memory_eop_1 <= matrix_memory_eop;
    matrix_memory_vld_1 <= matrix_memory_vld;
    matrix_memory_data_1<= matrix_memory_data;
  end else begin 
    matrix_memory_sop_1 <= 1'b0;
    matrix_memory_eop_1 <= 1'b0;
    matrix_memory_vld_1 <= 1'b0;
    matrix_memory_data_1<= 32'd0;
  end
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin
    matrix_memory_sop_2 <= 1'b0;
    matrix_memory_eop_2 <= 1'b0;
    matrix_memory_vld_2 <= 1'b0;
    matrix_memory_data_2<= 32'd0;
  end else if (current_state == S2) begin 
    matrix_memory_sop_2 <= matrix_memory_sop;
    matrix_memory_eop_2 <= matrix_memory_eop;
    matrix_memory_vld_2 <= matrix_memory_vld;
    matrix_memory_data_2<= matrix_memory_data;
  end else begin 
    matrix_memory_sop_2 <= 1'b0;
    matrix_memory_eop_2 <= 1'b0;
    matrix_memory_vld_2 <= 1'b0;
    matrix_memory_data_2<= 32'd0;
  end
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin
    matrix_memory_sop_3 <= 1'b0;
    matrix_memory_eop_3 <= 1'b0;
    matrix_memory_vld_3 <= 1'b0;
    matrix_memory_data_3<= 32'd0;
  end else if (current_state == S3) begin 
    matrix_memory_sop_3 <= matrix_memory_sop;
    matrix_memory_eop_3 <= matrix_memory_eop;
    matrix_memory_vld_3 <= matrix_memory_vld;
    matrix_memory_data_3<= matrix_memory_data;
  end else begin 
    matrix_memory_sop_3 <= 1'b0;
    matrix_memory_eop_3 <= 1'b0;
    matrix_memory_vld_3 <= 1'b0;
    matrix_memory_data_3<= 32'd0;
  end
end

//============================================================
reg [1:0] fifo_select_cont;
always @(posedge sys_clk  or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		fifo_select_cont <=  2'd0;
	end else begin 
		fifo_select_cont <=  fifo_select_cont + 1;
	end
end



wire  result0_fifo_rden;
wire  result1_fifo_rden;
wire  result2_fifo_rden;
wire  result3_fifo_rden;

wire [127:0] result0_fifo_rdat;
wire [127:0] result1_fifo_rdat;
wire [127:0] result2_fifo_rdat;
wire [127:0] result3_fifo_rdat;

wire  result0_fifo_empty;
wire  result1_fifo_empty;
wire  result2_fifo_empty;
wire  result3_fifo_empty;

assign result0_fifo_rden = (~result0_fifo_empty && ~fifo_almost_full && fifo_select_cont == 2'd0); 

assign result1_fifo_rden = (~result1_fifo_empty && ~fifo_almost_full && fifo_select_cont == 2'd1); 

assign result2_fifo_rden = (~result2_fifo_empty && ~fifo_almost_full && fifo_select_cont == 2'd2); 

assign result3_fifo_rden = (~result3_fifo_empty && ~fifo_almost_full && fifo_select_cont == 2'd3); 

//==========================================================================
wire         f0_fifo_write_en;
wire [127:0] f0_fifo_data_in ;

reg  [127:0] fifo_data_in ;
wire [127:0] fifo_data_out;
wire [  8:0] usedw        ;
reg          fifo_write_en;
wire         full         ;


assign f0_fifo_write_en = result0_fifo_rden || result1_fifo_rden || result2_fifo_rden || result3_fifo_rden;

assign f0_fifo_data_in = (result0_fifo_rden)? result0_fifo_rdat :(
						 (result1_fifo_rden)? result1_fifo_rdat :
						 (result2_fifo_rden)? result2_fifo_rdat :
						 (result3_fifo_rden)? result3_fifo_rdat :0);

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    fifo_write_en <= 1'b0;
  end else begin
    fifo_write_en <= f0_fifo_write_en;
  end
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    fifo_data_in <= 128'd0;
  end else begin
    fifo_data_in <= f0_fifo_data_in;
  end
end


fifo_512x128 matrix_4_fifo (
		.data   (fifo_data_in ), 
		.wrreq  (fifo_write_en), 
		.wrusedw  (usedw        ), 
		.wrfull   (full         ), 
		.wrclk  (sys_clk      ), 

		.rdclk  (core_clk),
		.q      (result_fifo_rdat),
		.rdreq  (result_fifo_rden ),
		.rdempty  (result_fifo_empty)  
	);

assign fifo_almost_full = (usedw >= 9'd500);




save_send s0(
  //input
  .sys_clk (sys_clk)          ,
  .sys_rst_n(sys_rst_n)         ,
  .matrix_memory_sop(matrix_memory_sop_0) ,
  .matrix_memory_eop(matrix_memory_eop_0) ,
  .matrix_memory_vld(matrix_memory_vld_0) ,
  .matrix_memory_data(matrix_memory_data_0),
  .result_fifo_rden(result0_fifo_rden)  ,
  //output
  .pkt_receive_enable(save_send_enable[0]),
  .result_fifo_rdat(result0_fifo_rdat)  ,
  .result_fifo_empty(result0_fifo_empty) 
);

save_send s1(
  //input
  .sys_clk (sys_clk)          ,
  .sys_rst_n(sys_rst_n)         ,
  .matrix_memory_sop(matrix_memory_sop_1) ,
  .matrix_memory_eop(matrix_memory_eop_1) ,
  .matrix_memory_vld(matrix_memory_vld_1) ,
  .matrix_memory_data(matrix_memory_data_1),
  .result_fifo_rden(result1_fifo_rden)  ,
  //output
  .pkt_receive_enable(save_send_enable[1]),
  .result_fifo_rdat(result1_fifo_rdat)  ,
  .result_fifo_empty(result1_fifo_empty) 
);

save_send s2(
  //input
  .sys_clk (sys_clk)          ,
  .sys_rst_n(sys_rst_n)         ,
  .matrix_memory_sop(matrix_memory_sop_2) ,
  .matrix_memory_eop(matrix_memory_eop_2) ,
  .matrix_memory_vld(matrix_memory_vld_2) ,
  .matrix_memory_data(matrix_memory_data_2),
  .result_fifo_rden(result2_fifo_rden)  ,
  //output
  .pkt_receive_enable(save_send_enable[2]),
  .result_fifo_rdat(result2_fifo_rdat)  ,
  .result_fifo_empty(result2_fifo_empty) 
);

save_send s3(
  //input
  .sys_clk (sys_clk)          ,
  .sys_rst_n(sys_rst_n)         ,
  .matrix_memory_sop(matrix_memory_sop_3) ,
  .matrix_memory_eop(matrix_memory_eop_3) ,
  .matrix_memory_vld(matrix_memory_vld_3) ,
  .matrix_memory_data(matrix_memory_data_3),
  .result_fifo_rden(result3_fifo_rden)  ,
  //output
  .pkt_receive_enable(save_send_enable[3]),
  .result_fifo_rdat(result3_fifo_rdat)  ,
  .result_fifo_empty(result3_fifo_empty) 
);

//===========================================================================

(*noprune*) reg [31:0]  sop_cont;
// (*noprune*) reg [31:0]  fifo_in_cont;
// (*noprune*) reg [31:0]  fifo_out_cont;

always @(posedge sys_clk or negedge sys_rst_n) 
begin
	if (!sys_rst_n) begin
      sop_cont <= 32'd0;
	end else if (matrix_memory_sop) begin
      sop_cont <= sop_cont + 1;
	end 
end 


// always @(posedge sys_clk or negedge sys_rst_n) 
// begin
// 	if (!sys_rst_n) begin
//       fifo_in_cont <= 32'd0;
// 	end else if (fifo_write_en) begin
//       fifo_in_cont <= fifo_in_cont + 1;
// 	end 
// end

// always @(posedge sys_clk or negedge sys_rst_n) 
// begin
// 	if (!sys_rst_n) begin
//       fifo_out_cont <= 32'd0;
// 	end else if (result_fifo_rden) begin
//       fifo_out_cont <= fifo_out_cont + 1;
// 	end 
// end





endmodule 