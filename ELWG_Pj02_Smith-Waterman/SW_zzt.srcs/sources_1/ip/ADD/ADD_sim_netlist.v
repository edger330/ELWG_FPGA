// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Fri Nov  2 15:31:57 2018
// Host        : DESKTOP-80OJBTC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim E:/projects/SW_zzt/SW_zzt.srcs/sources_1/ip/ADD/ADD_sim_netlist.v
// Design      : ADD
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcku115-flvf1924-2-e
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "ADD,c_addsub_v12_0_11,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_11,Vivado 2017.4" *) 
(* NotValidForBitStream *)
module ADD
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
  (* c_add_mode = "0" *) 
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
  ADD_c_addsub_v12_0_11 U0
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

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "16" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "0000000000000000" *) 
(* C_B_WIDTH = "16" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "1" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "2" *) 
(* C_OUT_WIDTH = "16" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "kintexu" *) (* ORIG_REF_NAME = "c_addsub_v12_0_11" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module ADD_c_addsub_v12_0_11
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
  (* c_add_mode = "0" *) 
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
  ADD_c_addsub_v12_0_11_viv xst_addsub
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
Il1SrQOQIN24q4Tu9eLont2BvRWOlIPjN0xvBiJ6AFlvp7je5vei8ufbjU/kSmraYc28iryDTDFK
DNH7AJYsPnqgCPANhzdcGXXCAY6mj6dPSDgye/FrZrbSDcSU/hjeW4oyaIJznYaO6/PYa6bGScoF
noS2hfxVnJmBFyndyCqoKsp5CMJvmnxbaeaVvX4KeUwbmfvZBHCjpZL2xliXZLKJhs1XjLyV95kz
vY/4dX9CLmTlL8CM9okUzhFry7NBr5lEw/A+Rg6gFGr0pPpWkikL1BB6kkQjoAQb60eCcPyCt/Kd
Nu80BaFHmBKiqT76nw9EmyScrJnPmDcyY+jARg==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
H66d2e5XDQUKlkaVDiPnnC74iOIUk2HE0ch1Sy4AZbd/Ca1DMvt4BBi69XsAftk2Jzdzct5pWh/r
gPJAH9EJBGYrBp3wzh7HvHt6ArgxGkCdFhd2r50/MbyVIWNxpO0B+bELWZtbAv8cxfWLuFBkll4M
Bl50pYNBgybTAI4wlOJCI4VmBOzBpLh5V3zMWxa6unNhMM+a3NRrG2KzbCzAwgiPHmNCCGuCJl2n
1WVkVMPAqAmfqFS66uj1xk3+QgMYy3HydPhswyQC/TeJCoIGC4RyAhjFt2zsuoMro/eHAedb5IOZ
4pvbKl856bp1OELJKmf2E2258ByLdJXao1F2wQ==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 21936)
`pragma protect data_block
hHbmqvRs/qu0s+pyPWAW2rvLBtqi5Ztu0R0RQsmbq7Vdq3+vxegJyrm2fr1wyz0cunqBeMtBlOIq
1U6TdHu8AOVeeGqQd0GH6xGSjYhmULgPjrNc3l9KCgW7UgOe3HYyQA8r2z+rIzUl2IihDEajzUSW
ODic+uFzGsaIWZN71FJEFao6ZE1CQelfmBps5jKQhFITWaWghmS3DxDBI1czWdvj1SuOECBk9ilw
gQw1/1UEbn8sMVk88HPHvdua/SkRv/n/xZmVPoprIOGTiJzAsDOlGCzp1Ly5EumilkxjbqTc8R6G
oeG2W7oFRQe5dkByNr8QcENW9USsOlbTb8fzk+QsyM8YGSTTrc7oUqRaReY9uwatgie1eerPos/2
AJzc9S2HU/0VRh8EPWq9ZoL+7Jws3hRAt4ODXy5/8QdmAjUKSzR3KrvFLnmT6BUEjKh23GFVlcKj
1OTqWqXiHyfWV8f9wfFrOwCunP51YvWSxcG8D0WIGU7AOp+7PTQ9b9OExnVdmnIW0GjbkIJfw9UY
rkff5dr9RZAuf41Oxha5s68iyHKYtVILyQ3a+RCpBraXZRGkeUc0HNU+x9UYb+iuddWDycQRUeSs
EivHYOn9HOsU3dVh+tDZX9Xasdar0R8WQBSGQlBZjyTQYZfE+mc75FOGuc/Nmq/o/YnDrVW9AO5J
7PAzDia4RWe0bgTaKnNvJheD11h4KTbu+wdnMm+HzUx9kvWVs+Sdfs2cQzS5QxEhgJ5DUssYsWVu
8P2vmnACtKXKPXJfpy9LGTNnFZx8mzCFq1XeXBKk+R7tCCaqHBV19bQWWw0vxdg6ao8IEYt4Meu4
UdWSZGYgolIlT2UqDZaHJQICtYPyLdq5bULbz/hwE28ONF8ebSq+fP0s8Nud39N73xBdJeRdBUG1
w/GVypYu559WTN3FOcsOloQSjVffibOBC0w25d92F7CgyKGbzWCH7dAGKVlCX5rtvwSMB+4/SmVT
NhkvLneyK3l3qN7zJDN89yja9hkCSlnCyIrKSl4Af1qZjHLRLQYgoaCaAjx3wimDFD84RMJkuokO
ZuHc1KnlsBy0aeLmzQfq9hn//YJTcFxJ81KR5bINE0bOcmcyLSYVi9yg/pGxgnQlTk0v/ih3u42w
sChnv3TgdgnBcKydg87VaeKJa5K27WcvSBhu8LXLMOWJI3vMrNKJfSPB4/0UX0WayY99/UiWGDy0
9owmyt291b9symp+xE4s3mu27VdrZsC8hGZmndkhTW9CPDw706xTyo20KcNo2QHxRPmeuUmzRbuk
ukoBmHNCpNXAu6Jfbj73o3fdjZKOAZV9ywy7nJm+xmfODM6rRYA0MVJ+NRkKAGnxLnvsBWfljKyd
N/SkRwEfFqLuJmroJ+Vl3JO0dxt0nU1h/2tfgZmIc6vyvcn+DSbSZo9bsePpFmFGx0TbaeEhzRPT
jqYm67OYWE3QTuweyHDY0DXCcGLz2BPQcwfcnsHVF7UzC1+Zl36qL+D5OaFvwRLZyvklNmG+nh1G
BJraOMqTtiPpRqQkqfIbVHDIHkRAuT+8N6qA5b2W1BfofpwOPUkqfCkNl3dkNXa0WoPZghyEbnQC
/eXemC9o0w/TADJfagNS3J0CyTJMij0sc8Devp7qeRb2dle93G4AAQugbFnhvGPLKwUYC5hZhqg7
UDNMesuTQzbBS+gZhXyxQ5UhKBgd6ssJyXm5aymHNJhcBFd0OdiZgylvjbQZYV79h+qGVdRI+aBa
BFcYRj6XOepGsAdX/l3/QVUUVGpNGKqfn75bi/IsiDzxq4sehy6UI96KEDNL6SP7/lrCtVTt49Kg
NlcsgQRR9K//ABCuL/+p2FlK8oYkW4ibtODbucmWeQDbtbffNkSGwd/orcKrWhJqzsRuKWJXHuCz
z5vuPtnJYbxvLquzAEyJUoTAuyzPH6F/ST26aXqpo8hNpqtvf8YBYLuis48lML/tzbT9pg9vb5Wu
kLy+0BObIp9Pl7GCiU2lG+75G6AqlBrJOsHI9fcjNK48vFPYKiyGD23Bqyd7HLD9pyqfzbGaQNrS
pkv6g1nz4lFYxJJnbY0A46KLwTA1hTWroyl50fokurmTBHH+/DOwEWZcMfWQTRs6QQ+Z2MitkV94
M9yl8AEy39rdyEKvje48Luz5R92ObnRJhR3GWiqe4vnU7ppPjW31T5k7CEEXoOi08Tohh6kHEYG3
DZ7y4p4aNTHe8+vfIuGeOqVXuyADrbpScBHozmNNqF5vOpmcW7lZRSjE8ROY1CaHQMnH6MrZxWpO
jhVAthMrfOms+O6+uLo1m60c6pxBc6rNtdVWT/DdpI7e5nRr08cG/HDNJGgodbGE2r47Q9Ij7doj
UyTyOx2VW13HS4vx3k4CGTGp/kOnrR4tEBopdv5iItKc4qxZD62jolxjak6csCqvSCut7s/7aQiS
a+DLArQBu08OJNxwtKBa3ziQizup+0C3EtblPpmxFqnacpJmCw4/UBA9ylxEBkTpUJ3jXhFFckTe
QIn4D6ihg5uf+JmrJZSsfFCdOY0Digcu8FIc3iddex0jVO3TS+7qfTjPjVP8p0XgldDos/GtXLKv
ybxxBbKyxHJlqJT6Lsu6n/dc1RWX9W/nEzg/hYgMNZtVDkLlFgoSBlh1m2sePIYpR9Ke000LL8Co
98bq/BI79RBvuwWOcBrAper5pZtFDFuK7X1AFRG9tN0UMIu+Of7h0pqya88CEy16wwxwnPpZaCk7
sVEYozuQs6UuaeXrgfMG+JdC+q/XSilcwVa74ctKVKkrZ8Iuci0+WfFoRJhosJY332hrbMoj/E/O
Btrpn8sxBmKYWgMoWlzN3eZB6Trvw1gZaSIxg3LoIBS+dCkttC6ReSpqjYeCXPmBE77/lOlMDm62
mSIKBPd1vC4eSxJrLFv4N7eN8601HNLhI1JyS4kitYClMFWWcYXK5T6ge9hmV0gEzad3HuLz+h5H
S6EGd8fi0piTe5ZjWiOiSQHpkK6cOm0KzKQa/cjbRRl50rYutafySHP1OZME1Po7xV3d8cvYxpzl
AGZYQpYTNZCrVdhb0apano+yIx2QokLHMxbIQY5PT2x0zzQtNg7KczbH9+9z2jldTZSbb7S6+ekW
/Z6D7a4pN1tZ2FEIjhHryMV/EcWGhmzHrsCN9G8ezUpj8rRAXi9VWfEXz/Q99pMN3Kw68eAtkvgO
Gt74Lc9pxpaoPKgsINraEqxtEJAiccTGrEbxguRCjagBgPhT8MNLLSnBReHSjT0n0e4gL8vMAn82
RrHrkh72jLdhIIogRF2K2VRVplds/GKiSoG0Ts2e5DI0gL8qfKcvFy0rllW0tNUQekVYJsU1IPkr
D4OeQGQubYHl8Tygf0Rq/AjyV1r3IoW6pZRQ5083iv9Ybp+R3LsOAb9NF/c5WCxKMEj3fybwzPPR
iEwk/PoV/OSPHjR+NLQmIfe7AKnLXnBR7Ly3cFY2CV0rrViIFNrZDNLFjgxH1896HrttrET9irzl
U55F/sG/s+QHuSgS2k95h1Xfn4/tf6pFKS+KXWQtVO36Q5mhYIKZWtWwFv2jP4e8GH684wICB/IT
U53HW/flOClun4UqQxKlq4Wavhx8AAiQQ+0gdHOZFuACjCRPHssp21132aMRdpcl+PrXrv/9/rIF
MAK0GXT4wlxgie1eXoQn/Ny9beVfqGJhUbvil96aZkhxsDaEHaVVLNPKj04C90TrFJGwq2ZHhNXf
91a+UPaoO0iK2m2McnvcFZ7pUti4AY4NhPPWoXc264MOLRXjYDKQOyZatt6Ii3LhPah6LDJ6m0FI
JHiy4L6t359BIPHN8O/tsfok8ymI2Vr+G4btNMEHeBtuW5ImExUxS3KC1TS9edWtXHLad9JcEWeQ
PH8HpvIuLMS+bwhyKCh01/D8mRTnxf4J2A5ZE+3U2ctQ0cjXvvXz92zBusE2VnlfQYWfN26VWUP6
wDOelJaoP9d2pPykktBRzhKPPNZ020bYbifukdsX+ZWzUNjuN4k0a5/h37H5Qz3hqb1thpUMkcCt
5OXKUyJqpRqncOT00yG47oUpGyhnxmY66wUCHwqT+q1VBE9II/lNqpkdPQGtF9RjIo5dCeTKchCO
HskgBkYuv8HKgHCtwbNqgOC8dbputDTMbUmYCNvbW0tGXRI9rdyNbuVkVVk1QOwUYFh7cEmKv9TX
AJMGx8b+7Yv+xw15DdJ8QrM4r3ZD7RRFOv6zdKfP1I+qK4+X9ios9Dr9A1Q481uW6/YoVAYSkvxo
MfPIwd4IfpDeqGJyMOdb+fi/9IEoZ80qwc5jr4KhbCl18OOltO+XvAfg7pvIJOrXB+j6go9Quyxs
pCQht+1ZrS7Ypk4/R/mpGghzMACG8erU3gKNGsITp6LfoecXeGnCQn62h5ui5TO8XDZtgnWmxROV
pI9XYZfKm2MqJcXSQ/1Zxg0BYJwXwno7Xe4IvpoTgaqaIrGq7qoDZ1Bg0Lwytqqdp7E2TTpwlfGu
+uxZvM1tCIwyA8bdnBPy+QSTJlYrzH+Isa5MhWdUXGuCfKbZJAntEYSMzS0z2i12nBCbS8KfkjnS
1Q7dRx1GE4K+6xBAy3+rMTlnQHoSPpPQ0u4eVq3GPmKSqMzcEeRJjl+Lxpb5kp58VBL1SokKdIkP
gBsqHcevCdBWCguQSp6V3+US9aOopOLVGk32ua9mJG7zLaapKZf0BGP3O0hqG0UMYM0AF6YyXMn9
ZU6b1rjyVBDEO8V8MtdVvPxp6O3sGq65VGnr7ylaOZzYnXMLzuyr0PkQkNPPtrx0nJarFd7L72da
qXitELpRUHXD3yKE2Fegb+XohlUksT3ANhTq+kIixgN7a3Z4Dktrmq5s24f97T881aDCEAyZAy47
PljSRJZqer0NRRyDyLXB5EW1Myujw8V5IPs73PYg422Th5Mc3uujj19ZcEX81VpEOHJ/bXJ5Ri1s
ddlonVDMC/gzmS3hnPUyCXBOXKHBZc/GpJorgiAnJ3g3yGDNwprkDYVl7GdV+q3P/FyvJG/g945O
DwF77UNKd1ycDvHgoe99jO5w3G7FRpS+G0fljxNA+oEprRbU4yMdskBXITCcU8+/h0QcgTqRBcvj
Or6E75zEgAueIidHNZX5zA/e4EM/Vsk0iH8X2BD/1okD7M9Q2QfABx95DKvh/LSfkal7743c0utb
w3D8RRGka8GkN/SYmYfCalLKPK+2fnNATLgAKwEaZxdh2Iz4HNIr/6M6nJvYjLhmR+LS7/xiiRr8
mBetNKzGlIajYKKOBwNVtf7NJ10A/aY0tt9FxXdy+lc/OVUCVgHxoCKnrT+t/emgOOV0KTFV/NnA
3ZOwNWCgg5bTYYVjQl/rgDVsviinwdOd0KxT1bQ+9K1Xe8FhEvZxSvEo2QX/rDOK6jvqMHr0PQ3B
6vwh8QbWQN4ODIAYHjqQm2p/bjBzvwtNidH6Si1tYYAiY1S2cgRiyfHXfG0R4D3EELEYw5H0sXI6
km/KT7KzR+7BqRX3rfKnU5PejS34tzBTS5y6VdIXJwiJOwz2+uuiaUaCTRhzeXCpTnUCq9W6CJT4
OTYs3UY8MP6r9yvcJe2Mdt8Spj/woLiAnVIE9SrsfWt4TaP8nrwetcodUNVV1M2caO2QJeo3owc4
JmKkB3pHLXnXtbRzHrnPghAKXV2LVy1EU44ovBF8xxVp5Qm2Y1zrqgrVEqFCRgPtLgOvRW+eXi5b
/cldQVWs+JjWRkpS5cHPjKhZ4TPZ/j9ysoNfd2B5bv5Bai/Cock84weN3MTFD7MTHeOdrkMuPSJi
8tRlDhZMSBELjbRQLd4U0eub1kdxX9jl4fXxkFZYUWEC9EdUZcB3gLIsbKOauZlChLQrlSUTe/C9
Kydsvbmj3Q8e/8JNDDhm/BM8DWHxoD/e3mYHc8SPbLDDcmazlcDUWN7LNbiVn3IVsCDwus7iW+dJ
w0iYU1nk7wL022+Wy9T3Ic8h+QDq1D6xVvpd79rkmOFB11BhpNmjEVBzOWDRJfunwJ9tin7qZJmN
x1MuHz3uVSE51fHpZZurklk2wTVAYJvH6n4Kbwo1zpaBchkno5khtK/7fNoArhI1dH8fljK/ghgI
Md5PoEqHU7mCmU+FNzc1aJipA416GE96/6jC/bsKgM2S7s7CKGsTfzIhttv5rppEQBUZTYkmsVVo
XhLaFrJcBdkyV6Y0hFjJuxzfkZwzFWaIJtdewVl9e19GZAQkj3cfvj29nRZ47akK344nRqOzLcoi
f0DZxlSab70CTRkgIo+SzyoJ1jHxtMB8j+wrljApStKf3dzRAn3//aTb2poWo4i5i3q0gEAOXuBX
9R7bnwkYnztCI1TuNw2nZqqPT/NlhiyJWnYysXAAHmiHst1riPErwWBIS84v71hjuwvahokFVpPy
ug+qbjSLe64Czto8QYgmbDHIF1FQvF4YEWzBzb00rnSdbJS23t3qXt+ciR2KkJh6G8IcdOkEOO4T
FNTPprdJ4Ur+kjwgllYBYgBRZVAswv8FIAj7QsdVBkDvcNmA0CKY37BbEVorHoCb45XaG2gKvPuw
MZq5xfPAs2uss0TqonfJtnkuU2ibvUecYxXpwbrGQ/y0OVD1QU9M+r3LqwRFGy8oXosLD3UaRJVb
w74qkv2/FaGnBksjw5rAsDK4py3F42YbJojOcPvzyoYl6Qjh4fCm7xxgjji+MTBHMM8p0t3boZT/
mPb+z0XnenRS+ufMUn0WlOsuDjd/2KNgqOE+LXeoxrjy4vyTWiBoDKHLTW7EJ1yZTzxqIB4bjKNB
GvP8SZXLHewqrQ8qnQ38ZeyWH3j/Lvh8b568m5QTfQoTc2ZBDUdQV68zywo6477bD0v1ILwMJCHC
w5GV3dxxpiVo7DdZ84KAG4DNHXlL0If4V3RWFT3sRVRwP+xlTHihpXYBcJoqQ9b1HfkBNDqLHATQ
dRIhSbWlkdCaLB/VytOXLIcsYKp5v6PBKO47mQpe0VFgoAnJ4GBvxDa0YTmfo9q9wgzeIHQbkhAW
xFr2N1UOJqht0kZCex778iq3ERyF9yjK8ZTKD8rhPmo6+rpoOuFwZWc/Zeb6T9H2/g/95IrrIvBm
nWvjSA9z5DCm4ukwTJeWQlcdfSuC0Iu2aFh2SqbuDyJAR3hrddEjOYmSJikYTXeUFZXvMQdNa5y1
NOQ37kwzb4srB3yxyg88qReUw7bA/nMtjFkGceijI3X0TR4K5ooNtKhYz8g/kd61KIwx8I6gXW1X
78dV/wNTnQPyOe1QhMkq2nxEETKJysi2cpJgOPYRfFedPajJ3HQSlGwxv/B6fBMSaHk5OZVDmEAI
sScPX1tB4plPBgmAt0jejoDIufDecmC2TGEyYNZTUMn2vO4NxErhc9sPBtYl1n78C6DSk26RNqaB
2r9X+6OwFc8RqeOskrwZn0aUqq9frVdZqnSKlpouYt1cn2lyPlbXJR3xVCbDzwzDxiASAzJyrqfR
badoVCOT2K50Z55BK1To8eI0P5RDDPXFuWg4J+3XUy41PEG67bAXdDcWYWHjWCKF6IX0MERdkO83
k8Yeq+hqNlAhsGhyizrbAc630T6a7nBmYe9xNeX4w0ZBbsgsI3gEgPRzdOzofl4yyTlxsZ2UawG8
M/GMSxKNkPah9hg4guvIjzCYNxnGFOaJb+kR5zmCVCCIUCyLJSW4CBJwpIDgue0k7roj4LIRMX2A
tTlkAzD8v1N+OXXItRRI+fwn3A6kJmQub2TgAjlXumDyaQyOQ1/QlH6PsKm3SH8w9032RJHfeL3k
TmI26zW9b0ZjLN1vFA7625JB1sAzXQb5rOkwNjBcQkf7Xy91GVrCe+2UMzCxGMDQXtKmwZE0uZXQ
DDu8q2lsDJhw+ULOZZcAWQNGCx+laIHe/AwQhq/nkzrjq9w+au9oUjcL2O9+e3Tml0+xnXc2oUvB
QYS4nC4NkCk7oKi9FtFVFPHAwlfsh0suldq25i67oBdvMDLdmrpHnwMSqsARjD+yxdaHOENSG9/f
fgCNr3dQPXTcnq/S92GFTC/UMkSznnIZ7ZgEIV9zHEMLcodkNXJXVppUncmKDbQYRh1Gfr4teyjb
cHC7Im8uFPb+cK++Ujs6CejQ7O4UVJttuiz73gmcEPgxdEc1GWz6KdABx0P14d6X/k8HiRYRktB0
+6PTebSnAPFw/CcVZ2D/TYEadEQdREAp1NJdYFcUL093IJpx3luM8nofZquIEXepT5nZlmVr3YLW
GirYVoHNsN/vHarBr8HyARRy8UEWv92Zs38pQK3kFMPaS3JAgVuhzZJVLSEYVHRZC57xVprE/eaZ
nXrNEaCIiizz2+/6Cmu2hrWoaWhZD8i6km2bEbkhhoa9sxN/nORLAwPyUOZdo/Uj0AVWMRdOxu3S
/FNkUhbpBP5LlrsxCF197gUD0WMTDAytX3+sZubB0yyB0YjK7z5uq1ndXG6UGv62/tuCU3sfozE9
xNMcX9eQ2L5CDpcDHqVBdyHVPGSTl/AiNMLqkz8GB2NoN06zn04slI15JPXfI3xR/lmrigGkOBR3
160lvldEQa6qZSqhxJCRnUM7Paspx/pCyW/fd6+XEiVQv0nXn2zqdAfbobngTWMebMC8vo9ebd3M
MTwR0RE2NFLIxCcG65EWfYeijzvgOc4ZzXfV/GrUa4vFnUCdsmIjnnvh2zzBRhI7OJoLimj7PKu5
c+vP9F4A+HgE+xvKDpfzmHJM7WQwjVtiyu3S0M5uKQxLbP0emhXjIAvxVjt0yDz0EC+IvXNt9RTW
cFfSC/OVgPni27DhYVfK4ldZr3AWSY+RnZ4siX79eGg89JnW5voroLcjhQBX/Qd6OELtuhYcxKK9
lw35yxmIyd0Q/nIp8KwLSfKoWyldrxog1iuQ6wFS3Kzs3EGOTfCW2pr/GwvRC51enYujABPIvVlC
D8OFhfWxMhRbOWfankuUuj3C48aFmT3dmmD/61PXqcoSzPgKCdbzlyc3FNRsLh5rgtZSuLV8PgBT
UlnxOO3f9Wkw50UVbrqgA4gNw+jxoen5FkSwi1Bme5oS94rugPjZRKyS4yYXc84h/YWAPPcXLCkZ
cVXBTkshEbR6HdMaqf4EKnpnvMk2sKgf1X6Wfe1wcYvDqz31dMEvIchHCjtCindi8L3mc1J4GzJD
QjJVqlmAPqb/g74Bs9e6Z24ra4q1jhvCUXcuGOglHm3l9QtpfHWZMMNHlCCQi5tAf1BAjAN3JZTY
/0Qze09OELFLhsflhrqzCLkiSfTdOWNwYQtutuHcfdlssbU3bjz8W09JbKtrNNwtSClnhZF8U2T/
FkNjIHXbLxQhoKb0lNJ4tpEwWcqT6HdyILBdsr/ufHD0NHgL0EpZxdofTMKnLi8LOg4zcMtOaKIb
iDijm/2u17Ac0m4+RIynjQ5D+6WrD1Xz0//XKun2qk56kE6YBLZqqje4L941JxlNBWUHzCYc1t6x
hbETnhIpBv58rtyOXa5T8dlA07czJHRhnEWfjPEvjRjULaEON036afIAC41Kb5FKbze1G8VsdxUP
XLWrNwYj0woSVP2ZH8vPLUPGl9hu6MDus5qfz3hgaV09Rl5qeuKA+gDNo//ydVo8gZ54eFHvsI3C
TjBu8BFxRBVAxiXNVcPXdUpSiPqoGGXZwZpK1mwJvYCapaYoT1rSI7+Btb/q/1zgJ4XlMj6MM6jb
t62W4h3u5Fzqvdi0y3xnCV/1kpWf0InmztgAyYzKwlDcv/CS7eeK8QRdV8ZCXnAcSeIqF2BmhzuI
XLwZd37w0AtOGn8QaYEXNgcGqzjHA3r8JxGIFT0/x3hows5RbJVwzF2a83Y+WyX2cVpCTaFg9JCM
baaN3KPAnFmXP+lY1Fva9kGep4E4qT/Nw4Jav0eqQWTEboCDnzt8sRofBRpU8WElm/eK2g+t2Opm
Dtl6zAeOnYIIDmmY/jgjRAKrOGAVplp9/ZjnVlHHZWJbPRIFGYCL9VYS51W4UTn5hA7Ky463JC/i
BpqF1+R+xvuBuYsCFL18miVeT4OK0TrrxZ5pWYDMfjVghMGk1fVphfmKXktZ8oLKCom+FSyoW/Hd
WMaz7GJYT7rwwQJNnoNWneKngXzo7962PAhbHXGsoCjE3gLKOKNBmfKI8U6srxGsVhmZaM70rCln
dz3eGDXZUh7/slGalg7rDJ2DPZXKgg9hHpnIajJ+vuGnG+kwlUzi68qMLsKTwOoxj2rQ794Hsssy
dYef7tVvFvMSjiiMQbttjYFLrB/INmRXB42WjnXagS4iB31qD5iTUEM2+wmC+E6NkpD4sTz98LIy
c04BFjbQwaCcuC85fWiFbmwWSGCAgZsnrEy25h1SLlXxzUfXHvuPh2AzdE20qLHo+LdrSmZjBKpZ
oBAcx/D839Vo4ev595HwefCh2zC36AqJuaqfAS+0nU9Tb9n38tqJ/DelL7+2/NLIPm7ezhf8xtNM
8iZ+/rb/PsN4hRSVayYy5otMEoiIpagqxMad3yh7lu1luaeH5EPQtV8BCLHH7PapwAQ4a2LIpY+T
cBikBFKhEEwAhj0lJHre0bFbAeewI5XY0Pl0poxz9vaB6WmZ0xFr1Mho30DTWwIGN7Cje+Oagh2O
WjMSjZJnouOuAJZ/wOQ/e0wSR7k8bFu0LqowFeDP0Ez8QPd2jK9nmRRG1VgTvhCXGFj93SAg31KB
NICvHVHAPc4C116rExSNeFIerlW4YqmZLcTryInkJ/ohXXGdM6pizhvzC+Z4AG/GG+VHWm7Lw6Hm
RewvR6Ptf79E7r6ZuoZptXDjy4A8dfFF/IMIefSfRQACwSeUYxBifFdlPmpSYu253wdEcQeG90zf
KcORSh/DrpMFc0sYT/r23mcU/oILqsGsn8yMw1AZVd7PRZ0BWjQMhTW2xVMKhCp3ffufyvIWmENk
4klqflBj8e3bjCTz6DSkKYbvjD1Fx83dhfHSOy15yQoF9O9rk5qX/4khj9bzZXWB6MjEUMlGh0Vb
8xCwORlsUpCHX3NMSKR47y2clVcVSU2oPWLDqpx3sW2ntmF0DwwypeDGzE3WAe+qn2FiLm8kyccf
QaV+IAUxPAL8GRkoKePDi8r9ImRj/Q3P22dEvRQ0VttPhlfVUF1QAaR9VLclTBKK75/wqE/3qUbi
2sYlj6n8nksHU8HTzG1qbSj1z61vdulC+FT0RHWhZlzChM1aRtOghTAu4E5fTJiyT2w8IaQJLC7h
VmKmZHhqsjQkJ4/ehYsp6Rq+0HUey/6t1kAINckso8bLwNrm8diypBS0ZnLW6/Gds2gluaXeSB1S
5sIiAm8WDZHfA2SuVScbIwMXqJQNcbz3SH8S5PcRmc0iBfguzwW74Evo7TFYyevpfryo86vTCTEJ
MHJgKdpmU5MX1x2p2peji/0kZ2IlGZdzKCHSg7OEVlyvPMLYTVn1a299iRuu7YCCbL8KTm+3tFTd
qqf9iEoCfsKR5hRKwbanfFvR16l8oHM7wfJJWpU7hMXhsfuqnUzpDdZQY+U0bxmX0qBji07EkCXg
8zMBLqD2nThoGs6XgqF6zllhkR9V3PlNNMi7JQ0U1b4u2tFK9+1XaXXtiQJklHSQVaEO1MPNImjV
uFWAU4oeXsZIDPGGDzVW4zkdGxwyKX+irws3h1mK4WL2iEG4lfIRZ1XL4IuJJY+J73f/07td84q4
03TWeEt1hnZHMlLbGd1UkKO5SmKcstZgIOVqFTFi6FTbJFF8q7ZQdAu6TJCf/kgo4S4b8rKPuwO8
wyrnyeJB85Z6I0mAbgt1ceHvvZnxj/VJxe2/piRDNynSHukMeS4E9R2O+U6mRnVuSk6NIKkJBaxM
KUc6NL7Yuk5OGvRqnNOB+0A+zgxghIe+JIU1AoUc+6hqcZE0R2LaRXhXZ1I5BObRxftfCBY89GC/
qgSxMcEHSKMUOhY4lyCpeiiBhtkuVwZ+y+zyLB9w0wNn5fZYuLfwKKM3TwjXa++JeA9eE1S6WeWO
bpnFrs7tgtaJRyMtTYyjpBkwDac2IfGzJrQMuf2mjb3ZGTxfbpr9dbSeVQFEGud4tC8vqHgm+gCu
6Mm1bAh+dJZ6mTkdpel9D0LPaiG+XF4657VkCXZUMKibxFcDRb0erQe1PRVlgR9ZZVbo3vJ2L5NY
SgVeOM37xmz2hlVjZ1lcTkU+2eaJ+sEWk34hHhLO/KEhuUso7M+fwwfjxFf77xYKkYCR1am51CDL
bsTDifUMnVqN2FnZwruW/dkqgVJrc/zUjo4rHcrgh1JMRuW4iRkF1MFV6oR6Dnb300K0MEd7gUoU
1PYEMuncsIxfNna2jeZYX1SVeOINutiW/zdTDdt94CT/JgdbE/RyDVHaBbMfZWrpmfpSeU6tidp/
D+MlVKkKymf4/0xretWz2ShFl9ut234Ioq2sB2Gg+Onr5CEzmUFiM+z3fBX4chb2wsvFTH2HFeR1
T2vZVu/XalGeltN5+QDDZhWjKJTIA5W8Zt7seRaoA5TonIeAlbSdXaqIQ+E/nOqGq3asBZYiFKVx
pEzpgBcAGhBU6nxwTQ2Mtwi5DC+hB8XKwIwITBRhS/rKbtjZyzL/ZZQJocw6wFFrgMwxUopeSvso
PU5j3+d1Ylkg6ZhcgWhI2HmSuC9oCT8jhrWHxs8dC6pFtHW1JclUp3mWM4a9gkew/tOP+rEmuGEn
KClaNrRn6QaF3gEKeiM9YU6Yy4Sec6uCXcb9vh6kqG4j3RELC2W8FQf+DAcsQyrB0EgpQfuphn0F
kdsxpCtwNr3b9KmvU3A/D00X5/ib8UeIp9+4LPPwF0UW/tqOlHEE/qnEX8/sTD1B8mRElGyYqNPN
8AO658cljMydo2GkuwlnBJj2UyW6vCLATB6x7YipIhnaTjD+Dwrq81EZ1FSnlMoJOb9dpavoeIhy
PBW4M2mLXdhp/1FSA+XDvnah+S79mb9Jr3JHaTBzTXDx6cJ2EcnD5o381OPE5caIAgvt3NboX2G3
Ncwi6IvTpxjc5q+Dy1sjsNhcIGEQvYt5oOi/3VIM0tFZQIvNfjjXSuihGiCul4WRebJKKQ2jZThb
2g8q0fb5jLpIeNfxAyPdNxr+/S11GpO35AWD0W0Xa7zhc3DgK8ycSmf6H20k4TUsKwnt50+tuuX7
2fGczSWTctiVTFVPdCg4ZX5EPKNyKXqlW8F5357+K2F/iy0LVpSDknnXv3G2QfSfej3aDC8bHAN7
wz9nlR3TuAPSF19r++UbHfFuU8KQ7+5o5fhKuRsVpJiQyYajyqMEYz5gqsVjURATD2oivrCVlYKe
SiBYRpPCRzVcl/fnfAuybuBzqRvgnmK4VazgCfJ4p5HTAf/6wR/32yWIcWeVv9O5tPplW/j6CnTT
6nTjxpCBkpPfvxstXfs3liudWoEU7UDuYqkkqvPTND34prkmqWq9ulI+uez6PB+S1B1VdBSuDyP+
umq40WQ66J8n1IMMmPEQJQ9w8heCJxluM7NVD7W9MRfCG6VcIuFJMFgvDqC8uIzmXLzcP6GsIEK9
/L6NvhpMZ7CgvWuNB1I57cfVk/avZWNnERogkBEkaSii+uJME0h1d08FOBX7pQxb1EWx55OAF24f
Vwra4vJLSulSteBiQBUd4lPODXV80UyyzAeOHM40i2YGId1FQ3/+25Gz1XUlgcuae0t7xDBQK436
RqnaPnZEzLsV32cqtRFm8O2m+wjtmn9cij5hloSOsYIyfeA1Mg85WMON256doU8DT041JKzzEKSA
JykKjH12/pUk2N75VYEMy8JJF8SozhnL9LNRmh/kYuPqh1QdQ20ceepgwjAf1xcivk2zbHYuwcy2
j4pVS/h6IO5Z6qhsPJp1CTz5uY9iMkl/MrxSDBw/wdHxWU0X2PZaxWFHJkNctR+q08pJS/gPEE51
YogdC1xJy04P5mZHJ5Oe0KaxD2rYNg/Y4e+B4q0bTrLE4ULFGHcWAZOPpMoROBJUe7GK2RGD0WfJ
pw5w2gwYPnP4ORetD7MYBhwxRu9sPOtHtctJuKsssWJOIUah4NWRk1/jHKe9zfTsZVd2lYshQOJJ
J9mBoGFsGq0W2xeM+uZ7p4SY88X6IpJgOaD94I2hsayzivuhYUffqxT+JZoUH9hs+eO8HfXlfHgT
ewdGX+qon1DFp0TO9Cdg3ieHYd8Eg4bvhmV1iZppx2i8jeh6OfEuvBkgqnpEjOVOxokGk9nJhbou
wfH/AmyWTbgU9AzbOVqLdZxqc51VlSaW5SK+3LKpQilRKGoHVz0h5JjWSGDnXpML5GuIR9KI619o
veOVuM5G/aNkwkBVOvrnqOVxGq9yuJ9S9KF2S4Gos76oef6zJOn2wYj+Dhdki04S2PSlehcaBBHu
4T9GAAvUY+IIkxjMw+dvhhQMbtQskyeI2/DJZxk56WIuQuoXPQvV7/ylujEsQuXw1cKbK/SPf0ZP
pxgVlCISW3VUPiuNFwfolJEfVcKtAjVo4MBpJM5O+u271t5S+zaSc/YfZIkBB6i4SjjTwkYZRrkm
zMSNmG5PCrPxNqC3Wb6bddNbJ8pZjpqQ81pChcwsK5zRq3SucevsiHxWlVAnHqmEefOWqKmk68uM
8gJNeCZXDx/G7HsvPi9t2+wMEcdzmJ/ihdH3w1gJVB4Ficw9JO+dE1ngXS/k1pufpq+KrKWir6Td
r74a/7NuvTVK0kdhsJN7plyoyxZpSvYlBcAddVqI9VT+HLwsc43VAxMUFIuwz73ViIQbX50pyvBN
VDQrP+0DNG8D6VT0Zh394rZ6+YAFtIxKXz9d0VVu/s1G294FswrWj/1OSOyro5jysyiL8dA1qgnn
gJK66iLnwELFqXaFVdmz409mgu2ibU2lfNCtkzb3XGrG94EiHhrJj9TFNzSyVs0qoWCvyjhE53SP
et6pbYiPhpWIa/0Yfm4b7FMFHW8HhPmpAi5ccYZkQUw9Fc8trzKnLEdPxxunu2rIJJDVqVlNY0bD
QzDPhmnuLmK/KG1cl9d2ZAmnhZjI9rlRI+Xmew0+LJ2QnzNxUhb1z7wWwiNWDR63sC4/bHp1shz0
1GlSlubgQZu92gWlGu19xjv9+mNbNJ4uvspkDXhIlvDM1vDQAecAD9Fvolt+mAOfxu2eU9KClv+2
pO/GgmpElPZuJOe1y8dpIMu9J1SEWWhubmOi4MfH/cuZNmCZDRnlBbg/hKorLsM6bbqTQBcCa9qV
yuTwu9ajTID4Si9me/rb1fXZ5AgbK5rsTV53NcDTvMuueIH8bvabobNE3i7t99yFv3gm+tvCu7yQ
u7XYUqQ7BG9NlFqSN079sJ7idIMvjgsutCSXhmwdSC/KZxhmxZ1mPBUEGZyzC0klxqOjnPoK9EtF
Te4Xjgtt4YNKlTOFv/ubCLxrHJSVAQia7IK9zWE60cctEdNs2kO0PvW78Z8I1v25c9aLD+WeUDgI
7jeyDEVKdRZ/XFZiJwZKHEpKXXK/qah2v4sq1vN5qfqgSe929sdeZWHRVz4jNtD1iFUIgHeK7w2M
Lyxd521bqpKOt6KDosuTg4sxIkJiev9lzpMIRgI+sflzIEXN/YrDqi/goKx8vJig4foFvg1Q1vC7
bchJr8Za+irryu3J5MIHckAsrDBAj7bHdQVeXN15FrR/cO2AKoqWPaUCP9jZBCyKeA0vb1IKok+h
Wqk5CsByDwfAUkGnjQ2au/3JVkJ8PWssf0iCVcKhTv7+gayiyT+rqGitJSa9mruv73KAsYQICGul
Gl46ZFoE8xHvzJqitH6Lye2O7f2dfU7RYstf1apbhuGW7juqmkfNeQfnz7z9tQzyWg5yaHACN6nO
DUvlPQx8rHBadFBXHNJTz2KbRW2mgCzzU0VtCYKjDJadioUMPNGoUFg9dNhXZUca3c7S+Yt9tGnv
nx+qaFzrJLoCCdrwnSd8DoF0KuuU+SgzFis2vH9iuRNAfIZpmp8GYq/YTA68pDzzUe1SsUUf2S4U
2rj0r0wFxX+fTK6qAnla+reok0Jsl3XXdharPAM001h63S+5kgRXoc+zXFnoJ71D/FpEorMWNvlX
4KTEHJJrfC54YIx3p0YT7X/ImoJNr7zcADGWpLXQSAK121lWt/OYUmxzMMrZHVeV0hec8xBOLmSh
fcmCGznbGSl3HCQxt4OukTIJ090wDMZrnC/uNi0dav0XlyQh9Nkx3Vbx4a9oSzkf0zqX1rljc8q+
sX7RUCHRRdloYUJgR422LEvyt/pfyZ/Bz1+i4sucrJZazAF/EgGIFtq9ButfTrXNTCA/fT92VU+0
4z9UryE5RH+MkOzNlGL3TFe91T7/9pg580yPzfZ4kOLWCLv4XGU9WwduIkYS3GVbBIxcUhmbX3Cb
bcg9aaPkGWVAcU9PdPKKsDvQg5hR3zqSUMpK0QCTx33CMIVZFEXuVwiur/UlAP0+0Fmrhowi1pAI
8lOwcHItjUy0b6SoWZbh0i0p5vyPQPgFa6cyPuRCzlBCUV7C9dyE1G0/TBs+AnjIlNU5e9L2IXtk
Xu9WHOZlmS5XRZ12PnXM3fo6/D/zhEZ72ILF/xN8wqFC0CPRdB2VjTkm54bl0uSBZoP2Cso4XTNh
PyGe30fzh8Oy8fyhlqzcmi5afiKAuvqRn37otYDPwA84e+W7uPUC3j/9AlwwEWEEb5Ao6HyKBv1I
JQZZEnehPcKdcVAexhqvhIzlvjOen0E8V3Oe7X2iF4ciS7muQwtYyqEN44xcML2Ev7d2aAoKSXX8
lhLe3AZEEYIccSW4D6Iedgt4vY7zrsWS3eL5teRlg0jll4keWfA5RL+vpsnidEEQ8nni/1xE+cWp
lzwyLX+8e9OZjIl4hRAuQ6Df5EPvtgM4ZAU70fNvm5s6aBqP2iGLHpO+5pM02EOrviK3qLcCDTE8
flLQnQyn0bo+YeiifaOLGSIUTTFeKQtzGnLzoUd7mMFtGjyXxMm8MFo4yrVKY2WYX2ZqCI5xwYT5
a3TGQIr/xIiDLa/uCN6ojItWPrj6cpxEomQfFSt4IY78iWjxgrvXslBHZ5y3+ihaNwjy68nmVGyi
TM+/98ih5cJcHigoBDYHltTNMi6mjhuuSpP5oUeUc6Amh5vh8EBcQ32dB9zvX3iOhUZgyfGbEsqm
9Cy3aDUOn4lDU7jzp7J8ItvtnuSEQ3rh6brLzjPqDDgtK0uR9qOwJ5tUmAImlQJxEuk0FXr6+qSr
ecBt6vppIxG8XwMbNUJ0YHaINiCBkSk25Tia6phWP7NxaDB69FE+DfotGk3K5iQKyJt8h1bn2qWu
TVhBlO7x9Tq6Ug5vk/5y3SeImBJVwI8u180xifxEeoxQBCRA1UoIn6DPqKqFzqdo3El1zHlx7BM+
WsKkMOJQj/FRlAjobazrJILRaPpXkcV2n7UAZEgY5SOLdq+SBP1TcwpmsMVYpgbxmiObL5txG6Sp
CyI5PuEEpdiI3W1HPyn84c0eDMA3x3WEFbAaVxXem68nN0gbDlGuu8lXNyLdTTxJXoYV6ta7sxiF
CMEVjBr1ejEYLN25qzezDiRoD4pOkqqJGgJwXIkHhQNzlzsN9WUXHLRQSzNd0XVbkIhFuhMsp5z+
JHejxhGc7yGJgp3JMBFHzqAN6nWxIY3JNI7I75p/loIku/Fv0pjNiMAhvNArI1E98pJmBj/QamDG
C9rYIDxdMcAUW0GgPUtCXvQwlxB9WBgqlVWqIAex4W/NEEHqTuECDfc888O2YW1UdrCRYY2orddO
D33G1YagRf7GPbE/SGhg0x5J4NHuEn4ieusPZom2vKxzAlpuTAVlg7mNas/G71jr0p2YCZgWMr8s
b9tb5knf0i0bOLEUHSEzO474pswVmBgibzioQPJzIZWDsTDVclcKp+EZJcCeJwr7A0lHi6voy2im
0Ytr3UsAlFXgRwgsYaO36b/JZ0xgcj5mCTZDugo6136BgRgKx/V6BoEBCOCNlLBm0u8kzzfK6XLE
mR21+v9pRu5QX+BqO6RpXGWaO26CYQsWWKoGaiYP9los2yfp0WxdhdFt3PSI8NEjOCPZJ+ClkEMj
8ICq7h9RgWdp700Q3d0ShPnnFK7N91TrjYfjFCoLgtVpJYEnS56F6zbkBnxrGAHqM9f7UH9JF8aB
InQZQWo3Bus7paPLCBLes+BI0ynfPOf6aLXGqIonGbMpKUoz7ZW2wXSZ95OWFDOIneERPd+dusQT
CZi3khTvNaGLLW/rpG42oV8m3DgUwqwsHCOFEV/U/SCH6ZT82j1OUc4LgXuXMJL+D8Qfjhlx7+Hy
TSNWM9Sr/iB1IR3PYAs6PvpfJlZP5EtZ1fxT1dqGi29SDgqAk1zwcIGJpfJ151Gs4D+W1zRI7u+U
xAasFV7j1mLBHquJGRKizq5GZhTQtC4DhyHWJlZSMpt+L+ni8y6q8wZuYoo5gFJuoT+7980coRup
7vl/Lrvg9eCSaMlZm0E34LCV6q8ruX6QkUPwQ8GOli8M2QEu8yWwyDbX4vgQBM541FKo2DdFZSFS
gKwsmFCkXkzWyZ5CUizQRVfqk3fkt5+0/C7esPpS03HX7hjT0QgqzyZeurvRlSAbCmS8q15VZu5n
T7N0zSNAloMCTwJlMawdPdkqUKaCH0O7Q+fEu0dmXN6DXZ64A5yNhxlg4dFEMa0oRdnqnf86yi5U
YqbrKlP1mmy4bxwsM1CEJhuDTNa2YA66KnjdM9jlVZ+PGKK0KDO1FGSlokq+vFV+MqzZp+945YoJ
v7k1B3rWqPjjZYyXjNQjR1Ovn5L7Dke9guZguSYsq+VGoKfLhRR/33V76sHcAw/Ttx4G7xvXqGze
YIk2+44TQYhP1HR8znPKOUu9vJrPD8No66zJd1mlgefDU3WEC6o5fuGqtSXNdDW6MxpfXRj+KfgD
wEyBBEgZ8C3e3PdqXNZApxqhIY1wdrNBO8Jk2aeNPflGaE5PjCvbj9l5Xef8YNqehQ+bdXMhzD+9
hrERTDJZJzxGPcH89lsRWIf+OO96r8d0iHN66WB5geW81hstvM+Mz1CeJcgikH5lKXWwrcW/E1cj
QXCM9k4wz0TvgSAONbXwCPRHPZHrhxzA1J91YXt1bGLFx68g5N8H7UC+FDDAh8+6eulTNN1zhqEd
BK/A9xIFI6QINRzAm67xaOa3/FLQxpJPQ2hfNlcWZiGTSm3vYBOl8Niitif0O6V9ZQArPGC+wQKG
+/8Mo8fRa5Hh7/yEaMBuowhYMAXK6CLHPPDeq64Yw+chhtHxTdvMFrcZwUfELSY5pkVIpItpdnEs
xjodT/PP75rVy6WnVX2AqqrpCyt/MnyaKBZLByBLtK43yG5D9BvQASQDR+pYDcuT/v/QEsL7C7ix
pNqIGxSPQnKW3Ud5Wy4EVWAI82p8wW9bJx4AtQq7Hjfvv9VTj30ceQT4X6mkBDoUH7A8jkK2eNJn
Owa7GC5zT6zJXoRTSLVmZgpmTm8dudjsJvIf3pdkDKEo1ITu49JgrYHEqKnCTUFpuIu+I+Bl0El8
kzGeR7dck916s5488tbgB1VxDSzywRWQg/ZbnK0k3OFOhWj30EoNg/QuxqXE35PwHw9vtBrlrqxo
CDZlwTKK58/2hrGa/SBlkAYzLEbAkUlMFd1PNVa3DZPTLDnUH7Zw1s488QeBa+IYFh86klBLaQkN
wIDr6ffmRYFTUi+x97r5dsvloWBJ848oO7rVA2la6S95arKZpI1676BL+iBlE7PRTdfT8FS8/knN
a7k47UciN2SCb2ELSUTgNADiMxJggMr8gUKqQRMiF96VRCvbwkDHV0S1YsI9LAQ36LijCQnckVSP
ajZpUwpynMgAWoh18zMRf13GRq8si810rmDr759MvKS1uUo4w+mqPwEOLo1jK33E1TmYBjrZSYTT
oXyeIAOy+pRWOBwwyTRslHVZWNUZ31k8vVMM7iiF4o3x8oc5CTp2wSWoGBcVB5v/Mk0N5azn+esr
6ICejMKwKPWaoMw+TFaTlpsfqImblXEqGGkTKzzAI1v/7wgY9bkCx+bwlLvwDI5pW5HHk8Jtqoiz
gQxyXZgFzIp+njOJyko0H7ELiVQYOmsK4GjLusg864u3K9mSJWwJH/h2JO4M5Ciwg1JmfK2nVYK9
pBxVxkpuK3iP2Hq8X1Dtcf7nzPZ4uWgFAE0Aw+48ueKN/LCBKRnspn1QEv/ItwdRG+OrCA1OyaPI
vOMNMF79IRrZ0RiJDW76TKHApGcNrJW5ZlEKIjyBiD8XPLx8PpoDcLxdAcGhTDdVY8qoOs3Bbw/O
Fczia3TNTgRXzNYFrU3Pq6fAHTCJ5Nf0DhL/FRS8jgqShu9UPVGyNkz2B1OG273L666cWcJgEe8/
1PyveSuYN+xe3a0xeJ5iwW59JupwkNmYq8JFk8gsxkkcJdkwBBclWwQFvPL+MUeB3u7H3OXme7Pp
0qJ1o+8zarUmz7Q/5mdw2CQiaViUhYevSBpYTblSWSdYNsw8t7TWHU9ONwHLksGq1GjGvwNDdTNG
wmlHbt68ZBIBpto1Wjih5PQJI83J3XjIAVqASaqG9/waky09n0i4Bsp0CDVzMqo/pv4adxlXPxOM
VX571zxy9z2XxC2onG/wPIiiOyWfLA88oJhffvFfK0bpo7JoPql/bDq/HYrBiUprYsIaSkjrWsmm
JdUX520naXDp41xScK7GkyDelvneSr2HR+daI1p44h8LZqPqk3NCY50CluFLEzCCxV1uTlSSRqW8
IAOzzQ8FRX3amAADxhxd0cuMHJW+dMgQnjqBEKNmTSToHHT1erskb0iL5g5N/gesReUB0m2XLaXr
QFyyvyaC+/FP9AXxnD8JT23kv3/na4GuvoO6DBzT3VeQM9xj7TYc65WdrbrtPQ5A7LDokRo4COYJ
B2lsL7J0VpTJ5YCsX3ezkdpBgd6bOC3To73T4ZmdgPeN4k+ZoF2/atYsn53b7o1yh/e0ocj5b8SO
yQiBMZIwOay2u0bCCYTM1hXFUzQL2Dc/pwUi/pYUfFDAJx3WRjf655Hr+igWWB6/trLnSWLqXUHi
KN0N4I8xdNnezHccy1ShmgsGsm6VP1YIA1+rEwNq4sGYRc2Ey7v91Z0I2+LSyjYdu1VU84XyaDu4
LRyOsfB24RnI2xCh0/FEfaBXTzNrkXqbl/FgAX+qUBYyMbeEnpY0tiJBQT4M/1tvLO0rMsYMO/mY
cuV2a+FlzeZctT19Nbz1CUkknJcLMI1GjOGkEw6/g0dcHSoT/p4IeQnrB81g3GVjJSB2nCxp9Exo
KCPtiefIT6uE7MAfCjPErXooyO8rMSaIz0AhG/MJNdiBcIBG+YKtW5BgIvP9zJgJZUQV0w/QZ9x8
ebJ+ud+cw7C7Z3vV98+ajAV1woI3zsiC/u6FNcMi3/HmORGXIQmiykckFxjtEYr8e0TM6WrzqMcD
qpHyy3KVS+5qsG1SNP1iVrNKlNGn3SHCaSmoKGUlfOEBcLk1d0MEs0r97RuOL9y628rpgOQiY/WI
9IR0RQgZ8yneBlqyQxyqrQYfAUpuOBciIdlJYIWYbhyqoJ4L9zwZd7sFWW7Rls2hx3NESyaB9NiO
D5xW54l/1fMAwW4wSo1g96IC6v1Se6p2/e4ljuN9sNfZRjTGp3pgLpHLeKW48DxTx2sNACaMy8+K
yyBvuAbuk8gvaEdvC1a2NbatT8PXYPTFUOipez2nYw9rZ73LUmuMywB8dJKMTUhPVyKCT2/KFe18
tKDa5d/Inyn8FLWWEAJekr9kgyfdVllFEyzOaGs+n+bP0dLHUntxdkMQRj6X/Gq1mTwt927xxxHV
xxNAwnj5RwgMSdUIsQkfiq2yhwR0X8BthGF/YfBpI66m3JliDEawJAXhuseD2s2sNavDQqDs2B++
IG6ZptBnZCHI6CWRwc9vEvDFtQMCuNPo37gFclowEi920KT/fNmBWDxtlxY1Rv0gx4mLidxR8FS9
c0vnMcmxuYjN/cU4fB+GEvex9/SCftLDLVToPkFuuGpaNfctdyA7beaXsSSbFP0iOSQmqA7ep3kV
21EXEjU2XnqytYZgxLQWEzhmtFRq3qRs7W/BH/1D5blzfepfJE1XgLAEiqNelalxszEFrHwwBIYW
zS59fQb5+YWiHv/IFrcKlQHHIeBJg7BO0eJ22BBZrXXfdiBjttuJixVMl8LjtrvcslwinBsyBBUZ
0T1f7KIZmPk+o4HwjUofQoRvpTeLrfDPs8SSGAvHnenIylwUcpjGBdhT8V/AX2C1Upsk6WNFTjKt
sb3lP/hYgwvmT5kZiyIOJCzfdPe4k8S//joRl3c8N+pCLiZKLYa/RrzygTlgqaBJmCpCLSTyPGsl
rKTKpEJdhmXggAuPIXgOiIKYmTn9TX/vflUFfUs9RYHiM9ZQItkTPht92T+MufXU5NmHyA78+UHA
CJ1yPo8QNOKS1V5MV7S4hq4ae/tIanS8fzKmZVMUF/rxqXfepVrfHmi0KS8/dHW8GBvETqW0Txcs
nhxJxhCRL39isjHRZ63dDU+5VMOmb8+pop/igZEVnJrt4pGHJ6GEKL4+RPr9GDbm7yeAHhkQdNdy
FajQw8NK+Blkg+Ci5x5l6TaiSZWRH5kc2hFmWWUwWFKoWc9zsbFul9e2zdkW+A+eTI/sVXD2YrNF
RtlsXbVc2yNtJvA4wWPver9jxUZbv6VU5XzTbh+e7RUJXxx6NRvF7/H3kXGbzo41Ux+pICrfT1hu
xKUyyqeravYMO2kScCaqwgCyKlBrIvvVOJrSf/IcyGaYsY/SBSgS50a6tnEf9oO/amgFm06RAaP0
be9k0buQGt45AtYWdU/9PoxZuT3ax1YZS+u4fLCuOhKPOsn5pWNzYoFm37be7M7snX6T5rQBkjJW
OxplQJk7N62HGuf22sk1ZuS646pPqaMkdLWkoXEFUOUWH7E4/ymXPCWhnMi789tC4O0B65kQ+i7N
bC7qnux2SvuElb/fNkDeJFgDERBWOASwICIAZi3bHLMYVPM0H1aNg1/GfL/mNpJQ24JTj8wOwa1G
+pXSbZKy4OcNyMWcNMVhTG5mcIJoanWPFx/iY8XbnrRV8uBPzzV5QVZ50yhuRJq/2uQbmzQyHStq
nZGGA0/WtKl5k/ahp09hjgL/kdOlalIRIx4nktIwmtZClSWY/kw9e2P+g+El+A9TP99eAxO6+ESO
Wm2Z++8fiZ8wOZaif4bMCYQxTKJn8XifYnv/ashuvKgmsVBKQ9CbJH9vxg05K99ncNYamojE1GXU
K5ux4PCbp6tcCOcpXmJUZQ/c6jPadclan3Zw9EVksjLQfyFwcnmhET0b+pcRdEG31KPgqjiyXLGC
L8yBnG0mZ0nGbiP2PgYL1Shy6vefV3X7Z55dzbZvjOBP4sD5qxVQW5XdhuGqka9tyxMuwsHT/IwT
ugFo40ZAZY9Z2jHZZkuIggdwsjc3v6rKabzopaSveYK/rbG995vlkjHOx82C+wTt/iVnWNdw7+35
qyjajV2wf+wxNFekOxuQ81a/9phcBP6tGvEgldlt/wxlkH4QwUd+aq3kKAD02ze2Vnp6scRA35Yy
WSYBAekUbrBAOrg0fYDjIZ0xNnqOEfxnmSxuv/vhLXazjlkHbpdsQf0RZaj8bMDy3ZNvZGgOrGr7
VNq7q2ewpGMZXo46L8jCyVLHQzQpCDsyu7m18uSl2YuXYyuNpoV6KXz2dts7L0OYM+dqGyscVli9
mW+/hHQz65ltBrYiJyYQ3zc4DWwa8//uI/fO9AdrMMymwK/vV7pyMgad0yRAEyRuTk26whKEAm8S
UezM87bs2sijm/L5pcqpyI6o0R5u7UeXVJ+GC2cb2qp4TRnOxNOUoTlVaxHycS2MNL7pQ2OyJk7Q
M47y/w6JMS5Dm/iR1+zalTci68Wrt9itZSIYz2yaJFexYaV4FwA+PJ31J146WhB5LdAjIac/51PW
C5vB7ORr94KZCElmAdJcLzPEaINpy0qwlAjq6+1TRJqcZHsVDF/5Khy/lefKcHbP39vt9MYOSaNK
E+eIkf9kzIb/PVnWvI/UDMMwCcgJXcrHK6oD+2GH6N53FlLilGab82v+6VLnZfENs9gMShiwjH4x
gYbMiQqgdTjYL9V1z6oJHSxW0nr9e00HpAGYfR3dDh+8GSIj6T953rVmz60Q1tNA0oQjWzrbUHE/
z1SBZDWjmDk74cyXmzh6LsguWpq2VPwYcBpqXcQ2dhOWm0tjds/jJ7t4D13mHVLqhLYPje/199GV
zKkJYp5y4C1uTkNA204eF54GY1spABFjcEaeKEmJxvJMnCk55orfvx/yF9oNCVggS2HShcq2XZ70
jlXPHGfltUQJROC153eivdbz8uVXSZE5Hca2Ow8OFW4HScZVpPSQHyBZLnfENKSyWD+rDAcpuirQ
U4DXOBjqcWxvoKicjGm6oZWRsrfK2EPvFpYsvwZwSwGWrcuk34UWzo/rmzCEhowOMnwBNF4T6zdx
DIn/M/jRTiS+RJL2rrO6UpeCKcqV//gm8Fg5lr8EweU6zkVx0hWgBhJGjeuQsLCZyE24afVCRjMi
WocXqyAvI44Dfm0x0idevpD5oVtJnWe5YAkesf3sDN4LSnra7Du912tBORB7ty6oYRAs/NRNE7/V
oifd+CV8ajt3Kr67skZHxWCWeGWfgNL+RP0fkaaY44A722V44nvHZQk/Samu8mV8RSlFWt32U1RY
z5b8Ht02lnoD7Scus7WBbZXQsxkEUoyxwMTiYd+0Qlb3xeAvRT5HYpcwEEhb+JW7DSq06sY1q2kz
ck7orve7lExjBCeo0acn4HC2UQYywNpx07F27qOHWPSNBprffc32xrogRng26r1fWx8sb39piLoH
jQze6lVMMms4HqzNcRZOqgV0BxY9wy6oTAx0OfESxpfmAACZ45br3sUCUHBvtOuqxzYDngfIG11X
8++2mlrrVAlfLah+ugaxxRKNMUNhENB899zvGAHt3DpMIcIuGZf+GMwjJmZe2fNfFJ8dr8zbplOz
ZinCuS94alZuT80D23GsQtyRkj9OXG6YlAEglpV3C5kDvxr7F9K+qhO9xyF4JJlS92DrDaoXWuB7
RHul4dcJC28oikm4Gb50YFvWaq+G0gaIPk4QGkNU6LHLrs/lxMPc/g3QOEvLuKYvwI5Tkp0obZuI
sgWQNDtqhzt//17nqHqdj3p39J8vDWi7UWhnsNfhD0ht5hgu9AubpgoOXTr/pFFpdw3BX2w6oELy
U4vsJ5UzqN/lQaN8KcTvCJS/ZtdjI+3zupi/lL4DylZiu1f8ZLMZykbc7wxU9mtV87r9fToK1djI
34I8WzeYbY/5ZFGPVdO4Uy5iudBcXAkOQKLlYrJzX2O18uuEilr3Nh6saDeiYKLjdYnoymxT5T8N
fFIn9gJyiUeunngEKCrIqECzpLp6j5gJkmf4++BOP+I3eyYTvpAopMG9RXKoiZm1VL91pvDkBURb
UOfkuTWAHDKv2N9AdszBCUTQyAY13fZGlcdHClBX0PZFW7NqGt+JscRF3bvJkqmJ4wd657Sv8zp7
rY+eGvtvN8xrGCtTCSOWepwivz5Pz68SRYdnwIOFyg+U+A0rbGZ6/VHy9qAK+b1OuSNXvPnXaPvN
I6L06x0sqKTiRmg0H2m90jzqYQu6ocmCqAsCHESOUwi/y8dXwkO0EIdXwYvbF8y+H2vzWBo7fG5e
8FEDMsK5LXsGT9dGdR4BhEchua2DhNncBvIVv3pt3yE3g1+vJNYKF38zgEKhPUEgxv3y0yOaqrDe
Q36PIaWiduluU+FYfY/FhXDb3ngpmh6Hfe/ivt2K9jEpPm1pPZt9jDx4+tLwXB2z5SiyM8nHOdmV
wrQPFyY1Mm1R41jAeACezYOI6sAb1uPAdg/DlBR2CzC55u21GRZUKD+UAdUpdh/hy2HcimDPAXpm
dj5Bh1qSRsComdqJ7aeqUUBLpLXqglOgNIe2pW3gkkgwD6yoxlqd6crt0Twj0baBJt+QXNlz+hxW
kliZGz7cGDkdhBjEeMQ+jYVq+C4rCJwTn/m9xxS9AXkMrDNlIb01Q/yGNsU3D2NgEvJivAgQ2WsY
v8mcEsF7issGItSNq7NnYHzAHbEmcaHL91mnJbcdAR3o94xuKgPEUD/RitiBgBBXbZyBGdFg4Hoy
nd0YC+ZBYIZuKRMNrU0dC2iIH5RVXO4uk0L39ZQLf4pXySOAQoasN2/zUmygZ4tkyREy/V+CLabg
MJAIEVMi1L2X+v8rTknaX+v7fW09q3MvF/o4WLg0YZUU+p06/ZiPQrrWbDRqBhNcKBG+DnYRb/oo
eQmvKkBcAOLWY0/Rf/iPB3bGlLrR0TWUzummR7qD+2XBQZpd/+iJhx9wNY3vKbx5dLzwPvfacBp9
aeTBU9quPYOIPtvRrv/5S5W4hOzjlYlHqg00YK7+XrkQvMKJIuz41bb3+mE7Wv2ifaLtfj1zYPY1
8vrBvZaLVku6PDoWAe34iaOf14WKxZloHLbcevVFK/JoOkiVBuGDU8dI5Dc60nmOsms0XmT2X/DU
2BN+HtvYXE6bTPe/49tlRT+qpB7usFggDtkmRAfN/LOucWOWzLMkFa4OjJTPB1tfeW9q/FLAf1Ea
1n+cBB7naC3GGFinaRxl67ZfO5dDUiH/7RGRM+giZIuBtsg8Mb7tWdJhtCSAG/GLCQspI5wsz12Q
qcMpuS5n+8LKrXEIYgvPH0tR0h/m5QgnG56HnEuXuJyCpb/G5F0TWUF1UBJYsFAlbskQdOjr2iHb
xZJJe+wTlAXIjTF9o+ay5CTOPLNm7KGCFL2VvSX4vD6KjFw4rqROYm1XeT764dKAELwiGUJLMOYL
tfn7EFWLwVw+1wDtIATxQEDPXoJzlAIsM9RSJFVDNQMh7QiL4C+A8yXSrTWxbye5zEdwtSoT6OMh
Q1cQN2vsg30m5UVtCAoCGfiD+jxYFs0d37UAxvFA8sfzIuhnXAZJKeaYX9nFRn9KtjbnrPeBEK3/
xSVz4t1dGh9Iv/wa4Y00z52WbTeRxVIxyo91Jrcg1VOme5sneXCHTbqOEfVucpPkiS4YkxnsRnPF
6VflHdq10uztVKos6lvKjxccSLEBZ9fzT2jwdY4lnuRawcWrptsAyBIV5RCMkM6U6QPck/fXJYut
rHaFGwtL3AfmEWvucYm7P7CuiV9KORYnM7JJhdmYxUTERmqGLqrHE4SQXi8AUo6ZqLNwjWcc0/cr
72RtQtfOcPHuZ9dcLRTZz8w0ju2VxDtd7o9l6Sv7aHl5E+PQV2b4AY3TY6n7mO/8FvfgRmO5qe2Q
l39tojZ296eS+awx+tGVGU45If1vT7w+NUt9NcUPuWV3Bm92IGM+4Y9tzQ2kYd3oxi6BK+fu09oI
0teEjnB5WQwUffOc8wtqOtXFuO8mEnBUIV/4D+Pv+jceWrNceufT7UsFPFtAlmAPWIpJxJQrc4yl
yvAJfZqdyndeQrWC3Wh9tx0JXABWvvRp0bsLSWJjR3Qui4FOqMsLpz1YX2HEAMYRFzghrUO96QGU
+3Z7WRyorSK2+8kAIUoAIDrSWaRtlmaP0uG4G5A/FLVpc7VjCBT4AzfDPiGXAC3nVziWt9f/G19P
GP8drN8KHwaGAsnty2b8GCJBQDypHzUyCn9tf82+lN7wvvnTwHHaXyGs/bsoF1eRRWiVaPz9q4yO
wUAaQ0zLEKfONxIQaZMG/taQvpQQX0inb84dtmOIZy/gsmu304IDjCPg/04TfAVdlyBLW0yqFR8D
/ij/vhfcNioCf8RMPqcVfaI6zScnu9Dbw89xQoct4Iifu/X5Olymu7RSWkQ3VAuXKKM2ZoA9ESCq
zJUZVf2eyOHYwUDvyDKhUwVICPt5SmHFll27tf7c1Y0gsZHnbARZe39Ua7lAJYrBn9MIQwAu1WcX
BLvrSlYmrewLcBDxQ+g9uB3F5l45PrkhsDpMFDqQXmo8rUzrd8QUPcUYsrL3xp1ATtMD3twR44QM
ZsP4tlwL3shEVor4NqFBBi/8kMETbguyHUbqiIhe+esXYcN5+l8/nmOA1igSHDkSmc9sYTi+nkUN
VymVuQRywrgqQgSP3TqF0t/AiKm3N6210dLeeUcSFb1f7X0rENFfLSHyvdmxRDQMA1EguC6SrqYs
u1QoW7F/kbJGhkLcMsYOLs3aleCcPNnOoEvYz8pp4Zt4t/i25g7qAAHp7ukVBQt61NRD0DZZsuqv
e7vTgj8Dj6u5/ZuNrWZbe7Gkx5KVWFYTa2n2X4XCDSwBLxcTgF9qifl2fx9BH/f36cVsUSSDxA31
SSaSPE6CwatBKuXKO9a1ErUu/WestofvTw184s5tdmY7ovfPyGdYKNYAL+bofqQylZcvj5OR43Qi
U3NH901Fko+cWS/VTLP7kn8qhXIlu3rksLsvRxpMzq0KP30IIJ7gNUrf1zncMsMOW2nb7C11NPjr
13ZJ9S/HNCFFMhIWcJzdWBMgt5n1LZ6PH5GTOAJzUJ+qH/hQuct2LT+vgVT5gdxHzaGPIXBTozKJ
dOAU3dFGmXI4oCW2O07pkFJhMWLar6sWJ3GuWokfx6rJiM7629hc0R+LYvo+z2D7Ayhj0VejNyGO
lLwbtXlTJODQsIS1YTNCUUh12ZQ+piIdUkeCANQHl7AGYkAVqyGZIXiFt7WOq74cFT88Y1huGnjC
CzcHX3m6+xWSkOAJZzvYuz4bAxL1jhl0jHE1fW3hQgTxQJbc4D7m+5MoGuE5aU5kGRxvwlAJlCp3
tmS9G1Ox3K6acL0xvKbhT+q2Ft7kE1ffVisjBnTTXRkEY1xksU4c+uAY9hqXkzEavIsKmQTUb76H
BGvzXkyzXeaVZ4jxcGGLC6TOQHSZ+YIcn3TLMe6f22ZMssDwKO5oQt9Ke/QbZ/qr8k1o7LHHkjG6
4+xfgz0D5UggQR8Fg1TjixDPcYi/F1oo/sa676ke2B9QON4FnIWczs36jqAzO9Cgnt1Ncsrv7Af3
pry1K0pguEpXSq2Yr0zy+tPjYO5nUya3SATPl6OoOYpgGStybJBn4NTbm9e6t+NwJzynBrf0/LnY
zKYkQ0t5YpEKESFriErAEUC4cSz+OoN1HS+BMnE9z5jzAmtgjv4fn8K8rx2jLIR6tZP4yxIBDTGh
UzzdPdyC7iCComrbiDHhcUnJH5skznIybeSh9R9fifMJCitcmwYbCxcSgNKFzL8E2uOsqX+TEH2l
tQ/OWufKynMYkfSaHMn9IHcZf+KAiM1o6gL0FgSLU1QOn2shdJCxyH3PyFxfiW79Bqt+B8Ws0ghg
lvs+i3gr+cKCzDKWVC5wB06PdMOCpBUppBluU2wNft/WoVUK6YPLQMtDYSScTu5ldVH88X+rHBVI
AyeNNIqPRkHiDRZPiAe5ARhgpnDxPS9tExN9tpKekdtuAwpuD551hVy9TrFMkj46
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
