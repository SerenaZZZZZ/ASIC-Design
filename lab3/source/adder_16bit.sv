// $Id: $40
// File name:   adder_16bit.sv
// Created:     1/28/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: 16bit adder wrapper based on nbit adder.

module adder_16bit
(
	input wire [15:0] a,
	input wire [15:0] b,
	input wire carry_in,
	output wire [15:0] sum,
	output wire overflow
);
	adder_nbit #(16) XXX(.a(a), .b(b), .carry_in(carry_in), .sum(sum), .overflow(overflow));
	always @ (carry_in)
	begin
		assert((carry_in == 1'b1)||(carry_in == 1'b0))
		else $error("Input 'carry_in' of component is not a digital logic value");
	end
	genvar i;
	generate
		for(i = 0; i <= 15; i = i + 1)
		begin
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
		end
	endgenerate	
endmodule