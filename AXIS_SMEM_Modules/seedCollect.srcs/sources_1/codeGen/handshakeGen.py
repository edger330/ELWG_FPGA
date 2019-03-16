# -*- coding: utf-8 -*-
"""
Created on Wed Jan  3 09:56:42 2018

@author: edger
"""
import os

def nsfile(s):  
    '''''The number of new expected documents'''  
    #判断文件夹是否存在，如果不存在则创建  
    b = os.path.exists("/home/edger330/project/seedCollect/seedCollect.srcs/sources_1/new/handshakeGen.v")  
    if b:  
        print("File Exist!")  
    else:  
        os.mkdir("/home/edger330/project/seedCollect/seedCollect.srcs/sources_1/new/handshakeGen.v") 
        
fp = open("/home/edger330/project/seedCollect/seedCollect.srcs/sources_1/new/handshakeGen.v",'w')

#####################################################################

for i in range(0, 7 + 1):
	fp.writelines("wire s_axis_tvalid_2out_"+str(i)+";\n"
		"wire [C_DATA_WIDTH-1:0] s_axis_tdata_2out_"+str(i)+";\n"
		"wire s_axis_tready_2in_"+str(i)+";\n"
		"wire s_axis_tlast_2out_"+str(i)+";\n"
		"\n"
				)

#####################################################################

for i in range(0, 63 + 1):
	fp.writelines("wire s_axis_tvalid_1out_"+str(i)+";\n"
		"wire [C_DATA_WIDTH-1:0] s_axis_tdata_1out_"+str(i)+";\n"
		"wire s_axis_tready_1in_"+str(i)+";\n"
		"wire s_axis_tlast_1out_"+str(i)+";\n"
		"\n"
				)

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines("input wire s_axis_tvalid_"+str(i)+";\n"
		"input wire [C_DATA_WIDTH-1:0] s_axis_tdata_"+str(i)+";\n"
		"output wire s_axis_tready_"+str(i)+";\n"
		"input wire s_axis_tlast_"+str(i)+";\n"
		"\n"
				)

#####################################################################

for i in range(0, 7 + 1):
	fp.writelines("MUX_2nd MUX2_"+str(i)+"\n"
	"(\n"
	".ID_in(ID),\n"
	"\n"
	".s_axis_tvalid (s_axis_tvalid_2out_"+str(i)+"),\n"
	".s_axis_tdata  (s_axis_tdata_2out_"+str(i)+" ),\n"
	".s_axis_tready (s_axis_tready_2in_"+str(i)+"),\n"
	".s_axis_tlast  (s_axis_tlast_2out_"+str(i)+" ),\n"
	"\n"	
	".s_axis_tvalid0 (s_axis_tvalid_1out_"+str(i*8)+"),\n"
	".s_axis_tdata0  (s_axis_tdata_1out_"+str(i*8)+" ),\n"
	".s_axis_tready0 (s_axis_tready_1in_"+str(i*8)+"),\n"
	".s_axis_tlast0  (s_axis_tlast_1out_"+str(i*8)+" ),\n"
	"\n"
	".s_axis_tvalid1 (s_axis_tvalid_1out_"+str(i*8+1)+"),\n"
	".s_axis_tdata1  (s_axis_tdata_1out_"+str(i*8+1)+" ),\n"
	".s_axis_tready1 (s_axis_tready_1in_"+str(i*8+1)+"),\n"
	".s_axis_tlast1  (s_axis_tlast_1out_"+str(i*8+1)+" ),\n"
	"\n"
	".s_axis_tvalid2 (s_axis_tvalid_1out_"+str(i*8+2)+"),\n"
	".s_axis_tdata2  (s_axis_tdata_1out_"+str(i*8+2)+" ),\n"
	".s_axis_tready2 (s_axis_tready_1in_"+str(i*8+2)+"),\n"
	".s_axis_tlast2  (s_axis_tlast_1out_"+str(i*8+2)+" ),\n"
	"\n"
	".s_axis_tvalid3 (s_axis_tvalid_1out_"+str(i*8+3)+"),\n"
	".s_axis_tdata3  (s_axis_tdata_1out_"+str(i*8+3)+" ),\n"
	".s_axis_tready3 (s_axis_tready_1in_"+str(i*8+3)+"),\n"
	".s_axis_tlast3  (s_axis_tlast_1out_"+str(i*8+3)+" ),\n"
	"\n"
	".s_axis_tvalid4 (s_axis_tvalid_1out_"+str(i*8+4)+"),\n"
	".s_axis_tdata4  (s_axis_tdata_1out_"+str(i*8+4)+" ),\n"
	".s_axis_tready4 (s_axis_tready_1in_"+str(i*8+4)+"),\n"
	".s_axis_tlast4  (s_axis_tlast_1out_"+str(i*8+4)+" ),\n"
	"\n"
	".s_axis_tvalid5 (s_axis_tvalid_1out_"+str(i*8+5)+"),\n"
	".s_axis_tdata5  (s_axis_tdata_1out_"+str(i*8+5)+" ),\n"
	".s_axis_tready5 (s_axis_tready_1in_"+str(i*8+5)+"),\n"
	".s_axis_tlast5  (s_axis_tlast_1out_"+str(i*8+5)+" ),\n"
	"\n"
	".s_axis_tvalid6 (s_axis_tvalid_1out_"+str(i*8+6)+"),\n"
	".s_axis_tdata6  (s_axis_tdata_1out_"+str(i*8+6)+" ),\n"
	".s_axis_tready6 (s_axis_tready_1in_"+str(i*8+6)+"),\n"
	".s_axis_tlast6  (s_axis_tlast_1out_"+str(i*8+6)+" ),\n"
	"\n"
	".s_axis_tvalid7 (s_axis_tvalid_1out_"+str(i*8+7)+"),\n"
	".s_axis_tdata7  (s_axis_tdata_1out_"+str(i*8+7)+" ),\n"
	".s_axis_tready7 (s_axis_tready_1in_"+str(i*8+7)+"),\n"
	".s_axis_tlast7  (s_axis_tlast_1out_"+str(i*8+7)+" )\n"
	");\n "
    "\n "
	)

#####################################################################

for i in range(0, 63 + 1):
	fp.writelines("MUX_1st MUX1_"+str(i)+"\n"
	"(\n"
	".state(state),\n"
	".ID_in(ID),\n"
	"\n"
	".s_axis_tvalid (s_axis_tvalid_1out_"+str(i)+"),\n"
	".s_axis_tdata  (s_axis_tdata_1out_"+str(i)+" ),\n"
	".s_axis_tready (s_axis_tready_1in_"+str(i)+"),\n"
	".s_axis_tlast  (s_axis_tlast_1out_"+str(i)+" ),\n"
	"\n"
	".s_axis_tvalid0 (s_axis_tvalid_"+str(i*8)+"),\n"
	".s_axis_tdata0  (s_axis_tdata_"+str(i*8)+" ),\n"
	".s_axis_tready0 (s_axis_tready_"+str(i*8)+"),\n"
	".s_axis_tlast0  (s_axis_tlast_"+str(i*8)+" ),\n"
	"\n"
	".s_axis_tvalid1 (s_axis_tvalid_"+str(i*8+1)+"),\n"
	".s_axis_tdata1  (s_axis_tdata_"+str(i*8+1)+" ),\n"
	".s_axis_tready1 (s_axis_tready_"+str(i*8+1)+"),\n"
	".s_axis_tlast1  (s_axis_tlast_"+str(i*8+1)+" ),\n"
	"\n"
	".s_axis_tvalid2 (s_axis_tvalid_"+str(i*8+2)+"),\n"
	".s_axis_tdata2  (s_axis_tdata_"+str(i*8+2)+" ),\n"
	".s_axis_tready2 (s_axis_tready_"+str(i*8+2)+"),\n"
	".s_axis_tlast2  (s_axis_tlast_"+str(i*8+2)+" ),\n"
	"\n"
	".s_axis_tvalid3 (s_axis_tvalid_"+str(i*8+3)+"),\n"
	".s_axis_tdata3  (s_axis_tdata_"+str(i*8+3)+" ),\n"
	".s_axis_tready3 (s_axis_tready_"+str(i*8+3)+"),\n"
	".s_axis_tlast3  (s_axis_tlast_"+str(i*8+3)+" ),\n"
	"\n"
	".s_axis_tvalid4 (s_axis_tvalid_"+str(i*8+4)+"),\n"
	".s_axis_tdata4  (s_axis_tdata_"+str(i*8+4)+" ),\n"
	".s_axis_tready4 (s_axis_tready_"+str(i*8+4)+"),\n"
	".s_axis_tlast4  (s_axis_tlast_"+str(i*8+4)+" ),\n"
	"\n"
	".s_axis_tvalid5 (s_axis_tvalid_"+str(i*8+5)+"),\n"
	".s_axis_tdata5  (s_axis_tdata_"+str(i*8+5)+" ),\n"
	".s_axis_tready5 (s_axis_tready_"+str(i*8+5)+"),\n"
	".s_axis_tlast5  (s_axis_tlast_"+str(i*8+5)+" ),\n"
	"\n"
	".s_axis_tvalid6 (s_axis_tvalid_"+str(i*8+6)+"),\n"
	".s_axis_tdata6  (s_axis_tdata_"+str(i*8+6)+" ),\n"
	".s_axis_tready6 (s_axis_tready_"+str(i*8+6)+"),\n"
	".s_axis_tlast6  (s_axis_tlast_"+str(i*8+6)+" ),\n"
	"\n"
	".s_axis_tvalid7 (s_axis_tvalid_"+str(i*8+7)+"),\n"
	".s_axis_tdata7  (s_axis_tdata_"+str(i*8+7)+" ),\n"
	".s_axis_tready7 (s_axis_tready_"+str(i*8+7)+"),\n"
	".s_axis_tlast7  (s_axis_tlast_"+str(i*8+7)+" )\n"
	");\n "
    "\n "
	)

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines("s_axis_tvalid_"+str(i)+",\n"
		"s_axis_tdata_"+str(i)+",\n"
		"s_axis_tready_"+str(i)+",\n"
		"s_axis_tlast_"+str(i)+",\n"
		"\n"
		)

#####################################################################










