# -*- coding: utf-8 -*-
"""
Created on Wed Jan  3 09:56:42 2018

@author: edger
"""
import os

def nsfile(s):  
    '''''The number of new expected documents'''  
    #判断文件夹是否存在，如果不存在则创建  
    b = os.path.exists("testseedCollectGen.v")  
    if b:  
        print("File Exist!")  
    else:  
        os.mkdir("testseedCollectGen.v") 
        
fp = open("testseedCollectGen.v",'w')

# #####################################################################

# for i in range(0, 511 + 1):
#     fp.writelines(
#         "always @(posedge clk or negedge rst_n) begin \n"
#         "   if(~rst_n) begin \n"
#         "       s_axis_tvalid_"+str(i)+" <= 1'b0; \n"
#         "   end \n"
#         "   else if (s_axis_tready_"+str(i)+" == 1'b1)begin \n"
#         "       s_axis_tvalid_"+str(i)+" <= 1'b1; \n"
#         "   end \n"
#         "   else begin \n"
#         "       s_axis_tvalid_"+str(i)+" <= 1'b0; \n"
#         "   end \n"
#         "end \n"
#         "\n"
#         "always @(posedge clk or negedge rst_n) begin \n"
#         "   if(~rst_n || s_axis_tvalid_"+str(i)+" == 1'b0) begin \n"
#         "       s_axis_tdata_"+str(i)+" <= 10'd"+str(i)+"; \n"
#         "   end \n"
#         "   else begin \n"
#         "       s_axis_tdata_"+str(i)+" <= s_axis_tdata_"+str(i)+" + 10'd"+str(i)+"; \n"
#         "   end \n"
#         "end \n"
#         "\n"
#         "always @(posedge clk or negedge rst_n) begin \n"
#         "   if(~rst_n) begin \n"
#         "       s_axis_tlast_"+str(i)+" <= 1'b0; \n"
#         "   end \n"
#         "   else if (s_axis_tdata_"+str(i)+" > 16'hFFFF) begin \n"
#         "       s_axis_tlast_"+str(i)+" <= 1'b1; \n"
#         "   end \n"
#         "end \n"
#         "\n"
#         )

# #####################################################################

for i in range(0, 15 + 1):
    fp.writelines(
        "always @(posedge clk or negedge rst_n) begin \n"
        "   if(~rst_n) begin \n"
        "       s_axis_tvalid_"+str(i)+" <= 1'b0; \n"
        "   end \n"
        "   else if (s_axis_tlast_"+str(i)+" == 1'b1) begin \n"
        "       s_axis_tvalid_"+str(i)+" <= 1'b0; \n"
        "   end \n"
        "   else if (s_axis_tdata_"+str(i)+" <= 16'hFFFF) begin \n"
        "       s_axis_tvalid_"+str(i)+" <= 1'b1; \n"
        "   end \n"
        "end \n"
        "\n"
        "always @(posedge clk or negedge rst_n) begin \n"
        "   if(~rst_n) begin \n"
        "       s_axis_tdata_"+str(i)+" <= 10'd"+str(i)+"; \n"
        "   end \n"
        "   else begin \n"
        "       s_axis_tdata_"+str(i)+" <= s_axis_tdata_"+str(i)+" + 10'd"+str(i+1)+"; \n"
        "   end \n"
        "end \n"
        "\n"
        "always @(posedge clk or negedge rst_n) begin \n"
        "   if(~rst_n) begin \n"
        "       s_axis_tlast_"+str(i)+" <= 1'b0; \n"
        "   end \n"
        "   else if (s_axis_tdata_"+str(i)+" > 16'hFFFF) begin \n"
        "       s_axis_tlast_"+str(i)+" <= 1'b1; \n"
        "   end \n"
        "   else begin \n"
        "       s_axis_tlast_"+str(i)+" <= 1'b0; \n"
        "   end \n"
        "end \n"
        "\n"
        )

#####################################################################

fp.close()










