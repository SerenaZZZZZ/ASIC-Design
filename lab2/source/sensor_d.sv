// $Id: $40
// File name:   sensor_d.sv
// Created:     1/21/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Dataflow style Sensor Error Detector Design

module sensor_d
(
	input wire [3:0] sensors, 
	output wire error
);
	assign error = sensors[0] | sensors[1] & sensors[2] | sensors[1] & sensors[3];

endmodule