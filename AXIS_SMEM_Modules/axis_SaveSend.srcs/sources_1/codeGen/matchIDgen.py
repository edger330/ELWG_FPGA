# -*- coding: utf-8 -*-
"""
Created on Wed Jan  3 09:56:42 2018

@author: edger
"""
import os

def nsfile(s):  
    '''''The number of new expected documents'''  
    #判断文件夹是否存在，如果不存在则创建  
    b = os.path.exists("matchIDgen.v")  
    if b:  
        print("File Exist!")  
    else:  
        os.mkdir("matchIDgen.v") 
        
fp = open("matchIDgen.v",'w')

#####################################################################

for i in range(0, 7 + 1):
	fp.writelines("wire start_out1_"+str(i)+";\n"
		"wire [C_DATA_WIDTH-1:0] data_out1_"+str(i)+";\n"
		"wire [C_ID_WIDTH-1:0] ID_out1_"+str(i)+";\n"
		"\n"
				)

#####################################################################

for i in range(0, 63 + 1):
	fp.writelines("wire start_out2_"+str(i)+";\n"
		"wire [C_DATA_WIDTH-1:0] data_out2_"+str(i)+";\n"
		"wire [C_ID_WIDTH-1:0] ID_out2_"+str(i)+";\n"
		"\n"
				)

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines("start_out3_"+str(i)+",\n"
		"data_out3_"+str(i)+",\n"
		"\n"
				)

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines("output wire start_out3_"+str(i)+";\n"
		"output wire [C_DATA_WIDTH-1:0] data_out3_"+str(i)+";\n"
		"\n"
				)

#####################################################################

for i in range(0, 7 + 1):
	fp.writelines("MUX_2nd MUX2_"+str(i)+"\n"
	"(\n"
	".start      (start_out1_"+str(i)+" ),\n"
	".data       (data_out1_"+str(i)+"  ),\n"
	".ID         (ID_out1_"+str(i)+"    ),\n"
	"\n"
	".start_out0 (start_out2_"+str(i*8)+" ),\n"
	".data_out0  (data_out2_"+str(i*8)+"  ),\n"
	".ID_out0    (ID_out2_"+str(i*8)+"    ),\n"
	"\n"
	".start_out1 (start_out2_"+str(i*8+1)+" ),\n"
	".data_out1  (data_out2_"+str(i*8+1)+"  ),\n"
	".ID_out1    (ID_out2_"+str(i*8+1)+"    ),\n"
	"\n"
	".start_out2 (start_out2_"+str(i*8+2)+" ),\n"
	".data_out2  (data_out2_"+str(i*8+2)+"  ),\n"
	".ID_out2    (ID_out2_"+str(i*8+2)+"    ),\n"
	"\n"
	".start_out3 (start_out2_"+str(i*8+3)+" ),\n"
	".data_out3  (data_out2_"+str(i*8+3)+"  ),\n"
	".ID_out3    (ID_out2_"+str(i*8+3)+"    ),\n"
	"\n"
	".start_out4 (start_out2_"+str(i*8+4)+" ),\n"
	".data_out4  (data_out2_"+str(i*8+4)+"  ),\n"
	".ID_out4    (ID_out2_"+str(i*8+4)+"    ),\n"
	"\n"
	".start_out5 (start_out2_"+str(i*8+5)+" ),\n"
	".data_out5  (data_out2_"+str(i*8+5)+"  ),\n"
	".ID_out5    (ID_out2_"+str(i*8+5)+"    ),\n"
	"\n"
	".start_out6 (start_out2_"+str(i*8+6)+" ),\n"
	".data_out6  (data_out2_"+str(i*8+6)+"  ),\n"
	".ID_out6    (ID_out2_"+str(i*8+6)+"    ),\n"
	"\n"
	".start_out7 (start_out2_"+str(i*8+7)+" ),\n"
	".data_out7  (data_out2_"+str(i*8+7)+"  ),\n"
	".ID_out7    (ID_out2_"+str(i*8+7)+"    )\n"
	");\n "
    "\n "
	)

#####################################################################

for i in range(0, 63 + 1):
	fp.writelines("MUX_3rd MUX3_"+str(i)+"\n"
	"(\n"
	".start      (start_out2_"+str(i)+" ),\n"
	".data       (data_out2_"+str(i)+"  ),\n"
	".ID       (ID_out2_"+str(i)+"  ),\n"
	"\n"
	".start_out0 (start_out3_"+str(i*8)+" ),\n"
	".data_out0  (data_out3_"+str(i*8)+"  ),\n"
	"\n"
	".start_out1 (start_out3_"+str(i*8+1)+" ),\n"
	".data_out1  (data_out3_"+str(i*8+1)+"  ),\n"
	"\n"
	".start_out2 (start_out3_"+str(i*8+2)+" ),\n"
	".data_out2  (data_out3_"+str(i*8+2)+"  ),\n"
	"\n"
	".start_out3 (start_out3_"+str(i*8+3)+" ),\n"
	".data_out3  (data_out3_"+str(i*8+3)+"  ),\n"
	"\n"
	".start_out4 (start_out3_"+str(i*8+4)+" ),\n"
	".data_out4  (data_out3_"+str(i*8+4)+"  ),\n"
	"\n"
	".start_out5 (start_out3_"+str(i*8+5)+" ),\n"
	".data_out5  (data_out3_"+str(i*8+5)+"  ),\n"
	"\n"
	".start_out6 (start_out3_"+str(i*8+6)+" ),\n"
	".data_out6  (data_out3_"+str(i*8+6)+"  ),\n"
	"\n"
	".start_out7 (start_out3_"+str(i*8+7)+" ),\n"
	".data_out7  (data_out3_"+str(i*8+7)+"  )\n"
	");\n "
    "\n "
	)

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines(".start_out3_"+str(i)+"(start_out3_"+str(i)+"),\n"
		".data_out3_"+str(i)+"(data_out3_"+str(i)+"),\n"
		"\n"
		)

#####################################################################









