//Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2014.4 (win64) Build 1071353 Tue Nov 18 18:24:04 MST 2014
//Date        : Sat Jan 23 17:09:29 2016
//Host        : asus running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
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

  wire [0:0]a_out_V;
  wire [0:0]b_out_V;
  wire [0:0]c_out_V;
  wire [0:0]d_out_V;
  wire [0:0]doRewind_in_V;
  wire [0:0]doStep_in_V;
  wire reset_rtl;
  wire [0:0]stepDone_out_V;
  wire [0:0]stopRewind_in_V;
  wire sys_clock;

design_1 design_1_i
       (.a_out_V(a_out_V),
        .b_out_V(b_out_V),
        .c_out_V(c_out_V),
        .d_out_V(d_out_V),
        .doRewind_in_V(doRewind_in_V),
        .doStep_in_V(doStep_in_V),
        .reset_rtl(reset_rtl),
        .stepDone_out_V(stepDone_out_V),
        .stopRewind_in_V(stopRewind_in_V),
        .sys_clock(sys_clock));
endmodule
