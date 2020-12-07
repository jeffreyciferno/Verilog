//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
//Date        : Tue Feb 18 16:40:19 2020
//Host        : EN4165515-215 running 64-bit major release  (build 9200)
//Command     : generate_target segment_c_0.bd
//Design      : segment_c_0
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "segment_c_0,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=segment_c_0,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "segment_c_0.hwdef" *) 
module segment_c_0
   (D0,
    D1,
    D2,
    D3,
    S);
  input D0;
  input D1;
  input D2;
  input D3;
  output S;

  wire D0_1;
  wire D1_1;
  wire D2_1;
  wire D3_1;
  wire xup_inv_0_y;
  wire xup_inv_1_y;
  wire xup_or4_0_y;

  assign D0_1 = D0;
  assign D1_1 = D1;
  assign D2_1 = D2;
  assign D3_1 = D3;
  assign S = xup_inv_1_y;
  segment_c_0_xup_inv_0_0 xup_inv_0
       (.a(D1_1),
        .y(xup_inv_0_y));
  segment_c_0_xup_inv_1_0 xup_inv_1
       (.a(xup_or4_0_y),
        .y(xup_inv_1_y));
  segment_c_0_xup_or4_0_0 xup_or4_0
       (.a(D3_1),
        .b(D2_1),
        .c(xup_inv_0_y),
        .d(D0_1),
        .y(xup_or4_0_y));
endmodule
