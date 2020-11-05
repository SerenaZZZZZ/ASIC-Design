/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Sun Feb 16 23:07:45 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  output [3:0] rollover_flag;
  input clk, n_rst, clear, count_enable;
  wire   N21, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57;
  wire   [3:0] next_count;
  assign rollover_flag[3] = 1'b0;
  assign rollover_flag[2] = 1'b0;
  assign rollover_flag[1] = 1'b0;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \rollover_flag_reg[0]  ( .D(N21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag[0]) );
  NOR2X1 U39 ( .A(n35), .B(n36), .Y(N21) );
  NAND2X1 U40 ( .A(n37), .B(n38), .Y(n36) );
  XNOR2X1 U41 ( .A(next_count[1]), .B(rollover_val[1]), .Y(n38) );
  AND2X1 U42 ( .A(n39), .B(n40), .Y(next_count[1]) );
  XNOR2X1 U43 ( .A(count_out[1]), .B(n41), .Y(n40) );
  NAND2X1 U44 ( .A(count_enable), .B(count_out[0]), .Y(n41) );
  XNOR2X1 U45 ( .A(next_count[2]), .B(rollover_val[2]), .Y(n37) );
  AND2X1 U46 ( .A(n39), .B(n42), .Y(next_count[2]) );
  XOR2X1 U47 ( .A(n43), .B(n44), .Y(n42) );
  NAND2X1 U48 ( .A(n45), .B(n46), .Y(n35) );
  XNOR2X1 U49 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n46) );
  OAI21X1 U50 ( .A(clear), .B(n47), .C(n48), .Y(next_count[0]) );
  XNOR2X1 U51 ( .A(count_enable), .B(count_out[0]), .Y(n47) );
  XNOR2X1 U52 ( .A(next_count[3]), .B(rollover_val[3]), .Y(n45) );
  AND2X1 U53 ( .A(n39), .B(n49), .Y(next_count[3]) );
  XOR2X1 U54 ( .A(count_out[3]), .B(n50), .Y(n49) );
  NOR2X1 U55 ( .A(n43), .B(n44), .Y(n50) );
  NAND3X1 U56 ( .A(count_out[1]), .B(count_out[0]), .C(count_enable), .Y(n44)
         );
  AND2X1 U57 ( .A(n48), .B(n51), .Y(n39) );
  OR2X1 U58 ( .A(n52), .B(n53), .Y(n48) );
  NAND3X1 U59 ( .A(n54), .B(n55), .C(n56), .Y(n53) );
  XOR2X1 U60 ( .A(n43), .B(rollover_val[2]), .Y(n56) );
  INVX1 U61 ( .A(count_out[2]), .Y(n43) );
  XNOR2X1 U62 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n55) );
  XNOR2X1 U63 ( .A(count_out[1]), .B(rollover_val[1]), .Y(n54) );
  NAND3X1 U64 ( .A(count_enable), .B(n51), .C(n57), .Y(n52) );
  XNOR2X1 U65 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n57) );
  INVX1 U66 ( .A(clear), .Y(n51) );
endmodule

