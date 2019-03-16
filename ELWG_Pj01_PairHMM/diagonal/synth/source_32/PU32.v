
/*********************************************************************
//  Author:    zzt
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
//  2017-12-02       zzt             2.0 version
//
**********************************************************************/
`timescale 1ns/1ps
module PU32 (
		//input
			sys_clk  ,
			sys_rst_n,
			mode,
			SUM_select,

			Y_Init   ,

			SUM_valid,
			SUM_start,

			p_mx_0     ,
			p_my_0     ,
			p_mm_0     ,

			p_mx_1     ,
			p_my_1     ,
			p_mm_1     ,

			p_mx_2     ,
			p_my_2     ,
			p_mm_2     ,

			p_mx_3     ,
			p_my_3     ,
			p_mm_3     ,

			p_mx_4     ,
			p_my_4     ,
			p_mm_4     ,

 			p_mx_5     ,
			p_my_5     ,
			p_mm_5     ,

 			p_mx_6     ,
			p_my_6     ,
			p_mm_6     ,

 			p_mx_7     ,
			p_my_7     ,
			p_mm_7     ,

 			p_mx_8     ,
			p_my_8     ,
			p_mm_8     ,

 			p_mx_9     ,
			p_my_9     ,
			p_mm_9     ,

			p_mx_10     ,
			p_my_10     ,
			p_mm_10     ,

			p_mx_11     ,
			p_my_11     ,
			p_mm_11     ,

			p_mx_12     ,
			p_my_12     ,
			p_mm_12     ,

			p_mx_13     ,
			p_my_13     ,
			p_mm_13     ,

			p_mx_14     ,
			p_my_14     ,
			p_mm_14     ,

			p_mx_15     ,
			p_my_15     ,
			p_mm_15     ,

			p_mx_16     ,
			p_my_16     ,
			p_mm_16     ,

			p_mx_17     ,
			p_my_17     ,
			p_mm_17     ,

			p_mx_18     ,
			p_my_18     ,
			p_mm_18     ,

			p_mx_19     ,
			p_my_19     ,
			p_mm_19     ,

			p_mx_20     ,
			p_my_20     ,
			p_mm_20     ,

			p_mx_21     ,
			p_my_21     ,
			p_mm_21     ,

			p_mx_22     ,
			p_my_22     ,
			p_mm_22     ,

			p_mx_23     ,
			p_my_23     ,
			p_mm_23     ,

			p_mx_24     ,
			p_my_24     ,
			p_mm_24     ,

			p_mx_25     ,
			p_my_25     ,
			p_mm_25     ,

			p_mx_26     ,
			p_my_26     ,
			p_mm_26     ,

			p_mx_27     ,
			p_my_27     ,
			p_mm_27     ,

			p_mx_28     ,
			p_my_28     ,
			p_mm_28     ,

			p_mx_29     ,
			p_my_29     ,
			p_mm_29     ,

			p_mx_30     ,
			p_my_30     ,
			p_mm_30     ,

			p_mx_31     ,
			p_my_31     ,
			p_mm_31     ,
			
			lambda1_0  ,
			lambda2_0  ,

			lambda1_1  ,
			lambda2_1  ,

			lambda1_2  ,
			lambda2_2  ,

			lambda1_3  ,
			lambda2_3  ,

			lambda1_4  ,
			lambda2_4  ,

			lambda1_5  ,
			lambda2_5  ,

			lambda1_6  ,
			lambda2_6  ,

			lambda1_7  ,
			lambda2_7  ,

			lambda1_8  ,
			lambda2_8  ,

			lambda1_9  ,
			lambda2_9  ,

			lambda1_10  ,
			lambda2_10  ,

			lambda1_11  ,
			lambda2_11  ,

			lambda1_12  ,
			lambda2_12  ,

			lambda1_13  ,
			lambda2_13  ,

			lambda1_14  ,
			lambda2_14  ,

			lambda1_15  ,
			lambda2_15  ,

			lambda1_16  ,
			lambda2_16  ,

			lambda1_17  ,
			lambda2_17  ,

			lambda1_18  ,
			lambda2_18  ,

			lambda1_19  ,
			lambda2_19  ,

			lambda1_20  ,
			lambda2_20  ,

			lambda1_21  ,
			lambda2_21  ,

			lambda1_22  ,
			lambda2_22  ,

			lambda1_23  ,
			lambda2_23  ,

			lambda1_24  ,
			lambda2_24  ,

			lambda1_25  ,
			lambda2_25  ,

			lambda1_26  ,
			lambda2_26  ,

			lambda1_27  ,
			lambda2_27  ,

			lambda1_28  ,
			lambda2_28  ,

			lambda1_29  ,
			lambda2_29  ,

			lambda1_30  ,
			lambda2_30  ,

			lambda1_31  ,
			lambda2_31  ,

			H_in  	   ,

			R_in_0     ,
			R_in_1     ,
			R_in_2     ,
			R_in_3     ,
			R_in_4     ,
			R_in_5     ,
			R_in_6     ,
			R_in_7     ,
			R_in_8     ,
			R_in_9     ,
			R_in_10    ,
			R_in_11    ,
			R_in_12    ,
			R_in_13    ,
			R_in_14    ,
			R_in_15    ,
			R_in_16    ,
			R_in_17    ,
			R_in_18    ,
			R_in_19    ,
			R_in_20    ,
			R_in_21    ,
			R_in_22    ,
			R_in_23    ,
			R_in_24    ,
			R_in_25    ,
			R_in_26    ,
			R_in_27    ,
			R_in_28    ,
			R_in_29    ,
			R_in_30    ,
			R_in_31    ,

			Init_in  ,
					
		//output	
			SUM_out  	    
);

/*-------------------------------------------------------------------*\
                            Port Description
\*-------------------------------------------------------------------*/	
input         sys_clk  ;
input         sys_rst_n;
input 		  mode;
input  [4:0]  SUM_select;

input SUM_valid;
input SUM_start;

input  [31:0] p_mx_0     ;
input  [31:0] p_my_0     ;
input  [31:0] p_mm_0     ;

input  [31:0] p_mx_1     ;
input  [31:0] p_my_1     ;
input  [31:0] p_mm_1     ;

input  [31:0] p_mx_2     ;
input  [31:0] p_my_2     ;
input  [31:0] p_mm_2     ;

input  [31:0] p_mx_3     ;
input  [31:0] p_my_3     ;
input  [31:0] p_mm_3     ;

input  [31:0] p_mx_4     ;
input  [31:0] p_my_4     ;
input  [31:0] p_mm_4     ;

input  [31:0] p_mx_5     ;
input  [31:0] p_my_5     ;
input  [31:0] p_mm_5     ;

input  [31:0] p_mx_6     ;
input  [31:0] p_my_6     ;
input  [31:0] p_mm_6     ;

input  [31:0] p_mx_7     ;
input  [31:0] p_my_7     ;
input  [31:0] p_mm_7     ;

input  [31:0] p_mx_8     ;
input  [31:0] p_my_8     ;
input  [31:0] p_mm_8     ;

input  [31:0] p_mx_9     ;
input  [31:0] p_my_9     ;
input  [31:0] p_mm_9     ;

input  [31:0] p_mx_10     ;
input  [31:0] p_my_10     ;
input  [31:0] p_mm_10     ;

input  [31:0] p_mx_11     ;
input  [31:0] p_my_11     ;
input  [31:0] p_mm_11     ;

input  [31:0] p_mx_12     ;
input  [31:0] p_my_12     ;
input  [31:0] p_mm_12     ;

input  [31:0] p_mx_13     ;
input  [31:0] p_my_13     ;
input  [31:0] p_mm_13     ;

input  [31:0] p_mx_14     ;
input  [31:0] p_my_14     ;
input  [31:0] p_mm_14     ;

input  [31:0] p_mx_15     ;
input  [31:0] p_my_15     ;
input  [31:0] p_mm_15     ;

input  [31:0] p_mx_16     ;
input  [31:0] p_my_16     ;
input  [31:0] p_mm_16     ;

input  [31:0] p_mx_17     ;
input  [31:0] p_my_17     ;
input  [31:0] p_mm_17     ;

input  [31:0] p_mx_18     ;
input  [31:0] p_my_18     ;
input  [31:0] p_mm_18     ;

input  [31:0] p_mx_19     ;
input  [31:0] p_my_19     ;
input  [31:0] p_mm_19     ;

input  [31:0] p_mx_20     ;
input  [31:0] p_my_20     ;
input  [31:0] p_mm_20     ;

input  [31:0] p_mx_21     ;
input  [31:0] p_my_21     ;
input  [31:0] p_mm_21     ;

input  [31:0] p_mx_22     ;
input  [31:0] p_my_22     ;
input  [31:0] p_mm_22     ;

input  [31:0] p_mx_23     ;
input  [31:0] p_my_23     ;
input  [31:0] p_mm_23     ;

input  [31:0] p_mx_24     ;
input  [31:0] p_my_24     ;
input  [31:0] p_mm_24     ;

input  [31:0] p_mx_25     ;
input  [31:0] p_my_25     ;
input  [31:0] p_mm_25     ;

input  [31:0] p_mx_26     ;
input  [31:0] p_my_26     ;
input  [31:0] p_mm_26     ;

input  [31:0] p_mx_27     ;
input  [31:0] p_my_27     ;
input  [31:0] p_mm_27     ;

input  [31:0] p_mx_28     ;
input  [31:0] p_my_28     ;
input  [31:0] p_mm_28     ;

input  [31:0] p_mx_29     ;
input  [31:0] p_my_29     ;
input  [31:0] p_mm_29     ;

input  [31:0] p_mx_30     ;
input  [31:0] p_my_30     ;
input  [31:0] p_mm_30     ;

input  [31:0] p_mx_31     ;
input  [31:0] p_my_31     ;
input  [31:0] p_mm_31     ;

input  [31:0] lambda1_0  ;
input  [31:0] lambda2_0  ;

input  [31:0] lambda1_1  ;
input  [31:0] lambda2_1  ;

input  [31:0] lambda1_2  ;
input  [31:0] lambda2_2  ;

input  [31:0] lambda1_3  ;
input  [31:0] lambda2_3  ;

input  [31:0] lambda1_4  ; 
input  [31:0] lambda2_4  ;

input  [31:0] lambda1_5  ; 
input  [31:0] lambda2_5  ;

input  [31:0] lambda1_6  ; 
input  [31:0] lambda2_6  ;

input  [31:0] lambda1_7  ; 
input  [31:0] lambda2_7  ;

input  [31:0] lambda1_8  ; 
input  [31:0] lambda2_8  ;

input  [31:0] lambda1_9  ; 
input  [31:0] lambda2_9  ;

input  [31:0] lambda1_10 ;
input  [31:0] lambda2_10 ;

input  [31:0] lambda1_11 ;
input  [31:0] lambda2_11 ;

input  [31:0] lambda1_12 ;
input  [31:0] lambda2_12 ;

input  [31:0] lambda1_13 ;
input  [31:0] lambda2_13 ;

input  [31:0] lambda1_14 ;
input  [31:0] lambda2_14 ;

input  [31:0] lambda1_15 ;
input  [31:0] lambda2_15 ;

input  [31:0] lambda1_16 ;
input  [31:0] lambda2_16 ;

input  [31:0] lambda1_17 ;
input  [31:0] lambda2_17 ;

input  [31:0] lambda1_18 ;
input  [31:0] lambda2_18 ;

input  [31:0] lambda1_19 ;
input  [31:0] lambda2_19 ;

input  [31:0] lambda1_20 ;
input  [31:0] lambda2_20 ;

input  [31:0] lambda1_21 ;
input  [31:0] lambda2_21 ;

input  [31:0] lambda1_22 ;
input  [31:0] lambda2_22 ;

input  [31:0] lambda1_23 ;
input  [31:0] lambda2_23 ;

input  [31:0] lambda1_24 ;
input  [31:0] lambda2_24 ;

input  [31:0] lambda1_25 ;
input  [31:0] lambda2_25 ;

input  [31:0] lambda1_26 ;
input  [31:0] lambda2_26 ;

input  [31:0] lambda1_27 ;
input  [31:0] lambda2_27 ;

input  [31:0] lambda1_28 ;
input  [31:0] lambda2_28 ;

input  [31:0] lambda1_29 ;
input  [31:0] lambda2_29 ;

input  [31:0] lambda1_30 ;
input  [31:0] lambda2_30 ;

input  [31:0] lambda1_31 ;
input  [31:0] lambda2_31 ;

input  [7:0]  H_in       ;

input  [7:0]  R_in_0     ;
input  [7:0]  R_in_1     ;
input  [7:0]  R_in_2     ;
input  [7:0]  R_in_3     ;
input  [7:0]  R_in_4     ;
input  [7:0]  R_in_5     ;
input  [7:0]  R_in_6     ;
input  [7:0]  R_in_7     ;
input  [7:0]  R_in_8     ;
input  [7:0]  R_in_9     ;
input  [7:0]  R_in_10    ;
input  [7:0]  R_in_11    ;
input  [7:0]  R_in_12    ;
input  [7:0]  R_in_13    ;
input  [7:0]  R_in_14    ;
input  [7:0]  R_in_15    ;
input  [7:0]  R_in_16    ;
input  [7:0]  R_in_17    ;
input  [7:0]  R_in_18    ;
input  [7:0]  R_in_19    ;
input  [7:0]  R_in_20    ;
input  [7:0]  R_in_21    ;
input  [7:0]  R_in_22    ;
input  [7:0]  R_in_23    ;
input  [7:0]  R_in_24    ;
input  [7:0]  R_in_25    ;
input  [7:0]  R_in_26    ;
input  [7:0]  R_in_27    ;
input  [7:0]  R_in_28    ;
input  [7:0]  R_in_29    ;
input  [7:0]  R_in_30    ;
input  [7:0]  R_in_31    ;

input         Init_in  ;

input  [31:0] Y_Init   ;

//----------out-------------------


output [31:0] SUM_out  ;	


/*-------------------------------------------------------------------*\
                          Reg/Wire Description
\*-------------------------------------------------------------------*/

wire  [8:0] X_fifo_num	;
wire  [8:0] M_fifo_num	;

wire        Init_out ;

wire [31:0] X_i_j;
wire [31:0] M_i_j;

wire [31:0]   M_out_0		;
wire [31:0]   Y_out_0		;
wire [31:0]   X_out_0		;
wire 	   Init_out_0		;
wire [31:0] SUM_out_0		;
wire [7:0] 	  H_out_0		;
wire  SUM_start_out_0		;

wire [31:0] M_out_1		;
wire [31:0] Y_out_1		;
wire [31:0] X_out_1		;
wire 	 Init_out_1		;
wire [31:0] SUM_out_1	;
wire [7:0] 	H_out_1		;
wire 	SUM_start_out_1 ;

wire [31:0] M_out_2		;
wire [31:0] Y_out_2		;
wire [31:0] X_out_2		;
wire 	 Init_out_2		;
wire [31:0] SUM_out_2	;
wire [7:0] 	H_out_2		;
wire 	SUM_start_out_2 ;

wire [31:0] M_out_3		;
wire [31:0] Y_out_3		;
wire [31:0] X_out_3		;
wire 	 Init_out_3		;
wire [31:0] SUM_out_3	;
wire [7:0] 	H_out_3		;
wire 	SUM_start_out_3 ;

wire [31:0]   M_out_4		;
wire [31:0]   Y_out_4		;
wire [31:0]   X_out_4		;
wire 	   Init_out_4		;
wire [31:0] SUM_out_4		;
wire [7:0] 	  H_out_4		;
wire  SUM_start_out_4		;

wire [31:0]   M_out_5		;
wire [31:0]   Y_out_5		;
wire [31:0]   X_out_5		;
wire 	   Init_out_5		;
wire [31:0] SUM_out_5		;
wire [7:0] 	  H_out_5		;
wire  SUM_start_out_5		;

wire [31:0]   M_out_6		;
wire [31:0]   Y_out_6		;
wire [31:0]   X_out_6		;
wire 	   Init_out_6		;
wire [31:0] SUM_out_6		;
wire [7:0] 	  H_out_6		;
wire  SUM_start_out_6		;

wire [31:0]   M_out_7		;
wire [31:0]   Y_out_7		;
wire [31:0]   X_out_7		;
wire 	   Init_out_7		;
wire [31:0] SUM_out_7		;
wire [7:0] 	  H_out_7		;
wire  SUM_start_out_7		;

wire [31:0]   M_out_8		;
wire [31:0]   Y_out_8		;
wire [31:0]   X_out_8		;
wire 	   Init_out_8		;
wire [31:0] SUM_out_8		;
wire [7:0] 	  H_out_8		;
wire  SUM_start_out_8		;

wire [31:0]   M_out_9		;
wire [31:0]   Y_out_9		;
wire [31:0]   X_out_9		;
wire 	   Init_out_9		;
wire [31:0] SUM_out_9		;
wire [7:0] 	  H_out_9		;
wire  SUM_start_out_9		;

wire [31:0]   M_out_10		;
wire [31:0]   Y_out_10		;
wire [31:0]   X_out_10		;
wire 	   Init_out_10		;
wire [31:0] SUM_out_10		;
wire [7:0] 	  H_out_10		;
wire  SUM_start_out_10		;

wire [31:0]   M_out_11		;
wire [31:0]   Y_out_11		;
wire [31:0]   X_out_11		;
wire 	   Init_out_11		;
wire [31:0] SUM_out_11		;
wire [7:0] 	  H_out_11		;
wire  SUM_start_out_11		;

wire [31:0]   M_out_12		;
wire [31:0]   Y_out_12		;
wire [31:0]   X_out_12		;
wire 	   Init_out_12		;
wire [31:0] SUM_out_12		;
wire [7:0] 	  H_out_12		;
wire  SUM_start_out_12		;

wire [31:0]   M_out_13		;
wire [31:0]   Y_out_13		;
wire [31:0]   X_out_13		;
wire 	   Init_out_13		;
wire [31:0] SUM_out_13		;
wire [7:0] 	  H_out_13		;
wire  SUM_start_out_13		;

wire [31:0]   M_out_14		;
wire [31:0]   Y_out_14		;
wire [31:0]   X_out_14		;
wire 	   Init_out_14		;
wire [31:0] SUM_out_14		;
wire [7:0] 	  H_out_14		;
wire  SUM_start_out_14		;

wire [31:0]   M_out_15		;
wire [31:0]   Y_out_15		;
wire [31:0]   X_out_15		;
wire 	   Init_out_15		;
wire [31:0] SUM_out_15		;
wire [7:0] 	  H_out_15		;
wire  SUM_start_out_15		;

wire [31:0]   M_out_16		;
wire [31:0]   Y_out_16		;
wire [31:0]   X_out_16		;
wire 	   Init_out_16		;
wire [31:0] SUM_out_16		;
wire [7:0] 	  H_out_16		;
wire  SUM_start_out_16		;

wire [31:0]   M_out_17		;
wire [31:0]   Y_out_17		;
wire [31:0]   X_out_17		;
wire 	   Init_out_17		;
wire [31:0] SUM_out_17		;
wire [7:0] 	  H_out_17		;
wire  SUM_start_out_17		;

wire [31:0]   M_out_18		;
wire [31:0]   Y_out_18		;
wire [31:0]   X_out_18		;
wire 	   Init_out_18		;
wire [31:0] SUM_out_18		;
wire [7:0] 	  H_out_18		;
wire  SUM_start_out_18		;

wire [31:0]   M_out_19		;
wire [31:0]   Y_out_19		;
wire [31:0]   X_out_19		;
wire 	   Init_out_19		;
wire [31:0] SUM_out_19		;
wire [7:0] 	  H_out_19		;
wire  SUM_start_out_19		;

wire [31:0]   M_out_20		;
wire [31:0]   Y_out_20		;
wire [31:0]   X_out_20		;
wire 	   Init_out_20		;
wire [31:0] SUM_out_20		;
wire [7:0] 	  H_out_20		;
wire  SUM_start_out_20		;

wire [31:0]   M_out_21		;
wire [31:0]   Y_out_21		;
wire [31:0]   X_out_21		;
wire 	   Init_out_21		;
wire [31:0] SUM_out_21		;
wire [7:0] 	  H_out_21		;
wire  SUM_start_out_21		;

wire [31:0]   M_out_22		;
wire [31:0]   Y_out_22		;
wire [31:0]   X_out_22		;
wire 	   Init_out_22		;
wire [31:0] SUM_out_22		;
wire [7:0] 	  H_out_22		;
wire  SUM_start_out_22		;

wire [31:0]   M_out_23		;
wire [31:0]   Y_out_23		;
wire [31:0]   X_out_23		;
wire 	   Init_out_23		;
wire [31:0] SUM_out_23		;
wire [7:0] 	  H_out_23		;
wire  SUM_start_out_23		;

wire [31:0]   M_out_24		;
wire [31:0]   Y_out_24		;
wire [31:0]   X_out_24		;
wire 	   Init_out_24		;
wire [31:0] SUM_out_24		;
wire [7:0] 	  H_out_24		;
wire  SUM_start_out_24		;

wire [31:0]   M_out_25		;
wire [31:0]   Y_out_25		;
wire [31:0]   X_out_25		;
wire 	   Init_out_25		;
wire [31:0] SUM_out_25		;
wire [7:0] 	  H_out_25		;
wire  SUM_start_out_25		;

wire [31:0]   M_out_26		;
wire [31:0]   Y_out_26		;
wire [31:0]   X_out_26		;
wire 	   Init_out_26		;
wire [31:0] SUM_out_26		;
wire [7:0] 	  H_out_26		;
wire  SUM_start_out_26		;

wire [31:0]   M_out_27		;
wire [31:0]   Y_out_27		;
wire [31:0]   X_out_27		;
wire 	   Init_out_27		;
wire [31:0] SUM_out_27		;
wire [7:0] 	  H_out_27		;
wire  SUM_start_out_27		;

wire [31:0]   M_out_28		;
wire [31:0]   Y_out_28		;
wire [31:0]   X_out_28		;
wire 	   Init_out_28		;
wire [31:0] SUM_out_28		;
wire [7:0] 	  H_out_28		;
wire  SUM_start_out_28		;

wire [31:0]   M_out_29		;
wire [31:0]   Y_out_29		;
wire [31:0]   X_out_29		;
wire 	   Init_out_29		;
wire [31:0] SUM_out_29		;
wire [7:0] 	  H_out_29		;
wire  SUM_start_out_29		;

wire [31:0]   M_out_30		;
wire [31:0]   Y_out_30		;
wire [31:0]   X_out_30		;
wire 	   Init_out_30		;
wire [31:0] SUM_out_30		;
wire [7:0] 	  H_out_30		;
wire  SUM_start_out_30		;

wire [31:0]   M_out_31		;
wire [31:0]   Y_out_31		;
wire [31:0]   X_out_31		;
wire 	   Init_out_31		;
wire [31:0] SUM_out_31		;
wire [7:0] 	  H_out_31		;
wire  SUM_start_out_31		;

wire 	rdreq			;
wire 	wrreq			;

reg SUM_valid_0;
reg SUM_valid_1;
reg SUM_valid_2;
reg SUM_valid_3;
reg SUM_valid_4;
reg SUM_valid_5;
reg SUM_valid_6;
reg SUM_valid_7;
reg SUM_valid_8;
reg SUM_valid_9;
reg SUM_valid_10;
reg SUM_valid_11;
reg SUM_valid_12;
reg SUM_valid_13;
reg SUM_valid_14;
reg SUM_valid_15;
reg SUM_valid_16;
reg SUM_valid_17;
reg SUM_valid_18;
reg SUM_valid_19;
reg SUM_valid_20;
reg SUM_valid_21;
reg SUM_valid_22;
reg SUM_valid_23;
reg SUM_valid_24;
reg SUM_valid_25;
reg SUM_valid_26;
reg SUM_valid_27;
reg SUM_valid_28;
reg SUM_valid_29;
reg SUM_valid_30;
reg SUM_valid_31;

reg SUM_valid_reg_0;
reg SUM_valid_reg_1;
reg SUM_valid_reg_2;

reg [31:0] SUM_out_reg	;

//(*noprune*) reg infinity ;

/*-------------------------------------------------------------------*\
                          Main Code
\*-------------------------------------------------------------------*/

assign rdreq = mode & Init_in;
assign wrreq = Init_out;

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		SUM_valid_0  <= 1'b0;
		SUM_valid_1  <= 1'b0;
		SUM_valid_2  <= 1'b0;
		SUM_valid_3  <= 1'b0;
		SUM_valid_4  <= 1'b0;
		SUM_valid_5  <= 1'b0;
		SUM_valid_6  <= 1'b0;
		SUM_valid_7  <= 1'b0;
		SUM_valid_8  <= 1'b0;
		SUM_valid_9  <= 1'b0;
		SUM_valid_10 <= 1'b0;
		SUM_valid_11 <= 1'b0;
		SUM_valid_12 <= 1'b0;
		SUM_valid_13 <= 1'b0;
		SUM_valid_14 <= 1'b0;
		SUM_valid_15 <= 1'b0;
		SUM_valid_16 <= 1'b0;
		SUM_valid_17 <= 1'b0;
		SUM_valid_18 <= 1'b0;
		SUM_valid_19 <= 1'b0;
		SUM_valid_20 <= 1'b0;
		SUM_valid_21 <= 1'b0;
		SUM_valid_22 <= 1'b0;
		SUM_valid_23 <= 1'b0;
		SUM_valid_24 <= 1'b0;
		SUM_valid_25 <= 1'b0;
		SUM_valid_26 <= 1'b0;
		SUM_valid_27 <= 1'b0;
		SUM_valid_28 <= 1'b0;
		SUM_valid_29 <= 1'b0;
		SUM_valid_30 <= 1'b0;
		SUM_valid_31 <= 1'b0;
	end 
	else begin
		SUM_valid_0  <= SUM_valid;
		SUM_valid_1  <= SUM_valid;
		SUM_valid_2  <= SUM_valid;
		SUM_valid_3  <= SUM_valid;
		SUM_valid_4  <= SUM_valid;
		SUM_valid_5  <= SUM_valid;
		SUM_valid_6  <= SUM_valid;
		SUM_valid_7  <= SUM_valid;
		SUM_valid_8  <= SUM_valid;
		SUM_valid_9  <= SUM_valid;
		SUM_valid_10 <= SUM_valid;
		SUM_valid_11 <= SUM_valid;
		SUM_valid_12 <= SUM_valid;
		SUM_valid_13 <= SUM_valid;
		SUM_valid_14 <= SUM_valid;
		SUM_valid_15 <= SUM_valid;
		SUM_valid_16 <= SUM_valid;
		SUM_valid_17 <= SUM_valid;
		SUM_valid_18 <= SUM_valid;
		SUM_valid_19 <= SUM_valid;
		SUM_valid_20 <= SUM_valid;
		SUM_valid_21 <= SUM_valid;
		SUM_valid_22 <= SUM_valid;
		SUM_valid_23 <= SUM_valid;
		SUM_valid_24 <= SUM_valid;
		SUM_valid_25 <= SUM_valid;
		SUM_valid_26 <= SUM_valid;
		SUM_valid_27 <= SUM_valid;
		SUM_valid_28 <= SUM_valid;
		SUM_valid_29 <= SUM_valid;
		SUM_valid_30 <= SUM_valid;
		SUM_valid_31 <= SUM_valid;
	end 
end

always @(posedge sys_clk or negedge sys_rst_n) begin 
	if (!sys_rst_n) begin
		SUM_valid_reg_0 <= 1'b0;
		SUM_valid_reg_1 <= 1'b0;
		SUM_valid_reg_2 <= 1'b0;
	end 
	else begin
		SUM_valid_reg_0 <= SUM_valid;
		SUM_valid_reg_1 <= SUM_valid_reg_0;
		SUM_valid_reg_2 <= SUM_valid_reg_1;
	end 
end

always @(*) begin 
	case (SUM_select)
		5'd0: SUM_out_reg = SUM_out_0;
		5'd1: SUM_out_reg = SUM_out_1;
		5'd2: SUM_out_reg = SUM_out_2;
		5'd3: SUM_out_reg = SUM_out_3;
		5'd4: SUM_out_reg = SUM_out_4;
		5'd5: SUM_out_reg = SUM_out_5;
		5'd6: SUM_out_reg = SUM_out_6;
		5'd7: SUM_out_reg = SUM_out_7;
		5'd8: SUM_out_reg = SUM_out_8;
		5'd9: SUM_out_reg = SUM_out_9;
		5'd10: SUM_out_reg = SUM_out_10;
		5'd11: SUM_out_reg = SUM_out_11;
		5'd12: SUM_out_reg = SUM_out_12;
		5'd13: SUM_out_reg = SUM_out_13;
		5'd14: SUM_out_reg = SUM_out_14;
		5'd15: SUM_out_reg = SUM_out_15;
		5'd16: SUM_out_reg = SUM_out_16;
		5'd17: SUM_out_reg = SUM_out_17;
		5'd18: SUM_out_reg = SUM_out_18;
		5'd19: SUM_out_reg = SUM_out_19;
		5'd20: SUM_out_reg = SUM_out_20;
		5'd21: SUM_out_reg = SUM_out_21;
		5'd22: SUM_out_reg = SUM_out_22;
		5'd23: SUM_out_reg = SUM_out_23;
		5'd24: SUM_out_reg = SUM_out_24;
		5'd25: SUM_out_reg = SUM_out_25;
		5'd26: SUM_out_reg = SUM_out_26;
		5'd27: SUM_out_reg = SUM_out_27;
		5'd28: SUM_out_reg = SUM_out_28;
		5'd29: SUM_out_reg = SUM_out_29;
		5'd30: SUM_out_reg = SUM_out_30;
		5'd31: SUM_out_reg = SUM_out_31;

		default: SUM_out_reg = SUM_out_31;
	endcase
end

		fifo_X fifo_X (
			.data (X_out_31  ), //  fifo_input.datain
			.wrreq(wrreq     ), //            .wrreq
			.rdreq(rdreq     ), //            .rdreq
			.clock(sys_clk   ), //            .clk
			.aclr (SUM_valid_reg_2), //            .aclr
			.q    (X_i_j     ), // fifo_output.dataout
			.usedw(X_fifo_num)
		);

		fifo_M fifo_M (
			.data (M_out_31  ), //  fifo_input.datain
			.wrreq(wrreq     ), //            .wrreq
			.rdreq(rdreq     ), //            .rdreq
			.clock(sys_clk   ), //            .clk
			.aclr (SUM_valid_reg_2), //            .aclr
			.q    (M_i_j     ), // fifo_output.dataout
			.usedw(M_fifo_num)
		);

/*-------------------------------------------------------------------*\
                             PE
\*-------------------------------------------------------------------*/

		PE0 PE0 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			.mode     (mode       ),

			.SUM_valid(SUM_valid_0),
			.SUM_start(SUM_start),
			
			.M_i_j    (M_i_j      ),
			.X_i_j    (X_i_j      ),
			.Y_i_j    (Y_out_0    ),
			.Y_Init   (Y_Init     ),
			
			.p_mx     (p_mx_0     ),
			.p_my     (p_my_0     ),
			.p_mm     (p_mm_0     ),
			
			.lambda1  (lambda1_0  ),
			.lambda2  (lambda2_0  ),
			
			.H_in     (H_in       ),
			.R_in     (R_in_0     ),
			
			.Init_in  (Init_in    ),
			
			.M_out    (M_out_0    ),
			.X_out    (X_out_0    ),
			.Y_out    (Y_out_0    ),

			.SUM_start_out(SUM_start_out_0),
			
			.Init_out (Init_out_0 ),
			.SUM_out  (SUM_out_0  ),
			.H_out    (H_out_0    )
		);

		PEx PE1 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_1),
			.SUM_start(SUM_start_out_0),
			
			.M_i_j    (M_out_0    ),
			.X_i_j    (X_out_0    ),
			.Y_i_j    (Y_out_1    ),
			
			.p_mx     (p_mx_1     ),
			.p_my     (p_my_1     ),
			.p_mm     (p_mm_1     ),
			
			.lambda1  (lambda1_1  ),
			.lambda2  (lambda2_1  ),
			
			.H_in     (H_out_0    ),
			.R_in     (R_in_1     ),
			
			.Init_in  (Init_out_0 ),
			
			.M_out    (M_out_1    ),
			.X_out    (X_out_1    ),
			.Y_out    (Y_out_1    ),

			.SUM_start_out(SUM_start_out_1),
			
			.Init_out (Init_out_1 ),
			.SUM_out  (SUM_out_1  ),
			.H_out    (H_out_1    )
		);

		PEx PE2 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_2),
			.SUM_start(SUM_start_out_1),
			
			.M_i_j    (M_out_1    ),
			.X_i_j    (X_out_1    ),
			.Y_i_j    (Y_out_2    ),
			
			.p_mx     (p_mx_2     ),
			.p_my     (p_my_2     ),
			.p_mm     (p_mm_2     ),
			
			.lambda1  (lambda1_2  ),
			.lambda2  (lambda2_2  ),
			
			.H_in     (H_out_1    ),
			.R_in     (R_in_2     ),
			
			.Init_in  (Init_out_1 ),
			
			.M_out    (M_out_2    ),
			.X_out    (X_out_2    ),
			.Y_out    (Y_out_2    ),

			.SUM_start_out(SUM_start_out_2),
			
			.Init_out (Init_out_2 ),
			.SUM_out  (SUM_out_2  ),
			.H_out    (H_out_2    )
		);

		PEx PE3 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_3),
			.SUM_start(SUM_start_out_2),
			
			.M_i_j    (M_out_2    ),
			.X_i_j    (X_out_2    ),
			.Y_i_j    (Y_out_3    ),
			
			.p_mx     (p_mx_3     ),
			.p_my     (p_my_3     ),
			.p_mm     (p_mm_3     ),
			
			.lambda1  (lambda1_3  ),
			.lambda2  (lambda2_3  ),
			
			.H_in     (H_out_2    ),
			.R_in     (R_in_3     ),
			
			.Init_in  (Init_out_2 ),
			
			.M_out    (M_out_3    ),
			.X_out    (X_out_3    ),
			.Y_out    (Y_out_3    ),
			.SUM_start_out(SUM_start_out_3),
			
			.Init_out (Init_out_3 ),
			.SUM_out  (SUM_out_3  ),
			.H_out    (H_out_3    )
		);

		PEx PE4 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_4),
			.SUM_start(SUM_start_out_3),
			
			.M_i_j    (M_out_3    ),
			.X_i_j    (X_out_3    ),
			.Y_i_j    (Y_out_4    ),
			
			.p_mx     (p_mx_4     ),
			.p_my     (p_my_4     ),
			.p_mm     (p_mm_4     ),
			
			.lambda1  (lambda1_4  ),
			.lambda2  (lambda2_4  ),
			
			.H_in     (H_out_3    ),
			.R_in     (R_in_4     ),
			
			.Init_in  (Init_out_3 ),
			
			.M_out    (M_out_4    ),
			.X_out    (X_out_4    ),
			.Y_out    (Y_out_4    ),
			.SUM_start_out(SUM_start_out_4),
			
			.Init_out (Init_out_4 ),
			.SUM_out  (SUM_out_4  ),
			.H_out    (H_out_4    )
		);

		PEx PE5 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_5),
			.SUM_start(SUM_start_out_4),
			
			.M_i_j    (M_out_4    ),
			.X_i_j    (X_out_4    ),
			.Y_i_j    (Y_out_5    ),
			
			.p_mx     (p_mx_5     ),
			.p_my     (p_my_5     ),
			.p_mm     (p_mm_5     ),
			
			.lambda1  (lambda1_5  ),
			.lambda2  (lambda2_5  ),
			
			.H_in     (H_out_4    ),
			.R_in     (R_in_5     ),
			
			.Init_in  (Init_out_4 ),
			
			.M_out    (M_out_5    ),
			.X_out    (X_out_5    ),
			.Y_out    (Y_out_5    ),
			.SUM_start_out(SUM_start_out_5),
			
			.Init_out (Init_out_5 ),
			.SUM_out  (SUM_out_5  ),
			.H_out    (H_out_5    )
		);

		PEx PE6 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_6),
			.SUM_start(SUM_start_out_5),
			
			.M_i_j    (M_out_5    ),
			.X_i_j    (X_out_5    ),
			.Y_i_j    (Y_out_6    ),
			
			.p_mx     (p_mx_6     ),
			.p_my     (p_my_6     ),
			.p_mm     (p_mm_6     ),
			
			.lambda1  (lambda1_6  ),
			.lambda2  (lambda2_6  ),
			
			.H_in     (H_out_5    ),
			.R_in     (R_in_6     ),
			
			.Init_in  (Init_out_5 ),
			
			.M_out    (M_out_6    ),
			.X_out    (X_out_6    ),
			.Y_out    (Y_out_6    ),
			.SUM_start_out(SUM_start_out_6),
			
			.Init_out (Init_out_6 ),
			.SUM_out  (SUM_out_6  ),
			.H_out    (H_out_6    )
		);

		PEx PE7 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_7),
			.SUM_start(SUM_start_out_6),
			
			.M_i_j    (M_out_6    ),
			.X_i_j    (X_out_6    ),
			.Y_i_j    (Y_out_7    ),
			
			.p_mx     (p_mx_7     ),
			.p_my     (p_my_7     ),
			.p_mm     (p_mm_7     ),
			
			.lambda1  (lambda1_7  ),
			.lambda2  (lambda2_7  ),
			
			.H_in     (H_out_6    ),
			.R_in     (R_in_7     ),
			
			.Init_in  (Init_out_6 ),
			
			.M_out    (M_out_7    ),
			.X_out    (X_out_7    ),
			.Y_out    (Y_out_7    ),
			.SUM_start_out(SUM_start_out_7),
			
			.Init_out (Init_out_7 ),
			.SUM_out  (SUM_out_7  ),
			.H_out    (H_out_7    )
		);

		PEx PE8 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_8),
			.SUM_start(SUM_start_out_7),
			
			.M_i_j    (M_out_7    ),
			.X_i_j    (X_out_7    ),
			.Y_i_j    (Y_out_8    ),
			
			.p_mx     (p_mx_8     ),
			.p_my     (p_my_8     ),
			.p_mm     (p_mm_8     ),
			
			.lambda1  (lambda1_8  ),
			.lambda2  (lambda2_8  ),
			
			.H_in     (H_out_7    ),
			.R_in     (R_in_8     ),
			
			.Init_in  (Init_out_7 ),
			
			.M_out    (M_out_8    ),
			.X_out    (X_out_8    ),
			.Y_out    (Y_out_8    ),
			.SUM_start_out(SUM_start_out_8),
			
			.Init_out (Init_out_8 ),
			.SUM_out  (SUM_out_8  ),
			.H_out    (H_out_8    )
		);

		PEx PE9 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_9),
			.SUM_start(SUM_start_out_8),
			
			.M_i_j    (M_out_8    ),
			.X_i_j    (X_out_8    ),
			.Y_i_j    (Y_out_9    ),
			
			.p_mx     (p_mx_9     ),
			.p_my     (p_my_9     ),
			.p_mm     (p_mm_9     ),
			
			.lambda1  (lambda1_9  ),
			.lambda2  (lambda2_9  ),
			
			.H_in     (H_out_8    ),
			.R_in     (R_in_9     ),
			
			.Init_in  (Init_out_8 ),
			
			.M_out    (M_out_9    ),
			.X_out    (X_out_9    ),
			.Y_out    (Y_out_9    ),
			.SUM_start_out(SUM_start_out_9),
			
			.Init_out (Init_out_9 ),
			.SUM_out  (SUM_out_9  ),
			.H_out    (H_out_9    )
		);

		PEx PE10 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_10),
			.SUM_start(SUM_start_out_9),
			
			.M_i_j    (M_out_9    ),
			.X_i_j    (X_out_9    ),
			.Y_i_j    (Y_out_10    ),
			
			.p_mx     (p_mx_10     ),
			.p_my     (p_my_10     ),
			.p_mm     (p_mm_10     ),
			
			.lambda1  (lambda1_10  ),
			.lambda2  (lambda2_10  ),
			
			.H_in     (H_out_9    ),
			.R_in     (R_in_10     ),
			
			.Init_in  (Init_out_9 ),
			
			.M_out    (M_out_10    ),
			.X_out    (X_out_10    ),
			.Y_out    (Y_out_10    ),
			.SUM_start_out(SUM_start_out_10),
			
			.Init_out (Init_out_10 ),
			.SUM_out  (SUM_out_10  ),
			.H_out    (H_out_10    )
		);
		PEx PE11 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_11),
			.SUM_start(SUM_start_out_10),
			
			.M_i_j    (M_out_10    ),
			.X_i_j    (X_out_10    ),
			.Y_i_j    (Y_out_11    ),
			
			.p_mx     (p_mx_11     ),
			.p_my     (p_my_11     ),
			.p_mm     (p_mm_11     ),
			
			.lambda1  (lambda1_11  ),
			.lambda2  (lambda2_11  ),
			
			.H_in     (H_out_10    ),
			.R_in     (R_in_11     ),
			
			.Init_in  (Init_out_10 ),
			
			.M_out    (M_out_11   ),
			.X_out    (X_out_11    ),
			.Y_out    (Y_out_11    ),
			.SUM_start_out(SUM_start_out_11),
			
			.Init_out (Init_out_11 ),
			.SUM_out  (SUM_out_11  ),
			.H_out    (H_out_11    )
		);

		PEx PE12 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_12),
			.SUM_start(SUM_start_out_11),
			
			.M_i_j    (M_out_11    ),
			.X_i_j    (X_out_11    ),
			.Y_i_j    (Y_out_12    ),
			
			.p_mx     (p_mx_12     ),
			.p_my     (p_my_12     ),
			.p_mm     (p_mm_12    ),
			
			.lambda1  (lambda1_12 ),
			.lambda2  (lambda2_12 ),
			
			.H_in     (H_out_11    ),
			.R_in     (R_in_12     ),
			
			.Init_in  (Init_out_11 ),
			
			.M_out    (M_out_12    ),
			.X_out    (X_out_12    ),
			.Y_out    (Y_out_12    ),
			.SUM_start_out(SUM_start_out_12),
			
			.Init_out (Init_out_12 ),
			.SUM_out  (SUM_out_12  ),
			.H_out    (H_out_12    )
		);

		PEx PE13 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_13),
			.SUM_start(SUM_start_out_12),
			
			.M_i_j    (M_out_12    ),
			.X_i_j    (X_out_12    ),
			.Y_i_j    (Y_out_13    ),
			
			.p_mx     (p_mx_13     ),
			.p_my     (p_my_13     ),
			.p_mm     (p_mm_13     ),
			
			.lambda1  (lambda1_13  ),
			.lambda2  (lambda2_13  ),
			
			.H_in     (H_out_12    ),
			.R_in     (R_in_13     ),
			
			.Init_in  (Init_out_12 ),
			
			.M_out    (M_out_13    ),
			.X_out    (X_out_13    ),
			.Y_out    (Y_out_13    ),
			.SUM_start_out(SUM_start_out_13),
			
			.Init_out (Init_out_13 ),
			.SUM_out  (SUM_out_13  ),
			.H_out    (H_out_13    )
		);

		PEx PE14 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_14),
			.SUM_start(SUM_start_out_13),
			
			.M_i_j    (M_out_13    ),
			.X_i_j    (X_out_13    ),
			.Y_i_j    (Y_out_14    ),
			
			.p_mx     (p_mx_14     ),
			.p_my     (p_my_14     ),
			.p_mm     (p_mm_14     ),
			
			.lambda1  (lambda1_14  ),
			.lambda2  (lambda2_14  ),
			
			.H_in     (H_out_13    ),
			.R_in     (R_in_14     ),
			
			.Init_in  (Init_out_13 ),
			
			.M_out    (M_out_14    ),
			.X_out    (X_out_14    ),
			.Y_out    (Y_out_14    ),
			.SUM_start_out(SUM_start_out_14),
			
			.Init_out (Init_out_14 ),
			.SUM_out  (SUM_out_14  ),
			.H_out    (H_out_14    )
		);

		PEx PE15 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_15),
			.SUM_start(SUM_start_out_14),
			
			.M_i_j    (M_out_14    ),
			.X_i_j    (X_out_14    ),
			.Y_i_j    (Y_out_15    ),
			
			.p_mx     (p_mx_15     ),
			.p_my     (p_my_15     ),
			.p_mm     (p_mm_15     ),
			
			.lambda1  (lambda1_15  ),
			.lambda2  (lambda2_15  ),
			
			.H_in     (H_out_14    ),
			.R_in     (R_in_15     ),
			
			.Init_in  (Init_out_14 ),
			
			.M_out    (M_out_15    ),
			.X_out    (X_out_15    ),
			.Y_out    (Y_out_15    ),
			.SUM_start_out(SUM_start_out_15),
			
			.Init_out (Init_out_15 ),
			.SUM_out  (SUM_out_15  ),
			.H_out    (H_out_15    )
		);

		PEx PE16 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_16),
			.SUM_start(SUM_start_out_15),
			
			.M_i_j    (M_out_15    ),
			.X_i_j    (X_out_15    ),
			.Y_i_j    (Y_out_16    ),
			
			.p_mx     (p_mx_16     ),
			.p_my     (p_my_16     ),
			.p_mm     (p_mm_16     ),
			
			.lambda1  (lambda1_16  ),
			.lambda2  (lambda2_16  ),
			
			.H_in     (H_out_15    ),
			.R_in     (R_in_16     ),
			
			.Init_in  (Init_out_15 ),
			
			.M_out    (M_out_16    ),
			.X_out    (X_out_16    ),
			.Y_out    (Y_out_16    ),
			.SUM_start_out(SUM_start_out_16),
			
			.Init_out (Init_out_16 ),
			.SUM_out  (SUM_out_16  ),
			.H_out    (H_out_16    )
		);

		PEx PE17 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_17),
			.SUM_start(SUM_start_out_16),
			
			.M_i_j    (M_out_16    ),
			.X_i_j    (X_out_16    ),
			.Y_i_j    (Y_out_17    ),
			
			.p_mx     (p_mx_17     ),
			.p_my     (p_my_17     ),
			.p_mm     (p_mm_17     ),
			
			.lambda1  (lambda1_17  ),
			.lambda2  (lambda2_17  ),
			
			.H_in     (H_out_16    ),
			.R_in     (R_in_17     ),
			
			.Init_in  (Init_out_16 ),
			
			.M_out    (M_out_17    ),
			.X_out    (X_out_17    ),
			.Y_out    (Y_out_17    ),
			.SUM_start_out(SUM_start_out_17),
			
			.Init_out (Init_out_17 ),
			.SUM_out  (SUM_out_17  ),
			.H_out    (H_out_17    )
		);

		PEx PE18 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_18),
			.SUM_start(SUM_start_out_17),
			
			.M_i_j    (M_out_17    ),
			.X_i_j    (X_out_17    ),
			.Y_i_j    (Y_out_18    ),
			
			.p_mx     (p_mx_18     ),
			.p_my     (p_my_18     ),
			.p_mm     (p_mm_18     ),
			
			.lambda1  (lambda1_18  ),
			.lambda2  (lambda2_18  ),
			
			.H_in     (H_out_17    ),
			.R_in     (R_in_18     ),
			
			.Init_in  (Init_out_17 ),
			
			.M_out    (M_out_18    ),
			.X_out    (X_out_18    ),
			.Y_out    (Y_out_18    ),
			.SUM_start_out(SUM_start_out_18),
			
			.Init_out (Init_out_18 ),
			.SUM_out  (SUM_out_18  ),
			.H_out    (H_out_18    )
		);

		PEx PE19 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_19),
			.SUM_start(SUM_start_out_18),
			
			.M_i_j    (M_out_18    ),
			.X_i_j    (X_out_18    ),
			.Y_i_j    (Y_out_19    ),
			
			.p_mx     (p_mx_19     ),
			.p_my     (p_my_19     ),
			.p_mm     (p_mm_19     ),
			
			.lambda1  (lambda1_19  ),
			.lambda2  (lambda2_19  ),
			
			.H_in     (H_out_18    ),
			.R_in     (R_in_19     ),
			
			.Init_in  (Init_out_18 ),
			
			.M_out    (M_out_19    ),
			.X_out    (X_out_19    ),
			.Y_out    (Y_out_19    ),
			.SUM_start_out(SUM_start_out_19),
			
			.Init_out (Init_out_19 ),
			.SUM_out  (SUM_out_19  ),
			.H_out    (H_out_19    )
		);

		PEx PE20 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_20),
			.SUM_start(SUM_start_out_19),
			
			.M_i_j    (M_out_19    ),
			.X_i_j    (X_out_19    ),
			.Y_i_j    (Y_out_20    ),
			
			.p_mx     (p_mx_20     ),
			.p_my     (p_my_20     ),
			.p_mm     (p_mm_20     ),
			
			.lambda1  (lambda1_20  ),
			.lambda2  (lambda2_20  ),
			
			.H_in     (H_out_19    ),
			.R_in     (R_in_20     ),
			
			.Init_in  (Init_out_19 ),
			
			.M_out    (M_out_20    ),
			.X_out    (X_out_20    ),
			.Y_out    (Y_out_20    ),
			.SUM_start_out(SUM_start_out_20),
			
			.Init_out (Init_out_20 ),
			.SUM_out  (SUM_out_20  ),
			.H_out    (H_out_20    )
		);

		PEx PE21 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_21),
			.SUM_start(SUM_start_out_20),
			
			.M_i_j    (M_out_20    ),
			.X_i_j    (X_out_20    ),
			.Y_i_j    (Y_out_21    ),
			
			.p_mx     (p_mx_21     ),
			.p_my     (p_my_21     ),
			.p_mm     (p_mm_21     ),
			
			.lambda1  (lambda1_21  ),
			.lambda2  (lambda2_21  ),
			
			.H_in     (H_out_20    ),
			.R_in     (R_in_21     ),
			
			.Init_in  (Init_out_20 ),
			
			.M_out    (M_out_21    ),
			.X_out    (X_out_21    ),
			.Y_out    (Y_out_21    ),
			.SUM_start_out(SUM_start_out_21),
			
			.Init_out (Init_out_21 ),
			.SUM_out  (SUM_out_21  ),
			.H_out    (H_out_21    )
		);

		PEx PE22 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_22),
			.SUM_start(SUM_start_out_21),
			
			.M_i_j    (M_out_21    ),
			.X_i_j    (X_out_21    ),
			.Y_i_j    (Y_out_22    ),
			
			.p_mx     (p_mx_22     ),
			.p_my     (p_my_22     ),
			.p_mm     (p_mm_22     ),
			
			.lambda1  (lambda1_22  ),
			.lambda2  (lambda2_22  ),
			
			.H_in     (H_out_21    ),
			.R_in     (R_in_22     ),
			
			.Init_in  (Init_out_21 ),
			
			.M_out    (M_out_22    ),
			.X_out    (X_out_22    ),
			.Y_out    (Y_out_22    ),
			.SUM_start_out(SUM_start_out_22),
			
			.Init_out (Init_out_22 ),
			.SUM_out  (SUM_out_22  ),
			.H_out    (H_out_22    )
		);

		PEx PE23 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_23),
			.SUM_start(SUM_start_out_22),
			
			.M_i_j    (M_out_22    ),
			.X_i_j    (X_out_22    ),
			.Y_i_j    (Y_out_23    ),
			
			.p_mx     (p_mx_23     ),
			.p_my     (p_my_23     ),
			.p_mm     (p_mm_23     ),
			
			.lambda1  (lambda1_23  ),
			.lambda2  (lambda2_23  ),
			
			.H_in     (H_out_22    ),
			.R_in     (R_in_23     ),
			
			.Init_in  (Init_out_22 ),
			
			.M_out    (M_out_23    ),
			.X_out    (X_out_23    ),
			.Y_out    (Y_out_23    ),
			.SUM_start_out(SUM_start_out_23),
			
			.Init_out (Init_out_23 ),
			.SUM_out  (SUM_out_23  ),
			.H_out    (H_out_23    )
		);

		PEx PE24 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_24),
			.SUM_start(SUM_start_out_23),
			
			.M_i_j    (M_out_23    ),
			.X_i_j    (X_out_23    ),
			.Y_i_j    (Y_out_24    ),
			
			.p_mx     (p_mx_24     ),
			.p_my     (p_my_24     ),
			.p_mm     (p_mm_24     ),
			
			.lambda1  (lambda1_24  ),
			.lambda2  (lambda2_24  ),
			
			.H_in     (H_out_23    ),
			.R_in     (R_in_24     ),
			
			.Init_in  (Init_out_23 ),
			
			.M_out    (M_out_24    ),
			.X_out    (X_out_24    ),
			.Y_out    (Y_out_24    ),
			.SUM_start_out(SUM_start_out_24),
			
			.Init_out (Init_out_24 ),
			.SUM_out  (SUM_out_24  ),
			.H_out    (H_out_24    )
		);

		PEx PE25 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_25),
			.SUM_start(SUM_start_out_24),
			
			.M_i_j    (M_out_24    ),
			.X_i_j    (X_out_24    ),
			.Y_i_j    (Y_out_25    ),
			
			.p_mx     (p_mx_25     ),
			.p_my     (p_my_25     ),
			.p_mm     (p_mm_25     ),
			
			.lambda1  (lambda1_25  ),
			.lambda2  (lambda2_25  ),
			
			.H_in     (H_out_24    ),
			.R_in     (R_in_25     ),
			
			.Init_in  (Init_out_24 ),
			
			.M_out    (M_out_25    ),
			.X_out    (X_out_25    ),
			.Y_out    (Y_out_25    ),
			.SUM_start_out(SUM_start_out_25),
			
			.Init_out (Init_out_25 ),
			.SUM_out  (SUM_out_25  ),
			.H_out    (H_out_25    )
		);

		PEx PE26 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_26),
			.SUM_start(SUM_start_out_25),
			
			.M_i_j    (M_out_25    ),
			.X_i_j    (X_out_25    ),
			.Y_i_j    (Y_out_26    ),
			
			.p_mx     (p_mx_26     ),
			.p_my     (p_my_26     ),
			.p_mm     (p_mm_26     ),
			
			.lambda1  (lambda1_26  ),
			.lambda2  (lambda2_26  ),
			
			.H_in     (H_out_25    ),
			.R_in     (R_in_26     ),
			
			.Init_in  (Init_out_25 ),
			
			.M_out    (M_out_26    ),
			.X_out    (X_out_26    ),
			.Y_out    (Y_out_26    ),
			.SUM_start_out(SUM_start_out_26),
			
			.Init_out (Init_out_26 ),
			.SUM_out  (SUM_out_26  ),
			.H_out    (H_out_26    )
		);

		PEx PE27 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_27),
			.SUM_start(SUM_start_out_26),
			
			.M_i_j    (M_out_26    ),
			.X_i_j    (X_out_26    ),
			.Y_i_j    (Y_out_27    ),
			
			.p_mx     (p_mx_27     ),
			.p_my     (p_my_27     ),
			.p_mm     (p_mm_27     ),
			
			.lambda1  (lambda1_27  ),
			.lambda2  (lambda2_27  ),
			
			.H_in     (H_out_26    ),
			.R_in     (R_in_27     ),
			
			.Init_in  (Init_out_26 ),
			
			.M_out    (M_out_27    ),
			.X_out    (X_out_27    ),
			.Y_out    (Y_out_27    ),
			.SUM_start_out(SUM_start_out_27),
			
			.Init_out (Init_out_27 ),
			.SUM_out  (SUM_out_27  ),
			.H_out    (H_out_27    )
		);

		PEx PE28 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_28),
			.SUM_start(SUM_start_out_27),
			
			.M_i_j    (M_out_27    ),
			.X_i_j    (X_out_27    ),
			.Y_i_j    (Y_out_28    ),
			
			.p_mx     (p_mx_28     ),
			.p_my     (p_my_28     ),
			.p_mm     (p_mm_28     ),
			
			.lambda1  (lambda1_28  ),
			.lambda2  (lambda2_28  ),
			
			.H_in     (H_out_27    ),
			.R_in     (R_in_28    ),
			
			.Init_in  (Init_out_27 ),
			
			.M_out    (M_out_28    ),
			.X_out    (X_out_28    ),
			.Y_out    (Y_out_28    ),
			.SUM_start_out(SUM_start_out_28),
			
			.Init_out (Init_out_28 ),
			.SUM_out  (SUM_out_28  ),
			.H_out    (H_out_28    )
		);

		PEx PE29 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_29),
			.SUM_start(SUM_start_out_28),
			
			.M_i_j    (M_out_28    ),
			.X_i_j    (X_out_28    ),
			.Y_i_j    (Y_out_29    ),
			
			.p_mx     (p_mx_29     ),
			.p_my     (p_my_29     ),
			.p_mm     (p_mm_29     ),
			
			.lambda1  (lambda1_29  ),
			.lambda2  (lambda2_29  ),
			
			.H_in     (H_out_28    ),
			.R_in     (R_in_29     ),
			
			.Init_in  (Init_out_28 ),
			
			.M_out    (M_out_29    ),
			.X_out    (X_out_29    ),
			.Y_out    (Y_out_29    ),
			.SUM_start_out(SUM_start_out_29),
			
			.Init_out (Init_out_29 ),
			.SUM_out  (SUM_out_29  ),
			.H_out    (H_out_29    )
		);

		PEx PE30 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_30),
			.SUM_start(SUM_start_out_29),
			
			.M_i_j    (M_out_29    ),
			.X_i_j    (X_out_29    ),
			.Y_i_j    (Y_out_30    ),
			
			.p_mx     (p_mx_30     ),
			.p_my     (p_my_30     ),
			.p_mm     (p_mm_30     ),
			
			.lambda1  (lambda1_30  ),
			.lambda2  (lambda2_30  ),
			
			.H_in     (H_out_29    ),
			.R_in     (R_in_30     ),
			
			.Init_in  (Init_out_29 ),
			
			.M_out    (M_out_30    ),
			.X_out    (X_out_30    ),
			.Y_out    (Y_out_30    ),
			.SUM_start_out(SUM_start_out_30),
			
			.Init_out (Init_out_30 ),
			.SUM_out  (SUM_out_30  ),
			.H_out    (H_out_30    )
		);

		PEx PE31 (
			.sys_clk  (sys_clk    ),
			.sys_rst_n(sys_rst_n  ),
			
			.SUM_valid(SUM_valid_31),
			.SUM_start(SUM_start_out_30),
			
			.M_i_j    (M_out_30    ),
			.X_i_j    (X_out_30    ),
			.Y_i_j    (Y_out_31    ),
			
			.p_mx     (p_mx_31     ),
			.p_my     (p_my_31     ),
			.p_mm     (p_mm_31     ),
			
			.lambda1  (lambda1_31  ),
			.lambda2  (lambda2_31  ),
			
			.H_in     (H_out_30    ),
			.R_in     (R_in_31     ),
			
			.Init_in  (Init_out_30 ),
			
			.M_out    (M_out_31    ),
			.X_out    (X_out_31    ),
			.Y_out    (Y_out_31    ),
			.SUM_start_out(SUM_start_out_31),
			
			.Init_out (Init_out_31 ),
			.SUM_out  (SUM_out_31  ),
			.H_out    (H_out_31    )
		);

assign Init_out = Init_out_31;
assign SUM_out = SUM_out_reg;

endmodule 