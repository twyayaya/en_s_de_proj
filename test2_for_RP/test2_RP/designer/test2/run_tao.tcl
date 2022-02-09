set_family {PolarFire}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\component\work\PF_TPSRAM_C0\PF_TPSRAM_C0.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\component\work\test2\test2.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\comb.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\PF_SRAM_AHBL_AXI_C1_PF_TPSRAM_AHB_AXI_0_PF_TPSRAM.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\test2_RP_HDL\delay_a_clock.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\test2_RP_HDL\error_gen.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\test2_RP_HDL\HDL_RP\de_v1\de64_1.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\test2_RP_HDL\HDL_RP\de_v1\de64_2.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\test2_RP_HDL\HDL_RP\de_v1\de_v1.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\test2_RP_HDL\HDL_RP\en64_RP.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\test2_RP_HDL\test5.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\hdl\test2_RP_HDL\test6.v}
read_verilog -mode system_verilog_mfcu {C:\Users\Kai\Desktop\test2_RP\component\work\PF_TPSRAM_C0\PF_TPSRAM_C0_0\PF_TPSRAM_C0_PF_TPSRAM_C0_0_PF_TPSRAM.v}
set_top_level {test2}
map_netlist
check_constraints {C:\Users\Kai\Desktop\test2_RP\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Users\Kai\Desktop\test2_RP\designer\test2\synthesis.fdc}
