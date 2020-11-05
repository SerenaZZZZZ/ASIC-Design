// $Id: $
// File name:   moore.sv
// Created:     2/14/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Moore Machine '1101' Detector

module moore (
    input clk, n_rst, i,
    output reg o
);

typedef enum bit [2:0] {START, STATE_1, STATE_2, STATE_3, STATE_4} stateType;
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
begin: NXT_LOGIC
    //o = 0;
    case(state)
        START:
            begin
                if (i)
                    nxt_state = STATE_1;
                else
                    nxt_state = START;
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
            //o =0;
                if (i) begin
                    nxt_state = STATE_4; 
                    //o = 1;
                end
                else
                    nxt_state = START;
            end
        STATE_4:
            begin
            //o = 1;
                if (i)
                    nxt_state = STATE_2;
                else begin
                    nxt_state = START;
                    
                end
            end
        default: nxt_state = START;
    endcase

end

always_comb
begin: OUT_LOGIC
    //o = 0;
    //nxt_state = state;
    case(state)
        START:
            begin
               o = 0;    
            end
        STATE_1:
            begin
               o = 0;
            end
        STATE_2:
            begin
               o = 0;
            end
        STATE_3:
            begin
                o = 0;
            end
        STATE_4:
            begin
               o = 1;
            end
        default: o = 0;
    endcase
end


//assign o = (state == STATE_4) ? 1'b1: 1'b0;

endmodule