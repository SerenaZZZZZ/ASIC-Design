/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Jan 14 14:14:03 2020
/////////////////////////////////////////////////////////////


module comparator ( a, b, gt, lt, eq );
  input [15:0] a;
  input [15:0] b;
  output gt, lt, eq;
  wire   N0, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64;
  assign gt = 1'b0;
  assign lt = N0;

  INVX1 U5 ( .A(N0), .Y(eq) );
  OAI21X1 U6 ( .A(a[15]), .B(n4), .C(n5), .Y(N0) );
  OAI21X1 U7 ( .A(b[15]), .B(n6), .C(n7), .Y(n5) );
  OAI21X1 U8 ( .A(a[14]), .B(n8), .C(n9), .Y(n7) );
  OAI21X1 U9 ( .A(b[14]), .B(n10), .C(n11), .Y(n9) );
  AOI21X1 U10 ( .A(a[13]), .B(n12), .C(n13), .Y(n11) );
  AOI21X1 U11 ( .A(n14), .B(n15), .C(b[13]), .Y(n13) );
  INVX1 U12 ( .A(a[13]), .Y(n14) );
  INVX1 U13 ( .A(n15), .Y(n12) );
  OAI21X1 U14 ( .A(a[12]), .B(n16), .C(n17), .Y(n15) );
  OAI21X1 U15 ( .A(b[12]), .B(n18), .C(n19), .Y(n17) );
  AOI21X1 U16 ( .A(a[11]), .B(n20), .C(n21), .Y(n19) );
  AOI21X1 U17 ( .A(n22), .B(n23), .C(b[11]), .Y(n21) );
  INVX1 U18 ( .A(a[11]), .Y(n22) );
  INVX1 U19 ( .A(n23), .Y(n20) );
  OAI21X1 U20 ( .A(a[10]), .B(n24), .C(n25), .Y(n23) );
  OAI21X1 U21 ( .A(b[10]), .B(n26), .C(n27), .Y(n25) );
  AOI21X1 U22 ( .A(a[9]), .B(n28), .C(n29), .Y(n27) );
  AOI21X1 U23 ( .A(n30), .B(n31), .C(b[9]), .Y(n29) );
  INVX1 U24 ( .A(a[9]), .Y(n30) );
  INVX1 U25 ( .A(n31), .Y(n28) );
  OAI21X1 U26 ( .A(a[8]), .B(n32), .C(n33), .Y(n31) );
  OAI21X1 U27 ( .A(b[8]), .B(n34), .C(n35), .Y(n33) );
  AOI21X1 U28 ( .A(a[7]), .B(n36), .C(n37), .Y(n35) );
  AOI21X1 U29 ( .A(n38), .B(n39), .C(b[7]), .Y(n37) );
  INVX1 U30 ( .A(a[7]), .Y(n38) );
  INVX1 U31 ( .A(n39), .Y(n36) );
  OAI21X1 U32 ( .A(a[6]), .B(n40), .C(n41), .Y(n39) );
  OAI21X1 U33 ( .A(b[6]), .B(n42), .C(n43), .Y(n41) );
  AOI21X1 U34 ( .A(a[5]), .B(n44), .C(n45), .Y(n43) );
  AOI21X1 U35 ( .A(n46), .B(n47), .C(b[5]), .Y(n45) );
  INVX1 U36 ( .A(a[5]), .Y(n46) );
  INVX1 U37 ( .A(n47), .Y(n44) );
  OAI21X1 U38 ( .A(a[4]), .B(n48), .C(n49), .Y(n47) );
  OAI21X1 U39 ( .A(b[4]), .B(n50), .C(n51), .Y(n49) );
  AOI21X1 U40 ( .A(a[3]), .B(n52), .C(n53), .Y(n51) );
  AOI21X1 U41 ( .A(n54), .B(n55), .C(b[3]), .Y(n53) );
  INVX1 U42 ( .A(a[3]), .Y(n54) );
  INVX1 U43 ( .A(n55), .Y(n52) );
  OAI21X1 U44 ( .A(a[2]), .B(n56), .C(n57), .Y(n55) );
  OAI21X1 U45 ( .A(b[2]), .B(n58), .C(n59), .Y(n57) );
  AOI21X1 U46 ( .A(a[1]), .B(n60), .C(n61), .Y(n59) );
  INVX1 U47 ( .A(n62), .Y(n61) );
  OAI21X1 U48 ( .A(n60), .B(a[1]), .C(n63), .Y(n62) );
  INVX1 U49 ( .A(b[1]), .Y(n63) );
  NAND2X1 U50 ( .A(b[0]), .B(n64), .Y(n60) );
  INVX1 U51 ( .A(a[0]), .Y(n64) );
  INVX1 U52 ( .A(a[2]), .Y(n58) );
  INVX1 U53 ( .A(b[2]), .Y(n56) );
  INVX1 U54 ( .A(a[4]), .Y(n50) );
  INVX1 U55 ( .A(b[4]), .Y(n48) );
  INVX1 U56 ( .A(a[6]), .Y(n42) );
  INVX1 U57 ( .A(b[6]), .Y(n40) );
  INVX1 U58 ( .A(a[8]), .Y(n34) );
  INVX1 U59 ( .A(b[8]), .Y(n32) );
  INVX1 U60 ( .A(a[10]), .Y(n26) );
  INVX1 U61 ( .A(b[10]), .Y(n24) );
  INVX1 U62 ( .A(a[12]), .Y(n18) );
  INVX1 U63 ( .A(b[12]), .Y(n16) );
  INVX1 U64 ( .A(a[14]), .Y(n10) );
  INVX1 U65 ( .A(b[14]), .Y(n8) );
  INVX1 U66 ( .A(a[15]), .Y(n6) );
  INVX1 U67 ( .A(b[15]), .Y(n4) );
endmodule

