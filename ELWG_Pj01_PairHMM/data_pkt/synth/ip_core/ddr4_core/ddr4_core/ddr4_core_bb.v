
module ddr4_core (
	emif_usr_reset_n,
	emif_usr_clk,
	global_reset_n,
	pll_ref_clk,
	oct_rzqin,
	mem_ck,
	mem_ck_n,
	mem_a,
	mem_act_n,
	mem_ba,
	mem_bg,
	mem_cke,
	mem_cs_n,
	mem_odt,
	mem_reset_n,
	mem_par,
	mem_alert_n,
	mem_dqs,
	mem_dqs_n,
	mem_dq,
	mem_dbi_n,
	local_cal_success,
	local_cal_fail,
	amm_ready_0,
	amm_read_0,
	amm_write_0,
	amm_address_0,
	amm_readdata_0,
	amm_writedata_0,
	amm_burstcount_0,
	amm_byteenable_0,
	amm_readdatavalid_0);	

	output		emif_usr_reset_n;
	output		emif_usr_clk;
	input		global_reset_n;
	input		pll_ref_clk;
	input		oct_rzqin;
	output	[0:0]	mem_ck;
	output	[0:0]	mem_ck_n;
	output	[16:0]	mem_a;
	output	[0:0]	mem_act_n;
	output	[1:0]	mem_ba;
	output	[0:0]	mem_bg;
	output	[0:0]	mem_cke;
	output	[0:0]	mem_cs_n;
	output	[0:0]	mem_odt;
	output	[0:0]	mem_reset_n;
	output	[0:0]	mem_par;
	input	[0:0]	mem_alert_n;
	inout	[8:0]	mem_dqs;
	inout	[8:0]	mem_dqs_n;
	inout	[71:0]	mem_dq;
	inout	[8:0]	mem_dbi_n;
	output		local_cal_success;
	output		local_cal_fail;
	output		amm_ready_0;
	input		amm_read_0;
	input		amm_write_0;
	input	[24:0]	amm_address_0;
	output	[575:0]	amm_readdata_0;
	input	[575:0]	amm_writedata_0;
	input	[6:0]	amm_burstcount_0;
	input	[71:0]	amm_byteenable_0;
	output		amm_readdatavalid_0;
endmodule
