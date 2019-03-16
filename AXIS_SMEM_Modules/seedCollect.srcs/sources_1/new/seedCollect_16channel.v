`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/06 20:05:11
// Design Name: 
// Module Name: seedCollect
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seedCollect_16channel #( 
  parameter integer C_DATAIN_WIDTH  = 128,
  parameter integer C_DATAOUT_WIDTH = 128,
  parameter integer C_BUS_WIDTH     = 16,
  // parameter integer C_FIFO_CNT      = 12,
  parameter integer C_ID_WIDTH      = 5,
  parameter integer C_STATE_WIDTH   = 2 
)
(
	clk,
	rst_n,
	// data_count,

	s_axis_tvalid_0,
	s_axis_tdata_0,
	s_axis_tready_0,
	s_axis_tlast_0,

	s_axis_tvalid_1,
	s_axis_tdata_1,
	s_axis_tready_1,
	s_axis_tlast_1,

	s_axis_tvalid_2,
	s_axis_tdata_2,
	s_axis_tready_2,
	s_axis_tlast_2,

	s_axis_tvalid_3,
	s_axis_tdata_3,
	s_axis_tready_3,
	s_axis_tlast_3,

	s_axis_tvalid_4,
	s_axis_tdata_4,
	s_axis_tready_4,
	s_axis_tlast_4,

	s_axis_tvalid_5,
	s_axis_tdata_5,
	s_axis_tready_5,
	s_axis_tlast_5,

	s_axis_tvalid_6,
	s_axis_tdata_6,
	s_axis_tready_6,
	s_axis_tlast_6,

	s_axis_tvalid_7,
	s_axis_tdata_7,
	s_axis_tready_7,
	s_axis_tlast_7,

	s_axis_tvalid_8,
	s_axis_tdata_8,
	s_axis_tready_8,
	s_axis_tlast_8,

	s_axis_tvalid_9,
	s_axis_tdata_9,
	s_axis_tready_9,
	s_axis_tlast_9,

	s_axis_tvalid_10,
	s_axis_tdata_10,
	s_axis_tready_10,
	s_axis_tlast_10,

	s_axis_tvalid_11,
	s_axis_tdata_11,
	s_axis_tready_11,
	s_axis_tlast_11,

	s_axis_tvalid_12,
	s_axis_tdata_12,
	s_axis_tready_12,
	s_axis_tlast_12,

	s_axis_tvalid_13,
	s_axis_tdata_13,
	s_axis_tready_13,
	s_axis_tlast_13,

	s_axis_tvalid_14,
	s_axis_tdata_14,
	s_axis_tready_14,
	s_axis_tlast_14,

	s_axis_tvalid_15,
	s_axis_tdata_15,
	s_axis_tready_15,
	s_axis_tlast_15,

	m_axis_tvalid ,
	m_axis_tdata  ,
	m_axis_tready ,
	m_axis_tlast  
);

//----parameters----

localparam IDLE      = 2'b00;
localparam GET_ID    = 2'b01;
localparam CMP_ID    = 2'b10;
localparam TRANS     = 2'b11;

//----input/output----

input wire clk;
input wire rst_n;
// output wire [C_FIFO_CNT-1:0] data_count;

output wire m_axis_tvalid;
output wire [C_DATAOUT_WIDTH-1:0] m_axis_tdata;
input wire m_axis_tready;
output wire m_axis_tlast;

input wire s_axis_tvalid_0;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_0;
output wire s_axis_tready_0;
input wire s_axis_tlast_0;

input wire s_axis_tvalid_1;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_1;
output wire s_axis_tready_1;
input wire s_axis_tlast_1;

input wire s_axis_tvalid_2;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_2;
output wire s_axis_tready_2;
input wire s_axis_tlast_2;

input wire s_axis_tvalid_3;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_3;
output wire s_axis_tready_3;
input wire s_axis_tlast_3;

input wire s_axis_tvalid_4;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_4;
output wire s_axis_tready_4;
input wire s_axis_tlast_4;

input wire s_axis_tvalid_5;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_5;
output wire s_axis_tready_5;
input wire s_axis_tlast_5;

input wire s_axis_tvalid_6;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_6;
output wire s_axis_tready_6;
input wire s_axis_tlast_6;

input wire s_axis_tvalid_7;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_7;
output wire s_axis_tready_7;
input wire s_axis_tlast_7;

input wire s_axis_tvalid_8;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_8;
output wire s_axis_tready_8;
input wire s_axis_tlast_8;

input wire s_axis_tvalid_9;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_9;
output wire s_axis_tready_9;
input wire s_axis_tlast_9;

input wire s_axis_tvalid_10;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_10;
output wire s_axis_tready_10;
input wire s_axis_tlast_10;

input wire s_axis_tvalid_11;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_11;
output wire s_axis_tready_11;
input wire s_axis_tlast_11;

input wire s_axis_tvalid_12;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_12;
output wire s_axis_tready_12;
input wire s_axis_tlast_12;

input wire s_axis_tvalid_13;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_13;
output wire s_axis_tready_13;
input wire s_axis_tlast_13;

input wire s_axis_tvalid_14;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_14;
output wire s_axis_tready_14;
input wire s_axis_tlast_14;

input wire s_axis_tvalid_15;
input wire [C_DATAIN_WIDTH-1:0] s_axis_tdata_15;
output wire s_axis_tready_15;
input wire s_axis_tlast_15;

//----reg/wire----

reg [C_STATE_WIDTH-1:0] current_state;
reg [C_STATE_WIDTH-1:0] next_state;

wire [C_ID_WIDTH-1:0] ID;
wire [C_BUS_WIDTH-1:0] B_tvalid; 

reg [2:0] CMP_cnt;

always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    current_state <= IDLE;
  end
  else begin
    current_state <= next_state;
  end
end

always @(*) begin
  next_state = current_state;  
  case(current_state)
    IDLE: 
    begin
      if(B_tvalid != 1'b0) begin
        next_state = GET_ID;
      end
    end

    GET_ID:
    begin
      if(ID != 1'b0) begin
        next_state = CMP_ID;
      end
      else begin
        next_state = IDLE;
      end
    end

    CMP_ID:
    begin
    	if(CMP_cnt == 3'd3) begin
        	next_state = TRANS;
        end
    end

    TRANS:
    begin
      if(m_axis_tlast) begin
        next_state = IDLE;
      end
    end

  endcase
end

always @(posedge clk or negedge rst_n) begin
  if(!rst_n) begin
    CMP_cnt <= 1'b0;
  end
  else if (CMP_cnt == 3'd3)begin
    CMP_cnt <= 1'b0;
  end
  else if (current_state == CMP_ID)begin
    CMP_cnt <= CMP_cnt + 1'b1;
  end
end

assign B_tvalid[0]  = s_axis_tvalid_0;
assign B_tvalid[1]  = s_axis_tvalid_1;
assign B_tvalid[2]  = s_axis_tvalid_2;
assign B_tvalid[3]  = s_axis_tvalid_3;
assign B_tvalid[4]  = s_axis_tvalid_4;
assign B_tvalid[5]  = s_axis_tvalid_5;
assign B_tvalid[6]  = s_axis_tvalid_6;
assign B_tvalid[7]  = s_axis_tvalid_7;
assign B_tvalid[8]  = s_axis_tvalid_8;
assign B_tvalid[9]  = s_axis_tvalid_9;
assign B_tvalid[10] = s_axis_tvalid_10;
assign B_tvalid[11] = s_axis_tvalid_11;
assign B_tvalid[12] = s_axis_tvalid_12;
assign B_tvalid[13] = s_axis_tvalid_13;
assign B_tvalid[14] = s_axis_tvalid_14;
assign B_tvalid[15] = s_axis_tvalid_15;

getID_16channel getID_16channel_inst(
	.clk(clk           ),
	.rst_n(rst_n       ),
	.state(next_state  ),
	.B_tvalid(B_tvalid ),
	.ID(ID             )
   );

MUX16 MUX16_inst(
	.clk(clk          ),
	.rst_n(rst_n      ),
	.state(next_state ),
	.ID_in(ID      ),

	.s_axis_tvalid0(s_axis_tvalid_0   ),
	.s_axis_tdata0(s_axis_tdata_0     ),
	.s_axis_tready0(s_axis_tready_0   ),
	.s_axis_tlast0(s_axis_tlast_0     ),
	
	.s_axis_tvalid1(s_axis_tvalid_1   ),
	.s_axis_tdata1(s_axis_tdata_1     ),
	.s_axis_tready1(s_axis_tready_1   ),
	.s_axis_tlast1(s_axis_tlast_1     ),
	
	.s_axis_tvalid2(s_axis_tvalid_2   ),
	.s_axis_tdata2(s_axis_tdata_2     ),
	.s_axis_tready2(s_axis_tready_2   ),
	.s_axis_tlast2(s_axis_tlast_2     ),
	
	.s_axis_tvalid3(s_axis_tvalid_3   ),
	.s_axis_tdata3(s_axis_tdata_3     ),
	.s_axis_tready3(s_axis_tready_3   ),
	.s_axis_tlast3(s_axis_tlast_3     ),
	
	.s_axis_tvalid4(s_axis_tvalid_4   ),
	.s_axis_tdata4(s_axis_tdata_4     ),
	.s_axis_tready4(s_axis_tready_4   ),
	.s_axis_tlast4(s_axis_tlast_4     ),
	
	.s_axis_tvalid5(s_axis_tvalid_5   ),
	.s_axis_tdata5(s_axis_tdata_5     ),
	.s_axis_tready5(s_axis_tready_5   ),
	.s_axis_tlast5(s_axis_tlast_5     ),
	
	.s_axis_tvalid6(s_axis_tvalid_6   ),
	.s_axis_tdata6(s_axis_tdata_6     ),
	.s_axis_tready6(s_axis_tready_6   ),
	.s_axis_tlast6(s_axis_tlast_6     ),
	
	.s_axis_tvalid7(s_axis_tvalid_7   ),
	.s_axis_tdata7(s_axis_tdata_7     ),
	.s_axis_tready7(s_axis_tready_7   ),
	.s_axis_tlast7(s_axis_tlast_7     ),
	
	.s_axis_tvalid8(s_axis_tvalid_8   ),
	.s_axis_tdata8(s_axis_tdata_8     ),
	.s_axis_tready8(s_axis_tready_8   ),
	.s_axis_tlast8(s_axis_tlast_8     ),
	
	.s_axis_tvalid9(s_axis_tvalid_9   ),
	.s_axis_tdata9(s_axis_tdata_9     ),
	.s_axis_tready9(s_axis_tready_9   ),
	.s_axis_tlast9(s_axis_tlast_9     ),
	
	.s_axis_tvalid10(s_axis_tvalid_10 ),
	.s_axis_tdata10(s_axis_tdata_10   ),
	.s_axis_tready10(s_axis_tready_10 ),
	.s_axis_tlast10(s_axis_tlast_10   ),
	
	.s_axis_tvalid11(s_axis_tvalid_11 ),
	.s_axis_tdata11(s_axis_tdata_11   ),
	.s_axis_tready11(s_axis_tready_11 ),
	.s_axis_tlast11(s_axis_tlast_11   ),
	
	.s_axis_tvalid12(s_axis_tvalid_12 ),
	.s_axis_tdata12(s_axis_tdata_12   ),
	.s_axis_tready12(s_axis_tready_12 ),
	.s_axis_tlast12(s_axis_tlast_12   ),
	
	.s_axis_tvalid13(s_axis_tvalid_13 ),
	.s_axis_tdata13(s_axis_tdata_13   ),
	.s_axis_tready13(s_axis_tready_13 ),
	.s_axis_tlast13(s_axis_tlast_13   ),
	
	.s_axis_tvalid14(s_axis_tvalid_14 ),
	.s_axis_tdata14(s_axis_tdata_14   ),
	.s_axis_tready14(s_axis_tready_14 ),
	.s_axis_tlast14(s_axis_tlast_14   ),

	.s_axis_tvalid15(s_axis_tvalid_15 ),
	.s_axis_tdata15(s_axis_tdata_15   ),
	.s_axis_tready15(s_axis_tready_15 ),
	.s_axis_tlast15(s_axis_tlast_15   ),
	
	.s_axis_tvalid(m_axis_tvalid       ),
	.s_axis_tdata(m_axis_tdata         ),
	.s_axis_tready(m_axis_tready       ),
	.s_axis_tlast(m_axis_tlast         )  
);

endmodule
