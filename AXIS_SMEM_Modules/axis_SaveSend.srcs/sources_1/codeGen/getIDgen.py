# -*- coding: utf-8 -*-
"""
Created on Wed Jan  3 09:56:42 2018

@author: edger
"""
import os

def nsfile(s):  
    '''''The number of new expected documents'''  
    #判断文件夹是否存在，如果不存在则创建  
    b = os.path.exists("getIDgen.v")  
    if b:  
        print("File Exist!")  
    else:  
        os.mkdir("getIDgen.v") 
        
fp = open("getIDgen.v",'w')

for i in range(0, 511 + 1):
	fp.writelines("reg [C_ID_WIDTH-1:0] const_ID_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines("reg const_ID_"+str(i)+" = 10'd"+str(i+1)+";\n"
				)

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] num"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 255 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] out1_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 127 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] out2_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 63 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] out3_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 31 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] out4_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 15 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] out5_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 7 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] out6_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 3 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] out7_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 1 + 1):
	fp.writelines("wire [C_ID_WIDTH-1:0] out8_"+str(i)+";\n"
				)

#####################################################################
for i in range(0, 0 + 1):
    fp.writelines("wire [C_ID_WIDTH-1:0] out9_"+str(i)+";\n"
				)

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines("busy_detection bd_"+str(i)+"(\n"
						"	.clk(clk),\n"
						"	.rst_n(rst_n),\n"
						"	.busy(B_busy["+str(i)+"]),\n"
						"	.ID(const_ID_"+str(i)+"),\n"
						"	.num(num"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################

for i in range(0, 255 + 1):
	fp.writelines("cmpID cmp1_"+str(i)+"(\n"
						"	.in1(num"+str(i*2)+"),\n"
						"	.in2(num"+str(i*2+1)+"),\n"
						"	.out(out1_"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################

for i in range(0, 127 + 1):
	fp.writelines("cmpID cmp2_"+str(i)+"(\n"
						"	.in1(out1_"+str(i*2)+"),\n"
						"	.in2(out1_"+str(i*2+1)+"),\n"
						"	.out(out2_"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################

for i in range(0, 63 + 1):
	fp.writelines("cmpID cmp3_"+str(i)+"(\n"
						"	.in1(out2_"+str(i*2)+"),\n"
						"	.in2(out2_"+str(i*2+1)+"),\n"
						"	.out(out3_"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################

for i in range(0, 31 + 1):
	fp.writelines("cmpID cmp4_"+str(i)+"(\n"
						"	.in1(out3_"+str(i*2)+"),\n"
						"	.in2(out3_"+str(i*2+1)+"),\n"
						"	.out(out4_"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################

for i in range(0, 15 + 1):
	fp.writelines("cmpID cmp5_"+str(i)+"(\n"
						"	.in1(out4_"+str(i*2)+"),\n"
						"	.in2(out4_"+str(i*2+1)+"),\n"
						"	.out(out5_"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################

for i in range(0, 7 + 1):
	fp.writelines("cmpID cmp6_"+str(i)+"(\n"
						"	.in1(out5_"+str(i*2)+"),\n"
						"	.in2(out5_"+str(i*2+1)+"),\n"
						"	.out(out6_"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################

for i in range(0, 3 + 1):
	fp.writelines("cmpID cmp7_"+str(i)+"(\n"
						"	.in1(out6_"+str(i*2)+"),\n"
						"	.in2(out6_"+str(i*2+1)+"),\n"
						"	.out(out7_"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################

for i in range(0, 1 + 1):
	fp.writelines("cmpID cmp8_"+str(i)+"(\n"
						"	.in1(out7_"+str(i*2)+"),\n"
						"	.in2(out7_"+str(i*2+1)+"),\n"
						"	.out(out8_"+str(i)+")\n"
					");\n"
					"\n"
					)

#####################################################################
        
for i in range(0, 0 + 1):
	fp.writelines("cmpID cmp9(\n"
						"	.in1(out8_0),\n"
						"	.in2(out8_1),\n"
						"	.out(ID)\n"
					");\n"
					"\n"
					)


