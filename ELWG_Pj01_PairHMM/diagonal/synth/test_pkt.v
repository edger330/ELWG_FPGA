/*********************************************************************
//  Author:    jyb
//  Filename:  
//  Modified:
//  Version:   1.0
//
//  Description:
//
//  Copyright (c) 2017 Test.
//
//  All Rights Reserved.
//
//
// -------------------------------------------------------------------
//  Modification History:
//
//  Date                  Who            Description of change
//  ------------------------------------------------------------------
//  2017-05-22            jyb            initial version
//
**********************************************************************/
`timescale 1ns/1ps


module test_pkt(
//input
sys_clk,sys_rst_n,
//output
result_fifo_rdat
);
parameter MAX_ADDR = 8'd113;

localparam S_0  = 8'b00000001;
localparam S_1  = 8'b00000010;
localparam S_2  = 8'b00000100;
localparam S_3  = 8'b00001000;
localparam S_4  = 8'b00010000;
localparam S_5  = 8'b00100000;
localparam S_6  = 8'b01000000;
localparam S_7  = 8'b10000000;


input sys_clk;
input sys_rst_n;

output [31:0] result_fifo_rdat;

reg [7:0] rom_addr;
reg rom_rden;
reg rom_rden_reg;
reg rom_rden_flag;

wire[35:0] rom_q;

wire [7:0] pkt_receive_enable;

wire result_fifo_empty;
wire [127:0] result_fifo_rdat;

reg [31:0] matrix_memory_data_0;
reg matrix_memory_sop_0;
reg matrix_memory_eop_0;
reg matrix_memory_vld_0;

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

reg [31:0] matrix_memory_data_4;
reg matrix_memory_sop_4;
reg matrix_memory_eop_4;
reg matrix_memory_vld_4;

reg [31:0] matrix_memory_data_5;
reg matrix_memory_sop_5;
reg matrix_memory_eop_5;
reg matrix_memory_vld_5;

reg [31:0] matrix_memory_data_6;
reg matrix_memory_sop_6;
reg matrix_memory_eop_6;
reg matrix_memory_vld_6;

reg [31:0] matrix_memory_data_7;
reg matrix_memory_sop_7;
reg matrix_memory_eop_7;
reg matrix_memory_vld_7;

// reg [31:0] matrix_memory_data;
// reg matrix_memory_sop;
// reg matrix_memory_eop;
// reg matrix_memory_vld;

reg [7:0] state_cur;
reg [7:0] state_next;


always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin 
    rom_rden_flag <= 1'b0;
    rom_rden_reg <= 1'b0;
  end else begin
  	rom_rden_reg <= rom_rden; 
    rom_rden_flag <= rom_rden_reg;
  end
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin 
    state_cur <= S_7;
  end else begin 
    state_cur <= state_next;
  end
end

always @(*) begin
  if (!sys_rst_n) begin 
    state_next <= state_cur;
  end
  else begin 
	  case(state_cur)
	    S_0 :
	      if ((!pkt_receive_enable[0]) && (!rom_rden_flag)) begin
	        state_next = S_1; 
	      end
	    S_1 :
	      if ((!pkt_receive_enable[1]) && (!rom_rden_flag)) begin
	        state_next = S_2; 
	      end
	    S_2 :
	      if ((!pkt_receive_enable[2]) && (!rom_rden_flag)) begin
	        state_next = S_3; 
	      end
	    S_3 :
	      if ((!pkt_receive_enable[3]) && (!rom_rden_flag)) begin
	        state_next = S_4; 
	      end
	    S_4 :
	      if ((!pkt_receive_enable[4]) && (!rom_rden_flag)) begin
	        state_next = S_5; 
	      end
	    S_5 :
	      if ((!pkt_receive_enable[5]) && (!rom_rden_flag)) begin
	        state_next = S_6; 
	      end
	    S_6 :
	      if ((!pkt_receive_enable[6]) && (!rom_rden_flag)) begin
	        state_next = S_7; 
	      end
	    S_7 :
	      if ((!pkt_receive_enable[7]) && (!rom_rden_flag)) begin
	        state_next = S_0; 
	      end					
	  endcase
	end
end
	
always @(posedge sys_clk or negedge sys_rst_n) begin
  if (!sys_rst_n) begin 
        matrix_memory_data_7 <= 32'b0;
        matrix_memory_sop_7  <= 1'b0;
        matrix_memory_eop_7  <= 1'b0;
        matrix_memory_vld_7  <= 1'b0;

        matrix_memory_data_6 <= 32'b0;
        matrix_memory_sop_6  <= 1'b0;
        matrix_memory_eop_6  <= 1'b0;
        matrix_memory_vld_6  <= 1'b0;

        matrix_memory_data_5 <= 32'b0;
        matrix_memory_sop_5  <= 1'b0;
        matrix_memory_eop_5  <= 1'b0;
        matrix_memory_vld_5  <= 1'b0;

        matrix_memory_data_4 <= 32'b0;
        matrix_memory_sop_4  <= 1'b0;
        matrix_memory_eop_4  <= 1'b0;
        matrix_memory_vld_4  <= 1'b0;

        matrix_memory_data_3 <= 32'b0;
        matrix_memory_sop_3  <= 1'b0;
        matrix_memory_eop_3  <= 1'b0;
        matrix_memory_vld_3  <= 1'b0;

        matrix_memory_data_2 <= 32'b0;
        matrix_memory_sop_2  <= 1'b0;
        matrix_memory_eop_2  <= 1'b0;
        matrix_memory_vld_2  <= 1'b0;

        matrix_memory_data_1 <= 32'b0;
        matrix_memory_sop_1  <= 1'b0;
        matrix_memory_eop_1  <= 1'b0;
        matrix_memory_vld_1  <= 1'b0;

        matrix_memory_data_0 <= 32'b0;
        matrix_memory_sop_0  <= 1'b0;
        matrix_memory_eop_0  <= 1'b0;
        matrix_memory_vld_0  <= 1'b0;
  end
  else begin
    case (state_next)
      S_0 :
        begin  
           matrix_memory_data_0 <= rom_q[31:0];
           matrix_memory_sop_0 <= rom_q[34];
           matrix_memory_eop_0 <= rom_q[33];
           matrix_memory_vld_0 <= rom_q[32];
        end
      S_1 :
        begin  
           matrix_memory_data_1 <= rom_q[31:0];
           matrix_memory_sop_1 <= rom_q[34];
           matrix_memory_eop_1 <= rom_q[33];
           matrix_memory_vld_1 <= rom_q[32];
        end
      S_2 :
        begin  
           matrix_memory_data_2 <= rom_q[31:0];
           matrix_memory_sop_2 <= rom_q[34];
           matrix_memory_eop_2 <= rom_q[33];
           matrix_memory_vld_2 <= rom_q[32];
        end
      S_3 :
        begin  
           matrix_memory_data_3 <= rom_q[31:0];
           matrix_memory_sop_3 <= rom_q[34];
           matrix_memory_eop_3 <= rom_q[33];
           matrix_memory_vld_3 <= rom_q[32];
        end
      S_4 :
        begin  
           matrix_memory_data_4 <= rom_q[31:0];
           matrix_memory_sop_4 <= rom_q[34];
           matrix_memory_eop_4 <= rom_q[33];
           matrix_memory_vld_4 <= rom_q[32];
        end
      S_5 :
        begin  
           matrix_memory_data_5 <= rom_q[31:0];
           matrix_memory_sop_5 <= rom_q[34];
           matrix_memory_eop_5 <= rom_q[33];
           matrix_memory_vld_5 <= rom_q[32];
        end
      S_6 :
        begin  
           matrix_memory_data_6 <= rom_q[31:0];
           matrix_memory_sop_6 <= rom_q[34];
           matrix_memory_eop_6 <= rom_q[33];
           matrix_memory_vld_6 <= rom_q[32];
        end
      S_7 :
        begin  
           matrix_memory_data_7 <= rom_q[31:0];
           matrix_memory_sop_7 <= rom_q[34];
           matrix_memory_eop_7 <= rom_q[33];
           matrix_memory_vld_7 <= rom_q[32];
        end
    endcase
  end
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin 
    rom_rden <= 1'b0;
  end 
  else if ((pkt_receive_enable == 8'b00000000) && (!rom_rden)) begin
    rom_rden <= 1'b0;
  end
  else if (rom_addr == MAX_ADDR) begin
  	rom_rden <= 1'b0;
  end
  else if ((pkt_receive_enable != 8'b00000000) && (state_cur == state_next)) begin
  	rom_rden <= 1'b1;
  end 
end

always @(posedge sys_clk or negedge sys_rst_n) 
begin 
  if (!sys_rst_n) begin 
    rom_addr <= 32'd0;
  end else if ((rom_addr == MAX_ADDR) & rom_rden == 1'b1) begin 
    rom_addr <= 32'd0;
  end else if (rom_rden) begin 
    rom_addr <= rom_addr + 1'b1;
  end
end





rom_256x32 u0 (
  .address(rom_addr), //  rom_input.address
  .clock  (sys_clk), //           .clk
  .rden   (rom_rden), //           .rden
  .q      (rom_q   )  // rom_output.dataout
);

pip_top s0(
  //input
  .sys_clk (sys_clk)          ,
  .sys_rst_n(sys_rst_n)         ,
  .matrix_memory_sop(matrix_memory_sop_0) ,
  .matrix_memory_eop(matrix_memory_eop_0) ,
  .matrix_memory_vld(matrix_memory_vld_0) ,
  .matrix_memory_data(matrix_memory_data_0),
  // .result_fifo_rden(~result_fifo_empty)  ,
  //output
  .pkt_receive_enable(pkt_receive_enable[0])
  // .result_fifo_rdat(result_fifo_rdat)  ,
  // .result_fifo_empty(result_fifo_empty) 
);

// save_send s1(
//   //input
//   .sys_clk (sys_clk)          ,
//   .sys_rst_n(sys_rst_n)         ,
//   .matrix_memory_sop(matrix_memory_sop_1) ,
//   .matrix_memory_eop(matrix_memory_eop_1) ,
//   .matrix_memory_vld(matrix_memory_vld_1) ,
//   .matrix_memory_data(matrix_memory_data_1),
//   // .result_fifo_rden(~result_fifo_empty)  ,
//   //output
//   .pkt_receive_enable(pkt_receive_enable[1])
//   // .result_fifo_rdat(result_fifo_rdat)  ,
//   // .result_fifo_empty(result_fifo_empty) 
// );

// save_send s2(
//   //input
//   .sys_clk (sys_clk)          ,
//   .sys_rst_n(sys_rst_n)         ,
//   .matrix_memory_sop(matrix_memory_sop_2) ,
//   .matrix_memory_eop(matrix_memory_eop_2) ,
//   .matrix_memory_vld(matrix_memory_vld_2) ,
//   .matrix_memory_data(matrix_memory_data_2),
//   // .result_fifo_rden(~result_fifo_empty)  ,
//   //output
//   .pkt_receive_enable(pkt_receive_enable[2])
//   // .result_fifo_rdat(result_fifo_rdat)  ,
//   // .result_fifo_empty(result_fifo_empty) 
// );

// save_send s3(
//   //input
//   .sys_clk (sys_clk)          ,
//   .sys_rst_n(sys_rst_n)         ,
//   .matrix_memory_sop(matrix_memory_sop_3) ,
//   .matrix_memory_eop(matrix_memory_eop_3) ,
//   .matrix_memory_vld(matrix_memory_vld_3) ,
//   .matrix_memory_data(matrix_memory_data_3),
//   // .result_fifo_rden(~result_fifo_empty)  ,
//   //output
//   .pkt_receive_enable(pkt_receive_enable[3])
//   // .result_fifo_rdat(result_fifo_rdat)  ,
//   // .result_fifo_empty(result_fifo_empty) 
// );

// save_send s4(
//   //input
//   .sys_clk (sys_clk)          ,
//   .sys_rst_n(sys_rst_n)         ,
//   .matrix_memory_sop(matrix_memory_sop_4) ,
//   .matrix_memory_eop(matrix_memory_eop_4) ,
//   .matrix_memory_vld(matrix_memory_vld_4) ,
//   .matrix_memory_data(matrix_memory_data_4),
//   // .result_fifo_rden(~result_fifo_empty)  ,
//   //output
//   .pkt_receive_enable(pkt_receive_enable[4])
//   // .result_fifo_rdat(result_fifo_rdat)  ,
//   // .result_fifo_empty(result_fifo_empty) 
// );

// save_send s5(
//   //input
//   .sys_clk (sys_clk)          ,
//   .sys_rst_n(sys_rst_n)         ,
//   .matrix_memory_sop(matrix_memory_sop_5) ,
//   .matrix_memory_eop(matrix_memory_eop_5) ,
//   .matrix_memory_vld(matrix_memory_vld_5) ,
//   .matrix_memory_data(matrix_memory_data_5),
//   // .result_fifo_rden(~result_fifo_empty)  ,
//   //output
//   .pkt_receive_enable(pkt_receive_enable[5])
//   // .result_fifo_rdat(result_fifo_rdat)  ,
//   // .result_fifo_empty(result_fifo_empty) 
// );

// save_send s6(
//   //input
//   .sys_clk (sys_clk)          ,
//   .sys_rst_n(sys_rst_n)         ,
//   .matrix_memory_sop(matrix_memory_sop_6) ,
//   .matrix_memory_eop(matrix_memory_eop_6) ,
//   .matrix_memory_vld(matrix_memory_vld_6) ,
//   .matrix_memory_data(matrix_memory_data_6),
//   // .result_fifo_rden(~result_fifo_empty)  ,
//   //output
//   .pkt_receive_enable(pkt_receive_enable[6])
//   // .result_fifo_rdat(result_fifo_rdat)  ,
//   // .result_fifo_empty(result_fifo_empty) 
// );

// save_send s7(
//   //input
//   .sys_clk (sys_clk)          ,
//   .sys_rst_n(sys_rst_n)         ,
//   .matrix_memory_sop(matrix_memory_sop_7) ,
//   .matrix_memory_eop(matrix_memory_eop_7) ,
//   .matrix_memory_vld(matrix_memory_vld_7) ,
//   .matrix_memory_data(matrix_memory_data_7),
//   // .result_fifo_rden(~result_fifo_empty)  ,
//   //output
//   .pkt_receive_enable(pkt_receive_enable[7])
//   // .result_fifo_rdat(result_fifo_rdat)  ,
//   // .result_fifo_empty(result_fifo_empty) 
// );

/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/


/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/

endmodule