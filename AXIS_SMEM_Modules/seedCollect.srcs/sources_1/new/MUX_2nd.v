`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/08/07 16:07:13
// Design Name: 
// Module Name: MUX_2nd
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


module MUX_2nd #( 
	parameter integer C_DATA_WIDTH = 128,
	parameter integer C_ID_WIDTH   = 10  
)
(	
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

	s_axis_tvalid,
	s_axis_tdata,
	s_axis_tready,
	s_axis_tlast,

	ID_in
	// ID_out    
    );

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

output reg s_axis_tvalid                    ;
output reg [C_DATA_WIDTH-1:0] s_axis_tdata  ;
input wire s_axis_tready                    ;
output reg s_axis_tlast                     ;

input wire [C_ID_WIDTH-1:0] ID_in           ;
// output reg [C_ID_WIDTH-1:0] ID_out          ;

reg [C_ID_WIDTH-1:0] ID_flag;

always @(*) begin
	if (ID_in == 1'b0) begin
		ID_flag = 1'b0;	
	end
	else begin
		ID_flag = (ID_in - 1'b1) >> 3;	
	end
end

always @(*) begin
	case (ID_flag[2:0]) 
		3'd0:
		begin
			s_axis_tvalid = s_axis_tvalid0;
			s_axis_tdata  = s_axis_tdata0 ;
			s_axis_tlast  = s_axis_tlast0 ;

			s_axis_tready0 = s_axis_tready;
			s_axis_tready1 = 1'b0;
			s_axis_tready2 = 1'b0;
			s_axis_tready3 = 1'b0;
			s_axis_tready4 = 1'b0;
			s_axis_tready5 = 1'b0;
			s_axis_tready6 = 1'b0;
			s_axis_tready7 = 1'b0;		
		end

		3'd1:
		begin
			s_axis_tvalid = s_axis_tvalid1;
			s_axis_tdata  = s_axis_tdata1 ;
			s_axis_tlast  = s_axis_tlast1 ;

			s_axis_tready0 = 1'b0;
			s_axis_tready1 = s_axis_tready;
			s_axis_tready2 = 1'b0;
			s_axis_tready3 = 1'b0;
			s_axis_tready4 = 1'b0;
			s_axis_tready5 = 1'b0;
			s_axis_tready6 = 1'b0;
			s_axis_tready7 = 1'b0;			
		end

		3'd2:
		begin
			s_axis_tvalid = s_axis_tvalid2;
			s_axis_tdata  = s_axis_tdata2 ;
			s_axis_tlast  = s_axis_tlast2 ;

			s_axis_tready0 = 1'b0;
			s_axis_tready1 = 1'b0;
			s_axis_tready2 = s_axis_tready;
			s_axis_tready3 = 1'b0;
			s_axis_tready4 = 1'b0;
			s_axis_tready5 = 1'b0;
			s_axis_tready6 = 1'b0;
			s_axis_tready7 = 1'b0;				
		end

		3'd3:
		begin
			s_axis_tvalid = s_axis_tvalid3;
			s_axis_tdata  = s_axis_tdata3 ;
			s_axis_tlast  = s_axis_tlast3 ;

			s_axis_tready0 = 1'b0;
			s_axis_tready1 = 1'b0;
			s_axis_tready2 = 1'b0;
			s_axis_tready3 = s_axis_tready;
			s_axis_tready4 = 1'b0;
			s_axis_tready5 = 1'b0;
			s_axis_tready6 = 1'b0;
			s_axis_tready7 = 1'b0;			
		end

		3'd4:
		begin
			s_axis_tvalid = s_axis_tvalid4;
			s_axis_tdata  = s_axis_tdata4 ;
			s_axis_tlast  = s_axis_tlast4 ;

			s_axis_tready0 = 1'b0;
			s_axis_tready1 = 1'b0;
			s_axis_tready2 = 1'b0;
			s_axis_tready3 = 1'b0;
			s_axis_tready4 = s_axis_tready;
			s_axis_tready5 = 1'b0;
			s_axis_tready6 = 1'b0;
			s_axis_tready7 = 1'b0;	
		end

		3'd5:
		begin
			s_axis_tvalid = s_axis_tvalid5;
			s_axis_tdata  = s_axis_tdata5 ;
			s_axis_tlast  = s_axis_tlast5 ;

			s_axis_tready0 = 1'b0;
			s_axis_tready1 = 1'b0;
			s_axis_tready2 = 1'b0;
			s_axis_tready3 = 1'b0;
			s_axis_tready4 = 1'b0;
			s_axis_tready5 = s_axis_tready;
			s_axis_tready6 = 1'b0;
			s_axis_tready7 = 1'b0;			
		end

		3'd6:
		begin
			s_axis_tvalid = s_axis_tvalid6;
			s_axis_tdata  = s_axis_tdata6 ;
			s_axis_tlast  = s_axis_tlast6 ;

			s_axis_tready0 = 1'b0;
			s_axis_tready1 = 1'b0;
			s_axis_tready2 = 1'b0;
			s_axis_tready3 = 1'b0;
			s_axis_tready4 = 1'b0;
			s_axis_tready5 = 1'b0;
			s_axis_tready6 = s_axis_tready;
			s_axis_tready7 = 1'b0;			
		end

		3'd7:
		begin
			s_axis_tvalid = s_axis_tvalid7;
			s_axis_tdata  = s_axis_tdata7 ;
			s_axis_tlast  = s_axis_tlast7 ;

			s_axis_tready0 = 1'b0;
			s_axis_tready1 = 1'b0;
			s_axis_tready2 = 1'b0;
			s_axis_tready3 = 1'b0;
			s_axis_tready4 = 1'b0;
			s_axis_tready5 = 1'b0;
			s_axis_tready6 = 1'b0;
			s_axis_tready7 = s_axis_tready;			
		end

		default:
		begin
			s_axis_tvalid = 1'b0 ;
			s_axis_tdata  = 1'b0 ;
			s_axis_tlast  = 1'b0 ;

			s_axis_tready0 = 1'b0;
			s_axis_tready1 = 1'b0;
			s_axis_tready2 = 1'b0;
			s_axis_tready3 = 1'b0;
			s_axis_tready4 = 1'b0;
			s_axis_tready5 = 1'b0;
			s_axis_tready6 = 1'b0;
			s_axis_tready7 = 1'b0;				
		end
	endcase
end

endmodule


