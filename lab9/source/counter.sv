// $Id: $
// File name:   counter.sv
// Created:     3/1/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: simply counts how many samples have been processed and asserts its output signal high after 1000 samples have been processed for the current set of coefficients since the last assertion or power on.

module counter(
    input clk, n_rst, cnt_up, clear,
    output reg one_k_samples
);
flex_counter#(
    .NUM_CNT_BITS(10)
)FC(
    .clk(clk), 
    .n_rst(n_rst), 
    .clear(clear), 
    .count_enable(cnt_up), 
    .rollover_val(10'd1000), 
    .count_out(), 
    .rollover_flag(one_k_samples)
);
endmodule