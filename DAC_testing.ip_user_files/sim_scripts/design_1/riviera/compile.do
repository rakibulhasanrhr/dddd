transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

vlib work
vlib riviera/xpm
vlib riviera/xil_defaultlib
vlib riviera/lib_cdc_v1_0_3
vlib riviera/proc_sys_reset_v5_0_16
vlib riviera/xlconstant_v1_1_9
vlib riviera/fifo_generator_v13_2_11

vmap xpm riviera/xpm
vmap xil_defaultlib riviera/xil_defaultlib
vmap lib_cdc_v1_0_3 riviera/lib_cdc_v1_0_3
vmap proc_sys_reset_v5_0_16 riviera/proc_sys_reset_v5_0_16
vmap xlconstant_v1_1_9 riviera/xlconstant_v1_1_9
vmap fifo_generator_v13_2_11 riviera/fifo_generator_v13_2_11

vlog -work xpm  -incr "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"C:/Progs/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Progs/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93  -incr \
"C:/Progs/Xilinx/Vivado/2024.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_3 -93  -incr \
"../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2a4f/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_16 -93  -incr \
"../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/0831/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vlog -work xlconstant_v1_1_9  -incr -v2k5 "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/e2d2/hdl/xlconstant_v1_1_vl_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"../../../bd/design_1/ip/design_1_xlconstant_0_0/sim/design_1_xlconstant_0_0.v" \
"../../../bd/design_1/ip/design_1_xlconstant_1_0/sim/design_1_xlconstant_1_0.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ipshared/9ebe/src/PkgZmodDAC.vhd" \
"../../../bd/design_1/ipshared/9ebe/src/ADI_SPI.vhd" \
"../../../bd/design_1/ipshared/9ebe/src/ConfigDAC.vhd" \
"../../../bd/design_1/ipshared/9ebe/src/GainOffsetCalib.vhd" \
"../../../bd/design_1/ipshared/9ebe/src/SyncAsync.vhd" \
"../../../bd/design_1/ipshared/9ebe/src/ResetBridge.vhd" \
"../../../bd/design_1/ipshared/9ebe/src/SyncBase.vhd" \
"../../../bd/design_1/ipshared/9ebe/src/ZmodAWG_1411_Controller.vhd" \
"../../../bd/design_1/ip/design_1_ZmodAWGController_0_0/sim/design_1_ZmodAWGController_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"../../../bd/design_1/ip/design_1_xlconstant_2_0/sim/design_1_xlconstant_2_0.v" \
"../../../bd/design_1/ip/design_1_pam2_dac_tester_top_0_0/sim/design_1_pam2_dac_tester_top_0_0.v" \

vlog -work fifo_generator_v13_2_11  -incr -v2k5 "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"../../../../DAC_testing.gen/sources_1/bd/design_1/ip/design_1_ZmodScopeController_0_0/src/ZmodADC_SynchonizationFIFO/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_11 -93  -incr \
"../../../../DAC_testing.gen/sources_1/bd/design_1/ip/design_1_ZmodScopeController_0_0/src/ZmodADC_SynchonizationFIFO/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_11  -incr -v2k5 "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"../../../../DAC_testing.gen/sources_1/bd/design_1/ip/design_1_ZmodScopeController_0_0/src/ZmodADC_SynchonizationFIFO/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"../../../bd/design_1/ip/design_1_ZmodScopeController_0_0/src/ZmodADC_SynchonizationFIFO/sim/ZmodADC_SynchonizationFIFO.v" \

vcom -work xil_defaultlib -93  -incr \
"../../../bd/design_1/ipshared/c25f/src/PkgZmodADC.vhd" \
"../../../bd/design_1/ipshared/c25f/src/ConfigADC.vhd" \
"../../../bd/design_1/ipshared/c25f/src/ConfigRelays.vhd" \
"../../../bd/design_1/ipshared/c25f/src/DataPath.vhd" \
"../../../bd/design_1/ipshared/c25f/src/HandshakeData.vhd" \
"../../../bd/design_1/ipshared/c25f/src/ZmodScopeController.vhd" \
"../../../bd/design_1/ip/design_1_ZmodScopeController_0_0/sim/design_1_ZmodScopeController_0_0.vhd" \

vlog -work xil_defaultlib  -incr -v2k5 "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/3cbc" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/814a/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/1017/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/52c0/hdl/verilog" "+incdir+../../../../DAC_testing.gen/sources_1/bd/design_1/ipshared/2276/hdl/verilog" -l xpm -l xil_defaultlib -l lib_cdc_v1_0_3 -l proc_sys_reset_v5_0_16 -l xlconstant_v1_1_9 -l fifo_generator_v13_2_11 \
"../../../bd/design_1/sim/design_1.v" \
"../../../bd/design_1/ip/design_1_ila_0_0/sim/design_1_ila_0_0.v" \

vlog -work xil_defaultlib \
"glbl.v"

