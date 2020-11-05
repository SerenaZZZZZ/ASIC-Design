/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Mar 31 01:10:40 2020
/////////////////////////////////////////////////////////////


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
  wire   \mapping[6][7] , \mapping[6][6] , \mapping[6][5] , \mapping[6][4] ,
         \mapping[6][3] , \mapping[6][2] , \mapping[6][1] , \mapping[6][0] ,
         \mapping[4][7] , \mapping[4][6] , \mapping[4][5] , \mapping[4][4] ,
         \mapping[3][7] , \mapping[3][6] , \mapping[1][7] , \mapping[1][6] ,
         \mapping[1][5] , \mapping[1][4] , \mapping[1][3] , \mapping[1][2] ,
         \mapping[1][1] , \mapping[1][0] , \mapping[0][7] , \mapping[0][6] ,
         \mapping[0][5] , \mapping[0][4] , \mapping[0][3] , \mapping[0][2] ,
         \mapping[0][1] , \mapping[0][0] , \nxtmapping[6][7] ,
         \nxtmapping[6][6] , \nxtmapping[6][5] , \nxtmapping[6][4] ,
         \nxtmapping[6][3] , \nxtmapping[6][2] , \nxtmapping[6][1] ,
         \nxtmapping[6][0] , \nxtmapping[1][7] , \nxtmapping[1][6] ,
         \nxtmapping[1][5] , \nxtmapping[1][4] , \nxtmapping[1][3] ,
         \nxtmapping[1][2] , \nxtmapping[1][1] , \nxtmapping[1][0] ,
         \nxtmapping[0][7] , \nxtmapping[0][6] , \nxtmapping[0][5] ,
         \nxtmapping[0][4] , \nxtmapping[0][3] , \nxtmapping[0][2] ,
         \nxtmapping[0][1] , \nxtmapping[0][0] , nxt_pslverr, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n80, n81, n82, n83, n84, n85, n86, n87, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n192, n193, n194, n195, n196,
         n197, n198, n199, n200, n201, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232;
  wire   [1:0] state;

  DFFSR \state_reg[0]  ( .D(n68), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n69), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \mapping_reg[6][7]  ( .D(\nxtmapping[6][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[6][7] ) );
  DFFSR \mapping_reg[6][6]  ( .D(\nxtmapping[6][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[6][6] ) );
  DFFSR \mapping_reg[6][5]  ( .D(\nxtmapping[6][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[6][5] ) );
  DFFSR \mapping_reg[6][4]  ( .D(\nxtmapping[6][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[6][4] ) );
  DFFSR \mapping_reg[6][3]  ( .D(\nxtmapping[6][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[6][3] ) );
  DFFSR \mapping_reg[6][2]  ( .D(\nxtmapping[6][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[6][2] ) );
  DFFSR \mapping_reg[6][1]  ( .D(\nxtmapping[6][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[6][1] ) );
  DFFSR \mapping_reg[6][0]  ( .D(\nxtmapping[6][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[6][0] ) );
  DFFSR \mapping_reg[4][7]  ( .D(n70), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mapping[4][7] ) );
  DFFSR \mapping_reg[4][6]  ( .D(n71), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mapping[4][6] ) );
  DFFSR \mapping_reg[4][5]  ( .D(n72), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mapping[4][5] ) );
  DFFSR \mapping_reg[4][4]  ( .D(n73), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mapping[4][4] ) );
  DFFSR \mapping_reg[4][3]  ( .D(n74), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \mapping_reg[4][2]  ( .D(n75), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \mapping_reg[4][1]  ( .D(n76), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[1]) );
  DFFSR \mapping_reg[4][0]  ( .D(n77), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[0]) );
  DFFSR \mapping_reg[3][7]  ( .D(n222), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mapping[3][7] ) );
  DFFSR \mapping_reg[3][6]  ( .D(n221), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mapping[3][6] ) );
  DFFSR \mapping_reg[3][5]  ( .D(n220), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[13]) );
  DFFSR \mapping_reg[3][4]  ( .D(n219), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[12]) );
  DFFSR \mapping_reg[3][3]  ( .D(n218), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[11]) );
  DFFSR \mapping_reg[3][2]  ( .D(n217), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[10]) );
  DFFSR \mapping_reg[3][1]  ( .D(n216), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[9]) );
  DFFSR \mapping_reg[3][0]  ( .D(n215), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[8]) );
  DFFSR \mapping_reg[2][7]  ( .D(n80), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[7]) );
  DFFSR \mapping_reg[2][6]  ( .D(n81), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[6]) );
  DFFSR \mapping_reg[2][5]  ( .D(n82), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[5]) );
  DFFSR \mapping_reg[2][4]  ( .D(n83), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[4]) );
  DFFSR \mapping_reg[2][3]  ( .D(n84), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[3]) );
  DFFSR \mapping_reg[2][2]  ( .D(n85), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[2]) );
  DFFSR \mapping_reg[2][1]  ( .D(n86), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[1]) );
  DFFSR \mapping_reg[2][0]  ( .D(n87), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        bit_period[0]) );
  DFFSR \mapping_reg[1][7]  ( .D(\nxtmapping[1][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[1][7] ) );
  DFFSR \mapping_reg[1][6]  ( .D(\nxtmapping[1][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[1][6] ) );
  DFFSR \mapping_reg[1][5]  ( .D(\nxtmapping[1][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[1][5] ) );
  DFFSR \mapping_reg[1][4]  ( .D(\nxtmapping[1][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[1][4] ) );
  DFFSR \mapping_reg[1][3]  ( .D(\nxtmapping[1][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[1][3] ) );
  DFFSR \mapping_reg[1][2]  ( .D(\nxtmapping[1][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[1][2] ) );
  DFFSR \mapping_reg[1][1]  ( .D(\nxtmapping[1][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[1][1] ) );
  DFFSR \mapping_reg[1][0]  ( .D(\nxtmapping[1][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[1][0] ) );
  DFFSR \mapping_reg[0][7]  ( .D(\nxtmapping[0][7] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[0][7] ) );
  DFFSR \prdata_reg[7]  ( .D(n67), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[7]) );
  DFFSR \mapping_reg[0][6]  ( .D(\nxtmapping[0][6] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[0][6] ) );
  DFFSR \prdata_reg[6]  ( .D(n66), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[6]) );
  DFFSR \mapping_reg[0][5]  ( .D(\nxtmapping[0][5] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[0][5] ) );
  DFFSR \prdata_reg[5]  ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[5]) );
  DFFSR \mapping_reg[0][4]  ( .D(\nxtmapping[0][4] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[0][4] ) );
  DFFSR \prdata_reg[4]  ( .D(n64), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[4]) );
  DFFSR \mapping_reg[0][3]  ( .D(\nxtmapping[0][3] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[0][3] ) );
  DFFSR \prdata_reg[3]  ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[3]) );
  DFFSR \mapping_reg[0][2]  ( .D(\nxtmapping[0][2] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[0][2] ) );
  DFFSR \prdata_reg[2]  ( .D(n62), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[2]) );
  DFFSR \mapping_reg[0][1]  ( .D(\nxtmapping[0][1] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[0][1] ) );
  DFFSR \prdata_reg[1]  ( .D(n61), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[1]) );
  DFFSR \mapping_reg[0][0]  ( .D(\nxtmapping[0][0] ), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(\mapping[0][0] ) );
  DFFSR \prdata_reg[0]  ( .D(n60), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prdata[0]) );
  DFFSR pslverr_reg ( .D(nxt_pslverr), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        pslverr) );
  AND2X2 U62 ( .A(n189), .B(paddr[0]), .Y(n142) );
  AND2X2 U63 ( .A(n189), .B(n126), .Y(n145) );
  AND2X2 U64 ( .A(n138), .B(n150), .Y(data_read) );
  INVX2 U65 ( .A(n183), .Y(n60) );
  INVX2 U66 ( .A(n178), .Y(n61) );
  INVX2 U67 ( .A(n173), .Y(n62) );
  INVX2 U68 ( .A(n168), .Y(n63) );
  INVX2 U69 ( .A(n163), .Y(n64) );
  INVX2 U70 ( .A(n158), .Y(n65) );
  INVX2 U71 ( .A(n153), .Y(n66) );
  INVX2 U72 ( .A(n147), .Y(n67) );
  INVX2 U73 ( .A(n127), .Y(n68) );
  INVX2 U74 ( .A(n146), .Y(n69) );
  INVX2 U75 ( .A(n209), .Y(n70) );
  INVX2 U76 ( .A(n208), .Y(n71) );
  INVX2 U77 ( .A(n207), .Y(n72) );
  INVX2 U78 ( .A(n206), .Y(n73) );
  INVX2 U79 ( .A(n205), .Y(n74) );
  INVX2 U80 ( .A(n204), .Y(n75) );
  INVX2 U81 ( .A(n203), .Y(n76) );
  INVX2 U82 ( .A(n201), .Y(n77) );
  INVX2 U85 ( .A(n198), .Y(n80) );
  INVX2 U86 ( .A(n197), .Y(n81) );
  INVX2 U87 ( .A(n196), .Y(n82) );
  INVX2 U88 ( .A(n195), .Y(n83) );
  INVX2 U89 ( .A(n194), .Y(n84) );
  INVX2 U90 ( .A(n193), .Y(n85) );
  INVX2 U91 ( .A(n192), .Y(n86) );
  INVX2 U92 ( .A(n190), .Y(n87) );
  INVX2 U95 ( .A(state[1]), .Y(n90) );
  INVX2 U96 ( .A(state[0]), .Y(n91) );
  INVX2 U97 ( .A(\mapping[6][7] ), .Y(n92) );
  INVX2 U98 ( .A(\mapping[6][6] ), .Y(n93) );
  INVX2 U99 ( .A(\mapping[6][5] ), .Y(n94) );
  INVX2 U100 ( .A(\mapping[6][4] ), .Y(n95) );
  INVX2 U101 ( .A(\mapping[6][3] ), .Y(n96) );
  INVX2 U102 ( .A(\mapping[6][2] ), .Y(n97) );
  INVX2 U103 ( .A(\mapping[6][1] ), .Y(n98) );
  INVX2 U104 ( .A(\mapping[6][0] ), .Y(n99) );
  INVX2 U105 ( .A(\mapping[3][7] ), .Y(n100) );
  INVX2 U106 ( .A(\mapping[3][6] ), .Y(n101) );
  INVX2 U107 ( .A(bit_period[13]), .Y(n102) );
  INVX2 U108 ( .A(bit_period[12]), .Y(n103) );
  INVX2 U109 ( .A(bit_period[11]), .Y(n104) );
  INVX2 U110 ( .A(bit_period[10]), .Y(n105) );
  INVX2 U111 ( .A(bit_period[9]), .Y(n106) );
  INVX2 U112 ( .A(bit_period[8]), .Y(n107) );
  INVX2 U113 ( .A(framing_error), .Y(n108) );
  INVX2 U114 ( .A(psel), .Y(n109) );
  INVX2 U115 ( .A(pwrite), .Y(n110) );
  INVX2 U116 ( .A(n214), .Y(n111) );
  INVX2 U117 ( .A(pwdata[7]), .Y(n112) );
  INVX2 U118 ( .A(pwdata[6]), .Y(n113) );
  INVX2 U119 ( .A(pwdata[5]), .Y(n114) );
  INVX2 U120 ( .A(pwdata[4]), .Y(n115) );
  INVX2 U121 ( .A(pwdata[3]), .Y(n116) );
  INVX2 U122 ( .A(pwdata[2]), .Y(n117) );
  INVX2 U123 ( .A(pwdata[1]), .Y(n118) );
  INVX2 U124 ( .A(pwdata[0]), .Y(n119) );
  INVX2 U126 ( .A(n138), .Y(n121) );
  INVX2 U128 ( .A(paddr[2]), .Y(n123) );
  INVX2 U129 ( .A(n187), .Y(n124) );
  INVX2 U130 ( .A(paddr[1]), .Y(n125) );
  INVX2 U131 ( .A(paddr[0]), .Y(n126) );
  OAI21X1 U132 ( .A(n232), .B(n112), .C(n129), .Y(\nxtmapping[6][7] ) );
  NAND2X1 U133 ( .A(rx_data[7]), .B(n232), .Y(n129) );
  OAI21X1 U134 ( .A(n232), .B(n113), .C(n130), .Y(\nxtmapping[6][6] ) );
  NAND2X1 U135 ( .A(rx_data[6]), .B(n232), .Y(n130) );
  OAI21X1 U136 ( .A(n232), .B(n114), .C(n131), .Y(\nxtmapping[6][5] ) );
  NAND2X1 U137 ( .A(rx_data[5]), .B(n232), .Y(n131) );
  OAI21X1 U138 ( .A(n232), .B(n115), .C(n132), .Y(\nxtmapping[6][4] ) );
  NAND2X1 U139 ( .A(rx_data[4]), .B(n232), .Y(n132) );
  OAI21X1 U140 ( .A(n232), .B(n116), .C(n133), .Y(\nxtmapping[6][3] ) );
  NAND2X1 U141 ( .A(rx_data[3]), .B(n232), .Y(n133) );
  OAI21X1 U142 ( .A(n232), .B(n117), .C(n134), .Y(\nxtmapping[6][2] ) );
  NAND2X1 U143 ( .A(rx_data[2]), .B(n232), .Y(n134) );
  OAI21X1 U144 ( .A(n232), .B(n118), .C(n135), .Y(\nxtmapping[6][1] ) );
  NAND2X1 U145 ( .A(rx_data[1]), .B(n232), .Y(n135) );
  OAI21X1 U146 ( .A(n232), .B(n119), .C(n136), .Y(\nxtmapping[6][0] ) );
  NAND2X1 U147 ( .A(rx_data[0]), .B(n232), .Y(n136) );
  NAND3X1 U148 ( .A(n137), .B(n126), .C(n138), .Y(n128) );
  NOR2X1 U149 ( .A(n112), .B(n230), .Y(\nxtmapping[1][7] ) );
  NOR2X1 U150 ( .A(n113), .B(n230), .Y(\nxtmapping[1][6] ) );
  NOR2X1 U151 ( .A(n114), .B(n230), .Y(\nxtmapping[1][5] ) );
  NOR2X1 U152 ( .A(n115), .B(n230), .Y(\nxtmapping[1][4] ) );
  NOR2X1 U153 ( .A(n116), .B(n230), .Y(\nxtmapping[1][3] ) );
  NOR2X1 U154 ( .A(n117), .B(n230), .Y(\nxtmapping[1][2] ) );
  OAI21X1 U155 ( .A(n118), .B(n230), .C(n141), .Y(\nxtmapping[1][1] ) );
  NAND3X1 U156 ( .A(n230), .B(n108), .C(overrun_error), .Y(n141) );
  OAI22X1 U157 ( .A(n225), .B(n108), .C(n119), .D(n230), .Y(\nxtmapping[1][0] ) );
  NOR2X1 U159 ( .A(n112), .B(n143), .Y(\nxtmapping[0][7] ) );
  NOR2X1 U160 ( .A(n113), .B(n143), .Y(\nxtmapping[0][6] ) );
  NOR2X1 U161 ( .A(n114), .B(n143), .Y(\nxtmapping[0][5] ) );
  NOR2X1 U162 ( .A(n115), .B(n143), .Y(\nxtmapping[0][4] ) );
  NOR2X1 U163 ( .A(n116), .B(n143), .Y(\nxtmapping[0][3] ) );
  NOR2X1 U164 ( .A(n117), .B(n143), .Y(\nxtmapping[0][2] ) );
  NOR2X1 U165 ( .A(n118), .B(n143), .Y(\nxtmapping[0][1] ) );
  OAI21X1 U166 ( .A(n119), .B(n143), .C(n144), .Y(\nxtmapping[0][0] ) );
  NAND2X1 U167 ( .A(data_ready), .B(n143), .Y(n144) );
  NAND2X1 U168 ( .A(n145), .B(n137), .Y(n143) );
  NOR2X1 U169 ( .A(n127), .B(n146), .Y(nxt_pslverr) );
  OAI21X1 U170 ( .A(n148), .B(n149), .C(n150), .Y(n147) );
  OAI21X1 U171 ( .A(n124), .B(n100), .C(n151), .Y(n149) );
  AOI22X1 U172 ( .A(\mapping[4][7] ), .B(n120), .C(bit_period[7]), .D(n122), 
        .Y(n151) );
  OAI21X1 U173 ( .A(n121), .B(n92), .C(n152), .Y(n148) );
  AOI22X1 U174 ( .A(\mapping[0][7] ), .B(n145), .C(\mapping[1][7] ), .D(n142), 
        .Y(n152) );
  OAI21X1 U175 ( .A(n154), .B(n155), .C(n150), .Y(n153) );
  OAI21X1 U176 ( .A(n124), .B(n101), .C(n156), .Y(n155) );
  AOI22X1 U177 ( .A(\mapping[4][6] ), .B(n120), .C(bit_period[6]), .D(n122), 
        .Y(n156) );
  OAI21X1 U178 ( .A(n121), .B(n93), .C(n157), .Y(n154) );
  AOI22X1 U179 ( .A(\mapping[0][6] ), .B(n145), .C(\mapping[1][6] ), .D(n142), 
        .Y(n157) );
  OAI21X1 U180 ( .A(n159), .B(n160), .C(n150), .Y(n158) );
  OAI21X1 U181 ( .A(n124), .B(n102), .C(n161), .Y(n160) );
  AOI22X1 U182 ( .A(\mapping[4][5] ), .B(n120), .C(bit_period[5]), .D(n122), 
        .Y(n161) );
  OAI21X1 U183 ( .A(n121), .B(n94), .C(n162), .Y(n159) );
  AOI22X1 U184 ( .A(\mapping[0][5] ), .B(n145), .C(\mapping[1][5] ), .D(n142), 
        .Y(n162) );
  OAI21X1 U185 ( .A(n164), .B(n165), .C(n150), .Y(n163) );
  OAI21X1 U186 ( .A(n124), .B(n103), .C(n166), .Y(n165) );
  AOI22X1 U187 ( .A(\mapping[4][4] ), .B(n120), .C(bit_period[4]), .D(n122), 
        .Y(n166) );
  OAI21X1 U188 ( .A(n121), .B(n95), .C(n167), .Y(n164) );
  AOI22X1 U189 ( .A(\mapping[0][4] ), .B(n145), .C(\mapping[1][4] ), .D(n142), 
        .Y(n167) );
  OAI21X1 U190 ( .A(n169), .B(n170), .C(n150), .Y(n168) );
  OAI21X1 U191 ( .A(n124), .B(n104), .C(n171), .Y(n170) );
  AOI22X1 U192 ( .A(data_size[3]), .B(n120), .C(bit_period[3]), .D(n122), .Y(
        n171) );
  OAI21X1 U193 ( .A(n121), .B(n96), .C(n172), .Y(n169) );
  AOI22X1 U194 ( .A(\mapping[0][3] ), .B(n145), .C(\mapping[1][3] ), .D(n142), 
        .Y(n172) );
  OAI21X1 U195 ( .A(n174), .B(n175), .C(n150), .Y(n173) );
  OAI21X1 U196 ( .A(n124), .B(n105), .C(n176), .Y(n175) );
  AOI22X1 U197 ( .A(data_size[2]), .B(n120), .C(bit_period[2]), .D(n122), .Y(
        n176) );
  OAI21X1 U198 ( .A(n121), .B(n97), .C(n177), .Y(n174) );
  AOI22X1 U199 ( .A(\mapping[0][2] ), .B(n145), .C(\mapping[1][2] ), .D(n142), 
        .Y(n177) );
  OAI21X1 U200 ( .A(n179), .B(n180), .C(n150), .Y(n178) );
  OAI21X1 U201 ( .A(n124), .B(n106), .C(n181), .Y(n180) );
  AOI22X1 U202 ( .A(data_size[1]), .B(n120), .C(bit_period[1]), .D(n122), .Y(
        n181) );
  OAI21X1 U203 ( .A(n121), .B(n98), .C(n182), .Y(n179) );
  AOI22X1 U204 ( .A(\mapping[0][1] ), .B(n145), .C(\mapping[1][1] ), .D(n142), 
        .Y(n182) );
  OAI21X1 U205 ( .A(n184), .B(n185), .C(n150), .Y(n183) );
  OAI21X1 U206 ( .A(n124), .B(n107), .C(n186), .Y(n185) );
  AOI22X1 U207 ( .A(data_size[0]), .B(n120), .C(bit_period[0]), .D(n122), .Y(
        n186) );
  OAI21X1 U208 ( .A(n121), .B(n99), .C(n188), .Y(n184) );
  AOI22X1 U209 ( .A(\mapping[0][0] ), .B(n145), .C(\mapping[1][0] ), .D(n142), 
        .Y(n188) );
  AOI22X1 U210 ( .A(pwdata[0]), .B(n223), .C(n229), .D(bit_period[0]), .Y(n190) );
  AOI22X1 U211 ( .A(pwdata[1]), .B(n223), .C(n229), .D(bit_period[1]), .Y(n192) );
  AOI22X1 U212 ( .A(pwdata[2]), .B(n223), .C(n229), .D(bit_period[2]), .Y(n193) );
  AOI22X1 U213 ( .A(pwdata[3]), .B(n223), .C(n229), .D(bit_period[3]), .Y(n194) );
  AOI22X1 U214 ( .A(pwdata[4]), .B(n223), .C(n229), .D(bit_period[4]), .Y(n195) );
  AOI22X1 U215 ( .A(pwdata[5]), .B(n223), .C(n229), .D(bit_period[5]), .Y(n196) );
  AOI22X1 U216 ( .A(pwdata[6]), .B(n223), .C(n229), .D(bit_period[6]), .Y(n197) );
  AOI22X1 U217 ( .A(pwdata[7]), .B(n223), .C(n229), .D(bit_period[7]), .Y(n198) );
  NAND3X1 U219 ( .A(n126), .B(n123), .C(paddr[1]), .Y(n199) );
  OAI22X1 U220 ( .A(n119), .B(n228), .C(n227), .D(n107), .Y(n215) );
  OAI22X1 U221 ( .A(n118), .B(n228), .C(n227), .D(n106), .Y(n216) );
  OAI22X1 U222 ( .A(n117), .B(n228), .C(n227), .D(n105), .Y(n217) );
  OAI22X1 U223 ( .A(n116), .B(n228), .C(n227), .D(n104), .Y(n218) );
  OAI22X1 U224 ( .A(n115), .B(n228), .C(n227), .D(n103), .Y(n219) );
  OAI22X1 U225 ( .A(n114), .B(n228), .C(n227), .D(n102), .Y(n220) );
  OAI22X1 U226 ( .A(n113), .B(n228), .C(n227), .D(n101), .Y(n221) );
  OAI22X1 U227 ( .A(n112), .B(n228), .C(n227), .D(n100), .Y(n222) );
  NAND3X1 U228 ( .A(n137), .B(n123), .C(n187), .Y(n200) );
  NOR2X1 U229 ( .A(n126), .B(n125), .Y(n187) );
  AOI22X1 U230 ( .A(pwdata[0]), .B(n224), .C(n226), .D(data_size[0]), .Y(n201)
         );
  AOI22X1 U231 ( .A(pwdata[1]), .B(n224), .C(n226), .D(data_size[1]), .Y(n203)
         );
  AOI22X1 U232 ( .A(pwdata[2]), .B(n224), .C(n226), .D(data_size[2]), .Y(n204)
         );
  AOI22X1 U233 ( .A(pwdata[3]), .B(n224), .C(n226), .D(data_size[3]), .Y(n205)
         );
  AOI22X1 U234 ( .A(pwdata[4]), .B(n224), .C(n226), .D(\mapping[4][4] ), .Y(
        n206) );
  AOI22X1 U235 ( .A(pwdata[5]), .B(n224), .C(n226), .D(\mapping[4][5] ), .Y(
        n207) );
  AOI22X1 U236 ( .A(pwdata[6]), .B(n224), .C(n226), .D(\mapping[4][6] ), .Y(
        n208) );
  AOI22X1 U237 ( .A(pwdata[7]), .B(n224), .C(n226), .D(\mapping[4][7] ), .Y(
        n209) );
  NOR2X1 U239 ( .A(n90), .B(state[0]), .Y(n137) );
  NAND3X1 U240 ( .A(n126), .B(n125), .C(paddr[2]), .Y(n210) );
  NOR2X1 U241 ( .A(n127), .B(n69), .Y(n150) );
  NAND3X1 U242 ( .A(n91), .B(n90), .C(n211), .Y(n146) );
  OAI21X1 U243 ( .A(n109), .B(n110), .C(n212), .Y(n211) );
  NAND3X1 U244 ( .A(n91), .B(n90), .C(n213), .Y(n127) );
  OAI21X1 U245 ( .A(pwrite), .B(n109), .C(n212), .Y(n213) );
  OAI21X1 U246 ( .A(n111), .B(n139), .C(psel), .Y(n212) );
  NOR2X1 U247 ( .A(n126), .B(n123), .Y(n139) );
  OAI21X1 U248 ( .A(n138), .B(n189), .C(pwrite), .Y(n214) );
  NOR2X1 U249 ( .A(paddr[1]), .B(paddr[2]), .Y(n189) );
  NOR2X1 U250 ( .A(n123), .B(n125), .Y(n138) );
  AND2X2 U251 ( .A(n122), .B(n137), .Y(n223) );
  AND2X2 U252 ( .A(n120), .B(n137), .Y(n224) );
  AND2X2 U253 ( .A(n142), .B(n137), .Y(n225) );
  INVX2 U254 ( .A(n227), .Y(n228) );
  INVX2 U255 ( .A(n231), .Y(n232) );
  INVX2 U256 ( .A(n128), .Y(n231) );
  INVX2 U257 ( .A(n200), .Y(n227) );
  INVX2 U258 ( .A(n223), .Y(n229) );
  INVX2 U259 ( .A(n224), .Y(n226) );
  INVX2 U260 ( .A(n225), .Y(n230) );
  INVX2 U261 ( .A(n199), .Y(n122) );
  INVX2 U262 ( .A(n210), .Y(n120) );
endmodule

