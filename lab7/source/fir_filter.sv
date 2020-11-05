// $Id: $
// File name:   fir_filter.sv
// Created:     3/1/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: the top level module which will connect all the individual components.

module fir_filter(
    input clk, n_reset, load_coeff, data_ready,
    input [15:0] sample_data, fir_coefficient,
    output reg one_k_samples, modwait, err,
    output reg [15:0] fir_out
);

reg cnt_up, clear, overflow;
reg [2:0] op;
reg [3:0] src1, src2, dest;
reg [16:0] outreg_data;

sync_low low1(
    .clk(clk), 
    .n_rst(n_reset),
    .async_in(data_ready),
    .sync_out(dr)
);

sync_low low2(
    .clk(clk), 
    .n_rst(n_reset),
    .async_in(load_coeff),
    .sync_out(lc)
);

controller controller(
    .clk(clk), 
    .n_rst(n_reset), 
    .dr(dr), 
    .lc(lc), 
    .overflow(overflow),
    .cnt_up(cnt_up), 
    .clear(clear), 
    .modwait(modwait), 
    .err(err),
    .op(op),
    .src1(src1), 
    .src2(src2), 
    .dest(dest)
);

counter counter(
    .clk(clk), 
    .n_rst(n_reset), 
    .cnt_up(cnt_up), 
    .clear(clear),
    .one_k_samples(one_k_samples)
);

datapath datapath(
    .clk(clk), 
    .n_reset(n_reset), 
    .op(op),
    .src1(src1), 
    .src2(src2), 
    .dest(dest),
    .ext_data1(sample_data), 
    .ext_data2(fir_coefficient),
    .outreg_data(outreg_data),
    .overflow(overflow)
);

magnitude magnitude(
    .in(outreg_data),
    .out(fir_out)
);

endmodule
