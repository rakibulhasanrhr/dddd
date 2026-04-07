// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module design_1 (
  clk_in1_0,
  reset_rtl_0_0,
  sZmodDAC_SetFS1_0,
  ZmodDAC_ClkIO_0,
  sZmodDAC_SDIO_0,
  sZmodDAC_Reset_0,
  sZmodDAC_CS_0,
  sZmodDAC_SCLK_0,
  sZmodDAC_SetFS2_0,
  sZmodDAC_EnOut_0,
  ZmodDAC_ClkIn_0,
  btn_ctrl_i_0,
  dZmodDAC_Data_0,
  ZmodAdcClkIn_n_0,
  ZmodAdcClkIn_p_0,
  dZmodADC_Data_0,
  iZmodSync_0,
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
  sZmodRelayComH_0,
  sZmodRelayComL_0
);

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_IN1_0 CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK_IN1_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_IN1_0, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_sys_clock, INSERT_VIP 0" *)
  input clk_in1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL_0_0 RST" *)
  (* X_INTERFACE_MODE = "slave RST.RESET_RTL_0_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL_0_0, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *)
  input reset_rtl_0_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodDAC_SetFS1_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ZMODDAC_CLKIO_0 CLK" *)
  (* X_INTERFACE_MODE = "master CLK.ZMODDAC_CLKIO_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ZMODDAC_CLKIO_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ZmodAWGController_0_0_ZmodDAC_ClkIO, INSERT_VIP 0" *)
  output ZmodDAC_ClkIO_0;
  (* X_INTERFACE_IGNORE = "true" *)
  inout sZmodDAC_SDIO_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SZMODDAC_RESET_0 RST" *)
  (* X_INTERFACE_MODE = "master RST.SZMODDAC_RESET_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SZMODDAC_RESET_0, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  output sZmodDAC_Reset_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodDAC_CS_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodDAC_SCLK_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodDAC_SetFS2_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodDAC_EnOut_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ZMODDAC_CLKIN_0 CLK" *)
  (* X_INTERFACE_MODE = "master CLK.ZMODDAC_CLKIN_0" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ZMODDAC_CLKIN_0, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ZmodAWGController_0_0_ZmodDAC_ClkIn, INSERT_VIP 0" *)
  output ZmodDAC_ClkIn_0;
  (* X_INTERFACE_IGNORE = "true" *)
  input btn_ctrl_i_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output [13:0]dZmodDAC_Data_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output ZmodAdcClkIn_n_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output ZmodAdcClkIn_p_0;
  (* X_INTERFACE_IGNORE = "true" *)
  input [13:0]dZmodADC_Data_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output iZmodSync_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodADC_CS_0;
  (* X_INTERFACE_IGNORE = "true" *)
  inout sZmodADC_SDIO_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodADC_Sclk_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodCh1CouplingH_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodCh1CouplingL_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodCh1GainH_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodCh1GainL_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodCh2CouplingH_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodCh2CouplingL_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodCh2GainH_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodCh2GainL_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodRelayComH_0;
  (* X_INTERFACE_IGNORE = "true" *)
  output sZmodRelayComL_0;

  // stub module has no contents

endmodule
