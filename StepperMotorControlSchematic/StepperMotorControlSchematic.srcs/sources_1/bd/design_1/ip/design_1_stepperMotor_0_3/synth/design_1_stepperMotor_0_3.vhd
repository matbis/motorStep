-- (c) Copyright 1995-2016 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: xilinx.com:hls:stepperMotor:1.0
-- IP Revision: 1601261628

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY design_1_stepperMotor_0_3 IS
  PORT (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    doStep_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    doRewind_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    stopRewind_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    nSteps_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    delayDuration_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    full_step_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    a_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    b_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    c_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    d_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    stepDone_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END design_1_stepperMotor_0_3;

ARCHITECTURE design_1_stepperMotor_0_3_arch OF design_1_stepperMotor_0_3 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : string;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF design_1_stepperMotor_0_3_arch: ARCHITECTURE IS "yes";

  COMPONENT stepperMotor IS
    PORT (
      ap_clk : IN STD_LOGIC;
      ap_rst : IN STD_LOGIC;
      doStep_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      doRewind_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      stopRewind_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      nSteps_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      delayDuration_in : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
      full_step_in_V : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
      a_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      b_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      c_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      d_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
      stepDone_out_V : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
    );
  END COMPONENT stepperMotor;
  ATTRIBUTE X_CORE_INFO : STRING;
  ATTRIBUTE X_CORE_INFO OF design_1_stepperMotor_0_3_arch: ARCHITECTURE IS "stepperMotor,Vivado 2014.4";
  ATTRIBUTE CHECK_LICENSE_TYPE : STRING;
  ATTRIBUTE CHECK_LICENSE_TYPE OF design_1_stepperMotor_0_3_arch : ARCHITECTURE IS "design_1_stepperMotor_0_3,stepperMotor,{}";
  ATTRIBUTE CORE_GENERATION_INFO : STRING;
  ATTRIBUTE CORE_GENERATION_INFO OF design_1_stepperMotor_0_3_arch: ARCHITECTURE IS "design_1_stepperMotor_0_3,stepperMotor,{x_ipProduct=Vivado 2014.4,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=stepperMotor,x_ipVersion=1.0,x_ipCoreRevision=1601261628,x_ipLanguage=VHDL,x_ipSimLanguage=MIXED}";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF ap_clk: SIGNAL IS "xilinx.com:signal:clock:1.0 ap_clk CLK";
  ATTRIBUTE X_INTERFACE_INFO OF ap_rst: SIGNAL IS "xilinx.com:signal:reset:1.0 ap_rst RST";
  ATTRIBUTE X_INTERFACE_INFO OF doStep_in_V: SIGNAL IS "xilinx.com:signal:data:1.0 doStep_in_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF doRewind_in_V: SIGNAL IS "xilinx.com:signal:data:1.0 doRewind_in_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF stopRewind_in_V: SIGNAL IS "xilinx.com:signal:data:1.0 stopRewind_in_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF nSteps_in: SIGNAL IS "xilinx.com:signal:data:1.0 nSteps_in DATA";
  ATTRIBUTE X_INTERFACE_INFO OF delayDuration_in: SIGNAL IS "xilinx.com:signal:data:1.0 delayDuration_in DATA";
  ATTRIBUTE X_INTERFACE_INFO OF full_step_in_V: SIGNAL IS "xilinx.com:signal:data:1.0 full_step_in_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF a_out_V: SIGNAL IS "xilinx.com:signal:data:1.0 a_out_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF b_out_V: SIGNAL IS "xilinx.com:signal:data:1.0 b_out_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF c_out_V: SIGNAL IS "xilinx.com:signal:data:1.0 c_out_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF d_out_V: SIGNAL IS "xilinx.com:signal:data:1.0 d_out_V DATA";
  ATTRIBUTE X_INTERFACE_INFO OF stepDone_out_V: SIGNAL IS "xilinx.com:signal:data:1.0 stepDone_out_V DATA";
BEGIN
  U0 : stepperMotor
    PORT MAP (
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      doStep_in_V => doStep_in_V,
      doRewind_in_V => doRewind_in_V,
      stopRewind_in_V => stopRewind_in_V,
      nSteps_in => nSteps_in,
      delayDuration_in => delayDuration_in,
      full_step_in_V => full_step_in_V,
      a_out_V => a_out_V,
      b_out_V => b_out_V,
      c_out_V => c_out_V,
      d_out_V => d_out_V,
      stepDone_out_V => stepDone_out_V
    );
END design_1_stepperMotor_0_3_arch;
