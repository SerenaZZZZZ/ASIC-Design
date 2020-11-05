/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 28 13:36:55 2020
/////////////////////////////////////////////////////////////


module adder_16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [16:0] A;
  input [16:0] B;
  output [16:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30;
  wire   [16:1] carry;

  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(carry[1]), .YC(carry[2]), .YS(SUM[1]) );
  FAX1 U1_0 ( .A(A[0]), .B(B[0]), .C(CI), .YC(carry[1]), .YS(SUM[0]) );
  BUFX4 U1 ( .A(carry[14]), .Y(n9) );
  BUFX4 U2 ( .A(carry[10]), .Y(n10) );
  INVX2 U3 ( .A(carry[4]), .Y(n1) );
  INVX4 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(n7), .Y(n8) );
  XOR2X1 U6 ( .A(A[4]), .B(B[4]), .Y(n3) );
  XOR2X1 U7 ( .A(n2), .B(n3), .Y(SUM[4]) );
  NAND2X1 U8 ( .A(n2), .B(A[4]), .Y(n4) );
  NAND2X1 U9 ( .A(n2), .B(B[4]), .Y(n5) );
  NAND2X1 U10 ( .A(A[4]), .B(B[4]), .Y(n6) );
  NAND3X1 U11 ( .A(n5), .B(n4), .C(n6), .Y(carry[5]) );
  INVX2 U12 ( .A(carry[6]), .Y(n7) );
  XOR2X1 U13 ( .A(A[6]), .B(B[6]), .Y(n11) );
  XOR2X1 U14 ( .A(n8), .B(n11), .Y(SUM[6]) );
  NAND2X1 U15 ( .A(n8), .B(A[6]), .Y(n12) );
  NAND2X1 U16 ( .A(n8), .B(B[6]), .Y(n13) );
  NAND2X1 U17 ( .A(A[6]), .B(B[6]), .Y(n14) );
  NAND3X1 U18 ( .A(n13), .B(n12), .C(n14), .Y(carry[7]) );
  XOR2X1 U19 ( .A(A[10]), .B(B[10]), .Y(n15) );
  XOR2X1 U20 ( .A(n15), .B(n10), .Y(SUM[10]) );
  NAND2X1 U21 ( .A(A[10]), .B(B[10]), .Y(n16) );
  NAND2X1 U22 ( .A(A[10]), .B(n10), .Y(n17) );
  NAND2X1 U23 ( .A(B[10]), .B(n10), .Y(n18) );
  NAND3X1 U24 ( .A(n16), .B(n17), .C(n18), .Y(carry[11]) );
  XOR2X1 U25 ( .A(A[11]), .B(B[11]), .Y(n19) );
  XOR2X1 U26 ( .A(n19), .B(carry[11]), .Y(SUM[11]) );
  NAND2X1 U27 ( .A(A[11]), .B(B[11]), .Y(n20) );
  NAND2X1 U28 ( .A(A[11]), .B(carry[11]), .Y(n21) );
  NAND2X1 U29 ( .A(B[11]), .B(carry[11]), .Y(n22) );
  NAND3X1 U30 ( .A(n20), .B(n21), .C(n22), .Y(carry[12]) );
  XOR2X1 U31 ( .A(A[14]), .B(B[14]), .Y(n23) );
  XOR2X1 U32 ( .A(n23), .B(n9), .Y(SUM[14]) );
  NAND2X1 U33 ( .A(A[14]), .B(B[14]), .Y(n24) );
  NAND2X1 U34 ( .A(A[14]), .B(n9), .Y(n25) );
  NAND2X1 U35 ( .A(B[14]), .B(n9), .Y(n26) );
  NAND3X1 U36 ( .A(n24), .B(n25), .C(n26), .Y(carry[15]) );
  XOR2X1 U37 ( .A(A[15]), .B(B[15]), .Y(n27) );
  XOR2X1 U38 ( .A(n27), .B(carry[15]), .Y(SUM[15]) );
  NAND2X1 U39 ( .A(A[15]), .B(B[15]), .Y(n28) );
  NAND2X1 U40 ( .A(A[15]), .B(carry[15]), .Y(n29) );
  NAND2X1 U41 ( .A(B[15]), .B(carry[15]), .Y(n30) );
  NAND3X1 U42 ( .A(n28), .B(n29), .C(n30), .Y(SUM[16]) );
endmodule


module adder_16 ( a, b, carry_in, sum, overflow );
  input [15:0] a;
  input [15:0] b;
  output [15:0] sum;
  input carry_in;
  output overflow;


  adder_16_DW01_add_0 r304 ( .A({1'b0, a}), .B({1'b0, b}), .CI(carry_in), 
        .SUM({overflow, sum}) );
endmodule

