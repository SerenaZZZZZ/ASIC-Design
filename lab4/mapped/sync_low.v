/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Feb  4 18:17:07 2020
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out );
  input clk, n_rst, async_in;
  output sync_out;
  wire   ff1;

  DFFSR ff1_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(ff1) );
  DFFSR sync_out_reg ( .D(ff1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule

