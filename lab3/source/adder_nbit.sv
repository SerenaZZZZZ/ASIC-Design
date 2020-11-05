// $Id: $40
// File name:   adder_nbit.sv
// Created:     1/23/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: parameterized Ripple Carry Adder.
`timescale 1ns/100ps
module adder_nbit
#(
	parameter BIT_WIDTH = 4
)
(
	input wire [BIT_WIDTH-1:0] a,b,
	input wire carry_in,
	output wire [BIT_WIDTH-1:0] sum,
	output wire overflow
);

	always @ (carry_in)
	begin
		assert((carry_in == 1'b1)||(carry_in == 1'b0))
		else $error("Input 'carry_in' of component is not a digital logic value");
	end

	wire [BIT_WIDTH:0] carrys;
	genvar i;

	assign carrys[0] = carry_in;
	generate
		for(i = 0; i <= BIT_WIDTH-1; i = i + 1)
		begin
			adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
			always @ (a[i])
			begin
				assert((a[i] == 1'b1)||(a[i] == 1'b0))
				else $error("Input 'a' of component is not a digital logic value");
			end

			always @ (b[i])
			begin
				assert((b[i] == 1'b1)||(b[i] == 1'b0))
				else $error("Input 'b' of component is not a digital logic value");
			end

			always @ (a[i], b[i], carrys[i])
			begin	
				#(2) assert(((a[i] + b[i] + carrys[i]) % 2) == sum[i])
				else $error ("Output 'sum' of first 1 bit adder is not correct");
				//#(2) assert(((a + b + carry_in) / 2) == carry_out)
				//else $error("Output 'carry_out' of first 1 bit adder is not correct");
			end
		end
	endgenerate
	assign overflow = carrys[BIT_WIDTH]; 

	
endmodule