/*********************************************************************
//  Author:    cz
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
//  2017-07-25       jyb             initial version
//
**********************************************************************/ 
module package_send(
	//input 
	sys_clk,
	sys_rst_n,
	start,	
	hap_num,
	read_num,
	hap_data,
	head_data,
	read_data,
	p0_ram_rdat,
	p1_ram_rdat,
	p2_ram_rdat,
	p3_ram_rdat,
	p4_ram_rdat,
	p5_ram_rdat,
	p6_ram_rdat,
	matrix_enable,

	//output 
	data,
	sop,
	eop,
	vld,
	hap_ram_ren , 
	hap_ram_raddr,
	head_ram_ren , 
	head_ram_raddr,
	read_ram_ren , 
	read_ram_raddr,
	p_ram_raddr,
 	p_ram_ren  ,
 	all_write_finished
	);

/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 0.2;

parameter IDLE             = 16'b0000_0000_0000_0001;
parameter SEND_HEAD        = 16'b0000_0000_0000_0010;
parameter HEAD_DONE        = 16'b0000_0000_0000_0100;
parameter SEND_INFO        = 16'b0000_0000_0000_1000; 
parameter SEND_R_H         = 16'b0000_0000_0001_0000;  
parameter SEND_R_H_DONE    = 16'b0000_0000_0010_0000;     
parameter SEND_P           = 16'b0000_0000_0100_0000; 
parameter SEND_P_DONE      = 16'b0000_0000_1000_0000; 
parameter CONT_HAP         = 16'b0000_0001_0000_0000;
parameter JUDGE_HAP        = 16'b0000_0010_0000_0000;
parameter CONT_READ        = 16'b0000_0100_0000_0000;
parameter JUDGE_READ       = 16'b0000_1000_0000_0000;
parameter DONE             = 16'b0001_0000_0000_0000;

/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
input               sys_clk;
input               sys_rst_n;
input               start;
input     [15:0]    hap_num;
input     [15:0]    read_num;
input               matrix_enable;
//
output    [31:0]    data;
output              sop;
output              eop;
output 		          vld;
//       
output              head_ram_ren;
output    [ 2:0]    head_ram_raddr;
input     [31:0]    head_data;
//
output              hap_ram_ren;
output    [16:0]    hap_ram_raddr;
input     [ 7:0]    hap_data;
//            
output              read_ram_ren;
output    [12:0]    read_ram_raddr;
input     [ 7:0]    read_data;
//          
output    [12:0]    p_ram_raddr;
output              p_ram_ren;
input     [31:0]    p0_ram_rdat;
input     [31:0]    p1_ram_rdat;
input     [31:0]    p2_ram_rdat;
input     [31:0]    p3_ram_rdat;
input     [31:0]    p4_ram_rdat;
input     [31:0]    p5_ram_rdat;
input     [31:0]    p6_ram_rdat;
//
output              all_write_finished;

/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/

reg                 f0_start;
reg                 f1_start;
wire                start_pulse;
reg                 module_vld;
//
reg		    [15:0]    curr_sta; 
reg       [15:0]    next_sta;	
//
reg       [15:0]    hap_num_reg;
reg       [15:0]    read_num_reg;
reg       [15:0]    hap_num_cont;
reg       [15:0]    read_num_cont;
//
reg       [ 7:0]    head_cont;
reg       [ 7:0]    info_cont;
reg       [ 7:0]    r_h_cont;
reg       [ 7:0]    p_cont;
//
reg                 head_ram_ren_reg;
reg       [ 2:0]    head_ram_raddr_reg;
//
reg                 hap_ram_ren_reg;
reg       [16:0]    hap_ram_raddr_reg;
reg       [16:0]    hap_base_addr;
reg       [15:0]    hap_len;
reg       [15:0]    hap_id_temp;
reg       [15:0]    hap_id;
//            
reg                 read_ram_ren_reg;
reg       [12:0]    read_ram_raddr_reg;
reg       [12:0]    read_base_addr;
reg       [15:0]    read_len;
reg       [15:0]    read_id_temp;
reg       [15:0]    read_id;
//
reg                 rom_y_ini_rden;
reg       [ 8:0]    rom_y_ini_addr;
wire      [31:0]    rom_y_ini_data;
reg       [31:0]    y_initial;
//
reg       [31:0]    r_h_data;
reg       [15:0]    read_len_cont;
reg       [15:0]    hap_len_cont;
//
reg       [15:0]    p_len_cont;
reg       [12:0]    p_ram_raddr_reg;
reg       [12:0]    p_base_addr;
reg                 p_ram_ren_reg;
reg       [31:0]    p0;
reg       [31:0]    p1;
reg       [31:0]    p2;
reg       [31:0]    p3;
reg       [31:0]    p4;
reg       [31:0]    p5;
reg       [31:0]    p6;
//
reg       [33:0]    fifo_data_in; 
reg                 fifo_write_en;
reg                 fifo_read_en;
wire      [33:0]    fifo_data_out;
reg       [33:0]    f0_fifo_data_out;
wire                empty;
wire                full;
wire      [12:0]    usedw;
//
reg       [31:0]    pkt_pointer;
wire                save_one_pkt;
wire                send_one_pkt;
//
reg                 pkt_sop;
reg                 pkt_eop;
reg                 pkt_vld;
reg       [31:0]    pkt_dat;
/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/

//create start_pulse
always @(posedge sys_clk or negedge sys_rst_n) 
begin 
	if (!sys_rst_n) begin 
		f0_start <=#D 1'b0;
		f1_start <=#D 1'b0;
	end else begin 
		f0_start <=#D start;
		f1_start <=#D f0_start;
	end
end

assign start_pulse = f0_start && ~f1_start;


always @(posedge sys_clk or negedge sys_rst_n)  
begin 
	if (!sys_rst_n) begin
		module_vld <=#D 1'b0;
	end else if (start_pulse) begin 
		module_vld <=#D 1'b1;
	end else if (curr_sta == DONE) begin 
		module_vld <=#D 1'b0;
	end
end

//---------------------------------------------------------

always @ (posedge sys_clk or negedge sys_rst_n) 
begin
	if (!sys_rst_n) begin
		hap_num_reg  <=#D 16'd0;
		read_num_reg <=#D 16'd0;
	end else if (start_pulse) begin 
		hap_num_reg  <=#D hap_num;
		read_num_reg <=#D read_num;
	end
end

//----------------------------------------------------------

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
	      if(module_vld && (usedw <= 13'd7167)) begin	 
	      	next_sta = SEND_HEAD; 
	      end	
		  end	
    
    SEND_HEAD:  
      begin    
        if(head_cont == 8'd5) begin 
          next_sta = HEAD_DONE; 
        end               
      end  
       
    HEAD_DONE:   
      begin 
        if(head_ram_raddr_reg == 3'd0) begin
          next_sta = SEND_INFO; 	
        end else begin
        	next_sta = SEND_HEAD;        
        end  
      end  
       
    SEND_INFO:  //hap_id // read_id // hap_len // read_len // y_initial
      begin     
        if(info_cont == 8'd13) begin 
          next_sta = SEND_R_H; 
        end               
      end   
       
    SEND_R_H:   
      begin 
        if(r_h_cont == 8'd12) begin
        	next_sta = SEND_R_H_DONE;
        end 	        	 
      end  
       
    SEND_R_H_DONE:   
      begin 
      	if(hap_len_cont == hap_len) begin
        	next_sta = SEND_P;      		
        end else begin
        	next_sta = SEND_R_H;          	       
        end 
      end  
       
    SEND_P:   
      begin 
        if(p_cont == 8'd12) begin
        	next_sta = SEND_P_DONE;
        end 	        	 
      end         
       
    SEND_P_DONE:
      begin
      	if(p_len_cont == read_len) begin
      		next_sta = CONT_HAP;
      	end else begin
      		next_sta = SEND_P;
      	end       	
      end 	
       
    CONT_HAP:   
      begin
      	  next_sta = JUDGE_HAP;      	
      end 	
      	       
    JUDGE_HAP:   
      begin
      	if(hap_num_cont == hap_num) begin
      		next_sta = CONT_READ;   
      	end else begin
      		next_sta = IDLE;         			
      	end	      		
      end
             
    CONT_READ:  
      begin
      	  next_sta = JUDGE_READ;        	
      end
             
    JUDGE_READ:   
      begin
      	if(read_num_cont == read_num) begin
      		next_sta = DONE;   
      	end else begin
      		next_sta = IDLE;         			
      	end	        	
      end       
       
    DONE:
      begin
      	  next_sta = IDLE;
      end 
  
  endcase
end


//-------------------------------------------------------------------------------------------

//send head
always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    head_cont <=#D 8'd0;
  end else if(head_cont == 8'd5) begin
    head_cont <=#D 8'd0;
  end else if(curr_sta == SEND_HEAD) begin
  	head_cont <=#D head_cont + 1;
  end else begin
    head_cont <=#D 8'd0;  	
  end 	  		
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    head_ram_raddr_reg <=#D 3'd6;
  end else if(curr_sta == IDLE) begin
    head_ram_raddr_reg <=#D 3'd6;
  end else if(head_cont == 8'd1) begin
  	head_ram_raddr_reg <=#D head_ram_raddr_reg - 1;
  end
end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    head_ram_ren_reg <=#D 1'b0;
  end else begin
    head_ram_ren_reg <=#D (head_cont == 8'd1);
  end
end

//------------------------------------------------------------------------------

//send info
//hap_id // read_id // hap_len // read_len // y_initial


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    info_cont <=#D 8'd0;
  end else if(info_cont == 8'd13 ) begin    
    info_cont <=#D 8'd0;
  end else if(curr_sta == SEND_INFO) begin
  	info_cont <=#D info_cont + 1;
  end else begin
    info_cont <=#D 8'd0;  	
  end 	  		
end


//hap

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_base_addr <=#D 17'd0;
  end else if(curr_sta == CONT_READ) begin 
    hap_base_addr <=#D 17'd0;  	
  end else if(curr_sta == CONT_HAP) begin   
    hap_base_addr <=#D hap_base_addr + 17'd400;    	
  end
end 


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_ram_ren_reg <=#D 1'b0;
  end else if((info_cont >= 8'd1) && (info_cont <= 8'd4)) begin   
    hap_ram_ren_reg <=#D 1'b1;    	
  end else if(~(hap_len_cont == hap_len) && (r_h_cont == 8'd1)) begin
    hap_ram_ren_reg <=#D 1'b1;    	  
  end else if(~(hap_len_cont == hap_len) && (r_h_cont == 8'd6)) begin
    hap_ram_ren_reg <=#D 1'b1;  
  end else begin
    hap_ram_ren_reg <=#D 1'b0;  	
  end 	  	
end 


always@(posedge sys_clk or negedge sys_rst_n)        
begin
  if(!sys_rst_n)begin	
    hap_ram_raddr_reg <=#D 17'd0;
  end else if(curr_sta == IDLE) begin
    hap_ram_raddr_reg <=#D 17'd0;  	
  end else if(info_cont == 8'd1) begin
    hap_ram_raddr_reg <=#D hap_base_addr;
  end else if(info_cont == 8'd2) begin
    hap_ram_raddr_reg <=#D hap_base_addr + 1;
  end else if(info_cont == 8'd3) begin
    hap_ram_raddr_reg <=#D hap_base_addr + 2;
  end else if(info_cont == 8'd4) begin
    hap_ram_raddr_reg <=#D hap_base_addr + 3;
  end else if(~(hap_len_cont == hap_len) && (r_h_cont == 8'd1)) begin
  	hap_ram_raddr_reg <=#D hap_ram_raddr_reg + 1;          
  end else if(~(hap_len_cont == hap_len) && (r_h_cont == 8'd6)) begin
  	hap_ram_raddr_reg <=#D hap_ram_raddr_reg + 1; 
  end 
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_id_temp[15:8] <=#D 8'd0;
  end else if(info_cont == 8'd4) begin
    hap_id_temp[15:8] <=#D hap_data;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_id_temp[7:0] <=#D 8'd0;
  end else if(info_cont == 8'd5) begin
    hap_id_temp[7:0] <=#D hap_data;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_id <=#D 8'd0;
  end else begin
    hap_id <=#D hap_id_temp - 1;
  end
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_len[15:8] <=#D 8'd0;
  end else if(info_cont == 8'd6) begin
    hap_len[15:8] <=#D hap_data;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_len[7:0] <=#D 8'd0;
  end else if(info_cont == 8'd7) begin
    hap_len[7:0] <=#D hap_data;
  end
end


//read

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_base_addr <=#D 13'd0;         
  end else if(curr_sta == DONE) begin
    read_base_addr <=#D 13'd0;  	
  end else if(curr_sta == CONT_READ) begin   
    read_base_addr <=#D read_base_addr + 13'd80;    	
  end
end 


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_ram_ren_reg <=#D 1'b0;
  end else if((info_cont >= 8'd1) && (info_cont <= 8'd4)) begin   
    read_ram_ren_reg <=#D 1'b1;    	
  end else if(~(read_len_cont == read_len) && (r_h_cont == 8'd1)) begin
    read_ram_ren_reg <=#D 1'b1;    	  
  end else if(~(read_len_cont == read_len) && (r_h_cont == 8'd6)) begin
    read_ram_ren_reg <=#D 1'b1;  
  end else begin
    read_ram_ren_reg <=#D 1'b0;  	
  end 	    
end 

always@(posedge sys_clk or negedge sys_rst_n)       
begin
  if(!sys_rst_n)begin	
    read_ram_raddr_reg <=#D 13'd0;
  end else if(curr_sta == IDLE) begin
    read_ram_raddr_reg <=#D 13'd0;  
  end else if(info_cont == 8'd1) begin
    read_ram_raddr_reg <=#D read_base_addr;
  end else if(info_cont == 8'd2) begin
    read_ram_raddr_reg <=#D read_base_addr + 1;
  end else if(info_cont == 8'd3) begin
    read_ram_raddr_reg <=#D read_base_addr + 2;
  end else if(info_cont == 8'd4) begin
    read_ram_raddr_reg <=#D read_base_addr + 3;
  end else if(~(read_len_cont == read_len) && (r_h_cont == 8'd1)) begin
  	read_ram_raddr_reg <=#D read_ram_raddr_reg + 1;
  end else if(~(read_len_cont == read_len) && (r_h_cont == 8'd6)) begin
  	read_ram_raddr_reg <=#D read_ram_raddr_reg + 1;  		
  end 	
  	          
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_id_temp[15:8] <=#D 8'd0;
  end else if(info_cont == 8'd4) begin
    read_id_temp[15:8] <=#D read_data;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_id_temp[7:0] <=#D 8'd0;
  end else if(info_cont == 8'd5) begin
    read_id_temp[7:0] <=#D read_data;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_id <=#D 8'd0;
  end else begin
    read_id <=#D read_id_temp - 1;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_len[15:8] <=#D 8'd0;
  end else if(info_cont == 8'd6) begin
    read_len[15:8] <=#D read_data;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_len[7:0] <=#D 8'd0;
  end else if(info_cont == 8'd7) begin
    read_len[7:0] <=#D read_data;
  end
end

//y_initial 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    rom_y_ini_rden <=#D 1'b0;
  end else if(info_cont == 8'd8) begin
    rom_y_ini_rden <=#D 1'b1;    
  end else begin
    rom_y_ini_rden <=#D 1'b0;
  end     	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    rom_y_ini_addr <=#D 9'd0;
  end else if(info_cont == 8'd8) begin
    rom_y_ini_addr <=#D hap_len[8:0];
  end else begin
  	rom_y_ini_addr <=#D 9'd0;
  end 	
end


rom_y_initial u_rom_y_initial (
	.clock  (sys_clk       ),
	.rden   (rom_y_ini_rden),
	.address(rom_y_ini_addr),
	.q      (rom_y_ini_data)
);


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    y_initial <=#D 32'd0;
  end else if(info_cont == 8'd11) begin
    y_initial <=#D rom_y_ini_data;
  end else if(curr_sta == IDLE) begin
  	y_initial <=#D 32'd0;
  end 	  	
end

//------------------------------------------------------------------------------
//send r_h_cont

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    r_h_cont <=#D 8'd0;
  end else if(r_h_cont == 8'd12) begin    
    r_h_cont <=#D 8'd0;
  end else if(curr_sta == SEND_R_H ) begin
  	r_h_cont <=#D r_h_cont + 1;
  end else begin
    r_h_cont <=#D 8'd0;  	
  end 	  		
end

// read
always@(posedge sys_clk or negedge sys_rst_n)    
begin
  if(!sys_rst_n)begin	
    read_len_cont <=#D 16'd0;
  end else if(curr_sta == IDLE) begin
  	read_len_cont <=#D 16'd0;  
  end else if(~(read_len_cont == read_len) && ((r_h_cont == 8'd5) || (r_h_cont == 8'd10))) begin
    read_len_cont <=#D read_len_cont + 1;
  end
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    r_h_data[31:24] <=#D 8'd0;
  end else if((r_h_cont == 8'd4) && ~(read_len_cont == read_len)) begin
    r_h_data[31:24] <=#D read_data;   
  end else if(r_h_cont == 8'd4) begin
  	r_h_data[31:24] <=#D 8'd0;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    r_h_data[23:16] <=#D 8'd0;
  end else if((r_h_cont == 8'd9) && ~(read_len_cont == read_len)) begin
    r_h_data[23:16] <=#D read_data;   
  end else if(r_h_cont == 8'd9) begin
  	r_h_data[23:16] <=#D 8'd0;
  end 	
end

//hap
always@(posedge sys_clk or negedge sys_rst_n)   
begin
  if(!sys_rst_n)begin	
    hap_len_cont <=#D 16'd0;
  end else if(curr_sta == IDLE) begin
    hap_len_cont <=#D 16'd0;    
  end else if(~(hap_len_cont == hap_len) && ((r_h_cont == 8'd5) || (r_h_cont == 8'd10))) begin
    hap_len_cont <=#D hap_len_cont + 1;
  end
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    r_h_data[15:8] <=#D 8'd0;
  end else if((r_h_cont == 8'd4) && ~(hap_len_cont == hap_len)) begin
    r_h_data[15:8] <=#D hap_data;   
  end else if(r_h_cont == 8'd4) begin
  	r_h_data[15:8] <=#D 8'd0;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    r_h_data[7:0] <=#D 8'd0;
  end else if((r_h_cont == 8'd9) && ~(hap_len_cont == hap_len)) begin
    r_h_data[7:0] <=#D hap_data;   
  end else if(r_h_cont == 8'd9) begin
  	r_h_data[7:0] <=#D 8'd0;
  end 	
end

//-------------------------------------------------------------------------------
//send p

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    p_cont <=#D 8'd0;
  end else if(p_cont == 8'd12) begin               
    p_cont <=#D 8'd0;
  end else if(curr_sta == SEND_P ) begin
  	p_cont <=#D p_cont + 1;
  end else begin
    p_cont <=#D 8'd0;  	
  end 	  		
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    p_base_addr <=#D 13'd0;         
  end else if(curr_sta == DONE) begin
    p_base_addr <=#D 13'd0;  	
  end else if(curr_sta == CONT_READ) begin   
    p_base_addr <=#D p_base_addr + 13'd76;    	
  end
end 


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    p_ram_ren_reg <=#D 1'b0;
  end else begin
    p_ram_ren_reg <=#D (p_cont == 8'd1);
  end 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n) begin	
    p_len_cont <=#D 16'd0;
  end else if(curr_sta == IDLE) begin
    p_len_cont <=#D 16'd0;   
  end else if(p_ram_ren_reg) begin
    p_len_cont <=#D p_len_cont + 1;
  end      	
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    p_ram_raddr_reg <=#D 13'd0;
  end else if(curr_sta == IDLE) begin
    p_ram_raddr_reg <=#D p_base_addr;
  end else if(curr_sta == SEND_P_DONE) begin                            
  	p_ram_raddr_reg <=#D p_ram_raddr_reg + 1;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    p0 <=#D 32'd0;
    p1 <=#D 32'd0;
    p2 <=#D 32'd0;
    p3 <=#D 32'd0;
    p4 <=#D 32'd0;
    p5 <=#D 32'd0;
    p6 <=#D 32'd0;
  end else if(p_cont == 8'd4) begin
    p0 <=#D p0_ram_rdat;
    p1 <=#D p1_ram_rdat;
    p2 <=#D p2_ram_rdat;
    p3 <=#D p3_ram_rdat;
    p4 <=#D p4_ram_rdat;
    p5 <=#D p5_ram_rdat;
    p6 <=#D p6_ram_rdat;
  end
end


//-------------------------------------------------------------------------------


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    hap_num_cont <=#D 16'd0;
  end else if(curr_sta == CONT_READ) begin
    hap_num_cont <=#D 16'd0;   
  end else if(curr_sta == CONT_HAP) begin
    hap_num_cont <=#D hap_num_cont + 1;     	
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_num_cont <=#D 16'd0;
  end else if(curr_sta == DONE) begin
    read_num_cont <=#D 16'd0;   
  end else if(curr_sta == CONT_READ) begin
    read_num_cont <=#D read_num_cont + 1;     	
  end 	
end


//-------------------------------------------------------------------------------

always@(posedge sys_clk or negedge sys_rst_n)                   
begin
  if(!sys_rst_n)begin	
    fifo_write_en <=#D 1'b0;
  end else if(head_cont == 8'd4) begin
    fifo_write_en <=#D 1'b1;
  end else if(info_cont == 8'd7) begin
    fifo_write_en <=#D 1'b1;  	
  end else if(info_cont == 8'd8) begin
    fifo_write_en <=#D 1'b1;  	  	
  end else if(info_cont == 8'd12) begin
    fifo_write_en <=#D 1'b1;  	  	
  end else if(r_h_cont == 8'd11) begin
    fifo_write_en <=#D 1'b1;  	  	  	
  end else if((p_cont>=8'd5) && (p_cont<=8'd11)) begin
    fifo_write_en <=#D 1'b1;    	
  end else begin 
    fifo_write_en <=#D 1'b0;    	  	 	 	  	
  end 
end 


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    fifo_data_in[33:32] <=#D 2'd0;
  end else if((head_cont == 8'd4) && (head_ram_raddr_reg == 3'd5)) begin
    fifo_data_in[33:32] <=#D 2'b10;
  end else if((p_len_cont == read_len) && (p_cont == 8'd11)) begin             
  	fifo_data_in[33:32] <=#D 2'b01;
  end else begin
  	fifo_data_in[33:32] <=#D 2'd0;  	
  end 	  	
end 


always@(posedge sys_clk or negedge sys_rst_n)         
begin
  if(!sys_rst_n)begin	
    fifo_data_in[31:0] <=#D 32'd0;
  end else if(head_cont == 8'd4) begin
    fifo_data_in[31:0] <=#D head_data;
  end else if(info_cont == 8'd7) begin
    fifo_data_in[31:0] <=#D {hap_id,read_id};
  end else if(info_cont == 8'd8) begin
    fifo_data_in[31:0] <=#D {hap_len,read_len};  	    	
  end else if(info_cont == 8'd12) begin
    fifo_data_in[31:0] <=#D y_initial;
  end else if(r_h_cont == 8'd11) begin   	
    fifo_data_in[31:0] <=#D r_h_data;  	  	
  end else if(p_cont == 8'd5) begin
  	fifo_data_in[31:0] <=#D p0;
  end else if(p_cont == 8'd6) begin
  	fifo_data_in[31:0] <=#D p1;	
  end else if(p_cont == 8'd7) begin
  	fifo_data_in[31:0] <=#D p2;  	
  end else if(p_cont == 8'd8) begin
  	fifo_data_in[31:0] <=#D p3;  	
  end else if(p_cont == 8'd9) begin
  	fifo_data_in[31:0] <=#D p4;  	
  end else if(p_cont == 8'd10) begin
  	fifo_data_in[31:0] <=#D p5;  	
  end else if(p_cont == 8'd11) begin
  	fifo_data_in[31:0] <=#D p6;  	
  end else begin
    fifo_data_in[31:0] <=#D 32'd0;  		
  end     	
end 



fifo_8192x34 u0 (
	 .data (fifo_data_in ), 
	 .wrreq(fifo_write_en), 
	 .rdreq(fifo_read_en ), 
	 .clock(sys_clk      ), 
	 .q    (fifo_data_out), 
	 .usedw(usedw        ),
	 .full (full         ), 
	 .empty(empty        )  
);

	
assign  save_one_pkt = ((fifo_write_en) && (fifo_data_in[33:32] == 2'b01));   //eop

assign  send_one_pkt = ((fifo_read_en) && (fifo_data_out[33:32] == 2'b10));   //sop




always@(posedge sys_clk or negedge sys_rst_n)        
begin
  if(!sys_rst_n)begin	
    pkt_pointer <=#D 32'd0;
  end else if(save_one_pkt && ~send_one_pkt) begin
    pkt_pointer <=#D pkt_pointer + 1;  
  end else if(~save_one_pkt && send_one_pkt) begin
    pkt_pointer <=#D pkt_pointer - 1;    	
  end 	  	
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    fifo_read_en <=#D 1'b0;
  end else if(fifo_data_out[33:32] == 2'b01) begin
     fifo_read_en <=#D 1'b0; 
  end else if(matrix_enable && (|pkt_pointer)) begin
     fifo_read_en <=#D 1'b1;   	
  end
end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_fifo_data_out <=#D 34'd0;
  end else if(fifo_read_en) begin
    f0_fifo_data_out <=#D fifo_data_out;
  end else begin
    f0_fifo_data_out <=#D 34'd0;  	
  end 	  	
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_sop <=#D 1'b0;
  end else if(f0_fifo_data_out[33:32] == 2'b10) begin
    pkt_sop <=#D 1'b1;  
  end else begin
    pkt_sop <=#D 1'b0;  	
  end
end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_eop <=#D 1'b0;
  end else if(f0_fifo_data_out[33:32] == 2'b01) begin
    pkt_eop <=#D 1'b1;  
  end else begin
    pkt_eop <=#D 1'b0;  	
  end
end 


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_vld <=#D 1'b0;
  end else if(pkt_eop) begin
    pkt_vld <=#D 1'b0;  
  end else if(f0_fifo_data_out[33:32] == 2'b10) begin
    pkt_vld <=#D 1'b1;    	
  end
end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_dat <=#D 32'd0;
  end else begin
    pkt_dat <=#D f0_fifo_data_out[31:0];  
  end
end



//-------------------------------------------------------------------------------------

assign head_ram_ren     =  head_ram_ren_reg;
assign head_ram_raddr   =  head_ram_raddr_reg;
//
assign hap_ram_ren      =  hap_ram_ren_reg;
assign hap_ram_raddr    =  hap_ram_raddr_reg;
//            
assign read_ram_ren     =  read_ram_ren_reg;
assign read_ram_raddr   =  read_ram_raddr_reg;
//          
assign p_ram_raddr      =  p_ram_raddr_reg;
assign p_ram_ren        =  p_ram_ren_reg;
//
assign	data = pkt_dat;
assign	sop  = pkt_sop;
assign	eop  = pkt_eop;
assign	vld  = pkt_vld;
//
assign  all_write_finished = (curr_sta == DONE);



endmodule 