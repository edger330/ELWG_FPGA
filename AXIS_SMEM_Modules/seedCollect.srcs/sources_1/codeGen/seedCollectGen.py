# -*- coding: utf-8 -*-
"""
Created on Wed Jan  3 09:56:42 2018

@author: edger
"""
import os

def nsfile(s):  
    '''''The number of new expected documents'''  
    #判断文件夹是否存在，如果不存在则创建  
    b = os.path.exists("seedCollectGen.v")  
    if b:  
        print("File Exist!")  
    else:  
        os.mkdir("seedCollectGen.v") 
        
fp = open("seedCollectGen.v",'w')

#####################################################################

for i in range(0, 511 + 1):
	fp.writelines(
		"assign B_tvalid["+str(i)+"] = s_axis_tvalid_"+str(i)+";\n"
		)
    
#####################################################################

for i in range(0, 511 + 1):
    fp.writelines(
        ".s_axis_tvalid_"+str(i)+"(s_axis_tvalid_"+str(i)+"),\n"
        ".s_axis_tdata_"+str(i)+"(s_axis_tdata_"+str(i)+"),\n"
        ".s_axis_tready_"+str(i)+"(s_axis_tready_"+str(i)+"),\n"
        ".s_axis_tlast_"+str(i)+"(s_axis_tlast_"+str(i)+"),\n"
        "\n"
        )

#####################################################################

for i in range(0, 511 + 1):
    fp.writelines(
        "reg s_axis_tvalid_"+str(i)+";\n"
        "reg [C_DATAIN_WIDTH-1:0] s_axis_tdata_"+str(i)+";\n"
        "wire s_axis_tready_"+str(i)+";\n"
        "reg s_axis_tlast_"+str(i)+";\n"
        "\n"
        )

#####################################################################

fp.close()










