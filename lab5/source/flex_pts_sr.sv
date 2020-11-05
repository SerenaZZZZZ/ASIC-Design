// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/11/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: flexible MSB PtS Shift Registers

module flex_pts_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
    input clk, n_rst, shift_enable, load_enable, [NUM_BITS-1:0] parallel_in,
    output reg serial_out
);

reg [NUM_BITS-1:0] temp, out;

always_comb begin
    temp = out;
    serial_out = 0;
    if (load_enable)
        temp = parallel_in;
    else if (shift_enable) 
    begin
        if (SHIFT_MSB)
            temp = {out[NUM_BITS-2:0], 1'b1};
        else
            temp = {1'b1, out[NUM_BITS-1:1]};
    end

    if (SHIFT_MSB) 
        serial_out = out[NUM_BITS-1];
    else
        serial_out = out[0];
    
end

always_ff @ (posedge clk, negedge n_rst)
begin
    if(!n_rst)
        out <= '1;
    else
        out <= temp;
end




endmodule