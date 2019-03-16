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
//  2017-05-23       jyb             initial version
//
**********************************************************************/
module hap_analyze (
//input
sys_clk,sys_rst_n,start,cpu_pkt_ram_rdat,hap_ram_ren,hap_ram_raddr,
//output
cpu_pkt_ram_raddr,cpu_pkt_ram_ren,hap_num,hap_data,done
);
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 2;

parameter IDLE           =8'b0000_0001;
parameter GET_HAP_LEN    =8'b0000_0010;
parameter COUNT_ONE_HAP  =8'b0000_0100;
parameter WAIT_SAVING_0  =8'b0000_1000;
parameter GET_HAP        =8'b0001_0000;
parameter WAIT_SAVING_1  =8'b0010_0000;
parameter DONE           =8'b0100_0000;
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

input               hap_ram_ren;
input      [16:0]   hap_ram_raddr;

output     [15:0]   hap_num;
output     [7:0]    hap_data;

output              done;
/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/
reg                 f0_start;
reg                 f1_start;

reg        [7:0]    curr_sta; 		
reg        [7:0]    next_sta;

reg        [17:0]   cpu_pkt_ram_raddr_reg0;
reg                 cpu_pkt_ram_ren_reg0; 

reg        [17:0]   cpu_pkt_ram_raddr_reg1;
reg                 cpu_pkt_ram_ren_reg1; 

reg                 get_hap_num_flag;

reg        [2:0]    count1;
reg        [3:0]    count2;
reg        [2:0]    count3;

reg        [15:0]   hap_num;
reg        [15:0]   hap_len; 
reg        [15:0]   hap_cont;
reg        [15:0]   hap_element_cont; 
reg        [7:0]    hap_element;

reg                 get_hap_start;

reg                 f0_get_hap_flag;
reg                 f1_get_hap_flag;
reg                 f2_get_hap_flag;
reg                 f3_get_hap_flag;
reg                 f4_get_hap_flag;
reg                 f5_get_hap_flag;

reg        [17:0]   get_hap_base_addr;
reg        [16:0]   save_hap_base_addr;

reg        [16:0]   hap_ram_waddr;
reg        [7:0]    hap_ram_wdat;
reg                 hap_ram_wen;
wire                saving_done;

reg                 done_reg;
reg                 f0_done_reg;
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
    get_hap_num_flag <=#D 1'b0;
  end else if (count1 == 3'd5) begin  
  	get_hap_num_flag <=#D 1'b0;	  
  end else if (f0_start && ~f1_start) begin
    get_hap_num_flag <=#D 1'b1;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    count1 <=#D 3'd0;
  end else if (count1 == 3'd5) begin 
    count1 <=#D 3'd0;
  end else if(get_hap_num_flag) begin
    count1 <=#D count1 + 1; 
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_raddr_reg0 <=#D 18'd0;
  end else if (count1==0 && get_hap_num_flag) begin
    cpu_pkt_ram_raddr_reg0 <=#D 18'd24;
  end else if (count1==1 && get_hap_num_flag) begin
  	cpu_pkt_ram_raddr_reg0 <=#D 18'd25;
  end	else begin 
  	cpu_pkt_ram_raddr_reg0 <=#D 18'd0;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_ren_reg0 <=#D 1'b0;
  end else if ((count1==0 && get_hap_num_flag) || (count1==1 && get_hap_num_flag)) begin
    cpu_pkt_ram_ren_reg0 <=#D 1'b1;
  end else begin
    cpu_pkt_ram_ren_reg0 <=#D 1'b0; 
  end 	 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_num[15:8] <=#D 8'd0;
  end else if (count1 == 3'd3) begin
    hap_num[15:8] <=#D cpu_pkt_ram_rdat;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_num[7:0] <=#D 8'd0;
  end else if(count1 == 3'd4) begin
    hap_num[7:0] <=#D cpu_pkt_ram_rdat;     
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    get_hap_start <=#D 1'b0;
  end else if(count1==3'd5) begin
    get_hap_start <=#D 1'b1;
  end else begin
  	get_hap_start <=#D 1'b0;
  end 	
end

//-----------------------------------------------------------------------------------------------
  
always@(posedge sys_clk or negedge sys_rst_n)
begin
	if(~sys_rst_n)
		curr_sta <= IDLE;
	else
		curr_sta <= next_sta;		
end 

always@(*)
begin
	next_sta = curr_sta;
	case(curr_sta) 
	  IDLE:		
	    begin
	      if (get_hap_start) begin
				  next_sta = GET_HAP_LEN;
			  end	
		  end	

    GET_HAP_LEN:
      begin
      	if (count2 == 4'd6) begin
      		next_sta = COUNT_ONE_HAP;
        end	
      end
      
    COUNT_ONE_HAP:
      begin 
        	next_sta = WAIT_SAVING_0;
      end 	
    
    WAIT_SAVING_0:
      begin
        if (count3 == 3'd5) begin
        	next_sta = GET_HAP;
		  end   	
      end 
       
    GET_HAP:
      begin 
        if (hap_element_cont == hap_len-1) begin
        	next_sta = WAIT_SAVING_1; 
        end
      end  
           
    WAIT_SAVING_1:      
      begin     
        if ((saving_done)&&(hap_cont == hap_num)) begin
          next_sta = DONE;
        end else if (saving_done) begin
        	next_sta = GET_HAP_LEN;  
        end 		
      end      
                           
    DONE:   
      begin
          next_sta = IDLE;
      end

  endcase 
end

//-----------------------------------------------------------------------------------------------
//get hap_len and hap 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    get_hap_base_addr <=#D 18'd0;
  end else if (curr_sta == IDLE) begin
    get_hap_base_addr <=#D 18'd26;          
  end else if ((curr_sta == GET_HAP)&&(hap_element_cont == hap_len-1)) begin
  	get_hap_base_addr <=#D get_hap_base_addr + hap_len + 2; 
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    count2 <=#D 4'd0;
  end else if (count2 == 4'd6) begin
    count2 <=#D 4'd0;                           
  end else if (curr_sta == GET_HAP_LEN)begin
  	count2 <=#D count2 + 1;
  end 	
end  

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_len[15:8] <=#D 8'd0;
  end else if(count2 == 4'd4) begin
    hap_len[15:8] <=#D cpu_pkt_ram_rdat;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_len[7:0] <=#D 8'd0;
  end else if(count2 == 4'd5) begin
    hap_len[7:0] <=#D cpu_pkt_ram_rdat; 
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_cont <=#D 16'd0;
  end else if (curr_sta==DONE) begin
    hap_cont <=#D 16'd0;
  end else if (curr_sta==COUNT_ONE_HAP) begin
  	hap_cont <=#D hap_cont + 1; 
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_element_cont <=#D 16'd0;
  end else if (hap_element_cont == hap_len-1) begin
    hap_element_cont <=#D 16'd0;
  end else if (curr_sta == GET_HAP) begin
  	hap_element_cont <=#D hap_element_cont + 1;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_get_hap_flag <=#D 1'b0;
    f1_get_hap_flag <=#D 1'b0;
    f2_get_hap_flag <=#D 1'b0;    
    f3_get_hap_flag <=#D 1'b0;
    f4_get_hap_flag <=#D 1'b0;    
    f5_get_hap_flag <=#D 1'b0;    
  end else begin
    f0_get_hap_flag <=#D (curr_sta == GET_HAP);
    f1_get_hap_flag <=#D f0_get_hap_flag;
    f2_get_hap_flag <=#D f1_get_hap_flag; 
    f3_get_hap_flag <=#D f2_get_hap_flag; 
    f4_get_hap_flag <=#D f3_get_hap_flag; 
    f5_get_hap_flag <=#D f4_get_hap_flag;        
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_element <=#D 8'd0;
  end else if (f2_get_hap_flag) begin         //f1_get_hap_flag
    hap_element <=#D cpu_pkt_ram_rdat;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)                      
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_raddr_reg1 <=#D 18'd0;
  end else if (count2 == 4'd1) begin
    cpu_pkt_ram_raddr_reg1 <=#D get_hap_base_addr;
  end else if (count2 == 4'd2) begin
    cpu_pkt_ram_raddr_reg1 <=#D get_hap_base_addr + 1;     
  end else if (curr_sta == GET_HAP) begin
  	cpu_pkt_ram_raddr_reg1 <=#D cpu_pkt_ram_raddr_reg1 + 1;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)                       
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_ren_reg1 <=#D 1'b0;
  end else if (count2 == 4'd1 || count2 == 4'd2) begin
    cpu_pkt_ram_ren_reg1 <=#D 1'b1;
  end else if (curr_sta == GET_HAP) begin
    cpu_pkt_ram_ren_reg1 <=#D 1'b1;  	 
  end else begin
    cpu_pkt_ram_ren_reg1 <=#D 1'b0;  	
  end  
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    done_reg <=#D 1'b0;
  end else if (curr_sta==DONE) begin
  	 done_reg <=#D 1'b1;
  end else begin
    done_reg <=#D 1'b0;
  end  
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_done_reg <=#D 1'b0; 
  end else begin
    f0_done_reg <=#D done_reg;
  end
end
//-----------------------------------------------------------------------
//save hap process 
//save hap_num*(hap_id[2byte] + hap_len[2byte] + hap[hap_len] < 400byte)

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    save_hap_base_addr <=#D 17'd0;
  end else if(curr_sta == IDLE) begin
    save_hap_base_addr <=#D 17'd0;
  end else if (saving_done) begin
  	save_hap_base_addr <=#D save_hap_base_addr + 17'd400;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n) begin	
    count3 <=#D 3'd0;
  end else if (count3 == 3'd5) begin              ///////////////////////////////////////////////////                 
    count3 <=#D 3'd0;
  end else if (curr_sta == WAIT_SAVING_0) begin
  	count3 <=#D count3 + 1;  	
  end	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_ram_waddr <=#D 18'd0;
  end else if (count3 == 3'd1) begin
    hap_ram_waddr <=#D save_hap_base_addr;
  end else if (count3 == 3'd2) begin
  	hap_ram_waddr <=#D save_hap_base_addr + 1; 
  end else if (count3 == 3'd3) begin
  	hap_ram_waddr <=#D save_hap_base_addr + 2;   		
  end else if (count3 == 3'd4) begin
  	hap_ram_waddr <=#D save_hap_base_addr + 3;
  end	else if (f3_get_hap_flag) begin
  	hap_ram_waddr <=#D hap_ram_waddr + 1;
  end 	   	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_ram_wdat <=#D 8'd0;
  end else if (count3 == 3'd1) begin
    hap_ram_wdat <=#D hap_cont[15:8];  //hap_id[15:8]
  end else if (count3 == 3'd2) begin   
  	hap_ram_wdat <=#D hap_cont[7:0];   //hap_id[7:0]
  end else if (count3 == 3'd3) begin
  	hap_ram_wdat <=#D hap_len[15:8];   		
  end else if (count3 == 3'd4) begin
  	hap_ram_wdat <=#D hap_len[7:0];
  end	else  begin  //f2_get_hap_flag
  	hap_ram_wdat <=#D hap_element;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_ram_wen <=#D 1'b0;
  end else if ((count3 >=3'd1)&&(count3 <=3'd4)) begin
    hap_ram_wen <=#D 1'b1; 
  end else if (f3_get_hap_flag) begin   
    hap_ram_wen <=#D 1'b1;  ////////////////////////////////////////////////////////
  end else begin
    hap_ram_wen <=#D 1'b0;
  end    	
end

assign saving_done = (~f4_get_hap_flag && f5_get_hap_flag);

ram_2_port_102400x8 u_hap_ram(
	.data      (hap_ram_wdat),
	.wraddress (hap_ram_waddr),  // [16:0]
	.rdaddress (hap_ram_raddr),  // [16:0]
	.wren      (hap_ram_wen),
	.clock     (sys_clk),
	.rden      (hap_ram_ren),
	.q         (hap_data)
	);

// always@(posedge sys_clk or negedge sys_rst_n)
// begin
//   if(!sys_rst_n)begin	
//     start_get_read_addr <=#D 18'd0;
//   end else if (f0_start && ~f1_start) begin
//     start_get_read_addr <=#D 18'd0;   
//   end else if (done_reg && ~f0_done_reg) begin
//     start_get_read_addr <=#D cpu_pkt_ram_raddr_reg1 + 1;
//   end
// end


assign  cpu_pkt_ram_raddr = (get_hap_num_flag)? cpu_pkt_ram_raddr_reg0 : cpu_pkt_ram_raddr_reg1;
assign  cpu_pkt_ram_ren   = cpu_pkt_ram_ren_reg0 || cpu_pkt_ram_ren_reg1;
assign  done = done_reg;


endmodule 
