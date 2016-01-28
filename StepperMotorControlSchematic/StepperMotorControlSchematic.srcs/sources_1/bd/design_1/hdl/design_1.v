//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
//Date        : Sat Jan 23 17:09:29 2016
//Host        : asus running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1
   (a_out_V,
    b_out_V,
    c_out_V,
    d_out_V,
    doRewind_in_V,
    doStep_in_V,
    reset_rtl,
    stepDone_out_V,
    stopRewind_in_V,
    sys_clock);
  output [0:0]a_out_V;
  output [0:0]b_out_V;
  output [0:0]c_out_V;
  output [0:0]d_out_V;
  input [0:0]doRewind_in_V;
  input [0:0]doStep_in_V;
  input reset_rtl;
  output [0:0]stepDone_out_V;
  input [0:0]stopRewind_in_V;
  input sys_clock;

  wire GND_1;
  wire VCC_1;
  wire [0:0]doRewind_in_V_1;
  wire [0:0]doStep_in_V_1;
  wire proc_sys_reset_0_mb_reset;
  wire reset_rtl_1;
  wire [0:0]stepperMotor_0_a_out_V;
  wire [0:0]stepperMotor_0_b_out_V;
  wire [0:0]stepperMotor_0_c_out_V;
  wire [0:0]stepperMotor_0_d_out_V;
  wire [0:0]stepperMotor_0_stepDone_out_V;
  wire [0:0]stopRewind_in_V_1;
  wire sys_clock_1;
  wire [31:0]xlconstant_0_dout;
  wire [31:0]xlconstant_1_dout;

  assign a_out_V[0] = stepperMotor_0_a_out_V;
  assign b_out_V[0] = stepperMotor_0_b_out_V;
  assign c_out_V[0] = stepperMotor_0_c_out_V;
  assign d_out_V[0] = stepperMotor_0_d_out_V;
  assign doRewind_in_V_1 = doRewind_in_V[0];
  assign doStep_in_V_1 = doStep_in_V[0];
  assign reset_rtl_1 = reset_rtl;
  assign stepDone_out_V[0] = stepperMotor_0_stepDone_out_V;
  assign stopRewind_in_V_1 = stopRewind_in_V[0];
  assign sys_clock_1 = sys_clock;
GND GND
       (.G(GND_1));
VCC VCC
       (.P(VCC_1));
design_1_proc_sys_reset_0_0 proc_sys_reset_0
       (.aux_reset_in(VCC_1),
        .dcm_locked(VCC_1),
        .ext_reset_in(reset_rtl_1),
        .mb_debug_sys_rst(GND_1),
        .mb_reset(proc_sys_reset_0_mb_reset),
        .slowest_sync_clk(sys_clock_1));
design_1_stepperMotor_0_3 stepperMotor_0
       (.a_out_V(stepperMotor_0_a_out_V),
        .ap_clk(sys_clock_1),
        .ap_rst(proc_sys_reset_0_mb_reset),
        .b_out_V(stepperMotor_0_b_out_V),
        .c_out_V(stepperMotor_0_c_out_V),
        .d_out_V(stepperMotor_0_d_out_V),
        .delayDuration_in(xlconstant_0_dout),
        .doRewind_in_V(doRewind_in_V_1),
        .doStep_in_V(doStep_in_V_1),
        .nSteps_in(xlconstant_1_dout),
        .stepDone_out_V(stepperMotor_0_stepDone_out_V),
        .stopRewind_in_V(stopRewind_in_V_1));
design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
design_1_xlconstant_1_0 xlconstant_1
       (.dout(xlconstant_1_dout));
endmodule
