`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/07 16:05:57
// Design Name: 
// Module Name: MUX_1st
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

module MUX16 #( 
	parameter integer C_DATA_WIDTH = 128,
	parameter integer C_ID_WIDTH   = 5,
	parameter integer C_STATE_WIDTH = 2   
)
(	
	clk,
	rst_n,
	s_axis_tvalid0 ,
	s_axis_tdata0  ,
	s_axis_tready0 ,
	s_axis_tlast0  ,
	
	s_axis_tvalid1 ,
	s_axis_tdata1  ,
	s_axis_tready1 ,
	s_axis_tlast1  ,

	s_axis_tvalid2 ,
	s_axis_tdata2  ,
	s_axis_tready2 ,
	s_axis_tlast2  ,

	s_axis_tvalid3 ,
	s_axis_tdata3  ,
	s_axis_tready3 ,
	s_axis_tlast3  ,

	s_axis_tvalid4 ,
	s_axis_tdata4  ,
	s_axis_tready4 ,
	s_axis_tlast4  ,

	s_axis_tvalid5 ,
	s_axis_tdata5  ,
	s_axis_tready5 ,
	s_axis_tlast5  ,

	s_axis_tvalid6 ,
	s_axis_tdata6  ,
	s_axis_tready6 ,
	s_axis_tlast6  ,

	s_axis_tvalid7 ,
	s_axis_tdata7  ,
	s_axis_tready7 ,
	s_axis_tlast7  ,

	s_axis_tvalid8 ,
	s_axis_tdata8  ,
	s_axis_tready8 ,
	s_axis_tlast8  ,
	
	s_axis_tvalid9 ,
	s_axis_tdata9  ,
	s_axis_tready9 ,
	s_axis_tlast9  ,

	s_axis_tvalid10,
	s_axis_tdata10 ,
	s_axis_tready10,
	s_axis_tlast10 ,

	s_axis_tvalid11,
	s_axis_tdata11,
	s_axis_tready11,
	s_axis_tlast11,

	s_axis_tvalid12,
	s_axis_tdata12,
	s_axis_tready12,
	s_axis_tlast12,

	s_axis_tvalid13,
	s_axis_tdata13,
	s_axis_tready13,
	s_axis_tlast13,

	s_axis_tvalid14,
	s_axis_tdata14,
	s_axis_tready14,
	s_axis_tlast14,

	s_axis_tvalid15,
	s_axis_tdata15,
	s_axis_tready15,
	s_axis_tlast15,

	s_axis_tvalid,
	s_axis_tdata,
	s_axis_tready,
	s_axis_tlast,

	state,
	ID_in   
    );

input wire clk;
input wire rst_n;

input wire s_axis_tvalid0                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata0 ;
output reg s_axis_tready0                   ;
input wire s_axis_tlast0                    ;

input wire s_axis_tvalid1                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata1 ;
output reg s_axis_tready1                   ;
input wire s_axis_tlast1                    ;

input wire s_axis_tvalid2                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata2 ;
output reg s_axis_tready2                   ;
input wire s_axis_tlast2                    ;

input wire s_axis_tvalid3                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata3 ;
output reg s_axis_tready3                   ;
input wire s_axis_tlast3                    ;

input wire s_axis_tvalid4                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata4 ;
output reg s_axis_tready4                   ;
input wire s_axis_tlast4                    ;

input wire s_axis_tvalid5                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata5 ;
output reg s_axis_tready5                   ;
input wire s_axis_tlast5                    ;

input wire s_axis_tvalid6                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata6 ;
output reg s_axis_tready6                   ;
input wire s_axis_tlast6                    ;

input wire s_axis_tvalid7                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata7 ;
output reg s_axis_tready7                   ;
input wire s_axis_tlast7                    ;

input wire s_axis_tvalid8                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata8 ;
output reg s_axis_tready8                   ;
input wire s_axis_tlast8                    ;

input wire s_axis_tvalid9                   ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata9 ;
output reg s_axis_tready9                   ;
input wire s_axis_tlast9                    ;

input wire s_axis_tvalid10                  ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata10;
output reg s_axis_tready10                  ;
input wire s_axis_tlast10                   ;

input wire s_axis_tvalid11                  ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata11;
output reg s_axis_tready11                  ;
input wire s_axis_tlast11                   ;

input wire s_axis_tvalid12                  ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata12;
output reg s_axis_tready12                  ;
input wire s_axis_tlast12                   ;

input wire s_axis_tvalid13                  ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata13;
output reg s_axis_tready13                  ;
input wire s_axis_tlast13                   ;

input wire s_axis_tvalid14                  ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata14;
output reg s_axis_tready14                  ;
input wire s_axis_tlast14                   ;

input wire s_axis_tvalid15                  ;
input wire [C_DATA_WIDTH-1:0] s_axis_tdata15;
output reg s_axis_tready15                  ;
input wire s_axis_tlast15                   ;

output reg s_axis_tvalid                    ;
output reg [C_DATA_WIDTH-1:0] s_axis_tdata  ;
input wire s_axis_tready                    ;
output reg s_axis_tlast                     ;

input wire [C_STATE_WIDTH-1:0] state ;
input wire [C_ID_WIDTH-1:0] ID_in    ;

reg [C_ID_WIDTH-2:0] ID_flag;

localparam IDLE      = 2'b00;
localparam GET_ID    = 2'b01;
localparam CMP_ID    = 2'b10;
localparam TRANS     = 2'b11;

always @(*) begin
	if (ID_in == 1'b0) begin
		ID_flag <= 1'b0;	
	end
	else begin
		ID_flag <= ID_in - 1'b1;	
	end
end

always @(posedge clk or negedge rst_n) begin
	if (~rst_n) begin
		s_axis_tvalid   <= 1'b0;
		s_axis_tdata    <= 1'b0;
		s_axis_tlast    <= 1'b0;
		
		s_axis_tready0  <= 1'b0;
		s_axis_tready1  <= 1'b0;
		s_axis_tready2  <= 1'b0;
		s_axis_tready3  <= 1'b0;
		s_axis_tready4  <= 1'b0;
		s_axis_tready5  <= 1'b0;
		s_axis_tready6  <= 1'b0;
		s_axis_tready7  <= 1'b0;
		s_axis_tready8  <= 1'b0;
		s_axis_tready9  <= 1'b0;
		s_axis_tready10 <= 1'b0;
		s_axis_tready11 <= 1'b0;
		s_axis_tready12 <= 1'b0;
		s_axis_tready13 <= 1'b0;
		s_axis_tready14 <= 1'b0;
		s_axis_tready15 <= 1'b0;			
	end
	else if ((ID_in == 1'b0) && (state == TRANS)) begin
		s_axis_tvalid   <= 1'b0;
		s_axis_tdata    <= 1'b0;
		s_axis_tlast    <= 1'b0;
		
		s_axis_tready0  <= 1'b0;
		s_axis_tready1  <= 1'b0;
		s_axis_tready2  <= 1'b0;
		s_axis_tready3  <= 1'b0;
		s_axis_tready4  <= 1'b0;
		s_axis_tready5  <= 1'b0;
		s_axis_tready6  <= 1'b0;
		s_axis_tready7  <= 1'b0;
		s_axis_tready8  <= 1'b0;
		s_axis_tready9  <= 1'b0;
		s_axis_tready10 <= 1'b0;
		s_axis_tready11 <= 1'b0;
		s_axis_tready12 <= 1'b0;
		s_axis_tready13 <= 1'b0;
		s_axis_tready14 <= 1'b0;
		s_axis_tready15 <= 1'b0;		
	end
	else if ((ID_in != 1'b0) && (state == TRANS)) begin
	case (ID_flag[3:0]) 
		4'd0:
		begin
			s_axis_tvalid <= s_axis_tvalid0;
			s_axis_tdata  <= s_axis_tdata0 ;
			s_axis_tlast  <= s_axis_tlast0 ;

			s_axis_tready0  <= s_axis_tready;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;		
		end

		4'd1:
		begin
			s_axis_tvalid <= s_axis_tvalid1;
			s_axis_tdata  <= s_axis_tdata1 ;
			s_axis_tlast  <= s_axis_tlast1 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= s_axis_tready;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd2:
		begin
			s_axis_tvalid <= s_axis_tvalid2;
			s_axis_tdata  <= s_axis_tdata2 ;
			s_axis_tlast  <= s_axis_tlast2 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= s_axis_tready;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;				
		end

		4'd3:
		begin
			s_axis_tvalid <= s_axis_tvalid3;
			s_axis_tdata  <= s_axis_tdata3 ;
			s_axis_tlast  <= s_axis_tlast3 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= s_axis_tready;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd4:
		begin
			s_axis_tvalid <= s_axis_tvalid4;
			s_axis_tdata  <= s_axis_tdata4 ;
			s_axis_tlast  <= s_axis_tlast4 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= s_axis_tready;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;		
		end

		4'd5:
		begin
			s_axis_tvalid <= s_axis_tvalid5;
			s_axis_tdata  <= s_axis_tdata5 ;
			s_axis_tlast  <= s_axis_tlast5 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= s_axis_tready;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;				
		end

		4'd6:
		begin
			s_axis_tvalid <= s_axis_tvalid6;
			s_axis_tdata  <= s_axis_tdata6 ;
			s_axis_tlast  <= s_axis_tlast6 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= s_axis_tready;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;				
		end

		4'd7:
		begin
			s_axis_tvalid <= s_axis_tvalid7;
			s_axis_tdata  <= s_axis_tdata7 ;
			s_axis_tlast  <= s_axis_tlast7 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= s_axis_tready;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd8:
		begin
			s_axis_tvalid <= s_axis_tvalid8;
			s_axis_tdata  <= s_axis_tdata8 ;
			s_axis_tlast  <= s_axis_tlast8 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= s_axis_tready;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd9:
		begin
			s_axis_tvalid <= s_axis_tvalid9;
			s_axis_tdata  <= s_axis_tdata9 ;
			s_axis_tlast  <= s_axis_tlast9 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= s_axis_tready;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd10:
		begin
			s_axis_tvalid <= s_axis_tvalid10;
			s_axis_tdata  <= s_axis_tdata10 ;
			s_axis_tlast  <= s_axis_tlast10 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= s_axis_tready;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd11:
		begin
			s_axis_tvalid <= s_axis_tvalid11;
			s_axis_tdata  <= s_axis_tdata11 ;
			s_axis_tlast  <= s_axis_tlast11 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= s_axis_tready;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd12:
		begin
			s_axis_tvalid <= s_axis_tvalid12;
			s_axis_tdata  <= s_axis_tdata12 ;
			s_axis_tlast  <= s_axis_tlast12 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= s_axis_tready;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd13:
		begin
			s_axis_tvalid <= s_axis_tvalid13;
			s_axis_tdata  <= s_axis_tdata13 ;
			s_axis_tlast  <= s_axis_tlast13 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= s_axis_tready;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;			
		end

		4'd14:
		begin
			s_axis_tvalid <= s_axis_tvalid14;
			s_axis_tdata  <= s_axis_tdata14 ;
			s_axis_tlast  <= s_axis_tlast14 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= s_axis_tready;
			s_axis_tready15 <= 1'b0;			
		end

		4'd15:
		begin
			s_axis_tvalid <= s_axis_tvalid15;
			s_axis_tdata  <= s_axis_tdata15 ;
			s_axis_tlast  <= s_axis_tlast15 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= s_axis_tready;			
		end

		default:
		begin
			s_axis_tvalid <= 1'b0 ;
			s_axis_tdata  <= 1'b0 ;
			s_axis_tlast  <= 1'b0 ;

			s_axis_tready0  <= 1'b0;
			s_axis_tready1  <= 1'b0;
			s_axis_tready2  <= 1'b0;
			s_axis_tready3  <= 1'b0;
			s_axis_tready4  <= 1'b0;
			s_axis_tready5  <= 1'b0;
			s_axis_tready6  <= 1'b0;
			s_axis_tready7  <= 1'b0;
			s_axis_tready8  <= 1'b0;
			s_axis_tready9  <= 1'b0;
			s_axis_tready10 <= 1'b0;
			s_axis_tready11 <= 1'b0;
			s_axis_tready12 <= 1'b0;
			s_axis_tready13 <= 1'b0;
			s_axis_tready14 <= 1'b0;
			s_axis_tready15 <= 1'b0;				
		end
	endcase
	end
end

endmodule

