/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Mon Feb 17 21:03:50 2020
/////////////////////////////////////////////////////////////


module mealy ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n10, n11, n12, n13, n14, n15;
  wire   [1:0] state;

  DFFSR \state_reg[0]  ( .D(n11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n10), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  NOR2X1 U15 ( .A(n12), .B(n13), .Y(o) );
  INVX1 U16 ( .A(state[1]), .Y(n12) );
  XOR2X1 U17 ( .A(n14), .B(state[0]), .Y(n11) );
  MUX2X1 U18 ( .B(n15), .A(i), .S(state[1]), .Y(n14) );
  NOR2X1 U19 ( .A(state[0]), .B(i), .Y(n15) );
  MUX2X1 U20 ( .B(n13), .A(state[0]), .S(state[1]), .Y(n10) );
  NAND2X1 U21 ( .A(state[0]), .B(i), .Y(n13) );
endmodule

