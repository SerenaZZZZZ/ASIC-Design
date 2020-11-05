// $Id: $
// File name:   timer.sv
// Created:     2/23/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module timer(
    input clk, n_rst, enable_timer,
    input [3:0] data_size,
    input [13:0] bit_period,
    output logic shift_enable, packet_done
);

flex_counter#(
    .NUM_CNT_BITS(14)
)FC1(
    .clk(clk), 
    .n_rst(n_rst), 
    .clear(!enable_timer), 
    .count_enable(enable_timer), 
    .rollover_val(bit_period), 
    .count_out(), 
    .rollover_flag(shift_enable)
);

flex_counter#(
    .NUM_CNT_BITS(4)
)FC2(
    .clk(clk), 
    .n_rst(n_rst), 
    .clear(!enable_timer), 
    .count_enable(shift_enable), 
    .rollover_val(data_size + 1'b1), //?
    .count_out(), 
    .rollover_flag(packet_done)
);





endmodule





