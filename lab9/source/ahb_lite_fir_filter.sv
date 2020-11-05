// $Id: $
// File name:   ahb_lite_fir_filter.sv
// Created:     3/31/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module ahb_lite_fir_filter
(
	input clk, n_rst, hsel, hsize, hwrite,
	input [3:0] haddr,
	input [1:0] htrans,
	input [15:0] hwdata,
	output reg [15:0] hrdata,
	output reg hresp
);

reg new_coefficient_set, data_ready, load_coeff, err, modwait;
reg [15:0] sample_data, fir_coefficient, fir_out;
reg [1:0] coefficient_num;

ahb_lite_slave slave
(
	.clk(clk), 
    .n_rst(n_rst), 
    .modwait(modwait), 
    .err(err), 
    .hsel(hsel), 
    .hsize(hsize), 
    .hwrite(hwrite),
	.coefficient_num(coefficient_num), 
    .htrans(htrans),
	.haddr(haddr),
	.fir_out(fir_out), 
    .hwdata(hwdata),
    //output
	.data_ready(data_ready), 
    .new_coefficient_set(new_coefficient_set), 
    .hresp(hresp),
	.sample_data(sample_data), 
    .fir_coefficient(fir_coefficient), 
    .hrdata(hrdata)
);

fir_filter fir_filter(
    .clk(clk), 
    .n_reset(n_rst), 
    .load_coeff(load_coeff), 
    .data_ready(data_ready),
    .sample_data(sample_data), 
    .fir_coefficient(fir_coefficient),
    //output
    .one_k_samples(), 
    .modwait(modwait), 
    .err(err),
    .fir_out(fir_out)
);

coefficient_loader loader(
    .clk(clk), 
    .n_reset(n_rst), 
    .new_coefficient_set(new_coefficient_set), 
    .modwait(modwait),
    //output
    .load_coeff(load_coeff),
    .coefficient_num(coefficient_num)
);


endmodule