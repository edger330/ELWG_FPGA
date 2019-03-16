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
//  2017-09-18       jyb             initial version
//
**********************************************************************/
module syn_coreclk_2_sysclk(
//input
core_clk, sys_clk, sys_rst_n, signal_a_in, signal_b_in, signal_c_in, signal_d_in,

//output
signal_a_out, signal_b_out, signal_c_out, signal_d_out

);
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 2;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
//global signal
input               core_clk;
input               sys_clk;
input               sys_rst_n;

input               signal_a_in;
output              signal_a_out;

input               signal_b_in;
output              signal_b_out;

input               signal_c_in;
output              signal_c_out;

input               signal_d_in;
output              signal_d_out;
/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/
reg       f0_signal_a_in;
wire      f1_signal_a_in;
reg       f2_signal_a_in;
wire      signal_a_in_fifo_full;
wire      signal_a_in_fifo_empty;

reg       f0_signal_b_in;
wire      f1_signal_b_in;
reg       f2_signal_b_in;
wire      signal_b_in_fifo_full;
wire      signal_b_in_fifo_empty;

reg       f0_signal_c_in;
wire      f1_signal_c_in;
reg       f2_signal_c_in;
wire      signal_c_in_fifo_full;
wire      signal_c_in_fifo_empty;

reg       f0_signal_d_in;
wire      f1_signal_d_in;
reg       f2_signal_d_in;
wire      signal_d_in_fifo_full;
wire      signal_d_in_fifo_empty;
/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/
   
always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_signal_a_in <=#D 1'b0;
  end else begin
    f0_signal_a_in <=#D signal_a_in;
  end
end 

afifo_8x1    signal_a_fifo(
    .data        (f0_signal_a_in                 ),
    .wrreq       (1'b1 && ~signal_a_in_fifo_full ),
    .rdreq       (~signal_a_in_fifo_empty        ),
    .wrclk       (core_clk                    ),
    .rdclk       (sys_clk                        ),
    .q           (f1_signal_a_in                 ),
    .wrusedw     (                               ),
    .rdempty     (signal_a_in_fifo_empty         ),
    .wrfull      (signal_a_in_fifo_full          )		
 );	


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f2_signal_a_in <=#D 1'b0;
  end else begin
    f2_signal_a_in <=#D f1_signal_a_in;
  end
end  

assign  signal_a_out = f2_signal_a_in;

//----------------------------------------------------------------------


always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_signal_b_in <=#D 1'b0;
  end else begin
    f0_signal_b_in <=#D signal_b_in;
  end
end 

afifo_8x1    signal_b_fifo(
    .data        (f0_signal_b_in                 ),
    .wrreq       (1'b1 && ~signal_b_in_fifo_full ),
    .rdreq       (~signal_b_in_fifo_empty        ),
    .wrclk       (core_clk                    ),
    .rdclk       (sys_clk                        ),
    .q           (f1_signal_b_in                 ),
    .wrusedw     (                               ),
    .rdempty     (signal_b_in_fifo_empty         ),
    .wrfull      (signal_b_in_fifo_full          )		
 );	


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f2_signal_b_in <=#D 1'b0;
  end else begin
    f2_signal_b_in <=#D f1_signal_b_in;
  end
end  

assign  signal_b_out = f2_signal_b_in;


//----------------------------------------------------------------------

always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_signal_c_in <=#D 1'b0;
  end else begin
    f0_signal_c_in <=#D signal_c_in;
  end
end 

afifo_8x1    signal_c_fifo(
    .data        (f0_signal_c_in                 ),
    .wrreq       (1'b1 && ~signal_c_in_fifo_full ),
    .rdreq       (~signal_c_in_fifo_empty        ),
    .wrclk       (core_clk                    ),
    .rdclk       (sys_clk                        ),
    .q           (f1_signal_c_in                 ),
    .wrusedw     (                               ),
    .rdempty     (signal_c_in_fifo_empty         ),
    .wrfull      (signal_c_in_fifo_full          )		
 );	


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f2_signal_c_in <=#D 1'b0;
  end else begin
    f2_signal_c_in <=#D f1_signal_c_in;
  end
end  

assign  signal_c_out = f2_signal_c_in;

//----------------------------------------------------------------------


always@(posedge core_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_signal_d_in <=#D 1'b0;
  end else begin
    f0_signal_d_in <=#D signal_d_in;
  end
end 

afifo_8x1    signal_d_fifo(
    .data        (f0_signal_d_in                 ),
    .wrreq       (1'b1 && ~signal_d_in_fifo_full ),
    .rdreq       (~signal_d_in_fifo_empty        ),
    .wrclk       (core_clk                    ),
    .rdclk       (sys_clk                        ),
    .q           (f1_signal_d_in                 ),
    .wrusedw     (                               ),
    .rdempty     (signal_d_in_fifo_empty         ),
    .wrfull      (signal_d_in_fifo_full          )		
 );	


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f2_signal_d_in <=#D 1'b0;
  end else begin
    f2_signal_d_in <=#D f1_signal_d_in;
  end
end  

assign  signal_d_out = f2_signal_d_in;

//----------------------------------------------------------------------

endmodule 