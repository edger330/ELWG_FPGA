// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Nov  2 15:32:17 2018
// Host        : DESKTOP-80OJBTC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim E:/projects/SW_zzt/SW_zzt.srcs/sources_1/ip/SUB/SUB_sim_netlist.v
// Design      : SUB
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "SUB,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module SUB
   (A,
    B,
    CLK,
    SCLR,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [15:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [15:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:reset:1.0 sclr_intf RST" *) (* x_interface_parameter = "XIL_INTERFACENAME sclr_intf, POLARITY ACTIVE_HIGH" *) input SCLR;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [15:0]S;

  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [15:0]S;
  wire SCLR;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "2" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  SUB_c_addsub_v12_0_11 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "1" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "16" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintexu" *) (* ORIG_REF_NAME = "c_addsub_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module SUB_c_addsub_v12_0_11
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [15:0]A;
  input [15:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [15:0]S;

  wire \<const0> ;
  wire [15:0]A;
  wire [15:0]B;
  wire CLK;
  wire [15:0]S;
  wire SCLR;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "1" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "kintexu" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "16" *) 
  (* c_add_mode = "1" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "0000000000000000" *) 
  (* c_b_width = "16" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "2" *) 
  (* c_out_width = "16" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  SUB_c_addsub_v12_0_11_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(SCLR),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2015"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
iO2Bdkfy0dqqValMR4KhTWXpD0gDQF+kyoly3tZBTZTVs0CbWJ4Owhu4jxMCf8X2gbWR6iweF6Ks
B5dmLHZTDA==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
dbcEbgyZfx3YLmYpvjegvD9sRQCV1qBv0GqFBvCakC3SMR/H82zqo5uv5MZldBGUVmNHnxF3Vejx
zSqxUKfTNc90CS6quuoQe0eeq3T5XSdgwbNtjPZKvJuJTmQKT96yB3CfQOz13fGjaLrn/8NBUBBh
I7OEoGGg7ADph9V3vRg=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
bD3a4YgAnaoJx9/hljj2C1rODcUhawTVE1gtdPkNj8/YjemaFM6/sF7Q0CXbDJ7a+OBrB5pUgj3O
Vesi4yVmFp+mGmFarftWat5KmZiP3RVWrXwdzMj+f8T7p+lE3iD4njqUxIUz0TsUaNvFeW0xVNNb
OwTEX04nyt5HrU82dltJCclpFxE6yrP9YvI7l328bphwnC63xxk8T3yXwCrvj3VrIYuDT2yMRxrB
TBCv/Fe2f07JQyV73J7+DGAeJG0B1dTHeu48auQT63g1HsYaUXREihEUKgZe70QlOqlPbrr6Quhx
2LXE8LSdCA+FbJ7LlQc/Sgasj3ZYjM5lhEKleQ==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
GCfR7acMSeEtOw1DhZKkUXjh9Uw/vUar7CGDRG9rZcB9NFDtQTltJeuKjFg8eaeKH9HFBMryuX72
/tmzhtFaiSTjr2na4ncL2XV3QRXe7nQaiHdc7cKBcZDvdSSMzOSYcIxLunwLwQTLC7sCvINmlxO1
NXnYzJVL1xb9HP8QVnSYpo1p+gCXcRBZzrOjZjCUnl7F2t3ZZStSGjBEyXVLnV+ouU3+247oJAOa
kC7v+pOtG2ho4KclIg0MGijjPs+jyOFU+b5C+ufQp/zL9GiZ5waCjb/0Y1vkBc9jZKR7YRnv+ASG
ju1uP8oqEXR9742kXRnW4HkMKkCK1MLDgWYdqw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2017_05", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
L+AGKmFZ1zoRJFd2cA+zxJhkgQ1R0aEjGQCGRFLNNhLHZXpzGDIjdSLjralBVRJ2rD6UcJutapF5
YaMoV9kphGGG2B07dxBuIimVjOxS3ZQJ7ru59ddfGBxUe9EHrv00Q5hTwoxig0lxqnmjSSnfsDeF
weTIqNnXkG5kqqezKC8a2FvUD5QWQBibhK69OAdmhhIOwZmpfvQKbEKgLX70BzcNlmLnttRL7G+q
XZ3fabZ42+JJHDLiIfveB3Gp2Lf2tzTH1u2xx5aEUr9154pnC9PWIwL3y3VBAT1oHR7ScdoGDOEy
HoYUiDibldOidIeKW0KrTeAIuBNmtM4R0R+RSA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
V5ClnklUs5Wo++EDemG/KeowZlAfqB8SUrvSxPQGrdIwGfUvoCajhuABAWdS/L/pQl7Eyz51aiuw
KzPMrWtQozAEITf1xzvzgKbWZqoi4PQD3rThywFsFq60u8DdvHYM/kEvit0cZVFvG8rAbtlseHLu
0vU1kbrNgxb3bxjOovg=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cRqAgScIUeXUwYGfCC0XDtpcc+mFNm3p8oTcFdtIU1nnlMagpBMqRm5ELc+m/Yw8jBwvcvt4tUFv
u/ypEEw+y12B+5Pr6SmnLJ+NVB3Q3Eyh4Q/d7p3jReIIsUxrlENpCTi4PVXMKr1B1Htzm8F8mXDq
y2UV+0SC+4yrBIntsdS0S8jPBERhfJhzNC5z38pPHANtM4wGGIUuKxIALLz1aq+2AjLbEgFHNrzw
2bJiDwRSTwrY4Yx2MSzYJk3O+cQBUe8nJDPx+aGEvDzQ4ZdJMNg2z+iaiE7OTaqK492Jb/1jvU0j
wlI+n35s2rrnc9QgfljdOJuueruPuYDi5vTTxA==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
CgSHHNqbF19sNwSPeWFffPnybpnN1koPZKLxkr//EoycNw8QQuK9zmT02ru1I7XfM+aiDaO2Ia94
ntq9+nrxk7qbMrDC/mZFxfxQBt30tMWuggjc8N965Ebse6By1BXONhB/Mz43uO9uAnqJJm0a8eNr
C6G+fyg3C/GRMW9Ews/VG9/pcXBxQIhCiiAMt/S6p0GFlCUoM7CLIZQxoKj2xeq6XH84iZJU0eIu
l21R/aQdB8KkBQckTWGzLiduLJHl2cnv8y9Vi7wV4u3yeOJLkc/lGKCMFthLCcI+APhRI7vWhNy6
BQVrlb3AH/jpCRLbn/qG8hmdDQ6aVA6m9JOZTQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
UxOsm6pjz6RoKlzIXXN+4RNfVizKLGCkhSCTYA+GWZkBd+VjHDe65wQAOBz4JfsUK6KOGv1gDdl9
SxC4nOx5smCwa0OsQLACsbcHxG0j9buMAj3W2nG/8mxLBWa/D3Hq6cjz24ns+7E2vN+MtRKGr80e
D4k6rS72VmwJDmm+/RbZmTXud88mHYhwXP/ugbkqze9I7Y1d3QieUUSGxVHAY3gjPN+mJci3YYXC
zYAfZ6DUzNEV11kOiu5eiKGjofZWW5t3fhqsjrQ7gq2+NuQGczk4KGmmBWQnFYhfVCR2YvkYJgKo
wh1hisRzyCG8FRb0lu1s4nSTD5q/SLeyQgYClg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 26128)
`pragma protect data_block
+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
Kx2gdSmwaU/QLrbRiZP5P0MyWioE7g==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
