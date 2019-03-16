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
`timescale 1ns/1ps

module data_pkt (
sys_clk,
sys_rst_n,

pcie_ram_ren, 
pcie_ram_raddr,
pcie_ram_rdat,

start_anlysis,
get_data_done,

matrix_enable_0,
matrix_enable_1,
matrix_enable_2,
matrix_enable_3,

pkt_data_0,
pkt_sop_0,
pkt_eop_0,
pkt_vld_0,

pkt_data_1,
pkt_sop_1,
pkt_eop_1,
pkt_vld_1,

pkt_data_2,
pkt_sop_2,
pkt_eop_2,
pkt_vld_2,

pkt_data_3,
pkt_sop_3,
pkt_eop_3,
pkt_vld_3
);
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 1;

parameter IDLE               = 8'b0000_0001;
parameter GET_PKT_NUM        = 8'b0000_0010;
parameter WAIT_ENABLE        = 8'b0000_0100;
parameter GET_DATA_NUM       = 8'b0000_1000;
parameter GET_DATA           = 8'b0001_0000;
parameter JUDGE              = 8'b0010_0000;
parameter DONE               = 8'b0100_0000;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
//global signal

input   wire            sys_clk;
input   wire            sys_rst_n;

output  wire            pcie_ram_ren; 
output  wire  [15:0]    pcie_ram_raddr;
input   wire  [127:0]   pcie_ram_rdat;

input   wire            start_anlysis;
output  wire            get_data_done;

input   wire            matrix_enable_0;
input   wire            matrix_enable_1;
input   wire            matrix_enable_2;
input   wire            matrix_enable_3;

output  wire  [31:0]    pkt_data_0;
output  wire            pkt_sop_0;
output  wire            pkt_eop_0;
output  wire            pkt_vld_0;

output  wire  [31:0]    pkt_data_1;
output  wire            pkt_sop_1;
output  wire            pkt_eop_1;
output  wire            pkt_vld_1;

output  wire  [31:0]    pkt_data_2;
output  wire            pkt_sop_2;
output  wire            pkt_eop_2;
output  wire            pkt_vld_2;

output  wire  [31:0]    pkt_data_3;
output  wire            pkt_sop_3;
output  wire            pkt_eop_3;
output  wire            pkt_vld_3;

/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/
reg       [7:0]     curr_sta;
reg       [7:0]     next_sta;


reg       [15:0]    pcie_ram_wen_cont;
reg       [15:0]    pcie_ram_ren_cont;

reg                 pcie_ram_ren_reg; 
reg       [15:0]    pcie_ram_raddr_reg;

wire                read_pcie_enable; 

reg       [7:0]     counter1;
reg       [31:0]    pkt_num;
reg       [31:0]    pkt_num_cont;

reg       [7:0]     counter2;
reg       [31:0]    data_num;

reg                 get_data_ren;
reg                 f0_get_data_ren;
reg                 f1_get_data_ren;
reg                 f2_get_data_ren;
reg                 f3_get_data_ren;
reg       [15:0]    data_num_cont;

reg                 channel_fifo_free_0;
reg                 channel_fifo_free_1;
reg                 channel_fifo_free_2;
reg                 channel_fifo_free_3;
reg                 channel_fifo_free;

reg                 f0_channel_fifo_free_0;
reg                 f0_channel_fifo_free_1;
reg                 f0_channel_fifo_free_2;
reg                 f0_channel_fifo_free_3;

wire                wrfull_0;   
wire                wrempty_0;   
wire      [7:0]     wrusedw_0;  
wire                rdempty_0;   
wire      [9:0]     rdusedw_0;  
reg                 wen_0;
reg       [127:0]   wdat_0;
wire                select_fifo_0;
wire                start_read_fifo_0;         //sys_clk
//wire                a_start_read_fifo_0;       //sys_clk
reg                 f0_start_read_fifo_0;    //sys_clk
wire                start_one_pkt_0;

wire                wrfull_1;   
wire                wrempty_1;   
wire      [7:0]     wrusedw_1;  
wire                rdempty_1;   
wire      [9:0]     rdusedw_1;  
reg                 wen_1;
reg       [127:0]   wdat_1;
wire                select_fifo_1;
wire                start_read_fifo_1;         //sys_clk
//wire                a_start_read_fifo_1;       //sys_clk
reg                 f0_start_read_fifo_1;    //sys_clk
wire                start_one_pkt_1;

wire                wrfull_2;   
wire                wrempty_2;   
wire      [7:0]     wrusedw_2;  
wire                rdempty_2;   
wire      [9:0]     rdusedw_2;  
reg                 wen_2;
reg       [127:0]   wdat_2;
wire                select_fifo_2;
wire                start_read_fifo_2;         //sys_clk
//wire                a_start_read_fifo_2;       //sys_clk
reg                 f0_start_read_fifo_2;    //sys_clk
wire                start_one_pkt_2;

wire                wrfull_3;   
wire                wrempty_3;   
wire      [7:0]     wrusedw_3;  
wire                rdempty_3;   
wire      [9:0]     rdusedw_3;  
reg                 wen_3;
reg       [127:0]   wdat_3;
wire                select_fifo_3;
wire                start_read_fifo_3;         //sys_clk
//wire                a_start_read_fifo_3;       //sys_clk
reg                 f0_start_read_fifo_3;    //sys_clk
wire                start_one_pkt_3;

reg       [1:0]     fifo_select_cont;

wire      [31:0]    f0_pkt_data_0;  
reg                 pkt_sop_0_reg;   
reg                 pkt_eop_0_reg;   
reg                 pkt_vld_0_reg;

wire      [31:0]    f0_pkt_data_1;  
reg                 pkt_sop_1_reg;   
reg                 pkt_eop_1_reg;   
reg                 pkt_vld_1_reg;

wire      [31:0]    f0_pkt_data_2;  
reg                 pkt_sop_2_reg;   
reg                 pkt_eop_2_reg;   
reg                 pkt_vld_2_reg;

wire      [31:0]    f0_pkt_data_3;  
reg                 pkt_sop_3_reg;   
reg                 pkt_eop_3_reg;   
reg                 pkt_vld_3_reg;

/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/

//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    pcie_ram_wen_cont <=#D 16'd0;
//  end else if((curr_sta == DONE || curr_sta == IDLE) && pcie_ram_wen_cont == 16'd9600) begin     
//    pcie_ram_wen_cont <=#D 16'd0;  
//  end else if(pcie_ram_wen) begin
//    pcie_ram_wen_cont <=#D pcie_ram_wen_cont + 1;    	
//  end
//end
//
//
//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    pcie_ram_ren_cont <=#D 16'd0;
//  end else if(curr_sta == DONE) begin      
//    pcie_ram_ren_cont <=#D 16'd0;  
//  end else if(pcie_ram_ren_reg) begin
//    pcie_ram_ren_cont <=#D pcie_ram_ren_cont + 1;    	
//  end
//end    


//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    pcie_ram_wen_cont <=#D 16'd0;
//  end else if(pcie_ram_wen_cont == 16'd9600 && curr_sta == IDLE) begin     
//    pcie_ram_wen_cont <=#D 16'd0;  
//  end else if(pcie_ram_wen) begin
//    pcie_ram_wen_cont <=#D pcie_ram_wen_cont + 1;    	
//  end
//end
//
//
//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    pcie_ram_ren_cont <=#D 16'd0;
//  end else if(curr_sta == DONE) begin      
//    pcie_ram_ren_cont <=#D 16'd0;  
//  end else if(pcie_ram_ren_reg) begin
//    pcie_ram_ren_cont <=#D pcie_ram_ren_cont + 1;    	
//  end
//end  
//
//
//assign read_pcie_enable = (pcie_ram_wen_cont > pcie_ram_ren_cont);

//---------------------------------------------------------------------


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
	      if(start_anlysis) begin	 
	        next_sta = GET_PKT_NUM; 
	      end	
		  end	
  
    GET_PKT_NUM:
      begin 
        if(counter1 == 8'd4) begin  
          next_sta = WAIT_ENABLE; 
        end 
      end 

    WAIT_ENABLE:
      begin
        if(channel_fifo_free) begin
          next_sta = GET_DATA_NUM;       		
        end 
      end 

    GET_DATA_NUM:
      begin
        if(counter2 == 8'd4) begin 
          next_sta = GET_DATA;         
        end 
      end 

    GET_DATA:
      begin
        if(data_num_cont == (data_num-1)) begin
          next_sta = JUDGE;          	
        end 
      end  
 
    JUDGE: 
      begin
        if(pkt_num_cont == pkt_num && ~f2_get_data_ren && f3_get_data_ren) begin
          next_sta = DONE;          	
        end else if(~f2_get_data_ren && f3_get_data_ren) begin
          next_sta = WAIT_ENABLE;          	
        end 		
      end 

    DONE:
      begin
      	  next_sta = IDLE;
      end 
  
  endcase
end   

//--------------------------------------------------------------
//GET_PKT_NUM

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    counter1 <=#D 8'd0; 
  end else if(counter1 == 8'd4) begin                  
    counter1 <=#D 8'd0;   
  end else if(curr_sta == GET_PKT_NUM) begin
    counter1 <=#D counter1 + 1;   	
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_num <=#D 32'd0;
  end else if(counter1 == 8'd4) begin
    pkt_num <=#D {pcie_ram_rdat[103:96],pcie_ram_rdat[111:104],pcie_ram_rdat[119:112],pcie_ram_rdat[127:120]};
  end
end



//---------------------------------------------------------------
//GET_DATA_NUM

reg counter2_en;

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    counter2_en <=#D 1'b0;
  end else if(counter2 == 8'd4) begin
    counter2_en <=#D 1'b0;    
  end else if(curr_sta == GET_DATA_NUM) begin
    counter2_en <=#D 1'b1;      	
  end else begin
    counter2_en <=#D 1'b0;  	
  end 	 	
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    counter2 <=#D 8'd0; 
  end else if(counter2 == 8'd4) begin                  
    counter2 <=#D 8'd0;   
  end else if(counter2_en) begin
    counter2 <=#D counter2 + 1;   	
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    data_num <=#D 32'd0;
  end else if(counter2 == 8'd4) begin
    data_num <=#D {pcie_ram_rdat[103:96],pcie_ram_rdat[111:104],pcie_ram_rdat[119:112],pcie_ram_rdat[127:120]}; 
  end
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_num_cont <=#D 32'd0;
  end else if(curr_sta == IDLE) begin
    pkt_num_cont <=#D 32'd0;  
  end else if(counter2 == 8'd4) begin
    pkt_num_cont <=#D pkt_num_cont + 1;  	
  end 	
end

//---------------------------------------------------------------------

//GET DATA

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    get_data_ren <=#D 1'b0;
  end else if(data_num_cont == (data_num-1)) begin
    get_data_ren <=#D 1'b0;                 
  end else if(curr_sta == GET_DATA ) begin
    get_data_ren <=#D 1'b1;   	
  end else begin
    get_data_ren <=#D 1'b0;  	
  end 		
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_get_data_ren <=#D 1'b0;
    f1_get_data_ren <=#D 1'b0;
    f2_get_data_ren <=#D 1'b0;
    f3_get_data_ren <=#D 1'b0;            
  end else begin
    f0_get_data_ren <=#D get_data_ren;
    f1_get_data_ren <=#D f0_get_data_ren;
    f2_get_data_ren <=#D f1_get_data_ren;
    f3_get_data_ren <=#D f2_get_data_ren;     
  end     
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    data_num_cont <=#D 16'd0;
  end else if(get_data_ren) begin
    data_num_cont <=#D data_num_cont + 1; 
  end else begin
    data_num_cont <=#D 16'd0;  	 
  end
end 

//-----------------------------------------------------------------------------

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pcie_ram_ren_reg <=#D 1'b0;
  end else if(counter1 == 8'd1) begin
    pcie_ram_ren_reg <=#D 1'b1;  
  end else if(counter2 == 8'd1) begin
    pcie_ram_ren_reg <=#D 1'b1;   	
  end else if(get_data_ren) begin
    pcie_ram_ren_reg <=#D 1'b1;    	
  end else begin
    pcie_ram_ren_reg <=#D 1'b0;  	
  end 		 	 
end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pcie_ram_raddr_reg <=#D 16'd0;
  end else if(counter1 == 8'd1) begin
    pcie_ram_raddr_reg <=#D 16'd0;  
  end else if(counter2 == 8'd1) begin
    pcie_ram_raddr_reg <=#D pcie_ram_raddr_reg + 1; 		
  end else if(get_data_ren)	begin
    pcie_ram_raddr_reg <=#D pcie_ram_raddr_reg + 1;    	
  end 	
end


//=============================================================================

//assign channel_fifo_free = channel_fifo_free_0 || channel_fifo_free_1 || channel_fifo_free_2 || channel_fifo_free_3;

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    channel_fifo_free <=#D 1'b0;
  end else begin
    case (fifo_select_cont)  
      2'd0: begin 
              if(channel_fifo_free_0) channel_fifo_free <= 1;  
              else                    channel_fifo_free <= 0;
            end 

      2'd1: begin 
              if(channel_fifo_free_1) channel_fifo_free <= 1;  
              else                    channel_fifo_free <= 0;
            end 
      
      2'd2: begin 
              if(channel_fifo_free_2) channel_fifo_free <= 1;  
              else                    channel_fifo_free <= 0;
            end 
   
      2'd3: begin 
              if(channel_fifo_free_3) channel_fifo_free <= 1;  
              else                    channel_fifo_free <= 0;
            end    
    endcase 
  end	
end


always@(posedge sys_clk)
begin
  if(wrempty_0) begin
    channel_fifo_free_0 <=#D 1'b1;
  end else if(~f1_get_data_ren && f2_get_data_ren) begin
    channel_fifo_free_0 <=#D 1'b0;  	
  end 	
end

always@(posedge sys_clk)
begin
  if(wrempty_1) begin
    channel_fifo_free_1 <=#D 1'b1;
  end else if(~f1_get_data_ren && f2_get_data_ren) begin
    channel_fifo_free_1 <=#D 1'b0;  	
  end 	
end

always@(posedge sys_clk)
begin
  if(wrempty_2) begin
    channel_fifo_free_2 <=#D 1'b1;
  end else if(~f1_get_data_ren && f2_get_data_ren) begin
    channel_fifo_free_2 <=#D 1'b0;  	
  end 	
end

always@(posedge sys_clk)
begin
  if(wrempty_3) begin
    channel_fifo_free_3 <=#D 1'b1;
  end else if(~f1_get_data_ren && f2_get_data_ren) begin
    channel_fifo_free_3 <=#D 1'b0;  	
  end 	
end


always@(posedge sys_clk )
begin
    f0_channel_fifo_free_0 <=#D channel_fifo_free_0;
    f0_channel_fifo_free_1 <=#D channel_fifo_free_1;
    f0_channel_fifo_free_2 <=#D channel_fifo_free_2;
    f0_channel_fifo_free_3 <=#D channel_fifo_free_3; 	
end


//assign   select_fifo_0  =   channel_fifo_free_0;

//assign   select_fifo_1  =  ~channel_fifo_free_0 &&  channel_fifo_free_1;

//assign   select_fifo_2  =  ~channel_fifo_free_0 && ~channel_fifo_free_1 &&  channel_fifo_free_2;

//assign   select_fifo_3  =  ~channel_fifo_free_0 && ~channel_fifo_free_1 && ~channel_fifo_free_2 && channel_fifo_free_3;


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    fifo_select_cont <=#D 2'd0;
  end else begin
    case (fifo_select_cont)  
      2'd0: begin if(~channel_fifo_free_0) fifo_select_cont <= fifo_select_cont + 1; end  
      2'd1: begin if(~channel_fifo_free_1) fifo_select_cont <= fifo_select_cont + 1; end 
      2'd2: begin if(~channel_fifo_free_2) fifo_select_cont <= fifo_select_cont + 1; end 
      2'd3: begin if(~channel_fifo_free_3) fifo_select_cont <= fifo_select_cont + 1; end 
    endcase 
  end
end 


//---------------------------------------------------------------------------------

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    wen_0 <=#D 1'b0;
  end else if(fifo_select_cont==2'd0 && channel_fifo_free_0 && f2_get_data_ren) begin
    wen_0 <=#D 1'b1;  
  end else begin
    wen_0 <=#D 1'b0;  	
  end 	
end

//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    wdat_0 <=#D 128'd0;  
//  end else if(fifo_select_cont==2'd0 && channel_fifo_free_0 && f2_get_data_ren) begin
//    wdat_0 <=#D {pcie_ram_rdat[7:0],pcie_ram_rdat[15:8],pcie_ram_rdat[23:16],pcie_ram_rdat[31:24],
//	              pcie_ram_rdat[39:32],pcie_ram_rdat[47:40],pcie_ram_rdat[55:48],pcie_ram_rdat[63:56],
//	              pcie_ram_rdat[71:64],pcie_ram_rdat[79:72],pcie_ram_rdat[87:80],pcie_ram_rdat[95:88],
//	              pcie_ram_rdat[103:96],pcie_ram_rdat[111:104],pcie_ram_rdat[119:112],pcie_ram_rdat[127:120]};      
//  end
//end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    wdat_0 <=#D 128'd0;  
  end else if(fifo_select_cont==2'd0 && channel_fifo_free_0 && f2_get_data_ren) begin
    wdat_0 <=#D pcie_ram_rdat;    
  end
end






assign start_read_fifo_0 = ~channel_fifo_free_0 && f0_channel_fifo_free_0;


fifo_256x128_1024x32 u0_channel_fifo(
//write
    .wrclk     (sys_clk      ),
    .wrreq     (wen_0         ),
    .data      (wdat_0        ),//127:0
    .wrfull    (wrfull_0      ),
    .wrempty   (wrempty_0     ),
    .wrusedw   (wrusedw_0     ),//7:0
//read
    .rdclk     (sys_clk       ),
    .rdreq     (pkt_vld_0_reg ),
    .q         (f0_pkt_data_0 ),//31:0
    .rdempty   (rdempty_0     ),
    .rdusedw   (rdusedw_0     ) //9:0
);


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_start_read_fifo_0 <=#D 1'b0;
  end else if(start_read_fifo_0) begin
    f0_start_read_fifo_0 <=#D 1'b1;  
  end else if(matrix_enable_0) begin
    f0_start_read_fifo_0 <=#D 1'b0;
  end
end 


assign  start_one_pkt_0 = f0_start_read_fifo_0 && matrix_enable_0;


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_sop_0_reg <=#D 1'b0;
  end else if(start_one_pkt_0) begin
    pkt_sop_0_reg <=#D 1'b1;  
  end else begin
    pkt_sop_0_reg <=#D 1'b0;  	
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin 	
    pkt_vld_0_reg <=#D 1'b0; 
  end else if(start_one_pkt_0) begin
    pkt_vld_0_reg <=#D 1'b1;   
  end else if(pkt_eop_0_reg) begin
    pkt_vld_0_reg <=#D 1'b0; 
  end 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_eop_0_reg <=#D 1'b0;
  end else if(rdusedw_0[9:0] == 10'd3 && ~wen_0) begin        
    pkt_eop_0_reg <=#D 1'b1;  
  end else begin
    pkt_eop_0_reg <=#D 1'b0;  	
  end 	
end


assign    pkt_data_0  = (pkt_vld_0_reg)? {f0_pkt_data_0[7:0],f0_pkt_data_0[15:8],f0_pkt_data_0[23:16],f0_pkt_data_0[31:24]}: 32'd0;
assign    pkt_sop_0   =  pkt_sop_0_reg;
assign    pkt_eop_0   =  pkt_eop_0_reg;
assign    pkt_vld_0   =  pkt_vld_0_reg;


//------------------------------------------------------------

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    wen_1 <=#D 1'b0;
  end else if(fifo_select_cont==2'd1 && channel_fifo_free_1 && f2_get_data_ren) begin
    wen_1 <=#D 1'b1;  
  end else begin
    wen_1 <=#D 1'b0;  	
  end 	
end

//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    wdat_1 <=#D 128'd0;  
//  end else if(fifo_select_cont==2'd1 && channel_fifo_free_1 && f2_get_data_ren) begin
//    wdat_1 <=#D {pcie_ram_rdat[7:0],pcie_ram_rdat[15:8],pcie_ram_rdat[23:16],pcie_ram_rdat[31:24],
//	              pcie_ram_rdat[39:32],pcie_ram_rdat[47:40],pcie_ram_rdat[55:48],pcie_ram_rdat[63:56],
//	              pcie_ram_rdat[71:64],pcie_ram_rdat[79:72],pcie_ram_rdat[87:80],pcie_ram_rdat[95:88],
//	              pcie_ram_rdat[103:96],pcie_ram_rdat[111:104],pcie_ram_rdat[119:112],pcie_ram_rdat[127:120]};       
//  end
//end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    wdat_1 <=#D 128'd0;  
  end else if(fifo_select_cont==2'd1 && channel_fifo_free_1 && f2_get_data_ren) begin
    wdat_1 <=#D pcie_ram_rdat;    
  end
end



assign start_read_fifo_1 = ~channel_fifo_free_1 && f0_channel_fifo_free_1;


fifo_256x128_1024x32 u1_channel_fifo(
//write
    .wrclk     (sys_clk      ),
    .wrreq     (wen_1         ),
    .data      (wdat_1        ),//127:0
    .wrfull    (wrfull_1      ),
    .wrempty   (wrempty_1     ),
    .wrusedw   (wrusedw_1     ),//7:0
//read
    .rdclk     (sys_clk       ),
    .rdreq     (pkt_vld_1_reg ),
    .q         (f0_pkt_data_1 ),//31:0
    .rdempty   (rdempty_1     ),
    .rdusedw   (rdusedw_1     ) //9:0
);

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_start_read_fifo_1 <=#D 1'b0;
  end else if(start_read_fifo_1) begin
    f0_start_read_fifo_1 <=#D 1'b1;  
  end else if(matrix_enable_1) begin
    f0_start_read_fifo_1 <=#D 1'b0;
  end
end 

assign  start_one_pkt_1 = f0_start_read_fifo_1 && matrix_enable_1;


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_sop_1_reg <=#D 1'b0;
  end else if(start_one_pkt_1) begin
    pkt_sop_1_reg <=#D 1'b1;  
  end else begin
    pkt_sop_1_reg <=#D 1'b0;  	
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin 	
    pkt_vld_1_reg <=#D 1'b0; 
  end else if(start_one_pkt_1) begin
    pkt_vld_1_reg <=#D 1'b1;   
  end else if(pkt_eop_1_reg) begin
    pkt_vld_1_reg <=#D 1'b0; 
  end 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_eop_1_reg <=#D 1'b0;
  end else if(rdusedw_1[9:0] == 10'd3 && ~wen_1) begin        
    pkt_eop_1_reg <=#D 1'b1;  
  end else begin
    pkt_eop_1_reg <=#D 1'b0;  	
  end 	
end


assign    pkt_data_1  = (pkt_vld_1_reg)? {f0_pkt_data_1[7:0],f0_pkt_data_1[15:8],f0_pkt_data_1[23:16],f0_pkt_data_1[31:24]} : 32'd0;
assign    pkt_sop_1   =  pkt_sop_1_reg;
assign    pkt_eop_1   =  pkt_eop_1_reg;
assign    pkt_vld_1   =  pkt_vld_1_reg;


//--------------------------------------------------------------


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    wen_2 <=#D 1'b0;
  end else if(fifo_select_cont==2'd2 && channel_fifo_free_2 && f2_get_data_ren) begin
    wen_2 <=#D 1'b1;  
  end else begin
    wen_2 <=#D 1'b0;  	
  end 	
end

//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    wdat_2 <=#D 128'd0;  
//  end else if(fifo_select_cont==2'd2 && channel_fifo_free_2 && f2_get_data_ren) begin
//    wdat_2 <=#D {pcie_ram_rdat[7:0],pcie_ram_rdat[15:8],pcie_ram_rdat[23:16],pcie_ram_rdat[31:24],
//	              pcie_ram_rdat[39:32],pcie_ram_rdat[47:40],pcie_ram_rdat[55:48],pcie_ram_rdat[63:56],
//	              pcie_ram_rdat[71:64],pcie_ram_rdat[79:72],pcie_ram_rdat[87:80],pcie_ram_rdat[95:88],
//	              pcie_ram_rdat[103:96],pcie_ram_rdat[111:104],pcie_ram_rdat[119:112],pcie_ram_rdat[127:120]};       
//  end
//end


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    wdat_2 <=#D 128'd0;  
  end else if(fifo_select_cont==2'd2 && channel_fifo_free_2 && f2_get_data_ren) begin
    wdat_2 <=#D pcie_ram_rdat;     
  end
end


assign start_read_fifo_2 = ~channel_fifo_free_2 && f0_channel_fifo_free_2;


fifo_256x128_1024x32 u2_channel_fifo(
//write
    .wrclk     (sys_clk      ),
    .wrreq     (wen_2         ),
    .data      (wdat_2        ),//127:0
    .wrfull    (wrfull_2      ),
    .wrempty   (wrempty_2     ),
    .wrusedw   (wrusedw_2     ),//7:0
//read
    .rdclk     (sys_clk       ),
    .rdreq     (pkt_vld_2_reg ),
    .q         (f0_pkt_data_2 ),//31:0
    .rdempty   (rdempty_2     ),
    .rdusedw   (rdusedw_2     ) //9:0
);


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_start_read_fifo_2 <=#D 1'b0;
  end else if(start_read_fifo_2) begin
    f0_start_read_fifo_2 <=#D 1'b1;  
  end else if(matrix_enable_2) begin
    f0_start_read_fifo_2 <=#D 1'b0;
  end
end 

assign  start_one_pkt_2 = f0_start_read_fifo_2 && matrix_enable_2;


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_sop_2_reg <=#D 1'b0;
  end else if(start_one_pkt_2) begin
    pkt_sop_2_reg <=#D 1'b1;  
  end else begin
    pkt_sop_2_reg <=#D 1'b0;  	
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin 	
    pkt_vld_2_reg <=#D 1'b0; 
  end else if(start_one_pkt_2) begin
    pkt_vld_2_reg <=#D 1'b1;   
  end else if(pkt_eop_2_reg) begin
    pkt_vld_2_reg <=#D 1'b0; 
  end 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_eop_2_reg <=#D 1'b0;
  end else if(rdusedw_2[9:0] == 10'd3 && ~wen_2) begin        
    pkt_eop_2_reg <=#D 1'b1;  
  end else begin
    pkt_eop_2_reg <=#D 1'b0;  	
  end 	
end

assign    pkt_data_2  = (pkt_vld_2_reg)? {f0_pkt_data_2[7:0],f0_pkt_data_2[15:8],f0_pkt_data_2[23:16],f0_pkt_data_2[31:24]} : 32'd0;
assign    pkt_sop_2   =  pkt_sop_2_reg;
assign    pkt_eop_2   =  pkt_eop_2_reg;
assign    pkt_vld_2   =  pkt_vld_2_reg;


//-------------------------------------------------------------


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    wen_3 <=#D 1'b0;
  end else if(fifo_select_cont==2'd3 && channel_fifo_free_3 && f2_get_data_ren) begin
    wen_3 <=#D 1'b1;  
  end else begin
    wen_3 <=#D 1'b0;  	
  end 	
end

//always@(posedge sys_clk or negedge sys_rst_n)
//begin
//  if(!sys_rst_n)begin	
//    wdat_3 <=#D 128'd0;  
//  end else if(fifo_select_cont==2'd3 && channel_fifo_free_3 && f2_get_data_ren) begin
//    wdat_3 <=#D {pcie_ram_rdat[7:0],pcie_ram_rdat[15:8],pcie_ram_rdat[23:16],pcie_ram_rdat[31:24],
//	              pcie_ram_rdat[39:32],pcie_ram_rdat[47:40],pcie_ram_rdat[55:48],pcie_ram_rdat[63:56],
//	              pcie_ram_rdat[71:64],pcie_ram_rdat[79:72],pcie_ram_rdat[87:80],pcie_ram_rdat[95:88],
//	              pcie_ram_rdat[103:96],pcie_ram_rdat[111:104],pcie_ram_rdat[119:112],pcie_ram_rdat[127:120]};  
//  end
//end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    wdat_3 <=#D 128'd0;  
  end else if(fifo_select_cont==2'd3 && channel_fifo_free_3 && f2_get_data_ren) begin
    wdat_3 <=#D pcie_ram_rdat;
  end
end



assign start_read_fifo_3 = ~channel_fifo_free_3 && f0_channel_fifo_free_3;


fifo_256x128_1024x32 u3_channel_fifo(
//write
    .wrclk     (sys_clk      ),
    .wrreq     (wen_3         ),
    .data      (wdat_3        ),//127:0
    .wrfull    (wrfull_3      ),
    .wrempty   (wrempty_3     ),
    .wrusedw   (wrusedw_3     ),//7:0
//read
    .rdclk     (sys_clk       ),
    .rdreq     (pkt_vld_3_reg ),
    .q         (f0_pkt_data_3 ),//31:0
    .rdempty   (rdempty_3     ),
    .rdusedw   (rdusedw_3     ) //9:0
);

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    f0_start_read_fifo_3 <=#D 1'b0;
  end else if(start_read_fifo_3) begin
    f0_start_read_fifo_3 <=#D 1'b1;  
  end else if(matrix_enable_3) begin
    f0_start_read_fifo_3 <=#D 1'b0;
  end
end 

assign  start_one_pkt_3 = f0_start_read_fifo_3 && matrix_enable_3;


always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_sop_3_reg <=#D 1'b0;
  end else if(start_one_pkt_3) begin
    pkt_sop_3_reg <=#D 1'b1;  
  end else begin
    pkt_sop_3_reg <=#D 1'b0;  	
  end 	
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin 	
    pkt_vld_3_reg <=#D 1'b0; 
  end else if(start_one_pkt_3) begin
    pkt_vld_3_reg <=#D 1'b1;   
  end else if(pkt_eop_3_reg) begin
    pkt_vld_3_reg <=#D 1'b0; 
  end 
end

always@(posedge sys_clk or negedge sys_rst_n)
begin
  if(!sys_rst_n)begin	
    pkt_eop_3_reg <=#D 1'b0;
  end else if(rdusedw_3[9:0] == 10'd3 && ~wen_3) begin        
    pkt_eop_3_reg <=#D 1'b1;  
  end else begin
    pkt_eop_3_reg <=#D 1'b0;  	
  end 	
end

assign    pkt_data_3  = (pkt_vld_3_reg)? {f0_pkt_data_3[7:0],f0_pkt_data_3[15:8],f0_pkt_data_3[23:16],f0_pkt_data_3[31:24]} : 32'd0;
assign    pkt_sop_3   =  pkt_sop_3_reg;
assign    pkt_eop_3   =  pkt_eop_3_reg;
assign    pkt_vld_3   =  pkt_vld_3_reg;


//===========================================================



assign    pcie_ram_ren   = pcie_ram_ren_reg;

assign    pcie_ram_raddr = pcie_ram_raddr_reg;

assign    get_data_done  = (curr_sta == DONE);


endmodule
