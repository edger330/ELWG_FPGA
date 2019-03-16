`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/07/20 16:22:56
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


module MUX_1st #( 
	parameter integer C_DATA_WIDTH = 512,
	parameter integer C_ID_WIDTH   = 10   
)
(
	start ,
	data  ,
	ID    ,
	state    ,
	
	start_out0 ,
	data_out0  ,
	ID_out0    ,
	
	start_out1 ,
	data_out1  ,
	ID_out1    ,
	
	start_out2 ,
	data_out2  ,
	ID_out2    ,
	
	start_out3 ,
	data_out3  ,
	ID_out3    ,
	
	start_out4 ,
	data_out4  ,
	ID_out4    ,
	
	start_out5 ,
	data_out5  ,
	ID_out5    ,
	
	start_out6 ,
	data_out6  ,
	ID_out6    ,
	
	start_out7 ,
	data_out7  ,
	ID_out7
    );
  parameter IDLE = 2'b00;
  parameter GET_ID = 2'b01;
  parameter MATCH_ID = 2'b10;
  parameter DONE    = 2'b11 ;
    
input wire [1:0] state                   ;
input wire start                         ;
input wire [C_DATA_WIDTH-1:0] data       ;
input wire [C_ID_WIDTH-1:0] ID           ;

output reg start_out0                   ;
output reg [C_DATA_WIDTH-1:0] data_out0 ;
output reg [C_ID_WIDTH-1:0] ID_out0     ;

output reg start_out1                   ;
output reg [C_DATA_WIDTH-1:0] data_out1 ;
output reg [C_ID_WIDTH-1:0] ID_out1     ;

output reg start_out2                   ;
output reg [C_DATA_WIDTH-1:0] data_out2 ;
output reg [C_ID_WIDTH-1:0] ID_out2     ;

output reg start_out3                   ;
output reg [C_DATA_WIDTH-1:0] data_out3 ;
output reg [C_ID_WIDTH-1:0] ID_out3     ;

output reg start_out4                   ;
output reg [C_DATA_WIDTH-1:0] data_out4 ;
output reg [C_ID_WIDTH-1:0] ID_out4     ;

output reg start_out5                   ;
output reg [C_DATA_WIDTH-1:0] data_out5 ;
output reg [C_ID_WIDTH-1:0] ID_out5     ;

output reg start_out6                   ;
output reg [C_DATA_WIDTH-1:0] data_out6 ;
output reg [C_ID_WIDTH-1:0] ID_out6     ;

output reg start_out7                   ;
output reg [C_DATA_WIDTH-1:0] data_out7 ;
output reg [C_ID_WIDTH-1:0] ID_out7     ;

reg [C_ID_WIDTH-1:0] ID_flag;

always @(*) begin
	if (ID == 1'b0) begin
		ID_flag <= 1'b0;	
	end
	else begin
		ID_flag <= ID - 1'b1;	
	end
end

always @(*) begin
	if (!ID ) begin
		start_out0 <= 1'b0 ;
		data_out0  <= 1'b0 ;
		ID_out0    <= 1'b0 ;
		
		start_out1 <= 1'b0 ;
		data_out1  <= 1'b0 ;
		ID_out1    <= 1'b0 ;
		
		start_out2 <= 1'b0 ;
		data_out2  <= 1'b0 ;
		ID_out2    <= 1'b0 ;
		
		start_out3 <= 1'b0 ;
		data_out3  <= 1'b0 ;
		ID_out3    <= 1'b0 ;
		
		start_out4 <= 1'b0 ;
		data_out4  <= 1'b0 ;
		ID_out4    <= 1'b0 ;
		
		start_out5 <= 1'b0 ;
		data_out5  <= 1'b0 ;
		ID_out5    <= 1'b0 ;
		
		start_out6 <= 1'b0 ;
		data_out6  <= 1'b0 ;
		ID_out6    <= 1'b0 ;
		
		start_out7 <= 1'b0 ;
		data_out7  <= 1'b0 ;
		ID_out7    <= 1'b0 ;		
	end
	else if (state == MATCH_ID) begin
	case ((ID_flag) >> 6) 
		3'd0:
		begin
			start_out0 <= start;
			data_out0 <= data;
			ID_out0 <= ID_flag[C_ID_WIDTH-5:0];

			start_out1 <= 1'b0 ;
			data_out1  <= 1'b0 ;
			ID_out1    <= 1'b0 ;

			start_out2 <= 1'b0 ;
			data_out2  <= 1'b0 ;
			ID_out2    <= 1'b0 ;

			start_out3 <= 1'b0 ;
			data_out3  <= 1'b0 ;
			ID_out3    <= 1'b0 ;

			start_out4 <= 1'b0 ;
			data_out4  <= 1'b0 ;
			ID_out4    <= 1'b0 ;

			start_out5 <= 1'b0 ;
			data_out5  <= 1'b0 ;
			ID_out5    <= 1'b0 ;

			start_out6 <= 1'b0 ;
			data_out6  <= 1'b0 ;
			ID_out6    <= 1'b0 ;

			start_out7 <= 1'b0 ;
			data_out7  <= 1'b0 ;
			ID_out7    <= 1'b0 ;	
		end

		3'd1:
		begin
			start_out1 <= start;
			data_out1 <= data;
			ID_out1 <= ID_flag[C_ID_WIDTH-5:0];

			start_out0 <= 1'b0 ;
			data_out0  <= 1'b0 ;
			ID_out0    <= 1'b0 ;

			start_out2 <= 1'b0 ;
			data_out2  <= 1'b0 ;
			ID_out2    <= 1'b0 ;

			start_out3 <= 1'b0 ;
			data_out3  <= 1'b0 ;
			ID_out3    <= 1'b0 ;

			start_out4 <= 1'b0 ;
			data_out4  <= 1'b0 ;
			ID_out4    <= 1'b0 ;

			start_out5 <= 1'b0 ;
			data_out5  <= 1'b0 ;
			ID_out5    <= 1'b0 ;

			start_out6 <= 1'b0 ;
			data_out6  <= 1'b0 ;
			ID_out6    <= 1'b0 ;

			start_out7 <= 1'b0 ;
			data_out7  <= 1'b0 ;
			ID_out7    <= 1'b0 ;			
		end

		3'd2:
		begin
			start_out2 <= start;
			data_out2 <= data;
			ID_out2 <= ID_flag[C_ID_WIDTH-5:0];

			start_out0 <= 1'b0 ;
			data_out0  <= 1'b0 ;
			ID_out0    <= 1'b0 ;

			start_out1 <= 1'b0 ;
			data_out1  <= 1'b0 ;
			ID_out1    <= 1'b0 ;

			start_out3 <= 1'b0 ;
			data_out3  <= 1'b0 ;
			ID_out3    <= 1'b0 ;

			start_out4 <= 1'b0 ;
			data_out4  <= 1'b0 ;
			ID_out4    <= 1'b0 ;

			start_out5 <= 1'b0 ;
			data_out5  <= 1'b0 ;
			ID_out5    <= 1'b0 ;

			start_out6 <= 1'b0 ;
			data_out6  <= 1'b0 ;
			ID_out6    <= 1'b0 ;

			start_out7 <= 1'b0 ;
			data_out7  <= 1'b0 ;
			ID_out7    <= 1'b0 ;			
		end

		3'd3:
		begin
			start_out3 <= start;
			data_out3 <= data;
			ID_out3 <= ID_flag[C_ID_WIDTH-5:0];

			start_out0 <= 1'b0 ;
			data_out0  <= 1'b0 ;
			ID_out0    <= 1'b0 ;

			start_out1 <= 1'b0 ;
			data_out1  <= 1'b0 ;
			ID_out1    <= 1'b0 ;

			start_out2 <= 1'b0 ;
			data_out2  <= 1'b0 ;
			ID_out2    <= 1'b0 ;

			start_out4 <= 1'b0 ;
			data_out4  <= 1'b0 ;
			ID_out4    <= 1'b0 ;

			start_out5 <= 1'b0 ;
			data_out5  <= 1'b0 ;
			ID_out5    <= 1'b0 ;

			start_out6 <= 1'b0 ;
			data_out6  <= 1'b0 ;
			ID_out6    <= 1'b0 ;

			start_out7 <= 1'b0 ;
			data_out7  <= 1'b0 ;
			ID_out7    <= 1'b0 ;			
		end

		3'd4:
		begin
			start_out4 <= start;
			data_out4 <= data;
			ID_out4 <= ID_flag[C_ID_WIDTH-5:0];	

			start_out0 <= 1'b0 ;
			data_out0  <= 1'b0 ;
			ID_out0    <= 1'b0 ;

			start_out1 <= 1'b0 ;
			data_out1  <= 1'b0 ;
			ID_out1    <= 1'b0 ;

			start_out2 <= 1'b0 ;
			data_out2  <= 1'b0 ;
			ID_out2    <= 1'b0 ;

			start_out3 <= 1'b0 ;
			data_out3  <= 1'b0 ;
			ID_out3    <= 1'b0 ;

			start_out5 <= 1'b0 ;
			data_out5  <= 1'b0 ;
			ID_out5    <= 1'b0 ;

			start_out6 <= 1'b0 ;
			data_out6  <= 1'b0 ;
			ID_out6    <= 1'b0 ;

			start_out7 <= 1'b0 ;
			data_out7  <= 1'b0 ;
			ID_out7    <= 1'b0 ;					
		end

		3'd5:
		begin
			start_out5 <= start;
			data_out5 <= data;
			ID_out5 <= ID_flag[C_ID_WIDTH-5:0];

			start_out0 <= 1'b0 ;
			data_out0  <= 1'b0 ;
			ID_out0    <= 1'b0 ;

			start_out1 <= 1'b0 ;
			data_out1  <= 1'b0 ;
			ID_out1    <= 1'b0 ;

			start_out2 <= 1'b0 ;
			data_out2  <= 1'b0 ;
			ID_out2    <= 1'b0 ;

			start_out3 <= 1'b0 ;
			data_out3  <= 1'b0 ;
			ID_out3    <= 1'b0 ;

			start_out4 <= 1'b0 ;
			data_out4  <= 1'b0 ;
			ID_out4    <= 1'b0 ;

			start_out6 <= 1'b0 ;
			data_out6  <= 1'b0 ;
			ID_out6    <= 1'b0 ;

			start_out7 <= 1'b0 ;
			data_out7  <= 1'b0 ;
			ID_out7    <= 1'b0 ;			
		end

		3'd6:
		begin
			start_out6 <= start;
			data_out6 <= data;
			ID_out6 <= ID_flag[C_ID_WIDTH-5:0];

			start_out0 <= 1'b0 ;
			data_out0  <= 1'b0 ;
			ID_out0    <= 1'b0 ;

			start_out1 <= 1'b0 ;
			data_out1  <= 1'b0 ;
			ID_out1    <= 1'b0 ;

			start_out2 <= 1'b0 ;
			data_out2  <= 1'b0 ;
			ID_out2    <= 1'b0 ;

			start_out3 <= 1'b0 ;
			data_out3  <= 1'b0 ;
			ID_out3    <= 1'b0 ;

			start_out4 <= 1'b0 ;
			data_out4  <= 1'b0 ;
			ID_out4    <= 1'b0 ;

			start_out5 <= 1'b0 ;
			data_out5  <= 1'b0 ;
			ID_out5    <= 1'b0 ;

			start_out7 <= 1'b0 ;
			data_out7  <= 1'b0 ;
			ID_out7    <= 1'b0 ;			
		end

		3'd7:
		begin
			start_out7 <= start;
			data_out7 <= data;
			ID_out7 <= ID_flag[C_ID_WIDTH-5:0];

			start_out0 <= 1'b0 ;
			data_out0  <= 1'b0 ;
			ID_out0    <= 1'b0 ;

			start_out1 <= 1'b0 ;
			data_out1  <= 1'b0 ;
			ID_out1    <= 1'b0 ;

			start_out2 <= 1'b0 ;
			data_out2  <= 1'b0 ;
			ID_out2    <= 1'b0 ;

			start_out3 <= 1'b0 ;
			data_out3  <= 1'b0 ;
			ID_out3    <= 1'b0 ;

			start_out4 <= 1'b0 ;
			data_out4  <= 1'b0 ;
			ID_out4    <= 1'b0 ;

			start_out5 <= 1'b0 ;
			data_out5  <= 1'b0 ;
			ID_out5    <= 1'b0 ;

			start_out6 <= 1'b0 ;
			data_out6  <= 1'b0 ;
			ID_out6    <= 1'b0 ;			
		end

		default:
		begin
			start_out0 <= 1'b0 ;
			data_out0  <= 1'b0 ;
			ID_out0    <= 1'b0 ;

			start_out1 <= 1'b0 ;
			data_out1  <= 1'b0 ;
			ID_out1    <= 1'b0 ;

			start_out2 <= 1'b0 ;
			data_out2  <= 1'b0 ;
			ID_out2    <= 1'b0 ;

			start_out3 <= 1'b0 ;
			data_out3  <= 1'b0 ;
			ID_out3    <= 1'b0 ;

			start_out4 <= 1'b0 ;
			data_out4  <= 1'b0 ;
			ID_out4    <= 1'b0 ;

			start_out5 <= 1'b0 ;
			data_out5  <= 1'b0 ;
			ID_out5    <= 1'b0 ;

			start_out6 <= 1'b0 ;
			data_out6  <= 1'b0 ;
			ID_out6    <= 1'b0 ;

			start_out7 <= 1'b0 ;
			data_out7  <= 1'b0 ;
			ID_out7    <= 1'b0 ;			
		end
	endcase
	end
end

endmodule
