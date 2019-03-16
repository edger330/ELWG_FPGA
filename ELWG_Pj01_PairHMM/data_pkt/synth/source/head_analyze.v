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
module head_analyze(
//input
sys_clk,sys_rst_n,start,cpu_pkt_ram_rdat,head_ram_ren,head_ram_raddr,

//output 
cpu_pkt_ram_raddr, cpu_pkt_ram_ren, head_data,done

);


/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 2;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
//global signal
input               sys_clk;
input               sys_rst_n;
input               start;

input      [7:0]    cpu_pkt_ram_rdat;
output     [17:0]   cpu_pkt_ram_raddr;
output              cpu_pkt_ram_ren;

input               head_ram_ren;
input      [2:0]    head_ram_raddr;
output     [31:0]   head_data;

output              done;
/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/
reg                 f0_start;
reg                 f1_start;
reg                 cpu_pkt_ram_ren_reg; 
reg        [17:0]   cpu_pkt_ram_raddr_reg;
reg        [7:0]    cpu_pkt_ram_rdat_reg;

reg                 f0_cpu_pkt_ram_ren_reg;
reg                 f1_cpu_pkt_ram_ren_reg;
reg                 f2_cpu_pkt_ram_ren_reg;

reg                 head_ram_wen;
reg        [4:0]    head_ram_waddr;
wire       [7:0]    head_ram_wdat;                  

reg                 done_reg;
/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_start <=#D 1'b0;
    f1_start <=#D 1'b0;
  end else begin 
    f0_start <=#D start; 
    f1_start <=#D f0_start;  
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_ren_reg <=#D 1'b0;  
  end else if (cpu_pkt_ram_raddr_reg == 18'd23) begin     
    cpu_pkt_ram_ren_reg <=#D 1'b0;
  end else if (f0_start && ~f1_start) begin
    cpu_pkt_ram_ren_reg <=#D 1'b1;  
  end 
end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_raddr_reg <=#D 18'd0;
  end else if (cpu_pkt_ram_raddr_reg == 18'd23) begin
  	 cpu_pkt_ram_raddr_reg <=#D 18'd0;
  end else if (cpu_pkt_ram_ren_reg) begin
    cpu_pkt_ram_raddr_reg <=#D cpu_pkt_ram_raddr_reg + 1;
  end
end 


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_rdat_reg <=#D 8'd0;
  end else if(f1_cpu_pkt_ram_ren_reg || head_ram_wen) begin
    cpu_pkt_ram_rdat_reg <=#D cpu_pkt_ram_rdat;
  end
end

//--------------------------------------------------------------------------

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_cpu_pkt_ram_ren_reg <=#D 1'b0;
    f1_cpu_pkt_ram_ren_reg <=#D 1'b0; 
    f2_cpu_pkt_ram_ren_reg <=#D 1'b0; 	 
  end else begin
    f0_cpu_pkt_ram_ren_reg <=#D cpu_pkt_ram_ren_reg;
    f1_cpu_pkt_ram_ren_reg <=#D f0_cpu_pkt_ram_ren_reg; 
	  f2_cpu_pkt_ram_ren_reg <=#D f1_cpu_pkt_ram_ren_reg; 
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n) begin	
    head_ram_wen <=#D 1'b0;
  end else if (head_ram_waddr == 5'd23) begin
  	head_ram_wen <=#D 1'b0;      
  end else if(f1_cpu_pkt_ram_ren_reg) begin
    head_ram_wen <=#D 1'b1; 
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    head_ram_waddr <=#D 5'd0;
  end else if (head_ram_waddr == 5'd23) begin
    head_ram_waddr <=#D 5'd0;
  end else if (f2_cpu_pkt_ram_ren_reg) begin
    head_ram_waddr <=#D head_ram_waddr + 1;
  end
end

assign head_ram_wdat = cpu_pkt_ram_rdat_reg;

ram_2_port_32x8_32 u_head_ram(
	.data      (head_ram_wdat),
	.wraddress (head_ram_waddr),  // [4:0]
	.rdaddress (head_ram_raddr),  // [2:0]
	.wren      (head_ram_wen),
	.clock     (sys_clk),
	.rden      (head_ram_ren),
	.q         (head_data)
	);

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    done_reg <=#D 1'b0;
  end else if(f0_start && ~f1_start) begin
    done_reg <=#D 1'b0;
  end else if(head_ram_waddr == 5'd23) begin
  	 done_reg <=#D 1'b1;
  end 	
end



reg  f0_done_reg;

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_done_reg <=#D 1'b0;
  end else begin
    f0_done_reg <=#D done_reg;
  end  	
end




assign cpu_pkt_ram_raddr = cpu_pkt_ram_raddr_reg;
assign cpu_pkt_ram_ren   = cpu_pkt_ram_ren_reg; 
assign done = done_reg && ~f0_done_reg;


endmodule 