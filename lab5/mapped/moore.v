/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Feb 17 20:52:57 2020
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24;
  wire   [2:0] state;
  wire   [2:0] nxt_state;

  DFFSR \state_reg[0]  ( .D(nxt_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[0]) );
  DFFSR \state_reg[1]  ( .D(nxt_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[1]) );
  DFFSR \state_reg[2]  ( .D(nxt_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        state[2]) );
  INVX1 U20 ( .A(n14), .Y(o) );
  NOR2X1 U21 ( .A(n15), .B(n16), .Y(nxt_state[2]) );
  OAI21X1 U22 ( .A(n17), .B(n14), .C(n18), .Y(nxt_state[1]) );
  MUX2X1 U23 ( .B(n19), .A(n20), .S(state[1]), .Y(n18) );
  NOR2X1 U24 ( .A(state[2]), .B(state[0]), .Y(n20) );
  INVX1 U25 ( .A(n15), .Y(n19) );
  NAND3X1 U26 ( .A(i), .B(n21), .C(state[0]), .Y(n15) );
  NAND3X1 U27 ( .A(n22), .B(n16), .C(state[2]), .Y(n14) );
  INVX1 U28 ( .A(state[1]), .Y(n16) );
  NOR2X1 U29 ( .A(n23), .B(n24), .Y(nxt_state[0]) );
  NAND2X1 U30 ( .A(n22), .B(n21), .Y(n24) );
  INVX1 U31 ( .A(state[2]), .Y(n21) );
  INVX1 U32 ( .A(state[0]), .Y(n22) );
  XOR2X1 U33 ( .A(n17), .B(state[1]), .Y(n23) );
  INVX1 U34 ( .A(i), .Y(n17) );
endmodule

