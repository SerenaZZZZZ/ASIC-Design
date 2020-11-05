// $Id: $40
// File name:   sensor_b.sv
// Created:     1/21/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Behavioral Style Sensor Error Detector Design

module sensor_b
(
	input wire [3:0] sensors, 
	output reg error
);

	always_comb begin
		error = sensors[0] | sensors[1] & sensors[2] | sensors[1] & sensors[3];
	end

endmodule