// $Id: $40
// File name:   sensor_s.sv
// Created:     1/21/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: The sensor detector monitors 4 sensors and reports the existence of an error condition.

module sensor_s(input wire [3:0] sensors, output wire error);
	wire [2:0] temp;

	AND2X1 A1 (.Y(temp[0]), .A(sensors[1]), .B(sensors[2]));
	AND2X1 A2 (.Y(temp[1]), .A(sensors[1]), .B(sensors[3]));
	OR2X1 A3 (.Y(temp[2]), .A(sensors[0]), .B(temp[0]));
	OR2X1 A4 (.Y(error), .A(temp[1]), .B(temp[2]));


endmodule

