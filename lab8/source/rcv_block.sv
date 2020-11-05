// $Id: $
// File name:   rcv_block.sv
// Created:     2/23/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     2.0  enabling the operation of the timer to be adjusted based on the configuration register values (extended version of UART Receiver design from Lab 6)
// Description: The receiver block basically functions to serially receive data and store it in parallel into a register.

module rcv_block
(
    input clk, n_rst, serial_in, data_read,
    input reg [3:0] data_size, // the value from the Data Size configuration register
    input reg [13:0] bit_period, // the value from the Bit Period configuration register
    output reg [7:0] rx_data, 
    output logic data_ready, overrun_error, framing_error
);

    logic new_packet_detected, sbc_clear, sbc_enable, enable_timer, noneed;
    logic stop_bit, strobe, packet_done, load_buffer;
    reg [7:0] packet_data, packet_data_xxx;

  always_comb begin
        packet_data_xxx = packet_data;
        if (data_size == 3'd7)
            packet_data_xxx = {1'b0, packet_data[7:1]};
        else if(data_size == 3'd5)
            packet_data_xxx = {3'b0, packet_data[7:3]};
    end

start_bit_det start(
    .clk(clk),
    .n_rst(n_rst),
    .serial_in(serial_in),
    .start_bit_detected(noneed),
    .new_package_detected(new_packet_detected)
);
rcu rcu(
    .clk(clk), 
    .n_rst(n_rst), 
    .new_packet_detected(new_packet_detected), 
    .packet_done(packet_done), 
    .framing_error(framing_error),
    .sbc_clear(sbc_clear), 
    .sbc_enable(sbc_enable), 
    .load_buffer(load_buffer), 
    .enable_timer(enable_timer)
);
timer timer(
    .data_size(data_size),
    .bit_period(bit_period),
    .clk(clk),
    .n_rst(n_rst),
    .enable_timer(enable_timer),
    .shift_enable(strobe),
    .packet_done(packet_done)
);
sr_9bit sr(
    .clk(clk),
    .n_rst(n_rst),
    .shift_strobe(strobe),
    .serial_in(serial_in), 
    .stop_bit(stop_bit), 
    .packet_data(packet_data)
);
stop_bit_chk stop(
    .clk(clk), 
    .n_rst(n_rst), 
    .sbc_clear(sbc_clear), 
    .sbc_enable(sbc_enable), 
    .stop_bit(stop_bit), 
    .framing_error(framing_error)
);
rx_data_buff rx(
    .clk(clk),
    .n_rst(n_rst),
    .load_buffer(load_buffer),
    .packet_data(packet_data_xxx),
    .data_read(data_read),
    .rx_data(rx_data),
    .data_ready(data_ready),
    .overrun_error(overrun_error)
);
endmodule

// apb_uart_rx apb_uart_rx(
//     .clk(), 
//     .n_rst(), 
//     .serial_in(), 
//     .psel(), 
//     .paddr(), 
//     .penable(), 
//     .pwrite(),
//     .pwdata(),
//     //output
//     .prdata(), 
//     .pslverr(),
// );

// apb_bus apb_bus(
//     .clk(),
//     .model_reset(),
//     .enqueue_transaction(),
//     .transaction_write(),
//     .transaction_fake(),
//     .transaction_addr(),
//     .transaction_data(),
//     .transaction_error(),
//     .enable_transactions(),
//     //output
//     .current_transaction_num(),
//     .psel(),
//     .paddr(),
//     .penable(),
//     .pwrite(),
//     .pwdata(),
//     .prdata(),
//     .pslverr(),
// );

