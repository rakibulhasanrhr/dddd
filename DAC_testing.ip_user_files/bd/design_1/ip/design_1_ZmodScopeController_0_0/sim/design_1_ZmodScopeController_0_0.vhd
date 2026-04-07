-- (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of AMD and is protected under U.S. and international copyright
-- and other intellectual property laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- AMD, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) AMD shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or AMD had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- AMD products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of AMD products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: digilent.com:user:ZmodScopeController:1.2
-- IP Revision: 4

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_ZmodScopeController_0_0 IS
  PORT (
    SysClk100 : IN STD_LOGIC;
    ADC_SamplingClk : IN STD_LOGIC;
    ADC_InClk : IN STD_LOGIC;
    aRst_n : IN STD_LOGIC;
    sRstBusy : OUT STD_LOGIC;
    sInitDoneADC : OUT STD_LOGIC;
    sConfigError : OUT STD_LOGIC;
    sInitDoneRelay : OUT STD_LOGIC;
    sEnableAcquisition : IN STD_LOGIC;
    sDataOverflow : OUT STD_LOGIC;
    cDataAxisTvalid : OUT STD_LOGIC;
    cDataAxisTready : IN STD_LOGIC;
    cDataAxisTdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    sCh1CouplingConfig : IN STD_LOGIC;
    sCh2CouplingConfig : IN STD_LOGIC;
    sCh1GainConfig : IN STD_LOGIC;
    sCh2GainConfig : IN STD_LOGIC;
    sTestMode : IN STD_LOGIC;
    ZmodAdcClkIn_p : OUT STD_LOGIC;
    ZmodAdcClkIn_n : OUT STD_LOGIC;
    iZmodSync : OUT STD_LOGIC;
    ZmodDcoClk : IN STD_LOGIC;
    dZmodADC_Data : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    sZmodADC_SDIO : INOUT STD_LOGIC;
    sZmodADC_CS : OUT STD_LOGIC;
    sZmodADC_Sclk : OUT STD_LOGIC;
    sZmodCh1CouplingH : OUT STD_LOGIC;
    sZmodCh1CouplingL : OUT STD_LOGIC;
    sZmodCh2CouplingH : OUT STD_LOGIC;
    sZmodCh2CouplingL : OUT STD_LOGIC;
    sZmodCh1GainH : OUT STD_LOGIC;
    sZmodCh1GainL : OUT STD_LOGIC;
    sZmodCh2GainH : OUT STD_LOGIC;
    sZmodCh2GainL : OUT STD_LOGIC;
    sZmodRelayComH : OUT STD_LOGIC;
    sZmodRelayComL : OUT STD_LOGIC
  );
END design_1_ZmodScopeController_0_0;

ARCHITECTURE design_1_ZmodScopeController_0_0_arch OF design_1_ZmodScopeController_0_0 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_ZmodScopeController_0_0_arch: ARCHITECTURE IS "yes";
  COMPONENT ZmodScopeController IS
    GENERIC (
      kSamplingPeriod : INTEGER;
      kADC_ClkDiv : INTEGER;
      kADC_Width : INTEGER;
      kExtRelayConfigEn : BOOLEAN;
      kExtCalibEn : BOOLEAN;
      kExtCmdInterfaceEn : BOOLEAN;
      kExtSyncEn : BOOLEAN;
      kCh1CouplingStatic : STD_LOGIC;
      kCh2CouplingStatic : STD_LOGIC;
      kCh1GainStatic : STD_LOGIC;
      kCh2GainStatic : STD_LOGIC;
      kCh1LgMultCoefStatic : STD_LOGIC_VECTOR(19 DOWNTO 0);
      kCh1LgAddCoefStatic : STD_LOGIC_VECTOR(19 DOWNTO 0);
      kCh1HgMultCoefStatic : STD_LOGIC_VECTOR(19 DOWNTO 0);
      kCh1HgAddCoefStatic : STD_LOGIC_VECTOR(19 DOWNTO 0);
      kCh2LgMultCoefStatic : STD_LOGIC_VECTOR(19 DOWNTO 0);
      kCh2LgAddCoefStatic : STD_LOGIC_VECTOR(19 DOWNTO 0);
      kCh2HgMultCoefStatic : STD_LOGIC_VECTOR(19 DOWNTO 0);
      kCh2HgAddCoefStatic : STD_LOGIC_VECTOR(19 DOWNTO 0);
      kZmodID : INTEGER;
      kSimulation : BOOLEAN
    );
    PORT (
      SysClk100 : IN STD_LOGIC;
      ADC_SamplingClk : IN STD_LOGIC;
      ADC_InClk : IN STD_LOGIC;
      aRst_n : IN STD_LOGIC;
      sRstBusy : OUT STD_LOGIC;
      sInitDoneADC : OUT STD_LOGIC;
      sConfigError : OUT STD_LOGIC;
      sInitDoneRelay : OUT STD_LOGIC;
      sEnableAcquisition : IN STD_LOGIC;
      sDataOverflow : OUT STD_LOGIC;
      cDataAxisTvalid : OUT STD_LOGIC;
      cDataAxisTready : IN STD_LOGIC;
      cDataAxisTdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      cExtCh1LgMultCoef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      cExtCh1LgAddCoef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      cExtCh1HgMultCoef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      cExtCh1HgAddCoef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      cExtCh2LgMultCoef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      cExtCh2LgAddCoef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      cExtCh2HgMultCoef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      cExtCh2HgAddCoef : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
      sCh1CouplingConfig : IN STD_LOGIC;
      sCh2CouplingConfig : IN STD_LOGIC;
      sCh1GainConfig : IN STD_LOGIC;
      sCh2GainConfig : IN STD_LOGIC;
      sTestMode : IN STD_LOGIC;
      cSyncIn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
      sCmdTxAxisTvalid : IN STD_LOGIC;
      sCmdTxAxisTready : OUT STD_LOGIC;
      sCmdTxAxisTdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      sCmdRxAxisTvalid : OUT STD_LOGIC;
      sCmdRxAxisTready : IN STD_LOGIC;
      sCmdRxAxisTdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      ZmodAdcClkIn_p : OUT STD_LOGIC;
      ZmodAdcClkIn_n : OUT STD_LOGIC;
      iZmodSync : OUT STD_LOGIC;
      ZmodDcoClk : IN STD_LOGIC;
      dZmodADC_Data : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
      sZmodADC_SDIO : INOUT STD_LOGIC;
      sZmodADC_CS : OUT STD_LOGIC;
      sZmodADC_Sclk : OUT STD_LOGIC;
      sZmodCh1CouplingH : OUT STD_LOGIC;
      sZmodCh1CouplingL : OUT STD_LOGIC;
      sZmodCh2CouplingH : OUT STD_LOGIC;
      sZmodCh2CouplingL : OUT STD_LOGIC;
      sZmodCh1GainH : OUT STD_LOGIC;
      sZmodCh1GainL : OUT STD_LOGIC;
      sZmodCh2GainH : OUT STD_LOGIC;
      sZmodCh2GainL : OUT STD_LOGIC;
      sZmodRelayComH : OUT STD_LOGIC;
      sZmodRelayComL : OUT STD_LOGIC
    );
  END COMPONENT ZmodScopeController;
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_MODE : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ADC_InClk: SIGNAL IS "xilinx.com:signal:clock:1.0 ADC_InClk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF ADC_InClk: SIGNAL IS "slave ADC_InClk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ADC_InClk: SIGNAL IS "XIL_INTERFACENAME ADC_InClk, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ADC_SamplingClk: SIGNAL IS "xilinx.com:signal:clock:1.0 ADC_SamplingClk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF ADC_SamplingClk: SIGNAL IS "slave ADC_SamplingClk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ADC_SamplingClk: SIGNAL IS "XIL_INTERFACENAME ADC_SamplingClk, ASSOCIATED_BUSIF DataStream, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF SysClk100: SIGNAL IS "xilinx.com:signal:clock:1.0 SysClk100 CLK";
  ATTRIBUTE X_INTERFACE_MODE OF SysClk100: SIGNAL IS "slave SysClk100";
  ATTRIBUTE X_INTERFACE_PARAMETER OF SysClk100: SIGNAL IS "XIL_INTERFACENAME SysClk100, ASSOCIATED_BUSIF SPI_IAP_TX:SPI_IAP_RX, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF ZmodDcoClk: SIGNAL IS "xilinx.com:signal:clock:1.0 ZmodDcoClk CLK";
  ATTRIBUTE X_INTERFACE_MODE OF ZmodDcoClk: SIGNAL IS "slave ZmodDcoClk";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ZmodDcoClk: SIGNAL IS "XIL_INTERFACENAME ZmodDcoClk, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF aRst_n: SIGNAL IS "xilinx.com:signal:reset:1.0 aRst_n RST";
  ATTRIBUTE X_INTERFACE_MODE OF aRst_n: SIGNAL IS "slave aRst_n";
  ATTRIBUTE X_INTERFACE_PARAMETER OF aRst_n: SIGNAL IS "XIL_INTERFACENAME aRst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  ATTRIBUTE X_INTERFACE_INFO OF cDataAxisTdata: SIGNAL IS "xilinx.com:interface:axis:1.0 DataStream TDATA";
  ATTRIBUTE X_INTERFACE_INFO OF cDataAxisTready: SIGNAL IS "xilinx.com:interface:axis:1.0 DataStream TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF cDataAxisTvalid: SIGNAL IS "xilinx.com:interface:axis:1.0 DataStream TVALID";
  ATTRIBUTE X_INTERFACE_MODE OF cDataAxisTvalid: SIGNAL IS "master DataStream";
  ATTRIBUTE X_INTERFACE_PARAMETER OF cDataAxisTvalid: SIGNAL IS "XIL_INTERFACENAME DataStream, TDATA_NUM_BYTES 4, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_0_clk_out1, LAYERED_METADATA undef, INSERT_VIP 0";
BEGIN
  U0 : ZmodScopeController
    GENERIC MAP (
      kSamplingPeriod => 20000,
      kADC_ClkDiv => 4,
      kADC_Width => 14,
      kExtRelayConfigEn => true,
      kExtCalibEn => false,
      kExtCmdInterfaceEn => false,
      kExtSyncEn => false,
      kCh1CouplingStatic => '0',
      kCh2CouplingStatic => '0',
      kCh1GainStatic => '0',
      kCh2GainStatic => '0',
      kCh1LgMultCoefStatic => X"10000",
      kCh1LgAddCoefStatic => X"00000",
      kCh1HgMultCoefStatic => X"10000",
      kCh1HgAddCoefStatic => X"00000",
      kCh2LgMultCoefStatic => X"10000",
      kCh2LgAddCoefStatic => X"00000",
      kCh2HgMultCoefStatic => X"10000",
      kCh2HgAddCoefStatic => X"00000",
      kZmodID => 0,
      kSimulation => false
    )
    PORT MAP (
      SysClk100 => SysClk100,
      ADC_SamplingClk => ADC_SamplingClk,
      ADC_InClk => ADC_InClk,
      aRst_n => aRst_n,
      sRstBusy => sRstBusy,
      sInitDoneADC => sInitDoneADC,
      sConfigError => sConfigError,
      sInitDoneRelay => sInitDoneRelay,
      sEnableAcquisition => sEnableAcquisition,
      sDataOverflow => sDataOverflow,
      cDataAxisTvalid => cDataAxisTvalid,
      cDataAxisTready => cDataAxisTready,
      cDataAxisTdata => cDataAxisTdata,
      cExtCh1LgMultCoef => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      cExtCh1LgAddCoef => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      cExtCh1HgMultCoef => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      cExtCh1HgAddCoef => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      cExtCh2LgMultCoef => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      cExtCh2LgAddCoef => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      cExtCh2HgMultCoef => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      cExtCh2HgAddCoef => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 18)),
      sCh1CouplingConfig => sCh1CouplingConfig,
      sCh2CouplingConfig => sCh2CouplingConfig,
      sCh1GainConfig => sCh1GainConfig,
      sCh2GainConfig => sCh2GainConfig,
      sTestMode => sTestMode,
      cSyncIn => STD_LOGIC_VECTOR(TO_UNSIGNED(1, 4)),
      sCmdTxAxisTvalid => '0',
      sCmdTxAxisTdata => STD_LOGIC_VECTOR(TO_UNSIGNED(0, 32)),
      sCmdRxAxisTready => '0',
      ZmodAdcClkIn_p => ZmodAdcClkIn_p,
      ZmodAdcClkIn_n => ZmodAdcClkIn_n,
      iZmodSync => iZmodSync,
      ZmodDcoClk => ZmodDcoClk,
      dZmodADC_Data => dZmodADC_Data,
      sZmodADC_SDIO => sZmodADC_SDIO,
      sZmodADC_CS => sZmodADC_CS,
      sZmodADC_Sclk => sZmodADC_Sclk,
      sZmodCh1CouplingH => sZmodCh1CouplingH,
      sZmodCh1CouplingL => sZmodCh1CouplingL,
      sZmodCh2CouplingH => sZmodCh2CouplingH,
      sZmodCh2CouplingL => sZmodCh2CouplingL,
      sZmodCh1GainH => sZmodCh1GainH,
      sZmodCh1GainL => sZmodCh1GainL,
      sZmodCh2GainH => sZmodCh2GainH,
      sZmodCh2GainL => sZmodCh2GainL,
      sZmodRelayComH => sZmodRelayComH,
      sZmodRelayComL => sZmodRelayComL
    );
END design_1_ZmodScopeController_0_0_arch;
