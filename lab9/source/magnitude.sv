// $Id: $
// File name:   magnitude.sv
// Created:     3/1/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: If the FIR algorithm produces negative output from the datapath, this block will output the positive magnitude on fir_out instead. Otherwise, this block will pass the datapath’s out_reg value on to fir_out.

module magnitude(
    input [16:0] in,
    output reg [15:0] out
);
assign out = in[16] ? (~in[15:0]+1'b1) : in[15:0] ;

endmodule