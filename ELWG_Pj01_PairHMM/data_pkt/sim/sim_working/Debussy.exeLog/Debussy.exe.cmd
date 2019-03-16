srcSourceCodeView
debImport "-f" "run.f"
srcResizeWindow 0 0 1936 1056
wvCreateWindow
wvResizeWindow -win $_nWave2 0 0 1920 1040
wvResizeWindow -win $_nWave2 0 0 1920 1040
wvOpenFile -win $_nWave2 \
           {C:\Users\Zitong\Desktop\FPGA\data_pkt\sim\sim_working\DebussFile\test_data_pkt_top.fsdb}
wvSetPosition -win $_nWave2 {("G1" 0)}
wvResizeWindow -win $_nWave2 -8 -8 1936 1056
wvResizeWindow -win $_nWave2 0 0 1920 1040
wvResizeWindow -win $_nWave2 1 0 1919 1040
wvResizeWindow -win $_nWave2 116 32 1804 1008
wvResizeWindow -win $_nWave2 359 82 1561 958
wvResizeWindow -win $_nWave2 538 116 1382 924
wvResizeWindow -win $_nWave2 598 125 1322 915
wvResizeWindow -win $_nWave2 599 126 1321 914
wvResizeWindow -win $_nWave2 600 125 1320 915
wvResizeWindow -win $_nWave2 608 117 1312 923
wvResizeWindow -win $_nWave2 623 102 1297 938
wvResizeWindow -win $_nWave2 634 94 1286 946
wvResizeWindow -win $_nWave2 637 92 1283 948
wvResizeWindow -win $_nWave2 638 92 1282 948
wvResizeWindow -win $_nWave2 664 92 1256 948
wvResizeWindow -win $_nWave2 696 90 1224 950
wvResizeWindow -win $_nWave2 725 82 1195 958
wvResizeWindow -win $_nWave2 746 76 1174 964
wvResizeWindow -win $_nWave2 763 73 1157 967
wvResizeWindow -win $_nWave2 778 65 1142 975
wvResizeWindow -win $_nWave2 793 55 1127 985
wvResizeWindow -win $_nWave2 802 47 1118 993
wvResizeWindow -win $_nWave2 804 44 1116 996
wvResizeWindow -win $_nWave2 806 41 1114 999wvCloseWindow -win $_nWave2
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
debExit
izeWindow -win $_nWave2 809 14 1111 1026
wvResizeWindow -win $_nWave2 808 8 1112 1032
wvResizeWindow -win $_nWave2 808 6 1112 1034
wvResizeWindow -win $_nWave2 807 6 1113 1034
wvResizeWindow -win $_nWave2 807 5 1113 1035
srcResizeWindow -303 17 909 1056
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {70 74 3 1 2 1}
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 0.000000
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 2 )}
wvSelectSignal -win $_nWave2 {( "G1" 1 )}
srcHBSelect "test.p0.uut" -win $_nTrace1
srcHBSelect "test.p0.uut" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut" -delim "."
srcHBSelect "test.p0.uut" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0.uut" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {54 55 1 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {79 119 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 43706384.203103 -snap {("G1" 30)}
wvSetCursor -win $_nWave2 47787914.245416 -snap {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )}
wvSelectSignal -win $_nWave2 {( "G1" 4 )}
wvSelectSignal -win $_nWave2 {( "G1" 5 )}
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0.uut" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "head_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "head_start" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 37 )}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 39 )}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_wdone" -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 23959696.755994 -snap {("G1" 34)}
wvSetCursor -win $_nWave2 24884456.981664 -snap {("G1" 32)}
wvSetCursor -win $_nWave2 27490599.435825 -snap {("G1" 32)}
wvSetCursor -win $_nWave2 27490599.435825 -snap {("G1" 32)}
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0.m0" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.m0" -delim "."
srcHBSelect "test.p0" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0" -delim "."
wvSetCursor -win $_nWave2 26313631.875882 -snap {("G2" 0)}
wvZoomAll -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 1 )}
wvSelectSignal -win $_nWave2 {( "G1" 2 )}
wvSelectSignal -win $_nWave2 {( "G1" 19 )}
wvSelectSignal -win $_nWave2 {( "G1" 18 )}
wvSelectSignal -win $_nWave2 {( "G1" 16 )}
wvSelectSignal -win $_nWave2 {( "G1" 6 )}
wvSelectSignal -win $_nWave2 {( "G1" 5 )}
wvSelectSignal -win $_nWave2 {( "G1" 7 )}
wvSelectSignal -win $_nWave2 {( "G1" 2 )}
wvSelectSignal -win $_nWave2 {( "G1" 31 )}
wvSelectSignal -win $_nWave2 {( "G1" 33 )}
wvSelectSignal -win $_nWave2 {( "G1" 31 )}
wvSelectSignal -win $_nWave2 {( "G1" 32 )}
wvSelectSignal -win $_nWave2 {( "G1" 31 )}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvResizeWindow -win $_nWave2 829 19 1113 1035
wvResizeWindow -win $_nWave2 829 19 1113 1035
wvSelectSignal -win $_nWave2 {( "G1" 32 )}
wvSelectSignal -win $_nWave2 {( "G1" 33 )}
wvSelectSignal -win $_nWave2 {( "G1" 20 )}
wvSelectSignal -win $_nWave2 {( "G1" 23 )}
wvSelectSignal -win $_nWave2 {( "G1" 23 24 25 26 27 28 29 )}
srcHBSelect "test.p0.uut.u_head_analyze" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_head_analyze" -delim "."
srcHBSelect "test.p0.uut.u_hap_analyze" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_hap_analyze" -delim "."
wvSelectGroup -win $_nWave2 {G2}
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {46 47 2 1 13 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {46 47 2 1 14 1}
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 0.000000
wvLastView -win $_nWave2
wvZoom -win $_nWave2 0.000000 54379356.164384
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {46 47 2 1 11 1}
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "test.p0.uut.u_head_analyze" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_head_analyze" -delim "."
srcHBSelect "test.p0.uut" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut" -delim "."
srcHBSelect "test.p0" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {87 90 3 1 15 1}
srcDeselectAll -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G1" 1 )}
wvSelectSignal -win $_nWave2 {( "G1" 1 )}
wvSelectSignal -win $_nWave2 {( "G1" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 \
           )} {( "G2" 1 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {56 60 8 1 1 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {64 75 3 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 4)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0.uut" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {83 86 9 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSetRadix -win $_nWave2 -format UDec {("G2" 2)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {87 90 8 1 1 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {91 94 9 1 1 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {45 46 2 1 12 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {46 47 2 1 9 1}
srcAddSelectedToWave -win $_nTrace1
wvSelectGroup -win $_nWave2 {G3}
wvResizeWindow -win $_nWave2 829 19 1113 1035
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {110 119 6 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 11 )}
srcHBSelect "test.p0.uut.u_read_analyze" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_read_analyze" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {65 66 2 1 13 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {78 87 2 1 12 1}
srcAddSelectedToWave -win $_nTrace1
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 12)}
wvSetPosition -win $_nWave2 {("G2" 3)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {285 322 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 5 )}
wvSetCursor -win $_nWave2 2880892.509557 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 1571395.914304 -snap {("G2" 5)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 4729561.709781 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 4791626.392160 -snap {("G2" 5)}
wvSetCursor -win $_nWave2 4784124.067916 -snap {("G2" 5)}
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 4692732.118039 -snap {("G2" 5)}
wvSetRadix -win $_nWave2 -format Bin {("G2" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {57 58 8 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {56 57 8 1 2 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0.uut.u_read_analyze.calculate_p_inst" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_read_analyze.calculate_p_inst" -delim \
           "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {47 56 8 1 1 1}
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "test.p0.uut.u_read_analyze" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_read_analyze" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {165 188 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {34 35 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 26 )}
wvSetCursor -win $_nWave2 27281.179068 -snap {("G2" 26)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0.uut.u_head_analyze" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_head_analyze" -delim "."
srcHBSelect "test.p0.uut.u_hap_analyze" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_hap_analyze" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {52 54 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 27 )}
wvSetCursor -win $_nWave2 25235.090638 -snap {("G2" 27)}
srcHBSelect "test.p0.uut" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "head_ram_raddr" -win $_nTrace1
srcSelect -signal "head_ram_ren" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 29 )}
wvSelectSignal -win $_nWave2 {( "G2" 30 )}
wvSelectSignal -win $_nWave2 {( "G2" 29 )}
wvSelectSignal -win $_nWave2 {( "G2" 29 30 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 30)}
wvSetPosition -win $_nWave2 {("G2" 28)}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 \
           19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hap_ram_ren" -win $_nTrace1
srcSelect -signal "hap_ram_raddr" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectGroup -win $_nWave2 {G3}
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -inst "u_package_send" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "hap_start" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_start" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvZoomAll -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 0.000000
wvSetCursor -win $_nWave2 6185869.932432 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 7245000.000000
wvSetCursor -win $_nWave2 7245000.000000
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_sta" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_sta" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "next_sta" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "package_start" -win $_nTrace1
srcHBSelect "test.p0.uut.u_package_send" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_package_send" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "start_pulse" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 7245000.000000
wvSelectSignal -win $_nWave2 {( "G2" 5 )}
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 7255000.000000
wvSelectSignal -win $_nWave2 {( "G2" 4 )}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "f0_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "f1_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "f0_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "f0_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "f1_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "module_vld" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 6 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G2" 5)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "f0_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "f1_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "counter" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "en_counter" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 7 )}
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )}
wvSetCursor -win $_nWave2 0.000000 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 0.000000 -snap {("G2" 6)}
wvSelectSignal -win $_nWave2 {( "G2" 7 )}
wvSetCursor -win $_nWave2 14869.879645 -snap {("G2" 7)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "module_vld" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "module_vld" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 29739.759291 -snap {("G2" 8)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "module_vld" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "all_finished" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "start_pulse" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "module_vld" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "start_pulse" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_enable" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvSetCursor -win $_nWave2 1576207.242399 -snap {("G3" 0)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvResizeWindow -win $_nWave2 363 2 1114 1035
wvResizeWindow -win $_nWave2 363 2 1143 1035
wvResizeWindow -win $_nWave2 363 2 1182 1035
wvResizeWindow -win $_nWave2 363 2 1222 1035
wvResizeWindow -win $_nWave2 363 2 1252 1035
wvResizeWindow -win $_nWave2 363 2 1269 1035
wvResizeWindow -win $_nWave2 363 2 1286 1035
wvResizeWindow -win $_nWave2 363 2 1314 1035
wvResizeWindow -win $_nWave2 363 2 1359 1035
wvResizeWindow -win $_nWave2 363 2 1399 1035
wvResizeWindow -win $_nWave2 363 2 1413 1035
wvResizeWindow -win $_nWave2 363 2 1422 1035
wvResizeWindow -win $_nWave2 363 2 1433 1035
wvResizeWindow -win $_nWave2 363 2 1439 1035
wvResizeWindow -win $_nWave2 363 2 1443 1035
wvResizeWindow -win $_nWave2 363 2 1451 1035
wvResizeWindow -win $_nWave2 363 2 1457 1035
wvResizeWindow -win $_nWave2 363 2 1472 1035
wvResizeWindow -win $_nWave2 363 2 1477 1035
wvResizeWindow -win $_nWave2 363 2 1480 1035
wvResizeWindow -win $_nWave2 363 2 1483 1035
srcHBSelect "test.p0" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {56 60 1 1 3 1}
srcAddSelectedToWave -win $_nTrace1
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 12 )}
wvSelectSignal -win $_nWave2 {( "G2" 9 )}
wvSelectSignal -win $_nWave2 {( "G2" 4 5 6 7 8 9 )}
wvSelectSignal -win $_nWave2 {( "G2" 1 2 3 4 5 6 7 8 9 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 5)}
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSetCursor -win $_nWave2 6856404.660821 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 8682841.393773 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 0.000000 -snap {("G2" 3)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 8243983.728367 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 8250174.302399 -snap {("G2" 2)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 18413341.995842 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 18471673.596674 -snap {("G2" 3)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 9561324.092873 -snap {("G2" 2)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 303.810421 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 303.810421 -snap {("G2" 3)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvResizeWindow -win $_nWave2 -8 -8 1936 1056
wvZoomAll -win $_nWave2
wvSetCursor -win $_nWave2 15029742.049470 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 13491572.438163 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 16255063.604240 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 18353752.650177 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 8107978.798587 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 8175000.000000
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSetCursor -win $_nWave2 8175000.000000
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_done" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 8175000.000000
wvSelectSignal -win $_nWave2 {( "G2" 6 )}
wvSetCursor -win $_nWave2 8175000.000000
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSetCursor -win $_nWave2 104282.685512 -snap {("G2" 6)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G2" 6 )}
wvSetCursor -win $_nWave2 0.000000
wvSetCursor -win $_nWave2 0.000000 -snap {("G2" 6)}
wvSetCursor -win $_nWave2 0.000000 -snap {("G2" 6)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 8147084.805654 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 8175000.000000
wvSetCursor -win $_nWave2 8590286.219081 -snap {("G2" 2)}
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 18379823.321555 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 8173155.477032 -snap {("G2" 1)}
wvSetCursor -win $_nWave2 8081908.127208 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 8175000.000000
wvSetCursor -win $_nWave2 8720639.575972 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 8316544.169611 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 8147084.805654 -snap {("G2" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 3 )}
wvSelectSignal -win $_nWave2 {( "G2" 4 )}
wvSetCursor -win $_nWave2 8212261.484099 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 8185000.000000
wvSetCursor -win $_nWave2 8185000.000000
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvSelectSignal -win $_nWave2 {( "G2" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 2 )}
wvScrollDown -win $_nWave2 0
wvSetCursor -win $_nWave2 18288575.971731 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 18395000.000000
wvSetCursor -win $_nWave2 18395000.000000
wvSetCursor -win $_nWave2 18395000.000000
wvSetCursor -win $_nWave2 18395000.000000
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomAll -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 11027117.270318 -snap {("G2" 2)}
wvSetCursor -win $_nWave2 8081763.471731 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 8836061.395760 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 8117682.420495 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 8764223.498233 -snap {("G2" 4)}
wvSetCursor -win $_nWave2 9267088.780919 -snap {("G2" 3)}
wvSetCursor -win $_nWave2 9365000.000000
wvSetCursor -win $_nWave2 20904828.180212 -snap {("G2" 4)}
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 20105631.570230 -snap {("G2" 3)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvResizeWindow -win $_nWave2 445 -7 1483 1035
wvResizeWindow -win $_nWave2 236 12 1482 1035
wvResizeWindow -win $_nWave2 236 12 1407 1035
wvResizeWindow -win $_nWave2 236 12 1274 1035
wvResizeWindow -win $_nWave2 236 12 1148 1035
wvResizeWindow -win $_nWave2 236 12 1046 1035
wvResizeWindow -win $_nWave2 236 12 977 1035
wvResizeWindow -win $_nWave2 236 12 938 1035
wvResizeWindow -win $_nWave2 236 12 906 1035
wvResizeWindow -win $_nWave2 236 12 885 1035
wvResizeWindow -win $_nWave2 236 12 874 1035
wvResizeWindow -win $_nWave2 236 12 871 1035
wvResizeWindow -win $_nWave2 236 12 872 1035
wvResizeWindow -win $_nWave2 236 12 901 1035
wvResizeWindow -win $_nWave2 236 12 951 1035
wvResizeWindow -win $_nWave2 236 12 1001 1035
wvResizeWindow -win $_nWave2 236 12 1051 1035
wvResizeWindow -win $_nWave2 236 12 1071 1035
wvResizeWindow -win $_nWave2 236 12 1077 1035
wvResizeWindow -win $_nWave2 236 12 1087 1035
wvResizeWindow -win $_nWave2 236 12 1100 1035
wvResizeWindow -win $_nWave2 236 12 1109 1035
wvResizeWindow -win $_nWave2 236 12 1121 1035
wvResizeWindow -win $_nWave2 236 12 1132 1035
wvResizeWindow -win $_nWave2 236 12 1138 1035
wvResizeWindow -win $_nWave2 817 9 1138 1035
wvResizeWindow -win $_nWave2 817 9 1138 1035
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "en_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "max_data_num_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "en_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "en_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "en_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "max_data_num_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "en_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "en_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "data_write_pcie" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "addr_write_pcie" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "en_write_pcie" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "max_data_num_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_enable" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "max_data_num_done" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcAction -pos 89 2 7 -win $_nTrace1 -name "max_data_num_done" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "max_data_num_done" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 20195000.000000
srcDeselectAll -win $_nTrace1
srcSelect -signal "sys_clk" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G2" 11 )}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 6)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 6)}
wvSetPosition -win $_nWave2 {("G2" 7)}
wvSelectSignal -win $_nWave2 {( "G2" 11 )}
wvSelectSignal -win $_nWave2 {( "G2" 9 )}
wvSelectSignal -win $_nWave2 {( "G2" 10 )}
wvSelectSignal -win $_nWave2 {( "G2" 9 )}
wvSelectSignal -win $_nWave2 {( "G2" 8 )}
wvSelectSignal -win $_nWave2 {( "G2" 8 9 10 11 )}
wvSetPosition -win $_nWave2 {("G2" 8)}
wvSetPosition -win $_nWave2 {("G2" 9)}
wvSetPosition -win $_nWave2 {("G2" 10)}
wvSetPosition -win $_nWave2 {("G2" 11)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvSetPosition -win $_nWave2 {("G3" 0)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSetCursor -win $_nWave2 20195000.000000
wvSetCursor -win $_nWave2 20195000.000000
wvSetCursor -win $_nWave2 20195000.000000
wvSetCursor -win $_nWave2 0.000000 -snap {("G3" 1)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 21204560.359889 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 21204702.310296 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G2" 6 )}
wvSelectSignal -win $_nWave2 {( "G2" 6 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSelectSignal -win $_nWave2 {( "G3" 2 )}
wvSelectSignal -win $_nWave2 {( "G3" 3 )}
wvSelectSignal -win $_nWave2 {( "G3" 2 )}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSelectSignal -win $_nWave2 {( "G2" 7 )}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 0.000000 -snap {("G3" 1)}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 15765000.000000
wvSetCursor -win $_nWave2 11742572.618892 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 18352692.035822 -snap {("G3" 1)}
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 18305000.000000
wvSetCursor -win $_nWave2 18305000.000000
wvSetCursor -win $_nWave2 17189834.304421 -snap {("G3" 1)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoom -win $_nWave2 0.000000 18235000.000000
wvZoom -win $_nWave2 0.000000 18235000.000000
wvResizeWindow -win $_nWave2 -8 -8 1936 1056
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 33279671.703820 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 13360496.799573 -snap {("G3" 2)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 13355000.000000
wvSetCursor -win $_nWave2 13342931.559480 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 13355094.848753 -snap {("G3" 2)}
wvSetCursor -win $_nWave2 13347224.485106 -snap {("G3" 2)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvSetCursor -win $_nWave2 13355094.848753 -snap {("G3" 2)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSelectSignal -win $_nWave2 {( "G3" 3 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 18304080.328197 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 18314276.026559 -snap {("G3" 3)}
wvSearchNext -win $_nWave2
wvResizeWindow -win $_nWave2 -8 -8 1936 1056
wvSetCursor -win $_nWave2 97278523.596939
wvSetCursor -win $_nWave2 21202369.522324 -snap {("G3" 3)}
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 23958067.365568 -snap {("G3" 1)}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSelectSignal -win $_nWave2 {( "G3" 2 )}
wvSelectSignal -win $_nWave2 {( "G3" 3 )}
wvSelectSignal -win $_nWave2 {( "G3" 2 )}
wvSetCursor -win $_nWave2 23966116.601116 -snap {("G3" 1)}
wvSetCursor -win $_nWave2 23958603.981271 -snap {("G3" 1)}
srcHBSelect "test.p0.uut.u_read_analyze" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.uut.u_read_analyze" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {41 44 1 1 10 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {35 44 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 24025859.816077 -snap {("G3" 11)}
wvSelectSignal -win $_nWave2 {( "G3" 10 )}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSetCursor -win $_nWave2 7932933.747829 -snap {("G3" 10)}
wvSetCursor -win $_nWave2 8436637.021270 -snap {("G2" 2)}
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_ram_addr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p0_ram_rdat" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_ram_ren" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_data" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "read_ram_raddr" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_ren" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_rdat" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sys_rst_n" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sys_clk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "cpu_pkt_ram_raddr" -win $_nTrace1
srcHBSelect "test.p0.uut.u_read_analyze" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p6_ram_rdat" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_ram_ren" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 14 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 13)}
wvSelectGroup -win $_nWave2 {G4}
wvSelectSignal -win $_nWave2 {( "G3" 12 )}
wvSelectSignal -win $_nWave2 {( "G3" 1 2 3 4 5 6 7 8 9 10 11 12 13 )}
wvSelectSignal -win $_nWave2 {( "G3" 4 )}
wvSelectSignal -win $_nWave2 {( "G3" 5 6 7 8 9 10 11 12 13 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 4)}
wvSelectSignal -win $_nWave2 {( "G3" 4 )}
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0.m0" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.m0" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_memory_sop" -win $_nTrace1
srcHBSelect "test.p0.m0.m1" -win $_nTrace1
srcHBSelect "test.p0.m0.m1" -win $_nTrace1
srcHBSelect "test.p0.m0.m1" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.m0.m1" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_memory_sop" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_memory_eop" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_memory_vld" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "matrix_memory_data" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 7 )}
wvSelectSignal -win $_nWave2 {( "G3" 5 )}
wvSelectSignal -win $_nWave2 {( "G3" 4 )}
wvSelectSignal -win $_nWave2 {( "G3" 5 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSetCursor -win $_nWave2 0.000000 -snap {("G3" 5)}
wvSearchNext -win $_nWave2
srcHBSelect "test.p0.m0.c1" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.m0.c1" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_mx" -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcSelect -signal "p_xx_yy" -win $_nTrace1
srcSelect -signal "p_xm_ym" -win $_nTrace1
srcSelect -signal "p_mm" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcHBSelect "test.p0.m0.m1" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.m0.m1" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -signal "counter_out_ready_ok" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {32 34 1 1 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {31 34 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_i_j" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "x_i_j" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "y_i_j" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "x_i_j" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_i_j" -win $_nTrace1
wvSetCursor -win $_nWave2 8366768.565148 -snap {("G4" 0)}
wvSelectSignal -win $_nWave2 {( "G3" 16 )}
wvSelectSignal -win $_nWave2 {( "G3" 15 16 17 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G3" 14)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {48 51 1 3 1 1}
srcHBSelect "test.p0.m0.c1" -win $_nTrace1
srcHBSelect "test.p0.m0.c1" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.m0.c1" -delim "."
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {37 40 1 3 1 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {36 41 1 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 8422093.644152 -snap {("G4" 0)}
wvSetCursor -win $_nWave2 8444899.811539 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 8435330.164832 -snap {("G3" 14)}
wvSetCursor -win $_nWave2 8443826.580133 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 8436582.268139 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 8444184.323935 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 8436045.652436 -snap {("G3" 13)}
wvSetCursor -win $_nWave2 8444273.759886 -snap {("G3" 13)}
srcDeselectAll -win $_nTrace1
wvSelectGroup -win $_nWave2 {G4}
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSearchPrev -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 9 )}
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 19 )}
wvSearchNext -win $_nWave2
wvSearchPrev -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 12 )}
wvSelectSignal -win $_nWave2 {( "G3" 13 )}
wvSelectSignal -win $_nWave2 {( "G3" 15 )}
wvSelectSignal -win $_nWave2 {( "G3" 16 )}
wvSelectSignal -win $_nWave2 {( "G3" 13 )}
wvSelectSignal -win $_nWave2 {( "G3" 19 )}
wvSelectSignal -win $_nWave2 {( "G3" 19 )}
wvSelectSignal -win $_nWave2 {( "G3" 15 )}
wvSelectSignal -win $_nWave2 {( "G3" 17 )}
wvSelectSignal -win $_nWave2 {( "G3" 19 )}
wvSelectSignal -win $_nWave2 {( "G3" 10 )}
wvSearchNext -win $_nWave2
srcHBSelect "test.p0.m0.c1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {99 102 9 1 2 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {95 102 3 1 1 1}
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {72 74 9 1 5 1}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -win $_nTrace1 -range {87 90 5 1 1 1}
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 8524543.273681 -snap {("G3" 27)}
wvSetCursor -win $_nWave2 8524901.017483 -snap {("G3" 28)}
wvSetCursor -win $_nWave2 8524829.468722 -snap {("G3" 27)}
wvSetCursor -win $_nWave2 8534041.371628 -snap {("G3" 27)}
wvSetCursor -win $_nWave2 8524561.160871 -snap {("G3" 27)}
wvSetCursor -win $_nWave2 8534577.987331 -snap {("G3" 27)}
wvSetCursor -win $_nWave2 8525187.212524 -snap {("G3" 28)}
wvSetCursor -win $_nWave2 8435160.984711 -snap {("G3" 19)}
wvSetCursor -win $_nWave2 8444194.015716 -snap {("G3" 19)}
wvSetCursor -win $_nWave2 8436144.780167 -snap {("G3" 19)}
wvSetCursor -win $_nWave2 8444641.195468 -snap {("G3" 19)}
wvSelectSignal -win $_nWave2 {( "G3" 25 )}
wvSelectSignal -win $_nWave2 {( "G3" 25 )}
wvSearchPrev -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G3" 13 )}
wvSelectSignal -win $_nWave2 {( "G3" 12 )}
wvSetCursor -win $_nWave2 8526246.944873 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 8533759.564718 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 8524547.661813 -snap {("G3" 11)}
wvSetCursor -win $_nWave2 8534564.488273 -snap {("G3" 11)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fp_rst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_i_j1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcAction -pos 193 5 0 -win $_nTrace1 -name "p_my" -ctrlKey off
srcDeselectAll -win $_nTrace1
srcHBSelect "test.p0.m0.c1" -win $_nTrace1
srcSetScope -win $_nTrace1 "test.p0.m0.c1" -delim "."
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_i_j1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fp_rst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_i_j1" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_i_j1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fp_rst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "sys_clk" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "fp_rst" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m_i_j1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_my" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSelectSignal -win $_nWave2 {( "G3" 31 )}
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G4" 0)}
wvSetPosition -win $_nWave2 {("G3" 31)}
srcDeselectAll -win $_nTrace1
srcSelect -signal "m5_out" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 8555045.320947 -snap {("G3" 32)}
wvSetCursor -win $_nWave2 8564525.531704 -snap {("G3" 32)}
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "m6_out" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "y_i_j1" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "p_xx_yy" -win $_nTrace1
srcAddSelectedToWave -win $_nTrace1
wvSetCursor -win $_nWave2 8524815.969664 -snap {("G3" 35)}
wvSetCursor -win $_nWave2 8534564.488273 -snap {("G3" 34)}
wvSetCursor -win $_nWave2 8524994.841566 -snap {("G3" 35)}
wvSetCursor -win $_nWave2 8534296.180422 -snap {("G3" 35)}
wvSetCursor -win $_nWave2 8525442.021318 -snap {("G3" 35)}
wvSetCursor -win $_nWave2 8534832.796125 -snap {("G3" 35)}
wvSelectSignal -win $_nWave2 {( "G3" 34 )}
srcDeselectAll -win $_nTrace1
wvDisplayGridCount -win $_nWave2 -off
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvSetCursor -win $_nWave2 8474213.108849 -snap {("G3" 21)}
wvSetCursor -win $_nWave2 8534492.939513 -snap {("G3" 12)}
wvSelectSignal -win $_nWave2 {( "G3" 8 )}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSelectSignal -win $_nWave2 {( "G3" 2 )}
wvSelectSignal -win $_nWave2 {( "G3" 3 )}
wvSelectSignal -win $_nWave2 {( "G3" 2 )}
wvSelectSignal -win $_nWave2 {( "G3" 3 )}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSelectSignal -win $_nWave2 {( "G3" 3 )}
wvSelectSignal -win $_nWave2 {( "G3" 1 )}
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvSearchNext -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvZoomIn -win $_nWave2
wvCloseWindow -win $_nWave2
wvGetSignalClose -win $_nWave2
wvGetSignalClose -win $_nWave2
debExit
