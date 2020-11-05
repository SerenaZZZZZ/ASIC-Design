// $Id: $
// File name:   sr_9bit.sv
// Created:     2/23/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: a 9-bit Shift Register that will shift the serial data received.

module sr_9bit
(
    input clk, n_rst, shift_strobe, serial_in,
    output logic stop_bit, 
    output logic [7:0] packet_data
);
    

flex_stp_sr #(
    .NUM_BITS(9),
    .SHIFT_MSB(0)
)xxx(
    .clk(clk),
    .n_rst(n_rst),
    .serial_in(serial_in),
    .shift_enable(shift_strobe),
    .parallel_out({stop_bit,packet_data})
);


endmodule