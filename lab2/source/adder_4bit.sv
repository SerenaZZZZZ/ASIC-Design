// $Id: $40
// File name:   adder_4bit.sv
// Created:     1/21/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: 4-bit Full Adder Deisign

module adder_4bit
(
	input wire [3:0] a,
	input wire [3:0] b,
	input wire carry_in,
	output wire [3:0] sum,
	output wire overflow
);
	wire [4:0] carrys;
	genvar i;

	assign carrys [0] = carry_in;
	generate
	for (i = 0; i <= 3; i = i + 1)
	begin
		adder_1bit IX (.a(a[i]), .b(b[i]), .carry_in(carrys[i]), .sum(sum[i]), .carry_out(carrys[i+1]));
	end
	endgenerate
	assign overflow = carrys[4];
	//wire [2:0] temp;

	//assign sum[0] = carry_in ^ (a[0] ^ b[0]);
	//assign temp[0] = ((~carry_in) & b[0] & a[0]) | (carry_in & (b[0] | a[0]));

	//assign sum[1] = overflow ^ (a[1] ^ b[1]);
	//assign temp[1] = ((~temp[0]) & b[1] & a[1]) | (temp[0] & (b[1] | a[1]));

	//assign sum[2] = overflow ^ (a[2] ^ b[2]);
	//assign temp[2] = ((~temp[1]) & b[1] & a[1]) | (temp[1] & (b[2] | a[2]));

	//assign sum[3] = overflow ^ (a[3] ^ b[3]);
	//assign overflow = ((~temp[2]) & b[3] & a[3]) | (temp[2] & (b[3] | a[3]));



endmodule