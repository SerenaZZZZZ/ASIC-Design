/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar 31 01:08:46 2020
/////////////////////////////////////////////////////////////


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_package_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_package_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_package_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U7 ( .A(n4), .B(new_sample), .Y(start_bit_detected) );
  INVX2 U6 ( .A(old_sample), .Y(n4) );
endmodule


module rcu ( clk, n_rst, new_packet_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, new_packet_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n4, n6, n7, n8, n9, n10;
  wire   [2:0] state;
  wire   [2:0] nxt_state;

  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[2]  ( .D(nxt_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  NOR2X1 U13 ( .A(state[2]), .B(n11), .Y(sbc_clear) );
  OAI21X1 U14 ( .A(n12), .B(n13), .C(n7), .Y(nxt_state[2]) );
  NOR2X1 U15 ( .A(n14), .B(state[2]), .Y(sbc_enable) );
  NAND2X1 U16 ( .A(state[2]), .B(n8), .Y(n13) );
  NAND2X1 U17 ( .A(n14), .B(n4), .Y(n12) );
  NAND2X1 U18 ( .A(state[1]), .B(state[0]), .Y(n14) );
  NOR2X1 U19 ( .A(state[2]), .B(n8), .Y(nxt_state[1]) );
  OAI21X1 U20 ( .A(state[0]), .B(n10), .C(n11), .Y(n15) );
  OAI21X1 U21 ( .A(n16), .B(n17), .C(n18), .Y(nxt_state[0]) );
  NAND2X1 U22 ( .A(packet_done), .B(enable_timer), .Y(n18) );
  NAND2X1 U23 ( .A(n6), .B(n10), .Y(n17) );
  AOI22X1 U24 ( .A(state[2]), .B(n4), .C(new_packet_detected), .D(n9), .Y(n16)
         );
  NOR2X1 U25 ( .A(n11), .B(n9), .Y(load_buffer) );
  NAND2X1 U26 ( .A(state[0]), .B(n10), .Y(n11) );
  NAND3X1 U27 ( .A(n6), .B(n9), .C(state[1]), .Y(n19) );
  INVX2 U6 ( .A(framing_error), .Y(n4) );
  INVX2 U7 ( .A(n19), .Y(enable_timer) );
  INVX2 U8 ( .A(state[0]), .Y(n6) );
  INVX2 U9 ( .A(sbc_enable), .Y(n7) );
  INVX2 U10 ( .A(n15), .Y(n8) );
  INVX2 U11 ( .A(state[2]), .Y(n9) );
  INVX2 U12 ( .A(state[1]), .Y(n10) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_inc_1 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;
  wire   n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n21, n22, n23, n25, n26, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n40, n41, n42, n44, n45, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102;
  assign n5 = A[12];
  assign n11 = A[11];
  assign n15 = A[10];
  assign n21 = A[9];
  assign n25 = A[8];
  assign n30 = A[7];
  assign n34 = A[6];
  assign n40 = A[5];
  assign n44 = A[4];
  assign n49 = A[3];
  assign n52 = A[2];
  assign n56 = A[1];
  assign n58 = A[0];

  XNOR2X1 U4 ( .A(n7), .B(n6), .Y(SUM[12]) );
  XNOR2X1 U9 ( .A(n13), .B(n12), .Y(SUM[11]) );
  NOR2X1 U10 ( .A(n8), .B(n1), .Y(n7) );
  NOR2X1 U12 ( .A(n10), .B(n18), .Y(n9) );
  NAND2X1 U13 ( .A(n11), .B(n15), .Y(n10) );
  XNOR2X1 U16 ( .A(n17), .B(n16), .Y(SUM[10]) );
  NOR2X1 U17 ( .A(n14), .B(n1), .Y(n13) );
  NAND2X1 U18 ( .A(n94), .B(n19), .Y(n14) );
  XNOR2X1 U21 ( .A(n23), .B(n22), .Y(SUM[9]) );
  NOR2X1 U22 ( .A(n95), .B(n1), .Y(n17) );
  NAND2X1 U25 ( .A(n21), .B(n25), .Y(n18) );
  XNOR2X1 U33 ( .A(n32), .B(n31), .Y(SUM[7]) );
  NOR2X1 U35 ( .A(n29), .B(n37), .Y(n28) );
  NAND2X1 U36 ( .A(n30), .B(n34), .Y(n29) );
  XNOR2X1 U39 ( .A(n36), .B(n35), .Y(SUM[6]) );
  NOR2X1 U40 ( .A(n96), .B(n33), .Y(n32) );
  NAND2X1 U41 ( .A(n97), .B(n38), .Y(n33) );
  XNOR2X1 U44 ( .A(n42), .B(n41), .Y(SUM[5]) );
  NOR2X1 U45 ( .A(n96), .B(n99), .Y(n36) );
  NAND2X1 U48 ( .A(n40), .B(n44), .Y(n37) );
  XOR2X1 U51 ( .A(n96), .B(n45), .Y(SUM[4]) );
  NOR2X1 U52 ( .A(n96), .B(n45), .Y(n42) );
  XOR2X1 U56 ( .A(n51), .B(n50), .Y(SUM[3]) );
  NOR2X1 U58 ( .A(n55), .B(n48), .Y(n47) );
  NAND2X1 U59 ( .A(n49), .B(n52), .Y(n48) );
  XNOR2X1 U62 ( .A(n54), .B(n53), .Y(SUM[2]) );
  NAND2X1 U63 ( .A(n98), .B(n54), .Y(n51) );
  XNOR2X1 U66 ( .A(n57), .B(n100), .Y(SUM[1]) );
  NAND2X1 U68 ( .A(n58), .B(n56), .Y(n55) );
  INVX1 U75 ( .A(n40), .Y(n41) );
  INVX1 U76 ( .A(n5), .Y(n6) );
  INVX1 U77 ( .A(n25), .Y(n26) );
  NOR2X1 U78 ( .A(n26), .B(n1), .Y(n23) );
  XNOR2X1 U79 ( .A(n91), .B(A[13]), .Y(SUM[13]) );
  NAND2X1 U80 ( .A(n101), .B(n102), .Y(n91) );
  XNOR2X1 U81 ( .A(n92), .B(n26), .Y(SUM[8]) );
  INVX1 U82 ( .A(n1), .Y(n92) );
  NAND2X1 U83 ( .A(n58), .B(n56), .Y(n93) );
  INVX1 U84 ( .A(n16), .Y(n94) );
  INVX2 U85 ( .A(n15), .Y(n16) );
  INVX1 U86 ( .A(n19), .Y(n95) );
  INVX1 U87 ( .A(n11), .Y(n12) );
  OR2X2 U88 ( .A(n93), .B(n48), .Y(n96) );
  INVX1 U89 ( .A(n35), .Y(n97) );
  BUFX2 U90 ( .A(n52), .Y(n98) );
  INVX1 U91 ( .A(n38), .Y(n99) );
  INVX1 U92 ( .A(n56), .Y(n57) );
  INVX1 U93 ( .A(n52), .Y(n53) );
  INVX1 U94 ( .A(n49), .Y(n50) );
  INVX1 U95 ( .A(n30), .Y(n31) );
  INVX1 U96 ( .A(n9), .Y(n8) );
  INVX1 U97 ( .A(n34), .Y(n35) );
  INVX1 U98 ( .A(n21), .Y(n22) );
  INVX1 U99 ( .A(n18), .Y(n19) );
  INVX1 U100 ( .A(SUM[0]), .Y(n100) );
  INVX1 U101 ( .A(n44), .Y(n45) );
  INVX1 U102 ( .A(n93), .Y(n54) );
  INVX1 U103 ( .A(n37), .Y(n38) );
  AND2X2 U104 ( .A(n28), .B(n47), .Y(n101) );
  INVX4 U105 ( .A(n101), .Y(n1) );
  AND2X1 U106 ( .A(n9), .B(n5), .Y(n102) );
  INVX1 U107 ( .A(n58), .Y(SUM[0]) );
endmodule


module flex_counter_NUM_CNT_BITS14_DW01_dec_1 ( A, SUM );
  input [14:0] A;
  output [14:0] SUM;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n16, n17, n19, n20, n23, n24, n25,
         n26, n29, n30, n33, n34, n35, n39, n40, n45, n48, n49, n52, n53, n54,
         n56, n58, n59, n60, n63, n64, n65, n67, n68, n72, n74, n110, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124;
  assign n2 = A[13];
  assign n3 = A[12];
  assign n4 = A[11];
  assign n5 = A[10];
  assign n6 = A[9];
  assign n7 = A[8];
  assign n8 = A[7];
  assign n9 = A[6];
  assign n56 = A[5];
  assign n60 = A[4];
  assign n65 = A[3];
  assign n68 = A[2];
  assign n72 = A[1];
  assign n74 = A[0];

  XNOR2X1 U3 ( .A(n19), .B(n2), .Y(SUM[13]) );
  NOR2X1 U5 ( .A(n17), .B(n25), .Y(n16) );
  XNOR2X1 U9 ( .A(n23), .B(n3), .Y(SUM[12]) );
  NAND2X1 U10 ( .A(n20), .B(n1), .Y(n19) );
  NOR2X1 U11 ( .A(n3), .B(n25), .Y(n20) );
  XNOR2X1 U15 ( .A(n29), .B(n4), .Y(SUM[11]) );
  NAND2X1 U16 ( .A(n24), .B(n1), .Y(n23) );
  NAND2X1 U18 ( .A(n26), .B(n34), .Y(n25) );
  NOR2X1 U19 ( .A(n5), .B(n4), .Y(n26) );
  XNOR2X1 U23 ( .A(n33), .B(n5), .Y(SUM[10]) );
  NAND2X1 U24 ( .A(n30), .B(n1), .Y(n29) );
  NOR2X1 U25 ( .A(n5), .B(n35), .Y(n30) );
  NAND2X1 U30 ( .A(n34), .B(n1), .Y(n33) );
  NOR2X1 U33 ( .A(n7), .B(n6), .Y(n34) );
  XOR2X1 U37 ( .A(n110), .B(n7), .Y(SUM[8]) );
  NAND2X1 U38 ( .A(n40), .B(n1), .Y(n39) );
  XNOR2X1 U43 ( .A(n48), .B(n8), .Y(SUM[7]) );
  NOR2X1 U46 ( .A(n9), .B(n8), .Y(n45) );
  XNOR2X1 U50 ( .A(n52), .B(n9), .Y(SUM[6]) );
  NAND2X1 U51 ( .A(n117), .B(n49), .Y(n48) );
  NOR2X1 U52 ( .A(n9), .B(n54), .Y(n49) );
  XNOR2X1 U56 ( .A(n58), .B(n56), .Y(SUM[5]) );
  NAND2X1 U57 ( .A(n53), .B(n117), .Y(n52) );
  NOR2X1 U60 ( .A(n60), .B(n56), .Y(n53) );
  XOR2X1 U64 ( .A(n117), .B(n60), .Y(SUM[4]) );
  NAND2X1 U65 ( .A(n59), .B(n117), .Y(n58) );
  XOR2X1 U70 ( .A(n67), .B(n114), .Y(SUM[3]) );
  NAND2X1 U72 ( .A(SUM[0]), .B(n123), .Y(n63) );
  NOR2X1 U73 ( .A(n68), .B(n65), .Y(n64) );
  XNOR2X1 U77 ( .A(n124), .B(n113), .Y(SUM[2]) );
  NOR2X1 U78 ( .A(n68), .B(n124), .Y(n67) );
  XNOR2X1 U82 ( .A(n72), .B(n74), .Y(SUM[1]) );
  INVX4 U93 ( .A(n116), .Y(n1) );
  BUFX2 U94 ( .A(n1), .Y(n110) );
  AND2X2 U95 ( .A(n45), .B(n53), .Y(n112) );
  INVX1 U96 ( .A(n53), .Y(n54) );
  INVX2 U97 ( .A(n74), .Y(SUM[0]) );
  AND2X2 U98 ( .A(n16), .B(n110), .Y(SUM[14]) );
  INVX2 U99 ( .A(n72), .Y(n122) );
  BUFX2 U100 ( .A(n68), .Y(n113) );
  BUFX2 U101 ( .A(n65), .Y(n114) );
  INVX2 U102 ( .A(n39), .Y(n118) );
  NAND2X1 U103 ( .A(n112), .B(n115), .Y(n116) );
  INVX1 U104 ( .A(n63), .Y(n115) );
  AND2X2 U105 ( .A(SUM[0]), .B(n123), .Y(n117) );
  AND2X2 U106 ( .A(n122), .B(n64), .Y(n123) );
  NAND2X1 U107 ( .A(n39), .B(n6), .Y(n120) );
  NAND2X1 U108 ( .A(n118), .B(n119), .Y(n121) );
  NAND2X1 U109 ( .A(n121), .B(n120), .Y(SUM[9]) );
  INVX1 U110 ( .A(n6), .Y(n119) );
  NAND2X1 U111 ( .A(n122), .B(SUM[0]), .Y(n124) );
  OR2X2 U112 ( .A(n3), .B(n2), .Y(n17) );
  INVX1 U113 ( .A(n7), .Y(n40) );
  INVX1 U114 ( .A(n60), .Y(n59) );
  INVX2 U115 ( .A(n34), .Y(n35) );
  INVX2 U116 ( .A(n25), .Y(n24) );
endmodule


module flex_counter_NUM_CNT_BITS14 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n169, n170, n171, n172, n173, n174, next_flag, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N29, N30, N31,
         N32, N33, N34, N35, N36, N37, N38, N39, N40, N41, N42, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, N60, N59, N58, N57, N56,
         N55, N54, N53, N52, N51, N50, N49, N48, N47, n1, n2, n4, n5, n6, n7,
         n8, n9, n10, n26, n27, n28, n30, n31, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n67, n68,
         n69, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168;

  DFFSR \count_out_reg[13]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        n169) );
  DFFSR \count_out_reg[12]  ( .D(n167), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        n170) );
  DFFSR \count_out_reg[11]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        n171) );
  DFFSR \count_out_reg[10]  ( .D(n165), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[10]) );
  DFFSR \count_out_reg[9]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n172) );
  DFFSR \count_out_reg[8]  ( .D(n114), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[8]) );
  DFFSR \count_out_reg[7]  ( .D(n113), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n173) );
  DFFSR \count_out_reg[6]  ( .D(n112), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(n111), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(n110), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(n109), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n108), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n107), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[0]  ( .D(n106), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n174) );
  DFFSR rollover_flag_reg ( .D(next_flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BITS14_DW01_inc_1 add_61_aco ( .A({N60, N59, N58, N57, 
        N56, N55, N54, N53, N52, N51, N50, N49, N48, N47}), .SUM({N42, N41, 
        N40, N39, N38, N37, N36, N35, N34, N33, N32, N31, N30, N29}) );
  flex_counter_NUM_CNT_BITS14_DW01_dec_1 sub_62 ( .A({1'b0, n74, n42, n40, n28, 
        n39, n6, n72, n45, n47, n51, n43, n49, n41, n38}), .SUM({N27, N26, N25, 
        N24, N23, N22, N21, N20, N19, N18, N17, N16, N15, N14, N13}) );
  INVX1 U19 ( .A(n8), .Y(n1) );
  INVX2 U20 ( .A(rollover_val[10]), .Y(n8) );
  AND2X2 U21 ( .A(n4), .B(n2), .Y(N56) );
  INVX8 U22 ( .A(n132), .Y(n2) );
  INVX1 U23 ( .A(n60), .Y(n4) );
  INVX1 U24 ( .A(n156), .Y(n5) );
  INVX1 U25 ( .A(count_out[1]), .Y(n137) );
  BUFX2 U26 ( .A(rollover_val[8]), .Y(n6) );
  INVX2 U27 ( .A(n64), .Y(n7) );
  NAND2X1 U28 ( .A(rollover_val[10]), .B(count_out[10]), .Y(n10) );
  NAND2X1 U29 ( .A(n8), .B(n9), .Y(n26) );
  NAND2X1 U30 ( .A(n10), .B(n26), .Y(n81) );
  INVX2 U31 ( .A(count_out[10]), .Y(n9) );
  INVX2 U32 ( .A(n27), .Y(n28) );
  INVX1 U33 ( .A(n1), .Y(n27) );
  INVX2 U34 ( .A(n151), .Y(count_out[12]) );
  INVX1 U35 ( .A(n170), .Y(n151) );
  INVX1 U36 ( .A(rollover_val[4]), .Y(n50) );
  INVX1 U37 ( .A(n125), .Y(n30) );
  INVX1 U38 ( .A(n174), .Y(n125) );
  INVX1 U39 ( .A(n138), .Y(n31) );
  INVX2 U40 ( .A(n132), .Y(count_out[9]) );
  INVX2 U41 ( .A(count_out[4]), .Y(n33) );
  INVX1 U42 ( .A(count_out[4]), .Y(n120) );
  INVX1 U43 ( .A(rollover_val[2]), .Y(n48) );
  INVX2 U44 ( .A(n50), .Y(n51) );
  INVX4 U45 ( .A(n78), .Y(n126) );
  INVX2 U46 ( .A(n76), .Y(n57) );
  AND2X2 U47 ( .A(count_out[13]), .B(n57), .Y(n34) );
  INVX2 U48 ( .A(n37), .Y(n38) );
  AND2X2 U49 ( .A(count_out[11]), .B(n62), .Y(n35) );
  AND2X2 U50 ( .A(n46), .B(n57), .Y(n36) );
  INVX2 U51 ( .A(n48), .Y(n49) );
  BUFX2 U52 ( .A(rollover_val[3]), .Y(n43) );
  INVX1 U53 ( .A(n31), .Y(n44) );
  XNOR2X1 U54 ( .A(rollover_val[13]), .B(n98), .Y(n96) );
  INVX2 U55 ( .A(n169), .Y(n98) );
  INVX1 U56 ( .A(rollover_val[0]), .Y(n37) );
  BUFX2 U57 ( .A(rollover_val[9]), .Y(n39) );
  BUFX2 U58 ( .A(rollover_val[11]), .Y(n40) );
  BUFX2 U59 ( .A(rollover_val[1]), .Y(n41) );
  BUFX2 U60 ( .A(rollover_val[12]), .Y(n42) );
  BUFX2 U61 ( .A(rollover_val[7]), .Y(n72) );
  XNOR2X1 U62 ( .A(rollover_val[7]), .B(n173), .Y(n90) );
  INVX1 U63 ( .A(n173), .Y(n104) );
  BUFX2 U64 ( .A(rollover_val[6]), .Y(n45) );
  INVX1 U65 ( .A(n152), .Y(n46) );
  INVX1 U66 ( .A(count_out[10]), .Y(n152) );
  BUFX2 U67 ( .A(rollover_val[5]), .Y(n47) );
  XNOR2X1 U68 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n82) );
  INVX1 U69 ( .A(count_out[2]), .Y(n136) );
  AOI21X1 U70 ( .A(N41), .B(n126), .C(n100), .Y(n52) );
  INVX1 U71 ( .A(n52), .Y(n167) );
  AOI21X1 U72 ( .A(N39), .B(n126), .C(n36), .Y(n53) );
  INVX1 U73 ( .A(n53), .Y(n165) );
  AOI21X1 U74 ( .A(N40), .B(n126), .C(n35), .Y(n54) );
  INVX1 U75 ( .A(n54), .Y(n166) );
  AOI22X1 U76 ( .A(count_out[9]), .B(n62), .C(N38), .D(n126), .Y(n55) );
  INVX1 U77 ( .A(n55), .Y(n164) );
  XOR2X1 U78 ( .A(rollover_val[4]), .B(n33), .Y(n80) );
  BUFX2 U79 ( .A(n152), .Y(n56) );
  NAND2X1 U80 ( .A(n57), .B(n58), .Y(n59) );
  NAND2X1 U81 ( .A(n59), .B(n102), .Y(n114) );
  INVX2 U82 ( .A(n133), .Y(n58) );
  INVX4 U83 ( .A(n62), .Y(n76) );
  INVX1 U84 ( .A(n79), .Y(n168) );
  INVX1 U85 ( .A(n156), .Y(n60) );
  INVX2 U86 ( .A(n156), .Y(n122) );
  INVX1 U87 ( .A(n73), .Y(n67) );
  INVX1 U88 ( .A(count_enable), .Y(n77) );
  AND2X2 U89 ( .A(n117), .B(n118), .Y(n61) );
  AND2X2 U90 ( .A(n155), .B(n77), .Y(n62) );
  INVX2 U91 ( .A(count_out[8]), .Y(n73) );
  INVX1 U92 ( .A(n75), .Y(n63) );
  INVX1 U93 ( .A(n128), .Y(n64) );
  XNOR2X1 U94 ( .A(rollover_val[9]), .B(n172), .Y(n91) );
  INVX1 U95 ( .A(n172), .Y(n132) );
  INVX2 U96 ( .A(n98), .Y(count_out[13]) );
  BUFX2 U97 ( .A(n30), .Y(count_out[0]) );
  INVX1 U98 ( .A(n120), .Y(n68) );
  INVX1 U99 ( .A(n121), .Y(n69) );
  BUFX2 U100 ( .A(n173), .Y(count_out[7]) );
  INVX2 U101 ( .A(n101), .Y(count_out[11]) );
  INVX1 U102 ( .A(n171), .Y(n101) );
  XNOR2X1 U103 ( .A(n73), .B(rollover_val[8]), .Y(n87) );
  BUFX2 U104 ( .A(rollover_val[13]), .Y(n74) );
  BUFX2 U105 ( .A(n5), .Y(n75) );
  INVX2 U106 ( .A(clear), .Y(n155) );
  NAND2X1 U107 ( .A(n76), .B(n155), .Y(n78) );
  OAI22X1 U108 ( .A(n126), .B(n34), .C(n34), .D(N42), .Y(n79) );
  NAND3X1 U109 ( .A(n81), .B(n82), .C(n80), .Y(n88) );
  XNOR2X1 U110 ( .A(rollover_val[0]), .B(n174), .Y(n85) );
  XNOR2X1 U111 ( .A(rollover_val[12]), .B(n170), .Y(n84) );
  INVX2 U112 ( .A(count_out[6]), .Y(n128) );
  XOR2X1 U113 ( .A(rollover_val[6]), .B(n128), .Y(n83) );
  NAND3X1 U114 ( .A(n83), .B(n85), .C(n84), .Y(n86) );
  NOR3X1 U115 ( .A(n87), .B(n88), .C(n86), .Y(n118) );
  INVX2 U116 ( .A(count_out[3]), .Y(n121) );
  XOR2X1 U117 ( .A(rollover_val[3]), .B(n121), .Y(n89) );
  NAND3X1 U118 ( .A(n90), .B(n91), .C(n89), .Y(n97) );
  XNOR2X1 U119 ( .A(rollover_val[11]), .B(n171), .Y(n94) );
  XNOR2X1 U120 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n93) );
  INVX2 U121 ( .A(count_out[5]), .Y(n138) );
  XOR2X1 U122 ( .A(rollover_val[5]), .B(n138), .Y(n92) );
  NAND3X1 U123 ( .A(n92), .B(n94), .C(n93), .Y(n95) );
  NOR3X1 U124 ( .A(n96), .B(n95), .C(n97), .Y(n117) );
  NAND2X1 U125 ( .A(n118), .B(n117), .Y(n156) );
  NOR2X1 U126 ( .A(n75), .B(n98), .Y(N60) );
  NAND2X1 U127 ( .A(count_out[12]), .B(n57), .Y(n99) );
  INVX2 U128 ( .A(n99), .Y(n100) );
  NOR2X1 U129 ( .A(n75), .B(n151), .Y(N59) );
  NOR2X1 U130 ( .A(n5), .B(n101), .Y(N58) );
  NOR2X1 U131 ( .A(n5), .B(n56), .Y(N57) );
  INVX2 U132 ( .A(n67), .Y(n133) );
  NAND2X1 U133 ( .A(N37), .B(n126), .Y(n102) );
  NOR2X1 U134 ( .A(n5), .B(n133), .Y(N55) );
  NAND2X1 U135 ( .A(N36), .B(n126), .Y(n103) );
  OAI21X1 U136 ( .A(n76), .B(n104), .C(n103), .Y(n113) );
  NOR2X1 U137 ( .A(n122), .B(n104), .Y(N54) );
  NOR2X1 U138 ( .A(n60), .B(n7), .Y(N53) );
  NAND2X1 U139 ( .A(N34), .B(n126), .Y(n105) );
  OAI21X1 U140 ( .A(n76), .B(n44), .C(n105), .Y(n111) );
  NAND2X1 U141 ( .A(N30), .B(n126), .Y(n115) );
  OAI21X1 U142 ( .A(n76), .B(n137), .C(n115), .Y(n107) );
  NAND2X1 U143 ( .A(N32), .B(n126), .Y(n116) );
  OAI21X1 U144 ( .A(n76), .B(n121), .C(n116), .Y(n109) );
  NOR2X1 U145 ( .A(n61), .B(n44), .Y(N52) );
  NAND2X1 U146 ( .A(N33), .B(n126), .Y(n119) );
  OAI21X1 U147 ( .A(n76), .B(n120), .C(n119), .Y(n110) );
  NOR2X1 U148 ( .A(n122), .B(n120), .Y(N51) );
  NOR2X1 U149 ( .A(n121), .B(n122), .Y(N50) );
  NAND2X1 U150 ( .A(N31), .B(n126), .Y(n123) );
  OAI21X1 U151 ( .A(n76), .B(n136), .C(n123), .Y(n108) );
  NOR2X1 U152 ( .A(n136), .B(n61), .Y(N49) );
  NOR2X1 U153 ( .A(n137), .B(n61), .Y(N48) );
  NAND2X1 U154 ( .A(N29), .B(n126), .Y(n124) );
  OAI21X1 U155 ( .A(n76), .B(n125), .C(n124), .Y(n106) );
  NOR2X1 U156 ( .A(n125), .B(n61), .Y(N47) );
  NAND2X1 U157 ( .A(N35), .B(n126), .Y(n127) );
  OAI21X1 U158 ( .A(n76), .B(n7), .C(n127), .Y(n112) );
  XOR2X1 U159 ( .A(N17), .B(n68), .Y(n130) );
  XOR2X1 U160 ( .A(N16), .B(n69), .Y(n129) );
  NOR2X1 U161 ( .A(n130), .B(n129), .Y(n146) );
  XOR2X1 U162 ( .A(N19), .B(n64), .Y(n131) );
  NOR2X1 U163 ( .A(N27), .B(n131), .Y(n145) );
  XOR2X1 U164 ( .A(N22), .B(n132), .Y(n135) );
  XOR2X1 U165 ( .A(N21), .B(n133), .Y(n134) );
  NAND2X1 U166 ( .A(n135), .B(n134), .Y(n143) );
  XOR2X1 U167 ( .A(n136), .B(N15), .Y(n141) );
  XOR2X1 U168 ( .A(n137), .B(N14), .Y(n140) );
  XOR2X1 U169 ( .A(n44), .B(N18), .Y(n139) );
  NAND3X1 U170 ( .A(n141), .B(n140), .C(n139), .Y(n142) );
  NOR2X1 U171 ( .A(n143), .B(n142), .Y(n144) );
  NAND3X1 U172 ( .A(n146), .B(n145), .C(n144), .Y(n163) );
  XOR2X1 U173 ( .A(N24), .B(count_out[11]), .Y(n148) );
  XOR2X1 U174 ( .A(N20), .B(count_out[7]), .Y(n147) );
  NOR2X1 U175 ( .A(n148), .B(n147), .Y(n161) );
  XOR2X1 U176 ( .A(N26), .B(count_out[13]), .Y(n150) );
  XOR2X1 U177 ( .A(N13), .B(count_out[0]), .Y(n149) );
  NOR2X1 U178 ( .A(n150), .B(n149), .Y(n160) );
  XOR2X1 U179 ( .A(N25), .B(n151), .Y(n154) );
  XOR2X1 U180 ( .A(N23), .B(n56), .Y(n153) );
  NAND2X1 U181 ( .A(n154), .B(n153), .Y(n158) );
  NAND3X1 U182 ( .A(count_enable), .B(n63), .C(n155), .Y(n157) );
  NOR2X1 U183 ( .A(n158), .B(n157), .Y(n159) );
  NAND3X1 U184 ( .A(n161), .B(n160), .C(n159), .Y(n162) );
  NOR2X1 U185 ( .A(n162), .B(n163), .Y(next_flag) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   next_flag, n40, n41, n42, n43, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65;

  DFFSR \count_out_reg[3]  ( .D(n43), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(n42), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(n41), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[0]  ( .D(n40), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(next_flag), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NAND3X1 U8 ( .A(n17), .B(n16), .C(n10), .Y(n1) );
  AND2X2 U9 ( .A(count_out[1]), .B(n1), .Y(n2) );
  INVX1 U10 ( .A(n2), .Y(n18) );
  INVX1 U11 ( .A(n46), .Y(n3) );
  AND2X2 U12 ( .A(n3), .B(n31), .Y(n35) );
  MUX2X1 U13 ( .B(n26), .A(n27), .S(n33), .Y(n28) );
  XNOR2X1 U14 ( .A(n45), .B(rollover_val[0]), .Y(n4) );
  INVX1 U15 ( .A(n32), .Y(n25) );
  BUFX2 U16 ( .A(n1), .Y(n5) );
  INVX1 U17 ( .A(n54), .Y(n6) );
  INVX1 U18 ( .A(rollover_val[3]), .Y(n54) );
  INVX2 U19 ( .A(clear), .Y(n19) );
  INVX2 U20 ( .A(count_enable), .Y(n7) );
  NAND2X1 U21 ( .A(n19), .B(n7), .Y(n44) );
  INVX2 U22 ( .A(count_out[1]), .Y(n24) );
  INVX2 U23 ( .A(count_out[2]), .Y(n29) );
  XOR2X1 U24 ( .A(rollover_val[2]), .B(n29), .Y(n17) );
  INVX2 U25 ( .A(count_out[3]), .Y(n8) );
  XOR2X1 U26 ( .A(n8), .B(rollover_val[3]), .Y(n16) );
  INVX2 U27 ( .A(count_out[0]), .Y(n45) );
  XOR2X1 U28 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n9) );
  NOR2X1 U29 ( .A(n4), .B(n9), .Y(n10) );
  NAND3X1 U30 ( .A(n17), .B(n16), .C(n10), .Y(n30) );
  NOR2X1 U31 ( .A(clear), .B(n18), .Y(n22) );
  NAND2X1 U32 ( .A(n44), .B(n19), .Y(n46) );
  NOR2X1 U33 ( .A(n2), .B(n46), .Y(n21) );
  NAND2X1 U34 ( .A(count_out[0]), .B(n30), .Y(n20) );
  INVX2 U35 ( .A(n20), .Y(n47) );
  MUX2X1 U36 ( .B(n22), .A(n21), .S(n47), .Y(n23) );
  OAI21X1 U37 ( .A(n44), .B(n24), .C(n23), .Y(n41) );
  NAND2X1 U38 ( .A(n47), .B(n2), .Y(n32) );
  NOR2X1 U39 ( .A(n46), .B(n32), .Y(n27) );
  NOR2X1 U40 ( .A(clear), .B(n25), .Y(n26) );
  NAND2X1 U41 ( .A(count_out[2]), .B(n5), .Y(n33) );
  OAI21X1 U42 ( .A(n44), .B(n29), .C(n28), .Y(n42) );
  NAND2X1 U43 ( .A(count_out[3]), .B(n5), .Y(n31) );
  NOR2X1 U44 ( .A(clear), .B(n31), .Y(n36) );
  NOR2X1 U45 ( .A(n33), .B(n32), .Y(n34) );
  MUX2X1 U46 ( .B(n36), .A(n35), .S(n34), .Y(n39) );
  INVX2 U47 ( .A(n44), .Y(n37) );
  NAND2X1 U48 ( .A(count_out[3]), .B(n37), .Y(n38) );
  NAND2X1 U49 ( .A(n39), .B(n38), .Y(n43) );
  OAI22X1 U50 ( .A(n47), .B(n46), .C(n45), .D(n44), .Y(n40) );
  INVX2 U51 ( .A(rollover_val[1]), .Y(n50) );
  INVX2 U52 ( .A(rollover_val[0]), .Y(n49) );
  NAND2X1 U53 ( .A(n50), .B(n49), .Y(n48) );
  INVX2 U54 ( .A(n48), .Y(n59) );
  INVX2 U55 ( .A(rollover_val[2]), .Y(n58) );
  NAND2X1 U56 ( .A(n59), .B(n58), .Y(n57) );
  OAI21X1 U57 ( .A(n50), .B(n49), .C(n48), .Y(n51) );
  XOR2X1 U58 ( .A(n51), .B(count_out[1]), .Y(n52) );
  NOR2X1 U59 ( .A(clear), .B(n52), .Y(n53) );
  OAI21X1 U60 ( .A(n6), .B(n57), .C(n53), .Y(n65) );
  INVX2 U61 ( .A(n57), .Y(n55) );
  NOR2X1 U62 ( .A(n55), .B(n54), .Y(n56) );
  XOR2X1 U63 ( .A(count_out[3]), .B(n56), .Y(n62) );
  OAI21X1 U64 ( .A(n59), .B(n58), .C(n57), .Y(n60) );
  XOR2X1 U65 ( .A(n60), .B(count_out[2]), .Y(n61) );
  NOR2X1 U66 ( .A(n62), .B(n61), .Y(n63) );
  NAND3X1 U67 ( .A(count_enable), .B(n4), .C(n63), .Y(n64) );
  NOR2X1 U68 ( .A(n65), .B(n64), .Y(next_flag) );
endmodule


module timer ( clk, n_rst, enable_timer, data_size, bit_period, shift_enable, 
        packet_done );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n1, n2, n3, n4, n5, n6, n7,
         n8, n9;

  flex_counter_NUM_CNT_BITS14 FC1 ( .clk(clk), .n_rst(n2), .clear(n8), 
        .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4 FC2 ( .clk(clk), .n_rst(n2), .clear(n8), 
        .count_enable(shift_enable), .rollover_val({\_2_net_[3] , \_2_net_[2] , 
        \_2_net_[1] , n9}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(n5), .Y(n1) );
  INVX2 U3 ( .A(data_size[2]), .Y(n5) );
  INVX2 U4 ( .A(n3), .Y(n2) );
  INVX2 U5 ( .A(n_rst), .Y(n3) );
  XOR2X1 U6 ( .A(n7), .B(data_size[3]), .Y(\_2_net_[3] ) );
  INVX1 U7 ( .A(n6), .Y(n4) );
  INVX2 U8 ( .A(data_size[0]), .Y(n9) );
  XOR2X1 U9 ( .A(data_size[1]), .B(data_size[0]), .Y(\_2_net_[1] ) );
  NAND2X1 U10 ( .A(data_size[1]), .B(data_size[0]), .Y(n6) );
  XOR2X1 U11 ( .A(n1), .B(n4), .Y(\_2_net_[2] ) );
  NOR2X1 U12 ( .A(n6), .B(n5), .Y(n7) );
  INVX2 U13 ( .A(enable_timer), .Y(n8) );
endmodule


module flex_stp_sr_NUM_BITS9_SHIFT_MSB0 ( clk, n_rst, shift_enable, serial_in, 
        parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n3, n11, n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n4, n5,
         n6, n7, n8, n9, n10, n30;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  OAI21X1 U2 ( .A(n30), .B(n1), .C(n3), .Y(n13) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n1), .Y(n3) );
  OAI22X1 U4 ( .A(n1), .B(n10), .C(n2), .D(n30), .Y(n15) );
  OAI22X1 U6 ( .A(n1), .B(n9), .C(n2), .D(n10), .Y(n17) );
  OAI22X1 U8 ( .A(n1), .B(n8), .C(n2), .D(n9), .Y(n19) );
  OAI22X1 U10 ( .A(n1), .B(n7), .C(n2), .D(n8), .Y(n21) );
  OAI22X1 U12 ( .A(n1), .B(n6), .C(n2), .D(n7), .Y(n23) );
  OAI22X1 U14 ( .A(n1), .B(n5), .C(n2), .D(n6), .Y(n25) );
  OAI22X1 U16 ( .A(n1), .B(n4), .C(n2), .D(n5), .Y(n27) );
  OAI21X1 U19 ( .A(n2), .B(n4), .C(n11), .Y(n29) );
  NAND2X1 U20 ( .A(serial_in), .B(n2), .Y(n11) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(shift_enable), .Y(n1) );
  INVX2 U9 ( .A(parallel_out[8]), .Y(n4) );
  INVX2 U11 ( .A(parallel_out[7]), .Y(n5) );
  INVX2 U13 ( .A(parallel_out[6]), .Y(n6) );
  INVX2 U15 ( .A(parallel_out[5]), .Y(n7) );
  INVX2 U17 ( .A(parallel_out[4]), .Y(n8) );
  INVX2 U18 ( .A(parallel_out[3]), .Y(n9) );
  INVX2 U21 ( .A(parallel_out[2]), .Y(n10) );
  INVX2 U31 ( .A(parallel_out[1]), .Y(n30) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, stop_bit, packet_data );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_NUM_BITS9_SHIFT_MSB0 xxx ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(shift_strobe), .serial_in(serial_in), .parallel_out({
        stop_bit, packet_data}) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n4, n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U5 ( .A(sbc_clear), .B(n4), .Y(n5) );
  AOI22X1 U6 ( .A(framing_error), .B(n3), .C(sbc_enable), .D(n2), .Y(n4) );
  INVX2 U3 ( .A(stop_bit), .Y(n2) );
  INVX2 U4 ( .A(sbc_enable), .Y(n3) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n1, n4, n5, n6, n7, n8, n9, n10, n11, n30, n31, n2, n3, n15, n17, n19,
         n21, n23, n25, n27, n29, n32, n33, n34;

  DFFSR \rx_data_reg[7]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n33), .CLK(clk), .R(1'b1), .S(n15), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n15), .S(1'b1), .Q(data_ready)
         );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n15), .S(1'b1), .Q(
        overrun_error) );
  NOR2X1 U3 ( .A(data_read), .B(n1), .Y(n30) );
  AOI21X1 U4 ( .A(n3), .B(data_ready), .C(overrun_error), .Y(n1) );
  OAI21X1 U5 ( .A(data_read), .B(n34), .C(n2), .Y(n31) );
  AOI22X1 U8 ( .A(rx_data[0]), .B(n2), .C(packet_data[0]), .D(n3), .Y(n4) );
  AOI22X1 U10 ( .A(rx_data[1]), .B(n2), .C(packet_data[1]), .D(n3), .Y(n5) );
  AOI22X1 U12 ( .A(rx_data[2]), .B(n2), .C(packet_data[2]), .D(n3), .Y(n6) );
  AOI22X1 U14 ( .A(rx_data[3]), .B(n2), .C(packet_data[3]), .D(n3), .Y(n7) );
  AOI22X1 U16 ( .A(rx_data[4]), .B(n2), .C(packet_data[4]), .D(n3), .Y(n8) );
  AOI22X1 U18 ( .A(rx_data[5]), .B(n2), .C(packet_data[5]), .D(n3), .Y(n9) );
  AOI22X1 U20 ( .A(rx_data[6]), .B(n2), .C(packet_data[6]), .D(n3), .Y(n10) );
  AOI22X1 U22 ( .A(rx_data[7]), .B(n2), .C(packet_data[7]), .D(n3), .Y(n11) );
  INVX2 U6 ( .A(load_buffer), .Y(n2) );
  INVX2 U7 ( .A(n2), .Y(n3) );
  INVX2 U9 ( .A(n17), .Y(n15) );
  INVX2 U11 ( .A(n_rst), .Y(n17) );
  INVX1 U13 ( .A(n4), .Y(n33) );
  INVX2 U15 ( .A(n10), .Y(n19) );
  INVX2 U17 ( .A(n11), .Y(n21) );
  INVX2 U19 ( .A(n8), .Y(n23) );
  INVX2 U21 ( .A(n9), .Y(n25) );
  INVX2 U23 ( .A(n7), .Y(n27) );
  INVX2 U34 ( .A(n6), .Y(n29) );
  INVX2 U35 ( .A(n5), .Y(n32) );
  INVX2 U36 ( .A(data_ready), .Y(n34) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, data_size, bit_period, 
        rx_data, data_ready, overrun_error, framing_error );
  input [3:0] data_size;
  input [13:0] bit_period;
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   new_packet_detected, packet_done, sbc_clear, sbc_enable, load_buffer,
         enable_timer, strobe, stop_bit, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11;
  wire   [7:0] packet_data_xxx;
  wire   [7:0] packet_data;

  NOR2X1 U13 ( .A(n12), .B(n2), .Y(packet_data_xxx[7]) );
  OAI22X1 U14 ( .A(n2), .B(n13), .C(n12), .D(n3), .Y(packet_data_xxx[6]) );
  OAI22X1 U15 ( .A(n3), .B(n13), .C(n12), .D(n4), .Y(packet_data_xxx[5]) );
  OAI21X1 U16 ( .A(n13), .B(n4), .C(n14), .Y(packet_data_xxx[4]) );
  AOI22X1 U17 ( .A(packet_data[4]), .B(n1), .C(n15), .D(packet_data[7]), .Y(
        n14) );
  OAI21X1 U18 ( .A(n13), .B(n5), .C(n16), .Y(packet_data_xxx[3]) );
  AOI22X1 U19 ( .A(packet_data[3]), .B(n1), .C(n15), .D(packet_data[6]), .Y(
        n16) );
  OAI21X1 U20 ( .A(n13), .B(n6), .C(n17), .Y(packet_data_xxx[2]) );
  AOI22X1 U21 ( .A(packet_data[2]), .B(n1), .C(n15), .D(packet_data[5]), .Y(
        n17) );
  OAI21X1 U22 ( .A(n13), .B(n7), .C(n18), .Y(packet_data_xxx[1]) );
  AOI22X1 U23 ( .A(packet_data[1]), .B(n1), .C(n15), .D(packet_data[4]), .Y(
        n18) );
  OAI21X1 U24 ( .A(n13), .B(n8), .C(n19), .Y(packet_data_xxx[0]) );
  AOI22X1 U25 ( .A(packet_data[0]), .B(n1), .C(packet_data[3]), .D(n15), .Y(
        n19) );
  NAND2X1 U26 ( .A(n10), .B(n13), .Y(n12) );
  NOR2X1 U27 ( .A(n20), .B(data_size[1]), .Y(n15) );
  NAND2X1 U28 ( .A(data_size[1]), .B(n9), .Y(n13) );
  NAND3X1 U29 ( .A(data_size[0]), .B(n11), .C(data_size[2]), .Y(n20) );
  start_bit_det start ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .new_package_detected(new_packet_detected) );
  rcu rcu ( .clk(clk), .n_rst(n_rst), .new_packet_detected(new_packet_detected), .packet_done(packet_done), .framing_error(framing_error), .sbc_clear(
        sbc_clear), .sbc_enable(sbc_enable), .load_buffer(load_buffer), 
        .enable_timer(enable_timer) );
  timer timer ( .clk(clk), .n_rst(n_rst), .enable_timer(enable_timer), 
        .data_size(data_size), .bit_period(bit_period), .shift_enable(strobe), 
        .packet_done(packet_done) );
  sr_9bit sr ( .clk(clk), .n_rst(n_rst), .shift_strobe(strobe), .serial_in(
        serial_in), .stop_bit(stop_bit), .packet_data(packet_data) );
  stop_bit_chk stop ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clear), 
        .sbc_enable(sbc_enable), .stop_bit(stop_bit), .framing_error(
        framing_error) );
  rx_data_buff rx ( .clk(clk), .n_rst(n_rst), .load_buffer(load_buffer), 
        .packet_data(packet_data_xxx), .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), .overrun_error(overrun_error) );
  INVX2 U2 ( .A(n15), .Y(n10) );
  AND2X2 U3 ( .A(n10), .B(n13), .Y(n1) );
  INVX2 U4 ( .A(packet_data[7]), .Y(n2) );
  INVX2 U5 ( .A(packet_data[6]), .Y(n3) );
  INVX2 U6 ( .A(packet_data[5]), .Y(n4) );
  INVX2 U7 ( .A(packet_data[4]), .Y(n5) );
  INVX2 U8 ( .A(packet_data[3]), .Y(n6) );
  INVX2 U9 ( .A(packet_data[2]), .Y(n7) );
  INVX2 U10 ( .A(packet_data[1]), .Y(n8) );
  INVX2 U11 ( .A(n20), .Y(n9) );
  INVX2 U12 ( .A(data_size[3]), .Y(n11) );
endmodule


module apb_slave ( clk, n_rst, data_ready, overrun_error, framing_error, psel, 
        penable, pwrite, rx_data, pwdata, paddr, prdata, data_read, pslverr, 
        data_size, bit_period );
  input [7:0] rx_data;
  input [7:0] pwdata;
  input [2:0] paddr;
  output [7:0] prdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   n239, n240, n241, \mapping[6][7] , \mapping[6][6] , \mapping[6][5] ,
         \mapping[6][4] , \mapping[6][3] , \mapping[6][2] , \mapping[6][1] ,
         \mapping[6][0] , \mapping[4][7] , \mapping[4][6] , \mapping[4][5] ,
         \mapping[4][4] , \mapping[3][7] , \mapping[3][6] , \mapping[1][7] ,
         \mapping[1][6] , \mapping[1][5] , \mapping[1][4] , \mapping[1][3] ,
         \mapping[1][2] , \mapping[1][1] , \mapping[1][0] , \mapping[0][7] ,
         \mapping[0][6] , \mapping[0][5] , \mapping[0][4] , \mapping[0][3] ,
         \mapping[0][2] , \mapping[0][1] , \mapping[0][0] , \nxtmapping[6][7] ,
         \nxtmapping[6][6] , \nxtmapping[6][5] , \nxtmapping[6][4] ,
         \nxtmapping[6][3] , \nxtmapping[6][2] , \nxtmapping[6][1] ,
         \nxtmapping[6][0] , \nxtmapping[1][7] , \nxtmapping[1][6] ,
         \nxtmapping[1][5] , \nxtmapping[1][4] , \nxtmapping[1][3] ,
         \nxtmapping[1][2] , \nxtmapping[1][1] , \nxtmapping[1][0] ,
         \nxtmapping[0][7] , \nxtmapping[0][6] , \nxtmapping[0][5] ,
         \nxtmapping[0][4] , \nxtmapping[0][3] , \nxtmapping[0][2] ,
         \nxtmapping[0][1] , \nxtmapping[0][0] , nxt_pslverr, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n152, n153,
         n154, n155, n157, n159, n162, n164, n167, n169, n172, n174, n177,
         n179, n182, n184, n187, n188, n189, n199, n200, n202, n206, n207,
         n208, n209, n210, n211, n212, n213, n214, n215, n216, n217, n218,
         n219, n220, n221, n222, n60, n61, n62, n63, n64, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n78, n79, n80, n81, n82, n83, n84, n85,
         n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n140, n151, n156, n158, n160, n161,
         n163, n165, n166, n168, n170, n171, n173, n175, n176, n178, n180,
         n181, n183, n185, n186, n190, n191, n192, n193, n194, n195, n196,
         n197, n198, n201, n203, n204, n205, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238;
  wire   [1:0] state;

  DFFSR \state_reg[0]  ( .D(n160), .CLK(clk), .R(n85), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n175), .CLK(clk), .R(n85), .S(1'b1), .Q(state[1])
         );
  DFFSR \mapping_reg[6][7]  ( .D(\nxtmapping[6][7] ), .CLK(clk), .R(n85), .S(
        1'b1), .Q(\mapping[6][7] ) );
  DFFSR \mapping_reg[6][6]  ( .D(\nxtmapping[6][6] ), .CLK(clk), .R(n85), .S(
        1'b1), .Q(\mapping[6][6] ) );
  DFFSR \mapping_reg[6][5]  ( .D(\nxtmapping[6][5] ), .CLK(clk), .R(n85), .S(
        1'b1), .Q(\mapping[6][5] ) );
  DFFSR \mapping_reg[6][4]  ( .D(\nxtmapping[6][4] ), .CLK(clk), .R(n85), .S(
        1'b1), .Q(\mapping[6][4] ) );
  DFFSR \mapping_reg[6][3]  ( .D(\nxtmapping[6][3] ), .CLK(clk), .R(n85), .S(
        1'b1), .Q(\mapping[6][3] ) );
  DFFSR \mapping_reg[6][2]  ( .D(\nxtmapping[6][2] ), .CLK(clk), .R(n85), .S(
        1'b1), .Q(\mapping[6][2] ) );
  DFFSR \mapping_reg[6][1]  ( .D(\nxtmapping[6][1] ), .CLK(clk), .R(n85), .S(
        1'b1), .Q(\mapping[6][1] ) );
  DFFSR \mapping_reg[6][0]  ( .D(\nxtmapping[6][0] ), .CLK(clk), .R(n85), .S(
        1'b1), .Q(\mapping[6][0] ) );
  DFFSR \mapping_reg[4][7]  ( .D(n178), .CLK(clk), .R(n85), .S(1'b1), .Q(
        \mapping[4][7] ) );
  DFFSR \mapping_reg[4][6]  ( .D(n180), .CLK(clk), .R(n84), .S(1'b1), .Q(
        \mapping[4][6] ) );
  DFFSR \mapping_reg[4][5]  ( .D(n181), .CLK(clk), .R(n84), .S(1'b1), .Q(
        \mapping[4][5] ) );
  DFFSR \mapping_reg[4][4]  ( .D(n183), .CLK(clk), .R(n84), .S(1'b1), .Q(
        \mapping[4][4] ) );
  DFFSR \mapping_reg[4][3]  ( .D(n185), .CLK(clk), .R(n84), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \mapping_reg[4][2]  ( .D(n186), .CLK(clk), .R(n84), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \mapping_reg[4][1]  ( .D(n190), .CLK(clk), .R(n84), .S(1'b1), .Q(n239)
         );
  DFFSR \mapping_reg[4][0]  ( .D(n191), .CLK(clk), .R(n84), .S(1'b1), .Q(n240)
         );
  DFFSR \mapping_reg[3][7]  ( .D(n222), .CLK(clk), .R(n84), .S(1'b1), .Q(
        \mapping[3][7] ) );
  DFFSR \mapping_reg[3][6]  ( .D(n221), .CLK(clk), .R(n84), .S(1'b1), .Q(
        \mapping[3][6] ) );
  DFFSR \mapping_reg[3][5]  ( .D(n220), .CLK(clk), .R(n84), .S(1'b1), .Q(
        bit_period[13]) );
  DFFSR \mapping_reg[3][4]  ( .D(n219), .CLK(clk), .R(n84), .S(1'b1), .Q(
        bit_period[12]) );
  DFFSR \mapping_reg[3][3]  ( .D(n218), .CLK(clk), .R(n84), .S(1'b1), .Q(
        bit_period[11]) );
  DFFSR \mapping_reg[3][2]  ( .D(n217), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[10]) );
  DFFSR \mapping_reg[3][1]  ( .D(n216), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[9]) );
  DFFSR \mapping_reg[3][0]  ( .D(n215), .CLK(clk), .R(n83), .S(1'b1), .Q(n241)
         );
  DFFSR \mapping_reg[2][7]  ( .D(n192), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[7]) );
  DFFSR \mapping_reg[2][6]  ( .D(n193), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[6]) );
  DFFSR \mapping_reg[2][5]  ( .D(n194), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[5]) );
  DFFSR \mapping_reg[2][4]  ( .D(n195), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[4]) );
  DFFSR \mapping_reg[2][3]  ( .D(n196), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[3]) );
  DFFSR \mapping_reg[2][2]  ( .D(n197), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[2]) );
  DFFSR \mapping_reg[2][1]  ( .D(n198), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[1]) );
  DFFSR \mapping_reg[2][0]  ( .D(n201), .CLK(clk), .R(n83), .S(1'b1), .Q(
        bit_period[0]) );
  DFFSR \mapping_reg[1][7]  ( .D(\nxtmapping[1][7] ), .CLK(clk), .R(n83), .S(
        1'b1), .Q(\mapping[1][7] ) );
  DFFSR \mapping_reg[1][6]  ( .D(\nxtmapping[1][6] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[1][6] ) );
  DFFSR \mapping_reg[1][5]  ( .D(\nxtmapping[1][5] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[1][5] ) );
  DFFSR \mapping_reg[1][4]  ( .D(\nxtmapping[1][4] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[1][4] ) );
  DFFSR \mapping_reg[1][3]  ( .D(\nxtmapping[1][3] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[1][3] ) );
  DFFSR \mapping_reg[1][2]  ( .D(\nxtmapping[1][2] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[1][2] ) );
  DFFSR \mapping_reg[1][1]  ( .D(\nxtmapping[1][1] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[1][1] ) );
  DFFSR \mapping_reg[1][0]  ( .D(\nxtmapping[1][0] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[1][0] ) );
  DFFSR \mapping_reg[0][7]  ( .D(\nxtmapping[0][7] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[0][7] ) );
  DFFSR \prdata_reg[7]  ( .D(n173), .CLK(clk), .R(n82), .S(1'b1), .Q(prdata[7]) );
  DFFSR \mapping_reg[0][6]  ( .D(\nxtmapping[0][6] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[0][6] ) );
  DFFSR \prdata_reg[6]  ( .D(n171), .CLK(clk), .R(n82), .S(1'b1), .Q(prdata[6]) );
  DFFSR \mapping_reg[0][5]  ( .D(\nxtmapping[0][5] ), .CLK(clk), .R(n82), .S(
        1'b1), .Q(\mapping[0][5] ) );
  DFFSR \prdata_reg[5]  ( .D(n170), .CLK(clk), .R(n81), .S(1'b1), .Q(prdata[5]) );
  DFFSR \mapping_reg[0][4]  ( .D(\nxtmapping[0][4] ), .CLK(clk), .R(n81), .S(
        1'b1), .Q(\mapping[0][4] ) );
  DFFSR \prdata_reg[4]  ( .D(n168), .CLK(clk), .R(n81), .S(1'b1), .Q(prdata[4]) );
  DFFSR \mapping_reg[0][3]  ( .D(\nxtmapping[0][3] ), .CLK(clk), .R(n81), .S(
        1'b1), .Q(\mapping[0][3] ) );
  DFFSR \prdata_reg[3]  ( .D(n166), .CLK(clk), .R(n81), .S(1'b1), .Q(prdata[3]) );
  DFFSR \mapping_reg[0][2]  ( .D(\nxtmapping[0][2] ), .CLK(clk), .R(n81), .S(
        1'b1), .Q(\mapping[0][2] ) );
  DFFSR \prdata_reg[2]  ( .D(n165), .CLK(clk), .R(n81), .S(1'b1), .Q(prdata[2]) );
  DFFSR \mapping_reg[0][1]  ( .D(\nxtmapping[0][1] ), .CLK(clk), .R(n81), .S(
        1'b1), .Q(\mapping[0][1] ) );
  DFFSR \prdata_reg[1]  ( .D(n163), .CLK(clk), .R(n81), .S(1'b1), .Q(prdata[1]) );
  DFFSR \mapping_reg[0][0]  ( .D(\nxtmapping[0][0] ), .CLK(clk), .R(n81), .S(
        1'b1), .Q(\mapping[0][0] ) );
  DFFSR \prdata_reg[0]  ( .D(n161), .CLK(clk), .R(n81), .S(1'b1), .Q(prdata[0]) );
  DFFSR pslverr_reg ( .D(nxt_pslverr), .CLK(clk), .R(n81), .S(1'b1), .Q(
        pslverr) );
  AND2X2 U62 ( .A(n189), .B(paddr[0]), .Y(n142) );
  AND2X2 U63 ( .A(n189), .B(n236), .Y(n145) );
  AND2X2 U64 ( .A(n138), .B(n150), .Y(data_read) );
  OAI21X1 U132 ( .A(n80), .B(n237), .C(n129), .Y(\nxtmapping[6][7] ) );
  NAND2X1 U133 ( .A(rx_data[7]), .B(n80), .Y(n129) );
  OAI21X1 U134 ( .A(n80), .B(n238), .C(n130), .Y(\nxtmapping[6][6] ) );
  NAND2X1 U135 ( .A(rx_data[6]), .B(n80), .Y(n130) );
  OAI21X1 U136 ( .A(n80), .B(n123), .C(n131), .Y(\nxtmapping[6][5] ) );
  NAND2X1 U137 ( .A(rx_data[5]), .B(n80), .Y(n131) );
  OAI21X1 U138 ( .A(n80), .B(n124), .C(n132), .Y(\nxtmapping[6][4] ) );
  NAND2X1 U139 ( .A(rx_data[4]), .B(n80), .Y(n132) );
  OAI21X1 U140 ( .A(n80), .B(n125), .C(n133), .Y(\nxtmapping[6][3] ) );
  NAND2X1 U141 ( .A(rx_data[3]), .B(n80), .Y(n133) );
  OAI21X1 U142 ( .A(n80), .B(n126), .C(n134), .Y(\nxtmapping[6][2] ) );
  NAND2X1 U143 ( .A(rx_data[2]), .B(n80), .Y(n134) );
  OAI21X1 U144 ( .A(n80), .B(n140), .C(n135), .Y(\nxtmapping[6][1] ) );
  NAND2X1 U145 ( .A(rx_data[1]), .B(n80), .Y(n135) );
  OAI21X1 U146 ( .A(n80), .B(n151), .C(n136), .Y(\nxtmapping[6][0] ) );
  NAND2X1 U147 ( .A(rx_data[0]), .B(n80), .Y(n136) );
  NAND3X1 U148 ( .A(n137), .B(n236), .C(n138), .Y(n128) );
  NOR2X1 U149 ( .A(n237), .B(n78), .Y(\nxtmapping[1][7] ) );
  NOR2X1 U150 ( .A(n238), .B(n78), .Y(\nxtmapping[1][6] ) );
  NOR2X1 U151 ( .A(n123), .B(n78), .Y(\nxtmapping[1][5] ) );
  NOR2X1 U152 ( .A(n124), .B(n78), .Y(\nxtmapping[1][4] ) );
  NOR2X1 U153 ( .A(n125), .B(n78), .Y(\nxtmapping[1][3] ) );
  NOR2X1 U154 ( .A(n126), .B(n78), .Y(\nxtmapping[1][2] ) );
  OAI21X1 U155 ( .A(n140), .B(n78), .C(n141), .Y(\nxtmapping[1][1] ) );
  NAND3X1 U156 ( .A(n78), .B(n158), .C(overrun_error), .Y(n141) );
  OAI22X1 U157 ( .A(n63), .B(n158), .C(n151), .D(n78), .Y(\nxtmapping[1][0] )
         );
  NOR2X1 U159 ( .A(n237), .B(n143), .Y(\nxtmapping[0][7] ) );
  NOR2X1 U160 ( .A(n238), .B(n143), .Y(\nxtmapping[0][6] ) );
  NOR2X1 U161 ( .A(n123), .B(n143), .Y(\nxtmapping[0][5] ) );
  NOR2X1 U162 ( .A(n124), .B(n143), .Y(\nxtmapping[0][4] ) );
  NOR2X1 U163 ( .A(n125), .B(n143), .Y(\nxtmapping[0][3] ) );
  NOR2X1 U164 ( .A(n126), .B(n143), .Y(\nxtmapping[0][2] ) );
  NOR2X1 U165 ( .A(n140), .B(n143), .Y(\nxtmapping[0][1] ) );
  OAI21X1 U166 ( .A(n151), .B(n143), .C(n144), .Y(\nxtmapping[0][0] ) );
  NAND2X1 U167 ( .A(data_ready), .B(n143), .Y(n144) );
  NAND2X1 U168 ( .A(n145), .B(n137), .Y(n143) );
  NOR2X1 U169 ( .A(n127), .B(n146), .Y(nxt_pslverr) );
  OAI21X1 U170 ( .A(n148), .B(n149), .C(n150), .Y(n147) );
  OAI21X1 U173 ( .A(n234), .B(n204), .C(n152), .Y(n148) );
  AOI22X1 U174 ( .A(\mapping[0][7] ), .B(n145), .C(\mapping[1][7] ), .D(n142), 
        .Y(n152) );
  OAI21X1 U175 ( .A(n154), .B(n155), .C(n150), .Y(n153) );
  OAI21X1 U178 ( .A(n234), .B(n205), .C(n157), .Y(n154) );
  AOI22X1 U179 ( .A(\mapping[0][6] ), .B(n145), .C(\mapping[1][6] ), .D(n142), 
        .Y(n157) );
  OAI21X1 U183 ( .A(n234), .B(n223), .C(n162), .Y(n159) );
  AOI22X1 U184 ( .A(\mapping[0][5] ), .B(n145), .C(\mapping[1][5] ), .D(n142), 
        .Y(n162) );
  OAI21X1 U188 ( .A(n234), .B(n224), .C(n167), .Y(n164) );
  AOI22X1 U189 ( .A(\mapping[0][4] ), .B(n145), .C(\mapping[1][4] ), .D(n142), 
        .Y(n167) );
  OAI21X1 U193 ( .A(n234), .B(n225), .C(n172), .Y(n169) );
  AOI22X1 U194 ( .A(\mapping[0][3] ), .B(n145), .C(\mapping[1][3] ), .D(n142), 
        .Y(n172) );
  OAI21X1 U198 ( .A(n234), .B(n226), .C(n177), .Y(n174) );
  AOI22X1 U199 ( .A(\mapping[0][2] ), .B(n145), .C(\mapping[1][2] ), .D(n142), 
        .Y(n177) );
  OAI21X1 U203 ( .A(n234), .B(n227), .C(n182), .Y(n179) );
  AOI22X1 U204 ( .A(\mapping[0][1] ), .B(n145), .C(\mapping[1][1] ), .D(n142), 
        .Y(n182) );
  OAI21X1 U208 ( .A(n234), .B(n228), .C(n188), .Y(n184) );
  AOI22X1 U209 ( .A(\mapping[0][0] ), .B(n145), .C(\mapping[1][0] ), .D(n142), 
        .Y(n188) );
  NAND3X1 U219 ( .A(n236), .B(n156), .C(paddr[1]), .Y(n199) );
  OAI22X1 U226 ( .A(n238), .B(n200), .C(n122), .D(n230), .Y(n221) );
  OAI22X1 U227 ( .A(n237), .B(n200), .C(n122), .D(n229), .Y(n222) );
  NOR2X1 U229 ( .A(n236), .B(n235), .Y(n187) );
  AOI22X1 U234 ( .A(pwdata[4]), .B(n121), .C(n202), .D(\mapping[4][4] ), .Y(
        n206) );
  AOI22X1 U235 ( .A(pwdata[5]), .B(n121), .C(n202), .D(\mapping[4][5] ), .Y(
        n207) );
  AOI22X1 U236 ( .A(pwdata[6]), .B(n121), .C(n202), .D(\mapping[4][6] ), .Y(
        n208) );
  AOI22X1 U237 ( .A(pwdata[7]), .B(n121), .C(n202), .D(\mapping[4][7] ), .Y(
        n209) );
  NOR2X1 U239 ( .A(n203), .B(state[0]), .Y(n137) );
  NAND3X1 U240 ( .A(n236), .B(n235), .C(paddr[2]), .Y(n210) );
  NOR2X1 U241 ( .A(n127), .B(n175), .Y(n150) );
  NAND3X1 U242 ( .A(n176), .B(n203), .C(n211), .Y(n146) );
  OAI21X1 U243 ( .A(n231), .B(n232), .C(n212), .Y(n211) );
  NAND3X1 U244 ( .A(n176), .B(n203), .C(n213), .Y(n127) );
  OAI21X1 U245 ( .A(pwrite), .B(n231), .C(n212), .Y(n213) );
  OAI21X1 U246 ( .A(n233), .B(n139), .C(psel), .Y(n212) );
  NOR2X1 U247 ( .A(n236), .B(n156), .Y(n139) );
  OAI21X1 U248 ( .A(n138), .B(n189), .C(pwrite), .Y(n214) );
  NOR2X1 U249 ( .A(paddr[1]), .B(paddr[2]), .Y(n189) );
  NOR2X1 U250 ( .A(n156), .B(n235), .Y(n138) );
  INVX1 U65 ( .A(bit_period[1]), .Y(n70) );
  INVX2 U66 ( .A(n97), .Y(n60) );
  INVX2 U67 ( .A(n86), .Y(n61) );
  INVX2 U68 ( .A(n92), .Y(n62) );
  INVX2 U69 ( .A(n70), .Y(n71) );
  AND2X2 U70 ( .A(n142), .B(n137), .Y(n63) );
  INVX1 U71 ( .A(bit_period[13]), .Y(n97) );
  INVX2 U72 ( .A(n91), .Y(n64) );
  BUFX4 U73 ( .A(n239), .Y(data_size[1]) );
  BUFX4 U74 ( .A(n240), .Y(data_size[0]) );
  AND2X2 U75 ( .A(n137), .B(n117), .Y(n67) );
  INVX2 U76 ( .A(n79), .Y(n80) );
  INVX2 U77 ( .A(n128), .Y(n79) );
  INVX2 U78 ( .A(n63), .Y(n78) );
  BUFX2 U79 ( .A(n_rst), .Y(n81) );
  BUFX2 U80 ( .A(n_rst), .Y(n82) );
  BUFX2 U81 ( .A(n_rst), .Y(n83) );
  BUFX2 U82 ( .A(n_rst), .Y(n84) );
  BUFX2 U83 ( .A(n_rst), .Y(n85) );
  INVX2 U84 ( .A(n210), .Y(n116) );
  INVX1 U85 ( .A(bit_period[6]), .Y(n103) );
  INVX2 U86 ( .A(n88), .Y(n68) );
  INVX2 U87 ( .A(n96), .Y(n69) );
  INVX1 U88 ( .A(bit_period[7]), .Y(n105) );
  INVX2 U89 ( .A(n90), .Y(n72) );
  INVX2 U90 ( .A(n89), .Y(n73) );
  INVX1 U91 ( .A(bit_period[12]), .Y(n96) );
  INVX1 U92 ( .A(n71), .Y(n87) );
  INVX2 U93 ( .A(n95), .Y(n74) );
  INVX2 U94 ( .A(n93), .Y(n75) );
  INVX2 U95 ( .A(n94), .Y(n76) );
  BUFX4 U96 ( .A(n241), .Y(bit_period[8]) );
  INVX1 U97 ( .A(bit_period[11]), .Y(n95) );
  INVX1 U98 ( .A(bit_period[5]), .Y(n91) );
  INVX1 U99 ( .A(bit_period[0]), .Y(n86) );
  INVX1 U100 ( .A(bit_period[3]), .Y(n89) );
  INVX1 U101 ( .A(bit_period[9]), .Y(n93) );
  INVX1 U102 ( .A(bit_period[8]), .Y(n92) );
  INVX1 U103 ( .A(bit_period[2]), .Y(n88) );
  INVX1 U104 ( .A(bit_period[10]), .Y(n94) );
  INVX1 U105 ( .A(bit_period[4]), .Y(n90) );
  INVX2 U106 ( .A(pwdata[0]), .Y(n151) );
  INVX2 U107 ( .A(n199), .Y(n117) );
  MUX2X1 U108 ( .B(n86), .A(n151), .S(n67), .Y(n201) );
  INVX2 U109 ( .A(pwdata[1]), .Y(n140) );
  MUX2X1 U110 ( .B(n87), .A(n140), .S(n67), .Y(n198) );
  INVX2 U111 ( .A(pwdata[2]), .Y(n126) );
  MUX2X1 U112 ( .B(n88), .A(n126), .S(n67), .Y(n197) );
  INVX2 U113 ( .A(pwdata[3]), .Y(n125) );
  MUX2X1 U114 ( .B(n89), .A(n125), .S(n67), .Y(n196) );
  INVX2 U115 ( .A(pwdata[4]), .Y(n124) );
  MUX2X1 U116 ( .B(n90), .A(n124), .S(n67), .Y(n195) );
  INVX2 U117 ( .A(pwdata[5]), .Y(n123) );
  MUX2X1 U118 ( .B(n91), .A(n123), .S(n67), .Y(n194) );
  MUX2X1 U119 ( .B(n103), .A(n238), .S(n67), .Y(n193) );
  MUX2X1 U120 ( .B(n105), .A(n237), .S(n67), .Y(n192) );
  INVX2 U121 ( .A(paddr[2]), .Y(n156) );
  NAND3X1 U122 ( .A(n187), .B(n137), .C(n156), .Y(n200) );
  INVX2 U123 ( .A(n200), .Y(n122) );
  MUX2X1 U124 ( .B(n92), .A(n151), .S(n122), .Y(n215) );
  MUX2X1 U125 ( .B(n93), .A(n140), .S(n122), .Y(n216) );
  MUX2X1 U126 ( .B(n94), .A(n126), .S(n122), .Y(n217) );
  MUX2X1 U127 ( .B(n95), .A(n125), .S(n122), .Y(n218) );
  MUX2X1 U128 ( .B(n96), .A(n124), .S(n122), .Y(n219) );
  MUX2X1 U129 ( .B(n97), .A(n123), .S(n122), .Y(n220) );
  NAND2X1 U130 ( .A(n137), .B(n116), .Y(n202) );
  INVX2 U131 ( .A(data_size[0]), .Y(n98) );
  INVX2 U158 ( .A(n202), .Y(n121) );
  MUX2X1 U171 ( .B(n98), .A(n151), .S(n121), .Y(n191) );
  INVX2 U172 ( .A(data_size[1]), .Y(n99) );
  MUX2X1 U176 ( .B(n99), .A(n140), .S(n121), .Y(n190) );
  INVX2 U177 ( .A(data_size[2]), .Y(n100) );
  MUX2X1 U180 ( .B(n100), .A(n126), .S(n121), .Y(n186) );
  INVX2 U181 ( .A(data_size[3]), .Y(n101) );
  MUX2X1 U182 ( .B(n101), .A(n125), .S(n121), .Y(n185) );
  INVX2 U185 ( .A(\mapping[3][7] ), .Y(n229) );
  INVX2 U186 ( .A(\mapping[3][6] ), .Y(n230) );
  AOI22X1 U187 ( .A(\mapping[3][6] ), .B(n187), .C(\mapping[4][6] ), .D(n116), 
        .Y(n102) );
  OAI21X1 U190 ( .A(n199), .B(n103), .C(n102), .Y(n155) );
  AOI22X1 U191 ( .A(\mapping[3][7] ), .B(n187), .C(\mapping[4][7] ), .D(n116), 
        .Y(n104) );
  OAI21X1 U192 ( .A(n199), .B(n105), .C(n104), .Y(n149) );
  AOI22X1 U195 ( .A(n62), .B(n187), .C(data_size[0]), .D(n116), .Y(n107) );
  AOI21X1 U196 ( .A(n61), .B(n117), .C(n184), .Y(n106) );
  INVX2 U197 ( .A(n150), .Y(n118) );
  AOI21X1 U200 ( .A(n107), .B(n106), .C(n118), .Y(n161) );
  AOI22X1 U201 ( .A(n75), .B(n187), .C(data_size[1]), .D(n116), .Y(n109) );
  AOI21X1 U202 ( .A(n71), .B(n117), .C(n179), .Y(n108) );
  AOI21X1 U205 ( .A(n109), .B(n108), .C(n118), .Y(n163) );
  AOI22X1 U206 ( .A(n76), .B(n187), .C(data_size[2]), .D(n116), .Y(n111) );
  AOI21X1 U207 ( .A(n68), .B(n117), .C(n174), .Y(n110) );
  AOI21X1 U210 ( .A(n111), .B(n110), .C(n118), .Y(n165) );
  AOI22X1 U211 ( .A(n74), .B(n187), .C(data_size[3]), .D(n116), .Y(n113) );
  AOI21X1 U212 ( .A(n73), .B(n117), .C(n169), .Y(n112) );
  AOI21X1 U213 ( .A(n113), .B(n112), .C(n118), .Y(n166) );
  AOI22X1 U214 ( .A(n69), .B(n187), .C(\mapping[4][4] ), .D(n116), .Y(n115) );
  AOI21X1 U215 ( .A(n72), .B(n117), .C(n164), .Y(n114) );
  AOI21X1 U216 ( .A(n115), .B(n114), .C(n118), .Y(n168) );
  AOI22X1 U217 ( .A(n60), .B(n187), .C(\mapping[4][5] ), .D(n116), .Y(n120) );
  AOI21X1 U218 ( .A(n64), .B(n117), .C(n159), .Y(n119) );
  AOI21X1 U220 ( .A(n120), .B(n119), .C(n118), .Y(n170) );
  INVX2 U221 ( .A(n206), .Y(n183) );
  INVX2 U222 ( .A(n207), .Y(n181) );
  INVX2 U223 ( .A(n208), .Y(n180) );
  INVX2 U224 ( .A(n209), .Y(n178) );
  INVX2 U225 ( .A(framing_error), .Y(n158) );
  INVX2 U228 ( .A(n127), .Y(n160) );
  INVX2 U230 ( .A(n153), .Y(n171) );
  INVX2 U231 ( .A(n147), .Y(n173) );
  INVX2 U232 ( .A(n146), .Y(n175) );
  INVX2 U233 ( .A(state[0]), .Y(n176) );
  INVX2 U238 ( .A(state[1]), .Y(n203) );
  INVX2 U251 ( .A(\mapping[6][7] ), .Y(n204) );
  INVX2 U252 ( .A(\mapping[6][6] ), .Y(n205) );
  INVX2 U253 ( .A(\mapping[6][5] ), .Y(n223) );
  INVX2 U254 ( .A(\mapping[6][4] ), .Y(n224) );
  INVX2 U255 ( .A(\mapping[6][3] ), .Y(n225) );
  INVX2 U256 ( .A(\mapping[6][2] ), .Y(n226) );
  INVX2 U257 ( .A(\mapping[6][1] ), .Y(n227) );
  INVX2 U258 ( .A(\mapping[6][0] ), .Y(n228) );
  INVX2 U259 ( .A(psel), .Y(n231) );
  INVX2 U260 ( .A(pwrite), .Y(n232) );
  INVX2 U261 ( .A(n214), .Y(n233) );
  INVX2 U262 ( .A(n138), .Y(n234) );
  INVX2 U263 ( .A(paddr[1]), .Y(n235) );
  INVX2 U264 ( .A(paddr[0]), .Y(n236) );
  INVX2 U265 ( .A(pwdata[7]), .Y(n237) );
  INVX2 U266 ( .A(pwdata[6]), .Y(n238) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, penable, pwrite, paddr, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_read, data_ready, overrun_error, framing_error;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;
  wire   [7:0] rx_data;

  rcv_block rcv_block ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .data_read(data_read), .data_size(data_size), .bit_period(bit_period), 
        .rx_data(rx_data), .data_ready(data_ready), .overrun_error(
        overrun_error), .framing_error(framing_error) );
  apb_slave apb_slave ( .clk(clk), .n_rst(n_rst), .data_ready(data_ready), 
        .overrun_error(overrun_error), .framing_error(framing_error), .psel(
        psel), .penable(penable), .pwrite(pwrite), .rx_data(rx_data), .pwdata(
        pwdata), .paddr(paddr), .prdata(prdata), .data_read(data_read), 
        .pslverr(pslverr), .data_size(data_size), .bit_period(bit_period) );
endmodule

