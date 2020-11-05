// $Id: $
// File name:   mealy.sv
// Created:     2/14/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Mealy Machine '1101' Detector

module mealy (
    input clk, n_rst, i,
    output reg o
);

typedef enum bit [1:0]{START, STATE_1, STATE_2, STATE_3} stateType;
stateType state;
stateType nxt_state;

always_ff @ (posedge clk, negedge n_rst)
begin: REG_LOGIC
    if(!n_rst)
        state <= START;
    else
        state <= nxt_state;      
end

always_comb
begin: NXT_OUT_LOGIC
    nxt_state = state;
    o = 0;
    case(state)
        START:
            begin
                if (i)
                    nxt_state = STATE_1;
            end
        STATE_1:
            begin
                if (i)
                    nxt_state = STATE_2; 
                else
                    nxt_state = START;  
            end
        STATE_2:
            begin
                if (!i)
                    nxt_state = STATE_3;
                else
                    nxt_state = STATE_2;
            end
        STATE_3:
            begin
                if (i) begin
                    nxt_state = STATE_1; 
                    o = 1;
                end
                else
                    nxt_state = START;
            end
    endcase

end

endmodule
