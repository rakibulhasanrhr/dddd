//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Tue Apr  7 14:24:09 2026
//Host        : FY-6302-08 running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=9,numReposBlks=9,numNonXlnxBlks=2,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,da_board_cnt=1,da_clkrst_cnt=5,synth_mode=None}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (ZmodAdcClkIn_n_0,
    ZmodAdcClkIn_p_0,
    ZmodDAC_ClkIO_0,
    ZmodDAC_ClkIn_0,
    btn_ctrl_i_0,
    clk_in1_0,
    dZmodADC_Data_0,
    dZmodDAC_Data_0,
    iZmodSync_0,
    reset_rtl_0_0,
    sZmodADC_CS_0,
    sZmodADC_SDIO_0,
    sZmodADC_Sclk_0,
    sZmodCh1CouplingH_0,
    sZmodCh1CouplingL_0,
    sZmodCh1GainH_0,
    sZmodCh1GainL_0,
    sZmodCh2CouplingH_0,
    sZmodCh2CouplingL_0,
    sZmodCh2GainH_0,
    sZmodCh2GainL_0,
    sZmodDAC_CS_0,
    sZmodDAC_EnOut_0,
    sZmodDAC_Reset_0,
    sZmodDAC_SCLK_0,
    sZmodDAC_SDIO_0,
    sZmodDAC_SetFS1_0,
    sZmodDAC_SetFS2_0,
    sZmodRelayComH_0,
    sZmodRelayComL_0);
  output ZmodAdcClkIn_n_0;
  output ZmodAdcClkIn_p_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ZMODDAC_CLKIO_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ZMODDAC_CLKIO_0, CLK_DOMAIN design_1_ZmodAWGController_0_0_ZmodDAC_ClkIO, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output ZmodDAC_ClkIO_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ZMODDAC_CLKIN_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ZMODDAC_CLKIN_0, CLK_DOMAIN design_1_ZmodAWGController_0_0_ZmodDAC_ClkIn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output ZmodDAC_ClkIn_0;
  input btn_ctrl_i_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, CLK_DOMAIN design_1_sys_clock, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_in1_0;
  input [13:0]dZmodADC_Data_0;
  output [13:0]dZmodDAC_Data_0;
  output iZmodSync_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL_0_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL_0_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl_0_0;
  output sZmodADC_CS_0;
  inout sZmodADC_SDIO_0;
  output sZmodADC_Sclk_0;
  output sZmodCh1CouplingH_0;
  output sZmodCh1CouplingL_0;
  output sZmodCh1GainH_0;
  output sZmodCh1GainL_0;
  output sZmodCh2CouplingH_0;
  output sZmodCh2CouplingL_0;
  output sZmodCh2GainH_0;
  output sZmodCh2GainL_0;
  output sZmodDAC_CS_0;
  output sZmodDAC_EnOut_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SZMODDAC_RESET_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SZMODDAC_RESET_0, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) output sZmodDAC_Reset_0;
  output sZmodDAC_SCLK_0;
  inout sZmodDAC_SDIO_0;
  output sZmodDAC_SetFS1_0;
  output sZmodDAC_SetFS2_0;
  output sZmodRelayComH_0;
  output sZmodRelayComL_0;

  wire ZmodAdcClkIn_n_0;
  wire ZmodAdcClkIn_p_0;
  wire ZmodDAC_ClkIO_0;
  wire ZmodDAC_ClkIn_0;
  wire [31:0]ZmodScopeController_0_cDataAxisTdata;
  wire ZmodScopeController_0_cDataAxisTvalid;
  wire btn_ctrl_i_0;
  wire clk_in1_0;
  wire clk_wiz_0_clk_out1;
  wire clk_wiz_0_clk_out3;
  wire [13:0]dZmodADC_Data_0;
  wire [13:0]dZmodDAC_Data_0;
  wire iZmodSync_0;
  wire [31:0]pam2_dac_tester_top_0_m_axis_TDATA;
  wire pam2_dac_tester_top_0_m_axis_TREADY;
  wire pam2_dac_tester_top_0_m_axis_TVALID;
  wire [0:0]proc_sys_reset_0_peripheral_aresetn;
  wire reset_rtl_0_0;
  wire sZmodADC_CS_0;
  wire sZmodADC_SDIO_0;
  wire sZmodADC_Sclk_0;
  wire sZmodCh1CouplingH_0;
  wire sZmodCh1CouplingL_0;
  wire sZmodCh1GainH_0;
  wire sZmodCh1GainL_0;
  wire sZmodCh2CouplingH_0;
  wire sZmodCh2CouplingL_0;
  wire sZmodCh2GainH_0;
  wire sZmodCh2GainL_0;
  wire sZmodDAC_CS_0;
  wire sZmodDAC_EnOut_0;
  wire sZmodDAC_Reset_0;
  wire sZmodDAC_SCLK_0;
  wire sZmodDAC_SDIO_0;
  wire sZmodDAC_SetFS1_0;
  wire sZmodDAC_SetFS2_0;
  wire sZmodRelayComH_0;
  wire sZmodRelayComL_0;
  wire [0:0]xlconstant_0_dout;
  wire [0:0]xlconstant_1_dout;
  wire [0:0]xlconstant_2_dout;

  design_1_ZmodAWGController_0_0 ZmodAWGController_0
       (.DAC_Clk(clk_wiz_0_clk_out3),
        .DAC_InIO_Clk(clk_wiz_0_clk_out1),
        .SysClk100(clk_wiz_0_clk_out1),
        .ZmodDAC_ClkIO(ZmodDAC_ClkIO_0),
        .ZmodDAC_ClkIn(ZmodDAC_ClkIn_0),
        .aRst_n(proc_sys_reset_0_peripheral_aresetn),
        .cDataAxisTdata(pam2_dac_tester_top_0_m_axis_TDATA),
        .cDataAxisTready(pam2_dac_tester_top_0_m_axis_TREADY),
        .cDataAxisTvalid(pam2_dac_tester_top_0_m_axis_TVALID),
        .dZmodDAC_Data(dZmodDAC_Data_0),
        .sDAC_EnIn(xlconstant_1_dout),
        .sTestMode(xlconstant_0_dout),
        .sZmodDAC_CS(sZmodDAC_CS_0),
        .sZmodDAC_EnOut(sZmodDAC_EnOut_0),
        .sZmodDAC_Reset(sZmodDAC_Reset_0),
        .sZmodDAC_SCLK(sZmodDAC_SCLK_0),
        .sZmodDAC_SDIO(sZmodDAC_SDIO_0),
        .sZmodDAC_SetFS1(sZmodDAC_SetFS1_0),
        .sZmodDAC_SetFS2(sZmodDAC_SetFS2_0));
  design_1_ZmodScopeController_0_0 ZmodScopeController_0
       (.ADC_InClk(clk_wiz_0_clk_out1),
        .ADC_SamplingClk(clk_wiz_0_clk_out1),
        .SysClk100(clk_wiz_0_clk_out1),
        .ZmodAdcClkIn_n(ZmodAdcClkIn_n_0),
        .ZmodAdcClkIn_p(ZmodAdcClkIn_p_0),
        .ZmodDcoClk(clk_wiz_0_clk_out1),
        .aRst_n(proc_sys_reset_0_peripheral_aresetn),
        .cDataAxisTdata(ZmodScopeController_0_cDataAxisTdata),
        .cDataAxisTvalid(ZmodScopeController_0_cDataAxisTvalid),
        .dZmodADC_Data(dZmodADC_Data_0),
        .iZmodSync(iZmodSync_0),
        .sCh1CouplingConfig(xlconstant_0_dout),
        .sCh1GainConfig(xlconstant_0_dout),
        .sCh2CouplingConfig(xlconstant_0_dout),
        .sCh2GainConfig(xlconstant_0_dout),
        .sEnableAcquisition(xlconstant_1_dout),
        .sTestMode(xlconstant_0_dout),
        .sZmodADC_CS(sZmodADC_CS_0),
        .sZmodADC_SDIO(sZmodADC_SDIO_0),
        .sZmodADC_Sclk(sZmodADC_Sclk_0),
        .sZmodCh1CouplingH(sZmodCh1CouplingH_0),
        .sZmodCh1CouplingL(sZmodCh1CouplingL_0),
        .sZmodCh1GainH(sZmodCh1GainH_0),
        .sZmodCh1GainL(sZmodCh1GainL_0),
        .sZmodCh2CouplingH(sZmodCh2CouplingH_0),
        .sZmodCh2CouplingL(sZmodCh2CouplingL_0),
        .sZmodCh2GainH(sZmodCh2GainH_0),
        .sZmodCh2GainL(sZmodCh2GainL_0),
        .sZmodRelayComH(sZmodRelayComH_0),
        .sZmodRelayComL(sZmodRelayComL_0));
  design_1_clk_wiz_0_0 clk_wiz_0
       (.clk_in1(clk_in1_0),
        .clk_out1(clk_wiz_0_clk_out1),
        .clk_out3(clk_wiz_0_clk_out3),
        .reset(reset_rtl_0_0));
  design_1_ila_0_0 ila_0
       (.clk(clk_wiz_0_clk_out1),
        .probe0(ZmodScopeController_0_cDataAxisTdata),
        .probe1(ZmodScopeController_0_cDataAxisTvalid));
  design_1_pam2_dac_tester_top_0_0 pam2_dac_tester_top_0
       (.btn_ctrl_i(btn_ctrl_i_0),
        .m_axis_aclk(clk_wiz_0_clk_out1),
        .m_axis_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .m_axis_tdata(pam2_dac_tester_top_0_m_axis_TDATA),
        .m_axis_tready(pam2_dac_tester_top_0_m_axis_TREADY),
        .m_axis_tvalid(pam2_dac_tester_top_0_m_axis_TVALID));
  design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(1'b1),
        .dcm_locked(xlconstant_2_dout),
        .ext_reset_in(reset_rtl_0_0),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(proc_sys_reset_0_peripheral_aresetn),
        .slowest_sync_clk(clk_wiz_0_clk_out1));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
  design_1_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
  design_1_xlconstant_2_0 xlconstant_2
       (.dout(xlconstant_2_dout));
endmodule
