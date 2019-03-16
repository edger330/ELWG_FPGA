# -*- coding: utf-8 -*-
"""
Created on Wed Jan  3 09:56:42 2018

@author: edger
"""
import os

def nsfile(s):  
    '''''The number of new expected documents'''  
    #判断文件夹是否存在，如果不存在则创建  
    b = os.path.exists("MUX_1stgen.v")  
    if b:  
        print("File Exist!")  
    else:  
        os.mkdir("MUX_1stgen.v") 
        
fp = open("MUX_1stgen.v",'w')

#####################################################################

for i in range(0, 7 + 1):
	fp.writelines("start_out"+str(i)+",\n"
		"data_out"+str(i)+",\n"
		"ID_out"+str(i)+",\n"
				)

#####################################################################

for i in range(0, 7 + 1):
	fp.writelines("output wire start_out"+str(i)+";\n"
		"output wire [C_DATA_WIDTH-1:0] data_out"+str(i)+";\n"
		"output wire [C_ID_WIDTH-1:0] ID_out"+str(i)+";\n"
				)

#####################################################################











