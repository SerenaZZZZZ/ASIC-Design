// $Id: $mg40
// File name:   flex_counter.sv
// Created:     2/6/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module flex_counter
#(
    parameter NUM_CNT_BITS = 4
)
(
    input wire clk, n_rst, clear, count_enable, [NUM_CNT_BITS-1:0] rollover_val,
    output reg [NUM_CNT_BITS-1:0] count_out, rollover_flag
);
    reg [NUM_CNT_BITS-1:0] next_count;
    reg next_flag;

    always_ff @ (posedge clk, negedge n_rst)
    begin
        if(1'b0 == n_rst) 
            begin
                count_out <= '0;
                rollover_flag <= '0;
            end
        else 
            begin
                count_out <= next_count;
                rollover_flag <= next_flag;
        end
    end

    always_comb
    begin   
        next_count = count_out;
        next_flag = 0;
        //next_flag = rollover_flag;

        if (clear =='1)begin
            next_count = '0;
            //next_flag = '0;
        end

        else if(count_enable == '1) begin
            next_count = count_out + 1;
            if(count_out == rollover_val)
                next_count = 1;
        end

        if(next_count == rollover_val)
        begin
            next_flag = '1;
        end
    end



endmodule