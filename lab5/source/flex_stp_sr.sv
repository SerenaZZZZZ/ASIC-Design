// $Id: $
// File name:   flex_stp_sr
// Created:     2/11/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: flexible MSB StP Shift Registers

module flex_stp_sr 
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input clk, n_rst, shift_enable, serial_in,
    output reg [NUM_BITS-1:0] parallel_out
);

reg [NUM_BITS-1:0] temp;

always_comb begin
    temp = parallel_out;
    if (shift_enable) begin
        if (SHIFT_MSB)
            temp = {parallel_out[NUM_BITS-2:0], serial_in};
        else
            temp = {serial_in, parallel_out[NUM_BITS-1:1]};
    end
end

always_ff @ (posedge clk, negedge n_rst)
begin
    if(!n_rst)
        parallel_out <= '1;
    else
        parallel_out <= temp;
end


endmodule

