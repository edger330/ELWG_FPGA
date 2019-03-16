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
//  2017-06-08       cz             initial version
//
**********************************************************************/

module package_send(
	//input 
	start,
	sys_clk,
	sys_rst_n,
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


/*---------------------------------------------------------------------*\
                         port description 
\*---------------------------------------------------------------------*/
input start    ;
input sys_clk  ;
input sys_rst_n;
input [15:0] hap_num;
input [15:0] read_num;
input matrix_enable;

output [31:0] data;
output        sop ;
output        eop ;
output 		  vld ;

output        hap_ram_ren  ;//hap
output [16:0] hap_ram_raddr;
input  [ 7:0] hap_data     ;

output        head_ram_ren  ;//head
output [ 2:0] head_ram_raddr;
input  [31:0] head_data     ;

output        read_ram_ren  ;//read
output [12:0] read_ram_raddr;
input  [ 7:0] read_data     ;

output [12:0] p_ram_raddr;//p
output        p_ram_ren  ;
input  [31:0] p0_ram_rdat;
input  [31:0] p1_ram_rdat;
input  [31:0] p2_ram_rdat;
input  [31:0] p3_ram_rdat;
input  [31:0] p4_ram_rdat;
input  [31:0] p5_ram_rdat;
input  [31:0] p6_ram_rdat;

output all_write_finished;
/*---------------------------------------------------------------------*\
                         reg/wire description 
\*---------------------------------------------------------------------*/
reg        hap_ram_ren   ;
reg [16:0] hap_ram_raddr ;
reg [16:0] hap_raddr_move;

// reg [ 8:0] hap_counter   ;
reg [15:0] hap_len       ;
reg [15:0] hap_id		 ;
reg [15:0] true_hap_id   ;


reg        head_ram_ren  ;
reg [ 2:0] head_ram_raddr;


reg        read_ram_ren   ;
reg [12:0] read_ram_raddr ;
reg [12:0] read_raddr_move;
wire [ 7:0] read_data      ;
reg [15:0] read_len		  ;
// reg [ 7:0] read_counter	  ;
reg [15:0] read_id		  ;
reg [15:0] true_read_id	  ;

reg [12:0] p_raddr_move;
reg [12:0] p_ram_raddr;
reg        p_ram_ren  ;


reg [31:0] r_h;
reg [7:0] counter;
reg 	  en_counter;
reg [15:0]    counter_read_num;
reg [15:0]	  counter_hap_num;
reg [3:0] counter_cycle;
reg [31:0] counter_sum_cycle;

reg [15:0] hap_num_ok;
reg [15:0] read_num_ok;
reg fifo_filled_1; 
reg fifo_filled_2; 
reg fifo_filled_3; 
reg fifo_filled_4; 

reg data_sop_temp;
reg data_sop;
reg data_eop;
reg data_vld;

reg [33:0] fifo_data_in; //fifo
reg fifo_write_en;
reg fifo_read_en;
wire[33:0] fifo_data_out;
wire empty;
wire full;
wire [12:0] usedw;

reg all_write_finished;

reg f0_start ;
reg f1_start ;
wire start_pulse;
reg module_vld;
reg f0_enable;
reg f1_enable;
wire enable;

wire rom_y_ini_rden ;
wire [8:0] rom_y_ini_addr;
wire [31:0] rom_y_ini_data;

reg [7:0] num_pkt_in_fifo;
/*---------------------------------------------------------------------*\
                         main code 
\*---------------------------------------------------------------------*/

always @(posedge sys_clk or negedge sys_rst_n) //制造脉冲start_pulse
begin 
	if (!sys_rst_n) begin 
		f0_start <=#D 0;
		f1_start <=#D 0;
	end else begin 
		f0_start <=#D start;
		f1_start <=#D f0_start;
	end
end

assign start_pulse = f0_start && ~f1_start;

always @(posedge sys_clk or negedge sys_rst_n) //制造脉冲enable
begin 
	if (!sys_rst_n) begin 
		f0_enable <=#D 0;
		f1_enable <=#D 0;
	end else if (module_vld) begin 
		f0_enable <=#D matrix_enable;
		f1_enable <=#D f0_enable;
	end
end

assign enable = f0_enable && ~f1_enable;

always @(posedge sys_clk or negedge sys_rst_n)  // 写操作使能信号
begin 
	if (!sys_rst_n) begin
		module_vld <=#D 0;
	end else if (start_pulse) begin 
		module_vld <=#D 1;
	end else if (all_write_finished) begin 
		module_vld <=#D 0;
	end
end

reg write_module_vld;

always @(posedge sys_clk or negedge sys_rst_n) // fifo内存是否够存入一个pkt
begin 
	if (!sys_rst_n) begin 
		write_module_vld <=#D 1;
	end else if (counter == 8'd0 && usedw <= 7200) begin 
		write_module_vld <=#D 1;
	end else if (counter == 8'd0 && usedw > 7200) begin 
		write_module_vld <=#D 0;
	end
end



always @(posedge sys_clk or negedge sys_rst_n) //记录hap的id counter_hap_num
begin 
	if (!sys_rst_n) begin 
		counter_hap_num <=#D 1;
	end else if (module_vld && fifo_filled_1 && counter_hap_num == hap_num_ok) begin 
		counter_hap_num <=#D 1;
	end else if (module_vld && fifo_filled_1) begin 
		counter_hap_num <=#D counter_hap_num + 1;
	end
end


always @(posedge sys_clk or negedge sys_rst_n) //记录read的id counter_read_num;
begin 
	if (!sys_rst_n) begin 
		counter_read_num <=#D 1;
	end else if (fifo_filled_2 && module_vld && counter_hap_num == hap_num_ok && counter_read_num == read_num_ok ) begin 
		counter_read_num <=#D 1;
 	end else if (fifo_filled_2  && module_vld && counter_hap_num == hap_num_ok) begin 
		counter_read_num <=#D counter_read_num + 1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) //所有的信号都已经传输完毕；
begin 
	if (!sys_rst_n) begin 
		all_write_finished <=#D 1;
	end else if (module_vld && fifo_filled_3 && counter_hap_num == hap_num_ok && counter_read_num == read_num_ok  ) begin 
		all_write_finished <=#D 1;
	end else begin 
		all_write_finished <=#D 0;
	end
end

reg write_next_pkt_en;

always @(posedge sys_clk or negedge sys_rst_n)//写入下一个数据包的使能信号write_next_pkt_en
begin 
	if (!sys_rst_n) begin 
		write_next_pkt_en <=#D 1;
	end else if (fifo_filled_4) begin 
		write_next_pkt_en <=#D 1;
	end else if (en_counter) begin 
		write_next_pkt_en <=#D 0;
	end
end



always @(posedge sys_clk or negedge sys_rst_n)//外围计数器counter使能信号，en_counter;
begin 
	if (!sys_rst_n) begin 
		en_counter <=#D 0;
	end else if (  write_next_pkt_en && write_module_vld && module_vld) begin 
		en_counter <=#D 1;
	end else if (module_vld && counter >= 100) begin 
		en_counter <=#D 0;
	end
end

always @(posedge sys_clk or negedge sys_rst_n)//外围计数器
begin 
	if (!sys_rst_n) begin 
		counter <=#D 0;
	end else if (fifo_filled_1) begin 
		counter <=#D 0;
	end else if (en_counter && module_vld) begin 
		counter <=#D counter + 1;
	end	
end

always @ (posedge sys_clk or negedge sys_rst_n) //周期计数器counter_cycle
begin
	if (!sys_rst_n) begin 
		counter_cycle <=#D 0;
	end else if (fifo_filled_2) begin 
		counter_cycle <=#D 0;
	end else if (counter_cycle == 7 && module_vld) begin 
		counter_cycle <=#D 0;
	end else if (counter >= 13 && module_vld) begin 
		counter_cycle <=#D counter_cycle + 1;
	end
end


always @ (posedge sys_clk or negedge sys_rst_n) //hap_num_ok 和 read_num_ok
begin
	if (!sys_rst_n) begin
		hap_num_ok <=#D 0;
		read_num_ok<=#D 0;
	end else if (start_pulse) begin 
		hap_num_ok <=#D hap_num;
		read_num_ok<=#D read_num;
	end
end

//-----------------------------------------------------------------------head 模块

always @(posedge sys_clk or negedge sys_rst_n) //head_ram的读地址head_ram_raddr
begin 
	if (!sys_rst_n) begin
		head_ram_raddr <=#D 0;
	end else if (module_vld) begin 	
		case (counter)
			8'd0 : head_ram_raddr <=#D 3'd5;
			8'd1 : head_ram_raddr <=#D 3'd4;
			8'd2 : head_ram_raddr <=#D 3'd3;
			8'd3 : head_ram_raddr <=#D 3'd2;
			8'd4 : head_ram_raddr <=#D 3'd1;
			8'd5 : head_ram_raddr <=#D 3'd0;
			default: head_ram_raddr <=#D 3'd6;
		endcase // counter
	end
end

always @(posedge sys_clk or negedge sys_rst_n) //head_ram读使能信号
begin 
	if (!sys_rst_n) begin 
		head_ram_ren <=#D 0;
	end else if (counter <= 6 && module_vld)  begin 
		head_ram_ren <=#D 1;
	end else begin  
		head_ram_ren <=#D 0;
	end	
end


//-----------------------------------------------------------------------hap 模块


always @(posedge sys_clk or negedge sys_rst_n) // hap读取的基地址hap_raddr_move
begin 
	if (!sys_rst_n) begin 
		hap_raddr_move <=#D 0;
	end else if ((counter_hap_num == hap_num_ok) && fifo_filled_3) begin 
		hap_raddr_move <=#D 0;
	end else if (all_write_finished && module_vld) begin 
		hap_raddr_move <=#D 0;
 	end else if (fifo_filled_3 && module_vld) begin 
		hap_raddr_move <=#D hap_raddr_move + 400;
	end	
end

// always @(posedge sys_clk or negedge sys_rst_n) // hap_counter
// begin 
// 	if (!sys_rst_n)
// 		hap_counter <= 0;
// 	else if (counter >= 11)
// 		hap_counter <= hap_counter + 1;
// end


always @(posedge sys_clk or negedge sys_rst_n)//hap_ram_ren
begin 
	if (!sys_rst_n) begin 
		hap_ram_ren <=#D 0;
	end else if (fifo_filled_4 ) begin 
		hap_ram_ren <=#D 0;
	end else if (counter == 6 && module_vld) begin 
		hap_ram_ren <=#D 1;
	end
end


always @(posedge sys_clk or negedge sys_rst_n) // hap_ram_raddr
begin 
	if (!sys_rst_n) begin 
		hap_ram_raddr <=#D 0;
	end else if (counter == 6 && module_vld) begin 
		hap_ram_raddr <=#D hap_raddr_move;
	end else if (counter >= 6 && counter <=9 && module_vld) begin 
		hap_ram_raddr <=#D hap_ram_raddr + 1;
	end else if (counter_cycle == 5 && module_vld) begin 
		hap_ram_raddr <=#D hap_ram_raddr + 1;
	end	else if (counter_cycle == 6 && module_vld) begin 
		hap_ram_raddr <=#D hap_ram_raddr + 1;
	end	
end

always @(posedge sys_clk or negedge sys_rst_n) // hap_id
begin 
	if (!sys_rst_n) begin 
		hap_id <=#D 0;
	end else if (fifo_filled_1 ) begin 
		hap_id <=#D 0;
	end else if (counter == 9 && module_vld) begin 
		hap_id [15:8] <=#D hap_data;
	end else if (counter == 10 && module_vld) begin 
		hap_id [ 7:0] <=#D hap_data; 
	end	
end

always @(posedge sys_clk or negedge sys_rst_n) // hap_id
begin 
	if (!sys_rst_n) begin 
		true_hap_id <=#D 0;
	end else begin 
		true_hap_id <=#D hap_id-1;
	end	
end


always @(posedge sys_clk or negedge sys_rst_n) // hap_len
begin 
	if (!sys_rst_n) begin 
		hap_len <=#D 300;
 	end else if (fifo_filled_2 ) begin 
		hap_len <=#D 300;
	end else if (counter == 11 && module_vld) begin 
		hap_len[15:8] <=#D hap_data;
	end else if (counter == 12 && module_vld) begin 
		hap_len[7:0]  <=#D hap_data;
	end	 
end

//-----------------------------------------------------------------------read 模块



always @(posedge sys_clk or negedge sys_rst_n) // read_ram_ren read存储模块使能信号
begin 
	if (!sys_rst_n) begin 
		read_ram_ren <=#D 0;
	end else if (fifo_filled_3 ) begin 
		read_ram_ren <=#D 0;
	end else if (counter == 6 && module_vld) begin 
		read_ram_ren <=#D 1 ;
	end	
end

always @(posedge sys_clk or negedge sys_rst_n) // 基地址read_raddr_move
begin 
	if (!sys_rst_n) begin 
		read_raddr_move <=#D 0;
	end else if (all_write_finished ) begin 
		read_raddr_move <=#D 0;
	end else if (fifo_filled_4 && counter_hap_num == hap_num_ok && module_vld) begin 
		read_raddr_move <=#D read_raddr_move + 80;
	end
end


always @(posedge sys_clk or negedge sys_rst_n) // read_ram_raddr
begin  
	if (!sys_rst_n) begin 
		read_ram_raddr <=#D 0;
	end else if (counter == 6 && module_vld) begin 
		read_ram_raddr <=#D read_raddr_move;
	end else if (counter >= 6 && counter <= 9 && module_vld) begin 
		read_ram_raddr <=#D read_ram_raddr + 1;
	end else if (counter_cycle == 5 && module_vld) begin 
		read_ram_raddr <=#D read_ram_raddr + 1;
	end else if (counter_cycle == 6 && module_vld) begin 
		read_ram_raddr <=#D read_ram_raddr + 1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) // read_id
begin 
	if (!sys_rst_n) begin
		read_id <=#D 0;
	end else if (fifo_filled_1) begin 
		read_id <=#D 0;
	end else if (counter == 9 && module_vld) begin 
		read_id [15:8] <=#D read_data;
	end else if (counter == 10 && module_vld) begin 
		read_id [ 7:0] <=#D read_data; 
	end	
end

always @(posedge sys_clk or negedge sys_rst_n)// true_read_id
begin 
	if (!sys_rst_n) begin 
		true_read_id <=#D 0;
	end else begin  
		true_read_id <=#D read_id-1;
	end	
end



always @(posedge sys_clk or negedge sys_rst_n)  // read_len
begin 
	if (!sys_rst_n) begin 
		read_len <=#D 80;
	end	else if (fifo_filled_2) begin 
		read_len <=#D 80;
	end else if (counter == 11 && module_vld) begin 
		read_len[15:8] <=#D read_data;
	end else if (counter == 12 && module_vld) begin 
		read_len[7:0]  <=#D read_data;
	end	
end

always @(posedge sys_clk or negedge sys_rst_n)  // r_h
begin 
	if (!sys_rst_n) begin 
		r_h <=#D 0;
	end else if (fifo_filled_3) begin 
		r_h <=#D 0;
	end else if (counter_cycle == 0 && module_vld) begin 
		r_h [31:24] <=#D read_data;
		r_h[15: 8] <=#D hap_data ;
	end else if (counter_cycle == 1 && module_vld) begin 
		r_h[23:16] <=#D read_data;
		r_h[ 7:0]  <=#D hap_data ;
	end
end

//-----------------------------------------------------------------------p 模块

always @(posedge sys_clk or negedge sys_rst_n) // p_raddr_move
begin 
	if (!sys_rst_n) begin 
		p_raddr_move <=#D 0;
	end else if (all_write_finished ) begin 
		p_raddr_move <=#D 0;
	end else if ( fifo_filled_4 && counter_hap_num == hap_num_ok && module_vld) begin 
		p_raddr_move <=#D p_raddr_move + 76;
	end	
end

always @(posedge sys_clk or negedge sys_rst_n) // p_ram_raddr,在第11个周期读入第一个数据的地址
begin 
	if (!sys_rst_n) begin 
		p_ram_raddr <=#D 0;
	end else if (counter == 10 && module_vld) begin 
		p_ram_raddr <=#D p_raddr_move;
	end else if (counter_cycle == 6 && module_vld)begin      //在第五个周期使能，在第六个周期换地址 
		p_ram_raddr <=#D p_ram_raddr + 1;
	end
end

always @(posedge sys_clk or negedge sys_rst_n) //p_ram_ren 
begin 
	if (!sys_rst_n) begin 
		p_ram_ren <=#D 0;
	end else if (counter_cycle == 5 && module_vld) begin 
		p_ram_ren <=#D 1;
	end else begin 
		p_ram_ren <=#D 0;
	end	
end


//-----------------------------------------------------------------------rom y_initial 模块



assign rom_y_ini_addr = hap_len [8:0];
assign rom_y_ini_rden = 1;

rom_y_initial r0 (
	.clock  (sys_clk       ),
	.rden   (rom_y_ini_rden),
	.address(rom_y_ini_addr),
	.q      (rom_y_ini_data)
);




wire  [33:0] fifo_data_out_temp;

fifo_8192x34 u0 (
	.data (fifo_data_in ), //  fifo_input.datain
	.wrreq(fifo_write_en), //            .wrreq
	.rdreq(fifo_read_en ), //            .rdreq
	.clock(sys_clk      ), //            .clk
	.q    (fifo_data_out), // fifo_output.dataout
	.usedw(usedw        ), //            .usedw
	.full (full         ), //            .full
	.empty(empty        )  //            .empty
);

assign fifo_data_out_temp = fifo_data_out ;

reg [15:0] counter_incre;
reg [15:0] counter_decre;

always @(posedge sys_clk or negedge sys_rst_n) // counter_incre 8'b 已接受包的个数
begin 
	if (!sys_rst_n) begin 
		counter_incre <=#D 16'b0;
	end else if (fifo_filled_1) begin 
		counter_incre <=#D counter_incre + 16'b1;
	end else if (counter_incre == counter_decre) begin 
		counter_incre <=#D 16'b0;
	end	
end


always @(posedge sys_clk or negedge sys_rst_n) // counter_decre 8'b 已发出包的个数
begin 
	if (!sys_rst_n) begin 
		counter_decre <=#D 16'b0;
	end else if (fifo_data_out [33:32] == 2'b01) begin 
		counter_decre <=#D counter_decre + 16'b1;
	end else if (counter_incre == counter_decre) begin 
		counter_decre <=#D 16'b0;
	end	
end


always @(posedge sys_clk or negedge sys_rst_n) // counter_sum_cycle
begin 
	if (!sys_rst_n) begin 
		counter_sum_cycle <=#D 0;
	end else if (fifo_filled_2 ) begin 
		counter_sum_cycle <=#D 0;
	end else if (counter_cycle == 7 && counter >= 22 && module_vld) begin  //读入一整个单位的数据之后才加一
		counter_sum_cycle <=#D counter_sum_cycle + 1;
	end	
end


wire hap_long ; // 比较hap_len和2倍read_len的大小
wire [15:0] hap_half ;
assign hap_long = (hap_len> (read_len<<1)) ? 1:0;
assign hap_half = (hap_len[0])? ((hap_len>>1) + 1) : (hap_len >> 1);

always @(posedge sys_clk or negedge sys_rst_n) // fifo_write_en
begin 
	if (!sys_rst_n) begin 
		fifo_write_en <=#D 0;
	end else if  (counter >=2 && counter <= 8 && module_vld) begin 
		fifo_write_en <=#D 1;
	end else if (counter == 18 && module_vld) begin 
		fifo_write_en <=#D 1;
	end else if (counter == 16 && module_vld) begin 
		fifo_write_en <=#D 1;
	end else if (counter == 15 && module_vld) begin 
		fifo_write_en <=#D 1;
	end else if  (counter >=21 && counter_sum_cycle < read_len && module_vld) begin 
		fifo_write_en <=#D 1;
	end else if  (hap_long && counter_sum_cycle >= read_len && counter_sum_cycle < hap_half && counter_cycle == 7 && module_vld) begin 
		fifo_write_en <=#D 1;
	end else  begin 
		fifo_write_en <=#D 0;
	end	
end		


always @(posedge sys_clk or negedge sys_rst_n) // 一个数据包填充fifo完毕的标志
begin 
	if (!sys_rst_n) begin 
		fifo_filled_1 <=#D 0;
		fifo_filled_2 <=#D 0;
		fifo_filled_3 <=#D 0;
		fifo_filled_4 <=#D 0;
	end else if (hap_long && counter_sum_cycle == hap_half && counter_cycle == 1 && module_vld) begin 
		fifo_filled_1 <=#D 1;
		fifo_filled_2 <=#D 1;
		fifo_filled_3 <=#D 1;
		fifo_filled_4 <=#D 1;
	end else if (!hap_long && counter_sum_cycle == read_len && counter_cycle == 1 && module_vld) begin 
		fifo_filled_1 <=#D 1;
		fifo_filled_2 <=#D 1;
		fifo_filled_3 <=#D 1;
		fifo_filled_4 <=#D 1;
	end else begin 
		fifo_filled_1 <=#D 0;
		fifo_filled_2 <=#D 0;
		fifo_filled_3 <=#D 0;
		fifo_filled_4 <=#D 0;

	end	
end



always @(posedge sys_clk or negedge sys_rst_n) // fifo 数据输入端 fifo_data_in
begin 
	if (!sys_rst_n) begin
		fifo_data_in <=#D 0;
	end else if (counter == 2) begin 
		fifo_data_in <=#D 34'd0;
	end else if (counter == 3 && module_vld) begin 
		fifo_data_in <=#D {2'b10,head_data};
	end else if (counter >= 4 && counter <= 8 && module_vld) begin //读入文件头 
		fifo_data_in <=#D {2'b00,head_data};
	end else if (counter == 18 && module_vld) begin 
		fifo_data_in <=#D {2'b00,true_hap_id,true_read_id} ;
	end else if (counter == 16 && module_vld) begin 
		fifo_data_in <=#D {2'b00,hap_len,read_len};
	end else if (counter == 15 && module_vld) begin 
		fifo_data_in <=#D {2'b00,rom_y_ini_data};
	end else if (hap_long && counter_sum_cycle == hap_half-1 && counter_cycle == 7 && module_vld) begin 
		fifo_data_in <=#D {2'b01,r_h};
	end else if (!hap_long && counter_sum_cycle == read_len-1 && counter_cycle == 7 && module_vld) begin 
		fifo_data_in <=#D {2'b01,r_h};
	end  else if (counter >= 21 && module_vld) begin 
		case (counter_cycle)
			4'd0 : fifo_data_in <=#D {2'b00,p0_ram_rdat};
			4'd1 : fifo_data_in <=#D {2'b00,p1_ram_rdat};
			4'd2 : fifo_data_in <=#D {2'b00,p2_ram_rdat};
			4'd3 : fifo_data_in <=#D {2'b00,p3_ram_rdat};
			4'd4 : fifo_data_in <=#D {2'b00,p4_ram_rdat};
			4'd5 : fifo_data_in <=#D {2'b00,p5_ram_rdat};
			4'd6 : fifo_data_in <=#D {2'b00,p6_ram_rdat};
			4'd7 : fifo_data_in <=#D {2'b00,r_h}		  ;
			default : fifo_data_in <=#D fifo_data_in;
		endcase // counter_cycle
	end
end





always @(posedge sys_clk or negedge sys_rst_n) // fifo_read_en
begin 
	if (!sys_rst_n) begin 
		fifo_read_en <=#D 0;
	end else if (fifo_data_out [33:32] == 2'b01 ) begin 
		fifo_read_en <=#D 0;
	end else if (matrix_enable && counter_incre > counter_decre) begin 
		fifo_read_en <=#D 1;
	end	
end


// always @(posedge sys_clk or negedge sys_rst_n) // fifo_read_en
// begin 
// 	if (!sys_rst_n) begin 
// 		fifo_read_en <=#D 0;
// 	end else if (matrix_enable && (counter == 8'd0) && (~empty) )  begin 
// 		fifo_read_en <=#D 1;
// 	end else if (fifo_data_out [33:32] == 2'b01 ) begin 
// 		fifo_read_en <=#D 0;
// 	end	
// end


// always @(posedge sys_clk or negedge sys_rst_n) // data_sop_temp 完成一个时延
// begin
// 	if (!sys_rst_n)
// 		data_sop_temp <= 0;
// 	else if (fifo_filled && module_vld)
// 		data_sop_temp <= 1;
// 	else 
// 		data_sop_temp <= 0;
// end


always @(posedge sys_clk or negedge sys_rst_n) // data_sop
begin
	if (!sys_rst_n) begin 
		data_sop <= #D 0;
	end else if (fifo_data_out_temp [33] ) begin 
		data_sop <=  #D 1;
	end else begin 
		data_sop <= #D 0;
	end	
end

always @(posedge sys_clk or negedge sys_rst_n) // data_vld
begin
	if (!sys_rst_n) begin 
		data_vld <=#D 0;
	end else if (fifo_data_out_temp [33]) begin 
		data_vld <=#D 1;
	end else if (eop) begin 
		data_vld <=#D 0;
	end	
end

reg f0_data_eop;
reg f1_data_eop;


always @(posedge sys_clk or negedge sys_rst_n) // data_eop
begin
	if (!sys_rst_n) begin 
		f0_data_eop <=#D 0; 
	end else if (fifo_data_out_temp [32]) begin 
		f0_data_eop <=#D 1;
	end else begin 
		f0_data_eop <=#D 0;
	end	
end



always @(posedge sys_clk or negedge sys_rst_n) // data_eop
begin
	if (!sys_rst_n) begin 
		f1_data_eop <=#D 0; 
	end else begin 
		f1_data_eop <=#D f0_data_eop;
	end
end



reg [31:0] data_data;

always @(posedge sys_clk or negedge sys_rst_n) // data_data
begin
	if (!sys_rst_n) begin 
		data_data <=#D 32'b0;
 	end else begin 
		data_data <=#D fifo_data_out_temp [31:0];
	end	
end


assign eop = f0_data_eop && ~f1_data_eop;
assign sop = data_sop;
assign vld = data_vld;
assign data= data_data;



//==================================================================

(*noprune*)reg [31:0] sop_cont;
(*noprune*)reg [31:0] eop_cont;



always @(posedge sys_clk or negedge sys_rst_n) // data_data
begin
	if (!sys_rst_n) begin 
		sop_cont <=#D 32'b0;
 	end else if(data_sop) begin 
		sop_cont <=#D sop_cont + 1;
	end	
end 


always @(posedge sys_clk or negedge sys_rst_n) // data_data
begin
	if (!sys_rst_n) begin 
		eop_cont <=#D 32'b0;
 	end else if(f0_data_eop && ~f1_data_eop) begin 
		eop_cont <=#D eop_cont + 1;
	end	
end 


//====================================================================







endmodule // package_send
