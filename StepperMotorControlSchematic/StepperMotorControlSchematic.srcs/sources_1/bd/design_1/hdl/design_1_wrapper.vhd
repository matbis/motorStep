--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
--Date        : Wed Jan 27 15:55:41 2016
--Host        : asus running 64-bit major release  (build 9200)
--Command     : generate_target design_1_wrapper.bd
--Design      : design_1_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_wrapper is
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
end design_1_wrapper;

architecture STRUCTURE of design_1_wrapper is
  component design_1 is
  port (
    b_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    c_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    a_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    d_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    stepDone_out_V : out STD_LOGIC_VECTOR ( 0 to 0 );
    doStep_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    doRewind_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    stopRewind_in_V : in STD_LOGIC_VECTOR ( 0 to 0 );
    sys_clock : in STD_LOGIC;
    reset_rtl : in STD_LOGIC;
    SEL : in STD_LOGIC;
    full_step_in_V : in STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component design_1;
begin
design_1_i: component design_1
    port map (
      SEL => SEL,
      a_out_V(0) => a_out_V(0),
      b_out_V(0) => b_out_V(0),
      c_out_V(0) => c_out_V(0),
      d_out_V(0) => d_out_V(0),
      doRewind_in_V(0) => doRewind_in_V(0),
      doStep_in_V(0) => doStep_in_V(0),
      full_step_in_V(0) => full_step_in_V(0),
      reset_rtl => reset_rtl,
      stepDone_out_V(0) => stepDone_out_V(0),
      stopRewind_in_V(0) => stopRewind_in_V(0),
      sys_clock => sys_clock
    );
end STRUCTURE;
