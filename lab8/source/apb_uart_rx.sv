// $Id: $
// File name:   apb_uart_rx.sv
// Created:     3/3/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: The full design module that connects the dedicated APB-Slave interface and UART Reciever modules together to form the overall SoC peripheral.
module apb_uart_rx(
    input clk, n_rst, serial_in, psel, penable, pwrite,
    input [2:0] paddr, 
    input [7:0] pwdata,
    output reg [7:0] prdata, 
    output reg pslverr//active-high rtansaction error feedback from the 'slave', asserted when a trnasaction error occures, like writing to a read-only address
);
reg [3:0] data_size;
reg [13:0] bit_period;
reg data_read, data_ready, overrun_error, framing_error;
reg [7:0] rx_data;

rcv_block rcv_block(
    .clk(clk),
    .n_rst(n_rst),
    .data_size(data_size),
    .bit_period(bit_period),
    .serial_in(serial_in),
    .data_read(data_read),
    //output
    .rx_data(rx_data), 
    .data_ready(data_ready),
    .overrun_error(overrun_error),
    .framing_error(framing_error)
  );

apb_slave apb_slave(
    .clk(clk), 
    .n_rst(n_rst), 
    .rx_data(rx_data), 
    .data_ready(data_ready), 
    .overrun_error(overrun_error), 
    .framing_error(framing_error), 
    .psel(psel), 
    .paddr(paddr), // the lave’s address bus
    .penable(penable), 
    .pwrite(pwrite),
    .pwdata(pwdata),
    //output
    .data_read(data_read), 
    .prdata(prdata), // the read data bus
    .pslverr(pslverr),
    .data_size(data_size), // the value from the Data Size configuration register
    .bit_period(bit_period) // the value from the Bit Period configuration register
);


endmodule