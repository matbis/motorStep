--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
--Date        : Wed Jan 27 15:55:41 2016
--Host        : asus running 64-bit major release  (build 9200)
--Command     : generate_target design_1.bd
--Design      : design_1
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1 is
  port (
    SEL : in STD_LOGIC;
    a_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    b_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    c_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    d_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    doRewind_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    doStep_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    full_step_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    reset_rtl : in STD_LOGIC;
    stepDone_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    stopRewind_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    sys_clock : in STD_LOGIC
  );
end design_1;

architecture STRUCTURE of design_1 is
  component design_1_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_xlconstant_0_0;
  component design_1_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_xlconstant_1_0;
  component design_1_proc_sys_reset_0_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_proc_sys_reset_0_0;
  component design_1_MUX_32_0_0 is
  port (
    SEL : in STD_LOGIC;
    A : in STD_LOGIC_VECTOR ( 31 downto 0 );
    B : in STD_LOGIC_VECTOR ( 31 downto 0 );
    X : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_MUX_32_0_0;
  component design_1_xlconstant_1_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component design_1_xlconstant_1_1;
  component design_1_stepperMotor_0_3 is
  port (
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    doStep_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    doRewind_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    stopRewind_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    nSteps_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    delayDuration_in : in STD_LOGIC_VECTOR ( 31 downto 0 );
    full_step_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    a_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    b_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    c_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    d_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    stepDone_out_V : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1_stepperMotor_0_3;
  signal GND_1 : STD_LOGIC;
  signal MUX_32_0_X : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal SEL_1 : STD_LOGIC;
  signal VCC_1 : STD_LOGIC;
  signal doRewind_in_V_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal doStep_in_V_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal full_step_in_V_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal proc_sys_reset_0_mb_reset : STD_LOGIC;
  signal reset_rtl_1 : STD_LOGIC;
  signal stepperMotor_0_a_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
  signal stepperMotor_0_b_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
  signal stepperMotor_0_c_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
  signal stepperMotor_0_d_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
  signal stepperMotor_0_stepDone_out_V : STD_LOGIC_VECTOR ( 0 to 0 );
  signal stopRewind_in_V_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal sys_clock_1 : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal xlconstant_2_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_peripheral_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
begin
  SEL_1 <= SEL;
  a_out_V(0) <= stepperMotor_0_a_out_V(0);
  b_out_V(0) <= stepperMotor_0_b_out_V(0);
  c_out_V(0) <= stepperMotor_0_c_out_V(0);
  d_out_V(0) <= stepperMotor_0_d_out_V(0);
  doRewind_in_V_1(0) <= doRewind_in_V(0);
  doStep_in_V_1(0) <= doStep_in_V(0);
  full_step_in_V_1(0) <= full_step_in_V(0);
  reset_rtl_1 <= reset_rtl;
  stepDone_out_V(0) <= stepperMotor_0_stepDone_out_V(0);
  stopRewind_in_V_1(0) <= stopRewind_in_V(0);
  sys_clock_1 <= sys_clock;
GND: unisim.vcomponents.GND
    port map (
      G => GND_1
    );
MUX_32_0: component design_1_MUX_32_0_0
    port map (
      A(31 downto 0) => xlconstant_1_dout(31 downto 0),
      B(31 downto 0) => xlconstant_2_dout(31 downto 0),
      SEL => SEL_1,
      X(31 downto 0) => MUX_32_0_X(31 downto 0)
    );
VCC: unisim.vcomponents.VCC
    port map (
      P => VCC_1
    );
proc_sys_reset_0: component design_1_proc_sys_reset_0_0
    port map (
      aux_reset_in => VCC_1,
      bus_struct_reset(0) => NLW_proc_sys_reset_0_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => VCC_1,
      ext_reset_in => reset_rtl_1,
      interconnect_aresetn(0) => NLW_proc_sys_reset_0_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => GND_1,
      mb_reset => proc_sys_reset_0_mb_reset,
      peripheral_aresetn(0) => NLW_proc_sys_reset_0_peripheral_aresetn_UNCONNECTED(0),
      peripheral_reset(0) => NLW_proc_sys_reset_0_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => sys_clock_1
    );
stepperMotor_0: component design_1_stepperMotor_0_3
    port map (
      a_out_V(0) => stepperMotor_0_a_out_V(0),
      ap_clk => sys_clock_1,
      ap_rst => proc_sys_reset_0_mb_reset,
      b_out_V(0) => stepperMotor_0_b_out_V(0),
      c_out_V(0) => stepperMotor_0_c_out_V(0),
      d_out_V(0) => stepperMotor_0_d_out_V(0),
      delayDuration_in(31 downto 0) => xlconstant_0_dout(31 downto 0),
      doRewind_in_V(0) => doRewind_in_V_1(0),
      doStep_in_V(0) => doStep_in_V_1(0),
      full_step_in_V(0) => full_step_in_V_1(0),
      nSteps_in(31 downto 0) => MUX_32_0_X(31 downto 0),
      stepDone_out_V(0) => stepperMotor_0_stepDone_out_V(0),
      stopRewind_in_V(0) => stopRewind_in_V_1(0)
    );
xlconstant_0: component design_1_xlconstant_0_0
    port map (
      dout(31 downto 0) => xlconstant_0_dout(31 downto 0)
    );
xlconstant_1: component design_1_xlconstant_1_0
    port map (
      dout(31 downto 0) => xlconstant_1_dout(31 downto 0)
    );
xlconstant_2: component design_1_xlconstant_1_1
    port map (
      dout(31 downto 0) => xlconstant_2_dout(31 downto 0)
    );
end STRUCTURE;
