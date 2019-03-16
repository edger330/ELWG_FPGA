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
module read_analyze (
sys_clk,
sys_rst_n,
start,
cpu_pkt_ram_rdat,
cpu_pkt_ram_raddr,
cpu_pkt_ram_ren,
read_ram_ren,
read_ram_raddr,
read_data,
read_num,
start_get_read_addr,
p_ram_ren,
p_ram_addr,
p0_ram_rdat,
p1_ram_rdat,
p2_ram_rdat,
p3_ram_rdat,
p4_ram_rdat,
p5_ram_rdat,
p6_ram_rdat,
done
);
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 2;

parameter IDLE           =8'b0000_0001;
parameter GET_READ_LEN   =8'b0000_0010;
parameter COUNT_ONE_READ =8'b0000_0100;
parameter WAIT_SAVING_0  =8'b0000_1000;
parameter GET_READ       =8'b0001_0000;
parameter WAIT_SAVING_1  =8'b0010_0000;
parameter GET_P          =8'b0100_0000;
parameter JUDGE          =8'b1000_0000;
parameter DONE           =8'b1111_1111;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
//global signal
input               sys_clk;
input               sys_rst_n;
input               start;

input     [7:0]     cpu_pkt_ram_rdat;
output    [17:0]    cpu_pkt_ram_raddr;
output              cpu_pkt_ram_ren;

input               read_ram_ren;
input     [12:0]    read_ram_raddr;
output    [7:0]     read_data;
output    [15:0]    read_num;

input     [17:0]    start_get_read_addr;
  
input               p_ram_ren;
input     [12:0]    p_ram_addr;
output    [31:0]    p0_ram_rdat;
output    [31:0]    p1_ram_rdat;
output    [31:0]    p2_ram_rdat;
output    [31:0]    p3_ram_rdat;
output    [31:0]    p4_ram_rdat;
output    [31:0]    p5_ram_rdat;
output    [31:0]    p6_ram_rdat;


output              done;
/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/
reg                 f0_start;
reg                 f1_start;

reg        [7:0]    curr_sta; 		
reg        [7:0]    next_sta;

reg        [17:0]   cpu_pkt_ram_raddr_reg0;  // get read_num
reg                 cpu_pkt_ram_ren_reg0; 

reg        [17:0]   cpu_pkt_ram_raddr_reg1;  // get read_len and read
reg                 cpu_pkt_ram_ren_reg1; 

reg        [17:0]   cpu_pkt_ram_raddr_reg2;  // get q i d c 
reg                 cpu_pkt_ram_ren_reg2; 
  
reg                 get_read_num_flag;

reg        [2:0]    count1;
reg        [3:0]    count2;
reg        [2:0]    count3;
reg        [3:0]    count4;
reg        [3:0]    count5;

reg        [15:0]   read_num;
reg        [15:0]   read_len; 
reg        [15:0]   read_cont;
reg        [15:0]   read_element_cont; 
reg        [7:0]    read_element;

reg                 get_read_start;

reg                 f0_get_read_flag;
reg                 f1_get_read_flag;
reg                 f2_get_read_flag;
reg                 f3_get_read_flag;
reg                 f4_get_read_flag;
reg                 f5_get_read_flag;

reg        [17:0]   get_read_base_addr;
reg        [12:0]   save_read_base_addr;

reg        [12:0]   read_ram_waddr;
reg        [7:0]    read_ram_wdat;
reg                 read_ram_wen;
wire                read_saving_done;

reg        [7:0]    q_data;
reg        [7:0]    i_data;
reg        [7:0]    d_data;
reg        [7:0]    c_data;

reg                 get_qidc_flag;
reg        [17:0]   get_qidc_start_addr;

reg        [7:0]    p_done_cont;

reg                 done_reg;
//----------------------------------------------------------

wire calculate_p_start;
wire calculate_p_done;
reg  f0_calculate_p_done;


wire [31:0]    p0;
wire [31:0]    p1;
wire [31:0]    p2;
wire [31:0]    p3;
wire [31:0]    p4;
wire [31:0]    p5;
wire [31:0]    p6;

reg [12:0] p_ram_waddr;
reg  [6:0] p_ram_wen;

reg [31:0] p0_ram_wdat;
reg [12:0] p0_ram_waddr;

reg [31:0] p1_ram_wdat;
reg [12:0] p1_ram_waddr;

reg [31:0] p2_ram_wdat;
reg [12:0] p2_ram_waddr;

reg [31:0] p3_ram_wdat;
reg [12:0] p3_ram_waddr;

reg [31:0] p4_ram_wdat;
reg [12:0] p4_ram_waddr;

reg [31:0] p5_ram_wdat;
reg [12:0] p5_ram_waddr;

reg [31:0] p6_ram_wdat;
reg [12:0] p6_ram_waddr;

//--------------------------------------------------------------


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
    get_read_num_flag <=#D 1'b0;
  end else if (count1 == 3'd5) begin  
  	get_read_num_flag <=#D 1'b0;	  
  end else if (f0_start && ~f1_start) begin
    get_read_num_flag <=#D 1'b1;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    count1 <=#D 3'd0;
  end else if (count1 == 3'd5) begin 
    count1 <=#D 3'd0;
  end else if(get_read_num_flag) begin
    count1 <=#D count1 + 1; 
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_raddr_reg0 <=#D 18'd0;
  end else if (count1==0 && get_read_num_flag) begin
    cpu_pkt_ram_raddr_reg0 <=#D start_get_read_addr + 1;
  end else if (count1==1 && get_read_num_flag) begin
  	cpu_pkt_ram_raddr_reg0 <=#D start_get_read_addr + 2;
  end	else begin 
  	cpu_pkt_ram_raddr_reg0 <=#D 18'd0;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_ren_reg0 <=#D 1'b0;
  end else if ((count1==0 && get_read_num_flag) || (count1==1 && get_read_num_flag)) begin
    cpu_pkt_ram_ren_reg0 <=#D 1'b1;
  end else begin
    cpu_pkt_ram_ren_reg0 <=#D 1'b0; 
  end 	 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_num[15:8] <=#D 8'd0;
  end else if (count1 == 3'd3) begin
    read_num[15:8] <=#D cpu_pkt_ram_rdat;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_num[7:0] <=#D 8'd0;
  end else if(count1 == 3'd4) begin
    read_num[7:0] <=#D cpu_pkt_ram_rdat;     
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    get_read_start <=#D 1'b0;
  end else if(count1==3'd5) begin
    get_read_start <=#D 1'b1;
  end else begin
  	get_read_start <=#D 1'b0;
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
	      if (get_read_start) begin
				  next_sta = GET_READ_LEN;
			  end	
		  end	

    GET_READ_LEN:
      begin
      	if (count2 == 4'd6) begin
      		next_sta = COUNT_ONE_READ;
        end	
      end
      
    COUNT_ONE_READ:
    // one cycle
      begin 
        	next_sta = WAIT_SAVING_0;
      end 	
    
    WAIT_SAVING_0:
      begin
        if (count3 == 3'd5) begin
        	next_sta = GET_READ;
		    end   	
      end 
       
//-------------------------------------------------------------------       
              
    GET_READ:
      begin 
        if (read_element_cont == read_len_reg-1) begin
        	next_sta = WAIT_SAVING_1; 
        end
      end  
           
    WAIT_SAVING_1:               
      begin     
        if (read_saving_done) begin
        	next_sta = GET_P;  
        end 		
      end                  
                                    
    GET_P:
      begin          
        if (p_done_cont == read_len_reg) begin
        	next_sta = JUDGE;
        end    
      end         
               
    JUDGE:
      begin
        if (read_cont == read_num) begin
          next_sta = DONE;
        end else begin
          next_sta = GET_READ_LEN;
        end
      end 	
                                   
    DONE:
    // one cycle
      begin
          next_sta = IDLE;
      end

  endcase 
end

//-----------------------------------------------------------------------------------------------
//get read_len and read 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    get_read_base_addr <=#D 18'd0;
  end else if (curr_sta == IDLE) begin
    get_read_base_addr <=#D start_get_read_addr + 2;          
  end else if ((curr_sta == GET_READ)&&(read_element_cont == read_len_reg-1)) begin   ////////////////////////////////////
  	get_read_base_addr <=#D get_read_base_addr + read_len_reg + read_len_reg + read_len_reg + read_len_reg + read_len_reg + 2;                   ////////////////////////////////////
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    count2 <=#D 4'd0;
  end else if (count2 == 4'd6) begin
    count2 <=#D 4'd0;                           
  end else if (curr_sta == GET_READ_LEN)begin
  	count2 <=#D count2 + 1;
  end 	
end  

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_len[15:8] <=#D 8'd0;
  end else if (read_len[15:8] == 8'hff) begin 
    read_len[15:8] <=#D 8'd0;    
  end else if (curr_sta == JUDGE) begin 
    read_len[15:8] <=#D 8'd0;   
  end else if(count2 == 4'd4) begin
    read_len[15:8] <=#D cpu_pkt_ram_rdat;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_len[7:0] <=#D 8'd0;
  end else if (read_len[7:0] == 8'hff) begin 
    read_len[7:0] <=#D 8'd0;    
  end else if (curr_sta == JUDGE) begin 
    read_len[7:0] <=#D 8'd0; 	 	 
  end else if(count2 == 4'd5) begin
    read_len[7:0] <=#D cpu_pkt_ram_rdat;
  end
end


reg  [15:0]   read_len_reg;

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_len_reg <=#D 16'd0;
  end else if (curr_sta == JUDGE) begin
    read_len_reg <=#D 16'd0;    
  end else if(curr_sta == COUNT_ONE_READ) begin
    read_len_reg <=#D read_len;
  end
end


////****************************************************
//reg   [7:0]    f0_cpu_pkt_ram_rdat;
//
//(*noprune*)reg   [7:0]    f1_cpu_pkt_ram_rdat;
//
//
//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    f0_cpu_pkt_ram_rdat <=#D 8'd0;
//  end else begin
//    f0_cpu_pkt_ram_rdat <=#D cpu_pkt_ram_rdat;
//  end
//end
//
//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    f1_cpu_pkt_ram_rdat <=#D 8'd0;
//  end else begin
//    f1_cpu_pkt_ram_rdat <=#D f0_cpu_pkt_ram_rdat;
//  end
//end
//
//
////****************************************************



always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_cont <=#D 16'd0;
  end else if (curr_sta==DONE) begin
    read_cont <=#D 16'd0;
  end else if (curr_sta==COUNT_ONE_READ) begin
  	read_cont <=#D read_cont + 1; 
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_element_cont <=#D 16'd0;
  end else if (read_element_cont == read_len_reg-1) begin
    read_element_cont <=#D 16'd0;
  end else if (curr_sta == GET_READ) begin
  	read_element_cont <=#D read_element_cont + 1;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_get_read_flag <=#D 1'b0;
    f1_get_read_flag <=#D 1'b0;
    f2_get_read_flag <=#D 1'b0;    
    f3_get_read_flag <=#D 1'b0;
    f4_get_read_flag <=#D 1'b0;    
    f5_get_read_flag <=#D 1'b0;    
  end else begin
    f0_get_read_flag <=#D (curr_sta == GET_READ);
    f1_get_read_flag <=#D f0_get_read_flag;
    f2_get_read_flag <=#D f1_get_read_flag; 
    f3_get_read_flag <=#D f2_get_read_flag; 
    f4_get_read_flag <=#D f3_get_read_flag; 
    f5_get_read_flag <=#D f4_get_read_flag;        
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_element <=#D 8'd0;
  end else if (f2_get_read_flag) begin         
    read_element <=#D cpu_pkt_ram_rdat;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)                      
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_raddr_reg1 <=#D 18'd0;
  end else if (count2 == 4'd1) begin
    cpu_pkt_ram_raddr_reg1 <=#D get_read_base_addr + 1;    
  end else if (count2 == 4'd2) begin
    cpu_pkt_ram_raddr_reg1 <=#D get_read_base_addr + 2;  
  end  else if (curr_sta == GET_READ) begin
  	cpu_pkt_ram_raddr_reg1 <=#D cpu_pkt_ram_raddr_reg1 + 1;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)                       
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_ren_reg1 <=#D 1'b0;
  end else if (count2 == 4'd1 || count2 == 4'd2) begin
    cpu_pkt_ram_ren_reg1 <=#D 1'b1;
  end else if (curr_sta == GET_READ) begin
    cpu_pkt_ram_ren_reg1 <=#D 1'b1;  	 
  end else begin
    cpu_pkt_ram_ren_reg1 <=#D 1'b0;  	
  end  
end


//-----------------------------------------------------------------------
//save read process 
//save read_num*(read_id[2byte] + read_len[2byte] + read[read_len] < 80byte)

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    save_read_base_addr <=#D 13'd0;
  end else if(curr_sta == IDLE) begin
    save_read_base_addr <=#D 13'd0;
  end else if (read_saving_done) begin
  	save_read_base_addr <=#D save_read_base_addr + 13'd80;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n) begin	
    count3 <=#D 3'd0;
  end else if (count3 == 3'd5) begin                             
    count3 <=#D 3'd0;
  end else if (curr_sta == WAIT_SAVING_0) begin
  	count3 <=#D count3 + 1;  	
  end	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_ram_waddr <=#D 13'd0;
  end else if (count3 == 3'd1) begin
    read_ram_waddr <=#D save_read_base_addr;
  end else if (count3 == 3'd2) begin
  	read_ram_waddr <=#D save_read_base_addr + 1; 
  end else if (count3 == 3'd3) begin
  	read_ram_waddr <=#D save_read_base_addr + 2;   		
  end else if (count3 == 3'd4) begin
  	read_ram_waddr <=#D save_read_base_addr + 3;
  end	else if (f3_get_read_flag) begin
  	read_ram_waddr <=#D read_ram_waddr + 1;
  end 	   	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_ram_wdat <=#D 8'd0;
  end else if (count3 == 3'd1) begin
    read_ram_wdat <=#D read_cont[15:8];  //read_id[15:8]
  end else if (count3 == 3'd2) begin   
  	read_ram_wdat <=#D read_cont[7:0];   //read_id[7:0]
  end else if (count3 == 3'd3) begin
  	read_ram_wdat <=#D read_len[15:8];   		
  end else if (count3 == 3'd4) begin
  	read_ram_wdat <=#D read_len[7:0];
  end	else  begin  //f2_get_read_flag
  	read_ram_wdat <=#D read_element;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    read_ram_wen <=#D 1'b0;
  end else if ((count3 >=3'd1)&&(count3 <=3'd4)) begin
    read_ram_wen <=#D 1'b1; 
  end else if (f3_get_read_flag) begin   
    read_ram_wen <=#D 1'b1;  
  end else begin
    read_ram_wen <=#D 1'b0;
  end    	
end


assign read_saving_done = (~f4_get_read_flag && f5_get_read_flag);

ram_2_port_8192x8 u_read_ram(
	.data      (read_ram_wdat),
	.wraddress (read_ram_waddr),  // [12:0]
	.rdaddress (read_ram_raddr),  // [12:0]
	.wren      (read_ram_wen),
	.clock     (sys_clk),
	.rden      (read_ram_ren),
	.q         (read_data)
	);

//--------------------------------------------------------------------------------

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    get_qidc_start_addr <=#D 18'd0;
  end else if(read_saving_done) begin
    get_qidc_start_addr <=#D cpu_pkt_ram_raddr_reg1 + 1;   /////////////////////////////////////////////
  end else if(calculate_p_done) begin
    get_qidc_start_addr <=#D get_qidc_start_addr + 1;      /////////////////////////////////////////////
  end       	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
  	get_qidc_flag <=#D 1'b0;    
  end else if(count4 == 4'd8) begin                     ////////////////////////////////////////////////////////
  	get_qidc_flag <=#D 1'b0;              ////////////////////////////////////////////////////////
  end else if (read_saving_done || (calculate_p_done && (p_done_cont < (read_len_reg-1)))) begin
  	get_qidc_flag <=#D 1'b1;
  end 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    count4 <=#D 4'd0;
  end else if(count4 == 4'd8) begin
    count4 <=#D 4'd0;
  end else if(get_qidc_flag) begin
  	count4 <=#D count4 + 1;
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_raddr_reg2 <=#D 18'd0;
  end else case (count4)
    4'd1: cpu_pkt_ram_raddr_reg2 <=#D get_qidc_start_addr;
    4'd2: cpu_pkt_ram_raddr_reg2 <=#D cpu_pkt_ram_raddr_reg2 + read_len_reg;
    4'd3: cpu_pkt_ram_raddr_reg2 <=#D cpu_pkt_ram_raddr_reg2 + read_len_reg;
    4'd4: cpu_pkt_ram_raddr_reg2 <=#D cpu_pkt_ram_raddr_reg2 + read_len_reg;
    default: cpu_pkt_ram_raddr_reg2 <=#D 18'd0;     
  endcase 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    cpu_pkt_ram_ren_reg2 <=#D 1'b0; 
  end else if ((count4>=4'd1)&&(count4<=4'd4)) begin
    cpu_pkt_ram_ren_reg2 <=#D 1'b1;
  end else begin
    cpu_pkt_ram_ren_reg2 <=#D 1'b0;
  end   	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    q_data <=#D 8'd0;
  end else if(count4 == 4'd4) begin
    q_data <=#D cpu_pkt_ram_rdat;
  end
end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    i_data <=#D 8'd0;
  end else if(count4 == 4'd5) begin
    i_data <=#D cpu_pkt_ram_rdat;
  end
end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    d_data <=#D 8'd0;
  end else if(count4 == 4'd6) begin
    d_data <=#D cpu_pkt_ram_rdat;
  end
end 

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    c_data <=#D 8'd0;
  end else if(count4 == 4'd7) begin
    c_data <=#D cpu_pkt_ram_rdat;
  end
end 


/*------------------------------------------------------------------------------
--  get p
------------------------------------------------------------------------------*/
assign  calculate_p_start = (count4 == 4'd8);

calculate_p calculate_p_inst(
  .sys_clk   (sys_clk),
  .sys_rst_n (sys_rst_n),
  .start     (calculate_p_start),
  .q_data    (q_data),
  .i_data    (i_data),
  .d_data    (d_data),
  .c_data    (c_data),
  .done      (calculate_p_done),
  .p0        (p0),
  .p1        (p1),
  .p2        (p2),
  .p3        (p3),
  .p4        (p4),
  .p5        (p5),
  .p6        (p6)
  );

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    p_done_cont <=#D 8'd0; 
  end else if(p_done_cont == read_len_reg) begin
    p_done_cont <=#D 8'd0;
  end else if(calculate_p_done) begin
    p_done_cont <=#D p_done_cont + 1;
  end  
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin 
    p0_ram_wdat <=#D 32'b0;
    p1_ram_wdat <=#D 32'b0;
    p2_ram_wdat <=#D 32'b0;
    p3_ram_wdat <=#D 32'b0;
    p4_ram_wdat <=#D 32'b0;
    p5_ram_wdat <=#D 32'b0;
    p6_ram_wdat <=#D 32'b0;
  end else if(calculate_p_done) begin
    p0_ram_wdat <=#D p0;
    p1_ram_wdat <=#D p1;
    p2_ram_wdat <=#D p2;
    p3_ram_wdat <=#D p3;
    p4_ram_wdat <=#D p4;
    p5_ram_wdat <=#D p5;
    p6_ram_wdat <=#D p6;
  end
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    p_ram_wen <=#D 7'b0000000;
  end else if(calculate_p_done) begin
    p_ram_wen <=#D 7'b1111111;  
  end else begin
    p_ram_wen <=#D 7'b0000000;
  end     	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin
    p0_ram_waddr <=#D 13'b0;
    p1_ram_waddr <=#D 13'b0;
    p2_ram_waddr <=#D 13'b0;
    p3_ram_waddr <=#D 13'b0;
    p4_ram_waddr <=#D 13'b0;
    p5_ram_waddr <=#D 13'b0;
    p6_ram_waddr <=#D 13'b0;
  end 
  else if(calculate_p_done) begin
    p0_ram_waddr <=#D p_ram_waddr;
    p1_ram_waddr <=#D p_ram_waddr;
    p2_ram_waddr <=#D p_ram_waddr;
    p3_ram_waddr <=#D p_ram_waddr;
    p4_ram_waddr <=#D p_ram_waddr;
    p5_ram_waddr <=#D p_ram_waddr;
    p6_ram_waddr <=#D p_ram_waddr;
  end
end

reg [12:0] p_ram_waddr_base;
always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin
    p_ram_waddr_base <=#D 13'b0;
  end else if (curr_sta == DONE) begin
    p_ram_waddr_base <=#D 13'b0;  
  end else if(curr_sta == JUDGE) begin 
    p_ram_waddr_base <=#D p_ram_waddr_base + 13'd76;
  end
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_calculate_p_done <=#D 1'b0;
  end else begin
    f0_calculate_p_done <=#D calculate_p_done;
  end
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin
    p_ram_waddr <=#D 13'b0;
  end else if(f0_calculate_p_done) begin
    p_ram_waddr <=#D p_ram_waddr + 1;
  end else if(count2 == 4) begin 
    p_ram_waddr <=#D p_ram_waddr_base;
  end
end

ram_2_port_8192x32 p0_ram(
  .data      (p0_ram_wdat),
  .wraddress (p0_ram_waddr), 
  .rdaddress (p_ram_addr),
  .wren      (p_ram_wen[0]),
  .clock     (sys_clk),
  .rden      (p_ram_ren),
  .q         (p0_ram_rdat)
  );

ram_2_port_8192x32 p1_ram(
  .data      (p1_ram_wdat),
  .wraddress (p1_ram_waddr), 
  .rdaddress (p_ram_addr),
  .wren      (p_ram_wen[1]),
  .clock     (sys_clk),
  .rden      (p_ram_ren),
  .q         (p1_ram_rdat)
  );

ram_2_port_8192x32 p2_ram(
  .data      (p2_ram_wdat),
  .wraddress (p2_ram_waddr), 
  .rdaddress (p_ram_addr),
  .wren      (p_ram_wen[2]),
  .clock     (sys_clk),
  .rden      (p_ram_ren),
  .q         (p2_ram_rdat)
  );

ram_2_port_8192x32 p3_ram(
  .data      (p3_ram_wdat),
  .wraddress (p3_ram_waddr), 
  .rdaddress (p_ram_addr),
  .wren      (p_ram_wen[3]),
  .clock     (sys_clk),
  .rden      (p_ram_ren),
  .q         (p3_ram_rdat)
  );

ram_2_port_8192x32 p4_ram(
  .data      (p4_ram_wdat),
  .wraddress (p4_ram_waddr), 
  .rdaddress (p_ram_addr),
  .wren      (p_ram_wen[4]),
  .clock     (sys_clk),
  .rden      (p_ram_ren),
  .q         (p4_ram_rdat)
  );

ram_2_port_8192x32 p5_ram(
  .data      (p5_ram_wdat),
  .wraddress (p5_ram_waddr), 
  .rdaddress (p_ram_addr),
  .wren      (p_ram_wen[5]),
  .clock     (sys_clk),
  .rden      (p_ram_ren),
  .q         (p5_ram_rdat)
  );

ram_2_port_8192x32 p6_ram(
  .data      (p6_ram_wdat),
  .wraddress (p6_ram_waddr), 
  .rdaddress (p_ram_addr),
  .wren      (p_ram_wen[6]),
  .clock     (sys_clk),  
  .rden      (p_ram_ren),
  .q         (p6_ram_rdat)
  );

/*------------------------------------------------------------------------------
--  Done
------------------------------------------------------------------------------*/
always @(posedge sys_clk or negedge sys_rst_n) begin
  if(!sys_rst_n) begin
    done_reg <=#D 0;
  end else if(curr_sta == DONE) begin
    done_reg <=#D 1;
  end else begin
    done_reg <=#D 0;
  end
end

//-------------------------------------------------------------------------------------------------

assign  cpu_pkt_ram_raddr = (get_read_num_flag)? cpu_pkt_ram_raddr_reg0 : ((curr_sta==GET_P)?cpu_pkt_ram_raddr_reg2 :cpu_pkt_ram_raddr_reg1);
assign  cpu_pkt_ram_ren   = cpu_pkt_ram_ren_reg0 || cpu_pkt_ram_ren_reg1 || cpu_pkt_ram_ren_reg2;
assign  done = done_reg;


endmodule 


