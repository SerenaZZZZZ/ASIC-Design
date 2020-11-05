// $Id: $
// File name:   timer.sv
// Created:     2/23/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module timer(
    input clk, n_rst, enable_timer,
    output logic shift_enable, packet_done
);


flex_counter#(
    .NUM_CNT_BITS(4)
)FC1(
    .clk(clk), 
    .n_rst(n_rst), 
    .clear(!enable_timer), 
    .count_enable(enable_timer), 
    .rollover_val(4'd10), 
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
    .rollover_val(4'd9), 
    .count_out(), 
    .rollover_flag(packet_done)
);





endmodule





