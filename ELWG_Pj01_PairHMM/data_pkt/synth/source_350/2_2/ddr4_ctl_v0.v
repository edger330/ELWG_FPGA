/*********************************************************************
//  Author:    jyb
//  Filename:  
//  Modified:
//  Version:   1.0
//
//  Description:
//  save 10000 pcie data_pkt     

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
//  2017-08-28       jyb             initial version
//
**********************************************************************/
module ddr4_ctl(
input               sys_clk,
input               sys_rst_n,
//
input               ddr4_clk,
input               ddr4_rst_n,
//
input               start_read_pcie_data_0,
input               start_read_pcie_data_1,

output              get_data_done_0,
output              get_data_done_1,

output              pcie_ram_ren_0,
output    [13:0]    pcie_ram_raddr_0,
input     [127:0]   pcie_ram_rdat_0,

output              pcie_ram_ren_1,
output    [13:0]    pcie_ram_raddr_1,
input     [127:0]   pcie_ram_rdat_1,


input               pkt_analysis_done,

input               ddr4_ready,
output              ddr4_ren,
output              ddr4_wen,
output    [24:0]    ddr4_addr,     
output    [511:0]   ddr4_wdat

);

/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 2;


/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
//global signal



/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/

reg                 ddr4_free;

reg                 pcie_ram_select;


reg                 read_pcie_ram_en_0;
reg                 read_pcie_ram_en_1;

wire                f0_pcie_ram_ren_0;
reg                 f1_pcie_ram_ren_0;
reg                 f2_pcie_ram_ren_0;
reg                 f3_pcie_ram_ren_0;

wire                f0_pcie_ram_ren_1;
reg                 f1_pcie_ram_ren_1;
reg                 f2_pcie_ram_ren_1;
reg                 f3_pcie_ram_ren_1;


reg       [13:0]    reg_pcie_ram_raddr_0;
reg       [13:0]    reg_pcie_ram_raddr_1;

reg                 ddr4_fifo_wen;
reg       [127:0]   ddr4_fifo_wdat; 
wire                ddr4_fifo_ren;
wire      [511:0]   ddr4_fifo_rdat;
wire      [5:0]     ddr4_fifo_rusedw;
wire                ddr4_fifo_empty;
wire      [7:0]     ddr4_fifo_wusedw;
wire                ddr4_fifo_full;

wire                ddr4_wen_temp;
wire      [511:0]   ddr4_wdat_temp;   
wire      [24:0]    ddr4_addr_temp;
wire                ddr4_ren_temp;

reg       [24:0]    ddr4_waddr;


reg       [24:0]    ddr4_raddr;
reg       [24:0]    ddr4_raddr_base;

wire                local_full;
wire                local_empty;
wire      [538:0]   local_rdat;
reg       [538:0]   local_wdat;
reg                 local_wen;
wire                local_ren;
(*noprune*) reg     local_error;

reg       [15:0]    ddr4_wen_cont;
reg       [15:0]    ddr4_ren_cont;
reg       [15:0]    ddr4_wpkt_cont;
reg       [15:0]    ddr4_rpkt_cont;
wire                 ddr4_pkt_read_en;

reg                 pcie_mem_free;
/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/

//write ddr4

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    read_pcie_ram_en_0 <=#D 1'b0;
  end else if(start_read_pcie_data_0) begin
    read_pcie_ram_en_0 <=#D 1'b1;    
  end else if(f0_pcie_ram_ren_0 && reg_pcie_ram_raddr_0 == 14'd7999) begin
    read_pcie_ram_en_0 <=#D 1'b0;  	
  end 	
end


assign f0_pcie_ram_ren_0 = read_pcie_ram_en_0 && ddr4_free && ~f0_pcie_ram_ren_1;


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    f1_pcie_ram_ren_0 <=#D 1'b0; 
    f2_pcie_ram_ren_0 <=#D 1'b0;
    f3_pcie_ram_ren_0 <=#D 1'b0;    
  end else begin
    f1_pcie_ram_ren_0 <=#D f0_pcie_ram_ren_0; 
    f2_pcie_ram_ren_0 <=#D f1_pcie_ram_ren_0;  
    f3_pcie_ram_ren_0 <=#D f2_pcie_ram_ren_0;      
  end
end


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    reg_pcie_ram_raddr_0 <=#D 14'd0;
  end else if(f0_pcie_ram_ren_0 && reg_pcie_ram_raddr_0 == 14'd7999) begin
    reg_pcie_ram_raddr_0 <=#D 14'd0;  
  end else if(f0_pcie_ram_ren_0) begin
    reg_pcie_ram_raddr_0 <=#D reg_pcie_ram_raddr_0 + 1;      
  end	
end 
 
 
assign     pcie_ram_ren_0     =    f0_pcie_ram_ren_0;

assign     pcie_ram_raddr_0   =    reg_pcie_ram_raddr_0;

assign     get_data_done_0    =    (f0_pcie_ram_ren_0 && reg_pcie_ram_raddr_0 == 14'd7999);  


//-------------------------------------------------------------------------------

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    read_pcie_ram_en_1 <=#D 1'b0;
  end else if(start_read_pcie_data_1) begin
    read_pcie_ram_en_1 <=#D 1'b1;    
  end else if(f0_pcie_ram_ren_1 && reg_pcie_ram_raddr_1 == 14'd7999) begin
    read_pcie_ram_en_1 <=#D 1'b0;  	
  end 	
end


assign f0_pcie_ram_ren_1 = read_pcie_ram_en_1 && ddr4_free && ~f0_pcie_ram_ren_0;


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    f1_pcie_ram_ren_1 <=#D 1'b0; 
    f2_pcie_ram_ren_1 <=#D 1'b0;
    f3_pcie_ram_ren_1 <=#D 1'b0;    
  end else begin
    f1_pcie_ram_ren_1 <=#D f0_pcie_ram_ren_1; 
    f2_pcie_ram_ren_1 <=#D f1_pcie_ram_ren_1;  
    f3_pcie_ram_ren_1 <=#D f2_pcie_ram_ren_1;      
  end
end


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    reg_pcie_ram_raddr_1 <=#D 14'd0;
  end else if(f0_pcie_ram_ren_1 && reg_pcie_ram_raddr_1 == 14'd7999) begin
    reg_pcie_ram_raddr_1 <=#D 14'd0;  
  end else if(f0_pcie_ram_ren_1) begin
    reg_pcie_ram_raddr_1 <=#D reg_pcie_ram_raddr_1 + 1;      
  end	
end 
 
 
assign     pcie_ram_ren_1     =    f0_pcie_ram_ren_1;

assign     pcie_ram_raddr_1   =    reg_pcie_ram_raddr_1;

assign     get_data_done_1    =    (f0_pcie_ram_ren_1 && reg_pcie_ram_raddr_1 == 14'd7999);  


//-----------------------------------------------------------------------------------------

//always@(posedge ddr4_clk or negedge ddr4_rst_n)
//begin
//  if(!ddr4_rst_n)begin	
//    pcie_ram_select <=#D 1'b0;
//  end else if(f0_pcie_ram_ren_0 && reg_pcie_ram_raddr_0 == 14'd7999) begin
//    pcie_ram_select <=#D ~pcie_ram_select;  
//  end else if(f0_pcie_ram_ren_1 && reg_pcie_ram_raddr_1 == 14'd7999) begin
//    pcie_ram_select <=#D ~pcie_ram_select;      
//  end	
//end 


reg  [31:0]   pcie_ram_ren_cont;

always@(posedge ddr4_clk or negedge ddr4_rst_n)                    
begin
  if(!ddr4_rst_n) begin	
    pcie_ram_ren_cont <=#D 32'd0;
  end else if((f0_pcie_ram_ren_0 || f0_pcie_ram_ren_1) && (pcie_ram_ren_cont==32'd79999999)) begin    
    pcie_ram_ren_cont <=#D 32'd0;    
  end else if(f0_pcie_ram_ren_0 || f0_pcie_ram_ren_1) begin
    pcie_ram_ren_cont <=#D pcie_ram_ren_cont + 1;
  end   
end 


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	                                
    ddr4_free <=#D 1'b1;
  end else if((f0_pcie_ram_ren_0 || f0_pcie_ram_ren_1) && (pcie_ram_ren_cont==32'd79999999)) begin 
    ddr4_free <=#D 1'b0;  
  end else if((ddr4_wpkt_cont == ddr4_rpkt_cont) && (ddr4_rpkt_cont == 16'd10000)) begin
    ddr4_free <=#D 1'b1;    
  end
end


//===============================================================================


//always@(posedge ddr4_clk or negedge ddr4_rst_n)
//begin
//  if(!ddr4_rst_n)begin	
//    ddr4_fifo_wen <=#D 1'b0;
//  end else begin
//    ddr4_fifo_wen <=#D f2_pcie_ram_ren_0 || f2_pcie_ram_ren_1;
//  end
//end
//
//
//always@(posedge ddr4_clk or negedge ddr4_rst_n)
//begin
//  if(!ddr4_rst_n)begin	
//    ddr4_fifo_wdat <=#D 128'd0;
//  end else if(f2_pcie_ram_ren_0) begin
//    ddr4_fifo_wdat <=#D pcie_ram_rdat_0;
//  end else if(f2_pcie_ram_ren_1) begin
//    ddr4_fifo_wdat <=#D pcie_ram_rdat_1;  	 
//  end else begin
//    ddr4_fifo_wdat <=#D 128'd0;  	 
//  end 	
//end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    ddr4_fifo_wen <=#D 1'b0;
  end else begin
    ddr4_fifo_wen <=#D f1_pcie_ram_ren_0 || f1_pcie_ram_ren_1;
  end
end


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    ddr4_fifo_wdat <=#D 128'd0;
  end else if(f1_pcie_ram_ren_0) begin
    ddr4_fifo_wdat <=#D pcie_ram_rdat_0;
  end else if(f1_pcie_ram_ren_1) begin
    ddr4_fifo_wdat <=#D pcie_ram_rdat_1;  	 
  end else begin
    ddr4_fifo_wdat <=#D 128'd0;  	 
  end 	
end





fifo_256x128  u_ddr4_fifo(
    //write
    .wrclk         (ddr4_clk         ),
    .wrreq         (ddr4_fifo_wen    ),
    .data          (ddr4_fifo_wdat   ),    //[127:0]
    .wrusedw       (ddr4_fifo_wusedw ),    //[7:0]
    .wrfull        (ddr4_fifo_full   ),
    //read         
    .rdclk         (ddr4_clk         ),
    .rdreq         (ddr4_fifo_ren    ),
    .q             (ddr4_fifo_rdat   ),    //[511:0]
    .rdusedw       (ddr4_fifo_rusedw ),    //[5:0]
    .rdempty       (ddr4_fifo_empty  )
);


//reg   [3:0]   ddr4_wen_cont;
//always@(posedge ddr4_clk or negedge ddr4_rst_n)                    
//begin
//  if(!ddr4_rst_n) begin	
//    ddr4_wen_cont <=#D 4'd0;
//  end else if(ddr4_fifo_wen && ddr4_wen_cont == 4'd3) begin    
//    ddr4_wen_cont <=#D 25'd0;    
//  end else if(ddr4_fifo_wen) begin
//    ddr4_wen_cont <=#D ddr4_wen_cont + 1;
//  end   
//end 



assign     ddr4_fifo_ren = ~ddr4_fifo_empty && ddr4_ready;

assign     ddr4_wen_temp = ddr4_fifo_ren;

assign     ddr4_wdat_temp = (ddr4_wen_temp)? ddr4_fifo_rdat : 0;    


//one ddr4 unit can save 512b=64B
//the ddr4 can save total 10000*125KB=1250000KB=1280000000B
//the most ddr4 write address is 1280000000/64-1=19999999

always@(posedge ddr4_clk or negedge ddr4_rst_n)                    
begin
  if(!ddr4_rst_n) begin	
    ddr4_waddr <=#D 25'd0;
  end else if(ddr4_wen_temp && (ddr4_waddr==25'd19999999)) begin    
    ddr4_waddr <=#D 25'd0;    
  end else if(ddr4_wen_temp) begin
    ddr4_waddr <=#D ddr4_waddr + 1;
  end   
end 

assign ddr4_addr_temp = (ddr4_wen_temp)? ddr4_waddr : ((ddr4_ren_temp)? ddr4_raddr : 0);


//==========================================================================

//synchronize ddr4 data signal

always@(posedge ddr4_clk or negedge ddr4_rst_n)               
begin
  if(!ddr4_rst_n)begin	
    local_wen <=#D 1'b0;
  end else begin
    local_wen <=#D (ddr4_wen_temp || ddr4_ren_temp);    
  end 
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)               
begin
  if(!ddr4_rst_n)begin	
    local_wdat <=#D 539'd0;
  end else begin
    local_wdat <=#D {ddr4_wen_temp,ddr4_ren_temp,ddr4_addr_temp,ddr4_wdat_temp};    
  end 
end


always@(posedge ddr4_clk or negedge ddr4_rst_n)               
begin
  if(!ddr4_rst_n)begin	
    local_error <=#D 1'b0;
  end else if(local_full && local_wen) begin
    local_error <=#D 1'b1;    
  end 
end


fifo_8x539_dis  u_fifo_8x539_dis (  //  [538] wen, [537] ren, [536:512] addr, [511:0] data
		.data   (local_wdat   ), 
		.wrreq  (local_wen    ), 
		.rdreq  (local_ren    ), 
		.clock  (ddr4_clk     ), 
		.q      (local_rdat   ),
		.usedw  (             ), 
		.full   (local_full   ), 
		.empty  (local_empty  )  
	);

assign  local_ren = ~local_empty && ddr4_ready;

assign  ddr4_wen  = local_ren && local_rdat[538];

assign  ddr4_ren  = local_ren && local_rdat[537];

assign  ddr4_addr = local_rdat[536:512];     

assign  ddr4_wdat = local_rdat[511:0];

//============================================================================

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    ddr4_wen_cont <=#D 16'd0;
  end else if(ddr4_wen && ddr4_wen_cont==16'd1999) begin
    ddr4_wen_cont <=#D 16'd0;  
  end else if(ddr4_wen) begin
    ddr4_wen_cont <=#D ddr4_wen_cont + 1;    	
  end 	
end


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	                                
    ddr4_wpkt_cont <=#D 16'd0;
  end else if((ddr4_wpkt_cont == ddr4_rpkt_cont) && (ddr4_rpkt_cont == 16'd10000)) begin 
    ddr4_wpkt_cont <=#D 16'd0;  
  end else if(ddr4_wen && ddr4_wen_cont==16'd1999) begin
    ddr4_wpkt_cont <=#D ddr4_wpkt_cont + 1;    
  end
end




//=============================================================================

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    ddr4_ren_cont <=#D 16'd0;
  end else if(ddr4_ren_temp && ddr4_ren_cont==16'd1999) begin
    ddr4_ren_cont <=#D 16'd0;  
  end else if(ddr4_ren_temp) begin
    ddr4_ren_cont <=#D ddr4_ren_cont + 1;    	
  end 	
end


always@(posedge ddr4_clk or negedge ddr4_rst_n)               
begin
  if(!ddr4_rst_n)begin	
    ddr4_rpkt_cont <=#D 16'd0;
  end else if((ddr4_wpkt_cont == ddr4_rpkt_cont) && (ddr4_rpkt_cont == 16'd10000)) begin
    ddr4_rpkt_cont <=#D 16'd0;    
  end else if(ddr4_ren_temp && ddr4_ren_cont==16'd1999) begin       
    ddr4_rpkt_cont <= ddr4_rpkt_cont + 1;
  end
end


//always@(posedge ddr4_clk or negedge ddr4_rst_n)
//begin
//  if(!ddr4_rst_n)begin	
//    ddr4_pkt_read_en <=#D 1'b0;
//  end else if(ddr4_wpkt_cont > ddr4_rpkt_cont) begin
//    ddr4_pkt_read_en <=#D 1'b1;   	
//  end else begin
//    ddr4_pkt_read_en <=#D 1'b0;  	
//  end 		  	
//end

assign ddr4_pkt_read_en =  (ddr4_wpkt_cont > ddr4_rpkt_cont);



always@(posedge ddr4_clk or negedge ddr4_rst_n) 
begin
  if(!ddr4_rst_n) begin 
  	pcie_mem_free <= 1'b1;
  end else if(ddr4_ren_temp && (ddr4_ren_cont==25'd1999)) begin         
  	pcie_mem_free <= 1'b0;
  end else if(pkt_analysis_done) begin
  	pcie_mem_free <= 1'b1;
  end
end


assign  ddr4_ren_temp = ddr4_ready && ddr4_pkt_read_en && pcie_mem_free && ~ddr4_wen_temp;


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n) begin	
    ddr4_raddr <=#D 25'd0;
  end else if(ddr4_ren_temp && (ddr4_raddr==25'd19999999)) begin  
    ddr4_raddr <=#D 25'd0;    
  end else if(ddr4_ren_temp) begin
    ddr4_raddr <=#D ddr4_raddr + 1;
  end   
end 



//always@(posedge ddr4_clk or negedge ddr4_rst_n)             
//begin
//  if(!ddr4_rst_n)begin	
//    ddr4_raddr_base <=#D 25'd0; 
//  end else if(ddr4_ren_temp && (ddr4_raddr==25'd1999) && (ddr4_rpkt_cont == 16'd9999)) begin
//    ddr4_raddr_base <=#D 25'd0;  	
//  end else if(ddr4_ren_temp && (ddr4_raddr==25'd1999)) begin
//    ddr4_raddr_base <=#D ddr4_raddr_base + 25'd2000;
//  end
//end


//=============================================================================




endmodule 