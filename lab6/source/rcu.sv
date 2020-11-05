// $Id: $
// File name:   rcu.sv
// Created:     2/23/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: This block is the portion of the design that dictates the current mode of operation for the Receiver Block of the UART.

module rcu
(
    input clk, n_rst, new_packet_detected, packet_done, framing_error,
    output logic sbc_clear, sbc_enable, load_buffer, enable_timer
);


typedef enum bit [2:0]{IDLE, R, DO, CHECK, CHECKED, LOAD} stateType;
stateType state;
stateType nxt_state;

always_ff @ (posedge clk, negedge n_rst)
begin: REG_LOGIC
    if(!n_rst)
        state <= IDLE;
    else
        state <= nxt_state;      
end

always_comb
begin: NXT_LOGIC
    nxt_state = IDLE;
    sbc_clear = 0;
    sbc_enable = 0;
    load_buffer = 0;
    enable_timer = 0;
    case(state)
        IDLE:
            begin
                load_buffer = 0;
                if (new_packet_detected)
                    nxt_state = R;
                else
                    nxt_state = IDLE;
            end
        R:
            begin
                sbc_clear = 1;
                nxt_state = DO;  
            end
        DO:
            begin
                sbc_clear = 0;
                enable_timer = 1;
                if (packet_done)
                    nxt_state = CHECK;
                else
                    nxt_state = DO;
            end
        CHECK:
            begin
                sbc_enable = 1;
                enable_timer = 0;
                nxt_state = CHECKED;
            end
        CHECKED:
            begin
                sbc_enable = 0;
                if (!framing_error)
                    nxt_state = LOAD;
                else
                    nxt_state = IDLE;
            end
        LOAD:
            begin
                load_buffer = 1;
                nxt_state = IDLE;
            end
    endcase
end
/*
always_comb
begin: OUT_LOGIC
    case(state)
        IDLE:
            begin
                load_buffer = 0;
            end
        R:
            begin
                sbc_clear = 1;  
            end
        DO:
            begin
                sbc_clear = 0;
                enable_timer = 1;
            end
        CHECK:
            begin
                sbc_enable = 1;
                enable_timer = 0;
            end
        CHECKED:
            begin
                sbc_enable = 0;
            end
        LOAD:
            begin
                load_buffer = 1;
            end

        default:
            begin
                sbc_clear = 0;
                sbc_enable = 0;
                load_buffer = 0;
                enable_timer = 0;
            end

    endcase
end
*/
endmodule