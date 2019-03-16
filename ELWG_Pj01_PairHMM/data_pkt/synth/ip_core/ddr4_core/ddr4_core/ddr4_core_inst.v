	ddr4_core u0 (
		.emif_usr_reset_n    (<connected-to-emif_usr_reset_n>),    // emif_usr_reset_n.reset_n
		.emif_usr_clk        (<connected-to-emif_usr_clk>),        //     emif_usr_clk.clk
		.global_reset_n      (<connected-to-global_reset_n>),      //   global_reset_n.reset_n
		.pll_ref_clk         (<connected-to-pll_ref_clk>),         //      pll_ref_clk.clk
		.oct_rzqin           (<connected-to-oct_rzqin>),           //              oct.oct_rzqin
		.mem_ck              (<connected-to-mem_ck>),              //              mem.mem_ck
		.mem_ck_n            (<connected-to-mem_ck_n>),            //                 .mem_ck_n
		.mem_a               (<connected-to-mem_a>),               //                 .mem_a
		.mem_act_n           (<connected-to-mem_act_n>),           //                 .mem_act_n
		.mem_ba              (<connected-to-mem_ba>),              //                 .mem_ba
		.mem_bg              (<connected-to-mem_bg>),              //                 .mem_bg
		.mem_cke             (<connected-to-mem_cke>),             //                 .mem_cke
		.mem_cs_n            (<connected-to-mem_cs_n>),            //                 .mem_cs_n
		.mem_odt             (<connected-to-mem_odt>),             //                 .mem_odt
		.mem_reset_n         (<connected-to-mem_reset_n>),         //                 .mem_reset_n
		.mem_par             (<connected-to-mem_par>),             //                 .mem_par
		.mem_alert_n         (<connected-to-mem_alert_n>),         //                 .mem_alert_n
		.mem_dqs             (<connected-to-mem_dqs>),             //                 .mem_dqs
		.mem_dqs_n           (<connected-to-mem_dqs_n>),           //                 .mem_dqs_n
		.mem_dq              (<connected-to-mem_dq>),              //                 .mem_dq
		.mem_dbi_n           (<connected-to-mem_dbi_n>),           //                 .mem_dbi_n
		.local_cal_success   (<connected-to-local_cal_success>),   //           status.local_cal_success
		.local_cal_fail      (<connected-to-local_cal_fail>),      //                 .local_cal_fail
		.amm_ready_0         (<connected-to-amm_ready_0>),         //       ctrl_amm_0.waitrequest_n
		.amm_read_0          (<connected-to-amm_read_0>),          //                 .read
		.amm_write_0         (<connected-to-amm_write_0>),         //                 .write
		.amm_address_0       (<connected-to-amm_address_0>),       //                 .address
		.amm_readdata_0      (<connected-to-amm_readdata_0>),      //                 .readdata
		.amm_writedata_0     (<connected-to-amm_writedata_0>),     //                 .writedata
		.amm_burstcount_0    (<connected-to-amm_burstcount_0>),    //                 .burstcount
		.amm_byteenable_0    (<connected-to-amm_byteenable_0>),    //                 .byteenable
		.amm_readdatavalid_0 (<connected-to-amm_readdatavalid_0>)  //                 .readdatavalid
	);

