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
//  2017-10-20       jyb             initial version
//
**********************************************************************/
module pkt_analysis_top(
input   wire            sys_clk,
input   wire            sys_rst_n,

input   wire            ddr4_clk,
input   wire            ddr4_rst_n,

input   wire            ddr4_rdat_vld,
input   wire   [511:0]  ddr4_rdat,

input   wire            matrix_enable_0,
input   wire            matrix_enable_1,
input   wire            matrix_enable_2,
input   wire            matrix_enable_3,
input   wire            matrix_enable_4,
input   wire            matrix_enable_5,
input   wire            matrix_enable_6,
input   wire            matrix_enable_7,
input   wire            matrix_enable_8,
input   wire            matrix_enable_9,
input   wire            matrix_enable_a,
input   wire            matrix_enable_b,
input   wire            matrix_enable_c,
input   wire            matrix_enable_d,
input   wire            matrix_enable_e,
input   wire            matrix_enable_f,

output  wire            pcie_ram_free,

output  wire   [31:0]   pkt_data_0,
output  wire            pkt_sop_0, 
output  wire            pkt_eop_0, 
output  wire            pkt_vld_0, 
   
output  wire   [31:0]   pkt_data_1,
output  wire            pkt_sop_1, 
output  wire            pkt_eop_1, 
output  wire            pkt_vld_1, 

output  wire   [31:0]   pkt_data_2,
output  wire            pkt_sop_2, 
output  wire            pkt_eop_2, 
output  wire            pkt_vld_2, 

output  wire   [31:0]   pkt_data_3,
output  wire            pkt_sop_3, 
output  wire            pkt_eop_3, 
output  wire            pkt_vld_3,    

output  wire   [31:0]   pkt_data_4,
output  wire            pkt_sop_4, 
output  wire            pkt_eop_4, 
output  wire            pkt_vld_4, 
   
output  wire   [31:0]   pkt_data_5,
output  wire            pkt_sop_5, 
output  wire            pkt_eop_5, 
output  wire            pkt_vld_5, 

output  wire   [31:0]   pkt_data_6,
output  wire            pkt_sop_6, 
output  wire            pkt_eop_6, 
output  wire            pkt_vld_6, 

output  wire   [31:0]   pkt_data_7,
output  wire            pkt_sop_7, 
output  wire            pkt_eop_7, 
output  wire            pkt_vld_7,

output  wire   [31:0]   pkt_data_8,
output  wire            pkt_sop_8, 
output  wire            pkt_eop_8, 
output  wire            pkt_vld_8, 
   
output  wire   [31:0]   pkt_data_9,
output  wire            pkt_sop_9, 
output  wire            pkt_eop_9, 
output  wire            pkt_vld_9, 

output  wire   [31:0]   pkt_data_a,
output  wire            pkt_sop_a, 
output  wire            pkt_eop_a, 
output  wire            pkt_vld_a, 

output  wire   [31:0]   pkt_data_b,
output  wire            pkt_sop_b, 
output  wire            pkt_eop_b, 
output  wire            pkt_vld_b,

output  wire   [31:0]   pkt_data_c,
output  wire            pkt_sop_c, 
output  wire            pkt_eop_c, 
output  wire            pkt_vld_c, 
   
output  wire   [31:0]   pkt_data_d,
output  wire            pkt_sop_d, 
output  wire            pkt_eop_d, 
output  wire            pkt_vld_d, 

output  wire   [31:0]   pkt_data_e,
output  wire            pkt_sop_e, 
output  wire            pkt_eop_e, 
output  wire            pkt_vld_e, 

output  wire   [31:0]   pkt_data_f,
output  wire            pkt_sop_f, 
output  wire            pkt_eop_f, 
output  wire            pkt_vld_f
);
/*---------------------------------------------------------------------*\
                         parameter description 
\*---------------------------------------------------------------------*/
parameter D = 2;
/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/

/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/

reg             pcie_ram_wen_0;
reg   [511:0]   pcie_ram_wdat_0;
reg   [10:0]    pcie_ram_waddr_0;
reg             pcie_ram_free_0;
wire            pcie_ram_ren_0; 
wire  [12:0]    pcie_ram_raddr_0;
wire  [127:0]   pcie_ram_rdat_0;

reg             pcie_ram_wen_1;
reg   [511:0]   pcie_ram_wdat_1;
reg   [10:0]    pcie_ram_waddr_1;
reg             pcie_ram_free_1;
wire            pcie_ram_ren_1; 
wire  [12:0]    pcie_ram_raddr_1;
wire  [127:0]   pcie_ram_rdat_1;

reg             pcie_ram_wen_2;
reg   [511:0]   pcie_ram_wdat_2;
reg   [10:0]    pcie_ram_waddr_2;
reg             pcie_ram_free_2;
wire            pcie_ram_ren_2; 
wire  [12:0]    pcie_ram_raddr_2;
wire  [127:0]   pcie_ram_rdat_2;

reg             pcie_ram_wen_3;
reg   [511:0]   pcie_ram_wdat_3;
reg   [10:0]    pcie_ram_waddr_3;
reg             pcie_ram_free_3;
wire            pcie_ram_ren_3; 
wire  [12:0]    pcie_ram_raddr_3;
wire  [127:0]   pcie_ram_rdat_3;

wire            get_data_done_0;
wire            get_data_done_1;
wire            get_data_done_2;
wire            get_data_done_3;
wire            a_get_data_done_0;
wire            a_get_data_done_1;
wire            a_get_data_done_2;
wire            a_get_data_done_3;

reg             start_anlysis_0;
reg             start_anlysis_1;
reg             start_anlysis_2;
reg             start_anlysis_3;
wire            a_start_anlysis_0;
wire            a_start_anlysis_1;
wire            a_start_anlysis_2;
wire            a_start_anlysis_3;




reg   [1:0]     ram_select;
reg             pcie_ram_free_reg;
/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    ram_select <=#D 2'd0;
  end else begin
    case (ram_select)  
      2'd0: begin if(pcie_ram_wen_0 && pcie_ram_waddr_0==11'd1999) ram_select <= ram_select + 1; end  
      2'd1: begin if(pcie_ram_wen_1 && pcie_ram_waddr_1==11'd1999) ram_select <= ram_select + 1; end 
      2'd2: begin if(pcie_ram_wen_2 && pcie_ram_waddr_2==11'd1999) ram_select <= ram_select + 1; end 
      2'd3: begin if(pcie_ram_wen_3 && pcie_ram_waddr_3==11'd1999) ram_select <= ram_select + 1; end 
    endcase 
  end
end 

//-----------------------------------------------------------------------------------------------------

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_free_0 <=#D 1'b1;
  end else if(pcie_ram_wen_0 && pcie_ram_waddr_0==11'd1) begin
    pcie_ram_free_0 <=#D 1'b0;   
  end else if(a_get_data_done_0) begin
    pcie_ram_free_0 <=#D 1'b1;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_free_1 <=#D 1'b1;
  end else if(pcie_ram_wen_1 && pcie_ram_waddr_1==11'd1) begin
    pcie_ram_free_1 <=#D 1'b0;   
  end else if(a_get_data_done_1) begin
    pcie_ram_free_1 <=#D 1'b1;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_free_2 <=#D 1'b1;
  end else if(pcie_ram_wen_2 && pcie_ram_waddr_2==11'd1) begin
    pcie_ram_free_2 <=#D 1'b0;   
  end else if(a_get_data_done_2) begin
    pcie_ram_free_2 <=#D 1'b1;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_free_3 <=#D 1'b1;
  end else if(pcie_ram_wen_3 && pcie_ram_waddr_3==11'd1) begin
    pcie_ram_free_3 <=#D 1'b0;   
  end else if(a_get_data_done_3) begin
    pcie_ram_free_3 <=#D 1'b1;  	
  end 	
end


always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_free_reg <=#D 1'b0;
  end else begin
    case (ram_select)  
      2'd0: begin 
              if(pcie_ram_free_0)   pcie_ram_free_reg <= 1;  
              else                  pcie_ram_free_reg <= 0;
            end 

      2'd1: begin 
              if(pcie_ram_free_1)   pcie_ram_free_reg <= 1;  
              else                  pcie_ram_free_reg <= 0;
            end 
      
      2'd2: begin 
              if(pcie_ram_free_2)   pcie_ram_free_reg <= 1;  
              else                  pcie_ram_free_reg <= 0;
            end 
   
      2'd3: begin 
              if(pcie_ram_free_3)   pcie_ram_free_reg <= 1;  
              else                  pcie_ram_free_reg <= 0;
            end    
    endcase 
  end	
end

assign pcie_ram_free  =  pcie_ram_free_reg;

//-----------------------------------------------------------------------------------------------------

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_wen_0 <=#D 1'b0;
  end else if(ram_select==2'd0 && ddr4_rdat_vld) begin
    pcie_ram_wen_0 <=#D 1'b1;   
  end else begin
    pcie_ram_wen_0 <=#D 1'b0;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_wdat_0 <=#D 512'b0;
  end else if(ram_select==2'd0 && ddr4_rdat_vld) begin
    pcie_ram_wdat_0 <=#D ddr4_rdat;   
  end else begin
    pcie_ram_wdat_0 <=#D 512'b0;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_waddr_0 <=#D 11'b0;
  end else if(pcie_ram_wen_0 && pcie_ram_waddr_0==11'd1999) begin
    pcie_ram_waddr_0 <=#D 11'b0;   
  end else if(pcie_ram_wen_0) begin
    pcie_ram_waddr_0 <=#D pcie_ram_waddr_0 + 1;  	
  end 	
end

//-----------------------------------------------------------------------------------------------------

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_wen_1 <=#D 1'b0;
  end else if(ram_select==2'd1 && ddr4_rdat_vld) begin
    pcie_ram_wen_1 <=#D 1'b1;   
  end else begin
    pcie_ram_wen_1 <=#D 1'b0;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_wdat_1 <=#D 512'b0;
  end else if(ram_select==2'd1 && ddr4_rdat_vld) begin
    pcie_ram_wdat_1 <=#D ddr4_rdat;  
  end else begin
    pcie_ram_wdat_1 <=#D 512'b0;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_waddr_1 <=#D 11'b0;
  end else if(pcie_ram_wen_1 && pcie_ram_waddr_1==11'd1999) begin
    pcie_ram_waddr_1 <=#D 11'b0;   
  end else if(pcie_ram_wen_1) begin
    pcie_ram_waddr_1 <=#D pcie_ram_waddr_1 + 1;  	
  end 	
end

//-----------------------------------------------------------------------------------------------------

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_wen_2 <=#D 1'b0;
  end else if(ram_select==2'd2 && ddr4_rdat_vld) begin
    pcie_ram_wen_2 <=#D 1'b1;   
  end else begin
    pcie_ram_wen_2 <=#D 1'b0;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_wdat_2 <=#D 512'b0;
  end else if(ram_select==2'd2 && ddr4_rdat_vld) begin
    pcie_ram_wdat_2 <=#D ddr4_rdat;   
  end else begin
    pcie_ram_wdat_2 <=#D 512'b0;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_waddr_2 <=#D 11'b0;
  end else if(pcie_ram_wen_2 && pcie_ram_waddr_2==11'd1999) begin
    pcie_ram_waddr_2 <=#D 11'b0;   
  end else if(pcie_ram_wen_2) begin
    pcie_ram_waddr_2 <=#D pcie_ram_waddr_2 + 1;  	
  end 	
end

//-----------------------------------------------------------------------------------------------------

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_wen_3 <=#D 1'b0;
  end else if(ram_select==2'd3 && ddr4_rdat_vld) begin
    pcie_ram_wen_3 <=#D 1'b1;   
  end else begin
    pcie_ram_wen_3 <=#D 1'b0;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_wdat_3 <=#D 512'b0;
  end else if(ram_select==2'd3 && ddr4_rdat_vld) begin
    pcie_ram_wdat_3 <=#D ddr4_rdat;  
  end else begin
    pcie_ram_wdat_3 <=#D 512'b0;  	
  end 	
end

always@(posedge ddr4_clk or negedge ddr4_rst_n)
begin
  if(!ddr4_rst_n)begin	
    pcie_ram_waddr_3 <=#D 11'b0;
  end else if(pcie_ram_wen_3 && pcie_ram_waddr_3==11'd1999) begin
    pcie_ram_waddr_3 <=#D 11'b0;   
  end else if(pcie_ram_wen_3) begin
    pcie_ram_waddr_3 <=#D pcie_ram_waddr_3 + 1;  	
  end 	
end

//-----------------------------------------------------------------------------------------------------


always@(posedge ddr4_clk)
begin
  if(pcie_ram_wen_0 && pcie_ram_waddr_0==11'd1999) begin	
    start_anlysis_0 <=#D 1'b1;
  end else begin
    start_anlysis_0 <=#D 1'b0;  
  end
end

always@(posedge ddr4_clk)
begin
  if(pcie_ram_wen_1 && pcie_ram_waddr_1==11'd1999) begin	
    start_anlysis_1 <=#D 1'b1;
  end else begin
    start_anlysis_1 <=#D 1'b0;  
  end
end

always@(posedge ddr4_clk)
begin
  if(pcie_ram_wen_2 && pcie_ram_waddr_2==11'd1999) begin	
    start_anlysis_2 <=#D 1'b1;
  end else begin
    start_anlysis_2 <=#D 1'b0;  
  end
end

always@(posedge ddr4_clk)
begin
  if(pcie_ram_wen_3 && pcie_ram_waddr_3==11'd1999) begin	
    start_anlysis_3 <=#D 1'b1;
  end else begin
    start_anlysis_3 <=#D 1'b0;  
  end
end


//==================================================================================

data_pkt u0_data_pkt(
   //
   .sys_clk         (sys_clk           ),  
   .sys_rst_n       (sys_rst_n         ),
   //
   .pcie_ram_ren    (pcie_ram_ren_0    ), 
   .pcie_ram_raddr  (pcie_ram_raddr_0  ),
   .pcie_ram_rdat   (pcie_ram_rdat_0   ),
   //
   .start_anlysis   (a_start_anlysis_0 ),
   .get_data_done   (get_data_done_0   ),
   //
   .matrix_enable_0 (matrix_enable_0   ),
   .matrix_enable_1 (matrix_enable_1   ),
   .matrix_enable_2 (matrix_enable_2   ),
   .matrix_enable_3 (matrix_enable_3   ),
   //
   .pkt_data_0      (pkt_data_0        ),
   .pkt_sop_0       (pkt_sop_0         ),
   .pkt_eop_0       (pkt_eop_0         ),
   .pkt_vld_0       (pkt_vld_0         ),
   //                                    
   .pkt_data_1      (pkt_data_1        ),
   .pkt_sop_1       (pkt_sop_1         ),
   .pkt_eop_1       (pkt_eop_1         ),
   .pkt_vld_1       (pkt_vld_1         ),
   //                                    
   .pkt_data_2      (pkt_data_2        ),
   .pkt_sop_2       (pkt_sop_2         ),
   .pkt_eop_2       (pkt_eop_2         ),
   .pkt_vld_2       (pkt_vld_2         ),
   //                                    
   .pkt_data_3      (pkt_data_3        ),
   .pkt_sop_3       (pkt_sop_3         ),
   .pkt_eop_3       (pkt_eop_3         ),
   .pkt_vld_3       (pkt_vld_3         )
);


ram_2048x512_8192x128 u0_data_pkt_ram(
   //write
   .wrclock         (ddr4_clk          ),
   .wren            (pcie_ram_wen_0    ),
   .wraddress       (pcie_ram_waddr_0  ),   //[10:0]
   .data            (pcie_ram_wdat_0   ),   //[511:0]
   //read                              
   .rdclock         (sys_clk           ),
   .rden            (pcie_ram_ren_0    ),
   .rdaddress       (pcie_ram_raddr_0  ),   //[12:0]
   .q               (pcie_ram_rdat_0   )    //[127:0]
);

//--------------------------------------------------------------------------

data_pkt u1_data_pkt(
   //
   .sys_clk         (sys_clk),  
   .sys_rst_n       (sys_rst_n),
   //
   .pcie_ram_ren    (pcie_ram_ren_1    ), 
   .pcie_ram_raddr  (pcie_ram_raddr_1  ),
   .pcie_ram_rdat   (pcie_ram_rdat_1   ),
   //
   .start_anlysis   (a_start_anlysis_1 ),
   .get_data_done   (get_data_done_1   ),
   //
   .matrix_enable_0 (matrix_enable_4   ),
   .matrix_enable_1 (matrix_enable_5   ),
   .matrix_enable_2 (matrix_enable_6   ),
   .matrix_enable_3 (matrix_enable_7   ),
   //
   .pkt_data_0      (pkt_data_4        ),
   .pkt_sop_0       (pkt_sop_4         ),
   .pkt_eop_0       (pkt_eop_4         ),
   .pkt_vld_0       (pkt_vld_4         ),
   //                                    
   .pkt_data_1      (pkt_data_5        ),
   .pkt_sop_1       (pkt_sop_5         ),
   .pkt_eop_1       (pkt_eop_5         ),
   .pkt_vld_1       (pkt_vld_5         ),
   //                                    
   .pkt_data_2      (pkt_data_6        ),
   .pkt_sop_2       (pkt_sop_6         ),
   .pkt_eop_2       (pkt_eop_6         ),
   .pkt_vld_2       (pkt_vld_6         ),
   //                                    
   .pkt_data_3      (pkt_data_7        ),
   .pkt_sop_3       (pkt_sop_7         ),
   .pkt_eop_3       (pkt_eop_7         ),
   .pkt_vld_3       (pkt_vld_7         )
);


ram_2048x512_8192x128 u1_data_pkt_ram(
   //write
   .wrclock         (ddr4_clk          ),
   .wren            (pcie_ram_wen_1    ),
   .wraddress       (pcie_ram_waddr_1  ),   //[10:0]
   .data            (pcie_ram_wdat_1   ),   //[511:0]
   //read                              
   .rdclock         (sys_clk           ),
   .rden            (pcie_ram_ren_1    ),
   .rdaddress       (pcie_ram_raddr_1  ),   //[12:0]
   .q               (pcie_ram_rdat_1   )    //[127:0]
);

//--------------------------------------------------------------------------

data_pkt u2_data_pkt(
   //
   .sys_clk         (sys_clk           ),  
   .sys_rst_n       (sys_rst_n         ),
   //
   .pcie_ram_ren    (pcie_ram_ren_2    ), 
   .pcie_ram_raddr  (pcie_ram_raddr_2  ),
   .pcie_ram_rdat   (pcie_ram_rdat_2   ),
   //
   .start_anlysis   (a_start_anlysis_2 ),
   .get_data_done   (get_data_done_2   ),
   //
   .matrix_enable_0 (matrix_enable_8   ),
   .matrix_enable_1 (matrix_enable_9   ),
   .matrix_enable_2 (matrix_enable_a   ),
   .matrix_enable_3 (matrix_enable_b   ),
   //
   .pkt_data_0      (pkt_data_8        ),
   .pkt_sop_0       (pkt_sop_8         ),
   .pkt_eop_0       (pkt_eop_8         ),
   .pkt_vld_0       (pkt_vld_8         ),
   //                                    
   .pkt_data_1      (pkt_data_9        ),
   .pkt_sop_1       (pkt_sop_9         ),
   .pkt_eop_1       (pkt_eop_9         ),
   .pkt_vld_1       (pkt_vld_9         ),
   //                                    
   .pkt_data_2      (pkt_data_a        ),
   .pkt_sop_2       (pkt_sop_a         ),
   .pkt_eop_2       (pkt_eop_a         ),
   .pkt_vld_2       (pkt_vld_a         ),
   //                                    
   .pkt_data_3      (pkt_data_b        ),
   .pkt_sop_3       (pkt_sop_b         ),
   .pkt_eop_3       (pkt_eop_b         ),
   .pkt_vld_3       (pkt_vld_b         )
);


ram_2048x512_8192x128 u2_data_pkt_ram(
   //write
   .wrclock         (ddr4_clk          ),
   .wren            (pcie_ram_wen_2    ),
   .wraddress       (pcie_ram_waddr_2  ),   //[10:0]
   .data            (pcie_ram_wdat_2   ),   //[511:0]
   //read                              
   .rdclock         (sys_clk           ),
   .rden            (pcie_ram_ren_2    ),
   .rdaddress       (pcie_ram_raddr_2  ),   //[12:0]
   .q               (pcie_ram_rdat_2   )    //[127:0]
);

//--------------------------------------------------------------------------

data_pkt u3_data_pkt(
   //
   .sys_clk         (sys_clk           ),  
   .sys_rst_n       (sys_rst_n         ),
   //
   .pcie_ram_ren    (pcie_ram_ren_3    ), 
   .pcie_ram_raddr  (pcie_ram_raddr_3  ),
   .pcie_ram_rdat   (pcie_ram_rdat_3   ),
   //
   .start_anlysis   (a_start_anlysis_3 ),
   .get_data_done   (get_data_done_3   ),
   //
   .matrix_enable_0 (matrix_enable_c   ),
   .matrix_enable_1 (matrix_enable_d   ),
   .matrix_enable_2 (matrix_enable_e   ),
   .matrix_enable_3 (matrix_enable_f   ),
   //
   .pkt_data_0      (pkt_data_c        ),
   .pkt_sop_0       (pkt_sop_c         ),
   .pkt_eop_0       (pkt_eop_c         ),
   .pkt_vld_0       (pkt_vld_c         ),
   //                                    
   .pkt_data_1      (pkt_data_d        ),
   .pkt_sop_1       (pkt_sop_d         ),
   .pkt_eop_1       (pkt_eop_d         ),
   .pkt_vld_1       (pkt_vld_d         ),
   //                                    
   .pkt_data_2      (pkt_data_e        ),
   .pkt_sop_2       (pkt_sop_e         ),
   .pkt_eop_2       (pkt_eop_e         ),
   .pkt_vld_2       (pkt_vld_e         ),
   //                                    
   .pkt_data_3      (pkt_data_f        ),
   .pkt_sop_3       (pkt_sop_f         ),
   .pkt_eop_3       (pkt_eop_f         ),
   .pkt_vld_3       (pkt_vld_f         )
);


ram_2048x512_8192x128 u3_data_pkt_ram(
   //write
   .wrclock         (ddr4_clk          ),
   .wren            (pcie_ram_wen_3    ),
   .wraddress       (pcie_ram_waddr_3  ),   //[10:0]
   .data            (pcie_ram_wdat_3   ),   //[511:0]
   //read                              
   .rdclock         (sys_clk           ),
   .rden            (pcie_ram_ren_3    ),
   .rdaddress       (pcie_ram_raddr_3  ),   //[12:0]
   .q               (pcie_ram_rdat_3   )    //[127:0]
);


//--------------------------------------------------------------------------


syn_ddrclk_2_sysclk u0 (
    .ddr_clk              (ddr4_clk            ),
    .ddr_rst_n            (ddr4_rst_n          ),
    //
    .sys_clk               (sys_clk             ),
    .sys_rst_n             (sys_rst_n           ),
    //                     
    .signal_a_in           (start_anlysis_0     ),
    .signal_a_out          (a_start_anlysis_0   ),
    //                     
    .signal_b_in           (start_anlysis_1     ),
    .signal_b_out          (a_start_anlysis_1   ),
    //                     
    .signal_c_in           (start_anlysis_2     ),
    .signal_c_out          (a_start_anlysis_2   ),
    //                     
    .signal_d_in           (start_anlysis_3     ),
    .signal_d_out          (a_start_anlysis_3   )
);



syn_sysclk_2_ddrclk u1 (
    .ddr_clk              (ddr4_clk            ),
    .ddr_rst_n            (ddr4_rst_n          ),
    //
    .sys_clk               (sys_clk             ),
    .sys_rst_n             (sys_rst_n           ),
    //                     
    .signal_a_in           (get_data_done_0     ),
    .signal_a_out          (a_get_data_done_0   ),
    //                     
    .signal_b_in           (get_data_done_1     ),
    .signal_b_out          (a_get_data_done_1   ),
    //                     
    .signal_c_in           (get_data_done_2     ),
    .signal_c_out          (a_get_data_done_2   ),
    //                     
    .signal_d_in           (get_data_done_3     ),
    .signal_d_out          (a_get_data_done_3   )
);

endmodule

