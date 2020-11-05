// $Id: $40
// File name:   adder_1bit.sv
// Created:     1/21/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: 1-bit Full Adder Design
`timescale 1ns/100ps
module adder_1bit
(
	input wire a,
	input wire b,
	input wire carry_in,
	output wire sum,
	output wire carry_out
);
	assign sum = carry_in ^ (a ^ b);
	assign carry_out = ((~carry_in) & b & a) | (carry_in & (b | a));

	always @ (a)
	begin
		assert((a == 1'b1)||(a == 1'b0))
		else $error("Input 'a' of component is not a digital logic value");
	end

	always @ (b)
	begin
		assert((b == 1'b1)||(b == 1'b0))
		else $error("Input 'b' of component is not a digital logic value");
	end

	always @ (carry_in)
	begin
		assert((carry_in == 1'b1)||(carry_in == 1'b0))
		else $error("Input 'carry_in' of component is not a digital logic value");
	end

	always @(a, b, carry_in)
	begin	
		#(2) assert(((a+ b + carry_in) % 2) == sum)
		else $error ("Output 'sum' of first 1 bit adder is not correct");

		#(2) assert(((a + b + carry_in) / 2) == carry_out)
		else $error("Output 'carry_out' of first 1 bit adder is not correct");
	end

endmodule
