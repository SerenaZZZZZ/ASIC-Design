// $Id: $
// File name:   coefficient_loader.sv
// Created:     3/31/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module coefficient_loader(
    input clk, n_reset, new_coefficient_set, modwait,
    output reg load_coeff,
    output reg [1:0] coefficient_num
);
typedef enum bit [2:0] {IDLE, LOAD1, WAIT1, LOAD2, WAIT2, LOAD3, WAIT3, LOAD4} stateType;
stateType nxtstate, state;

always_ff @(posedge clk, negedge n_reset)
begin: REG_LOGIC
    if (!n_reset) 
        state <= IDLE;
    else 
        state <= nxtstate;
end

always_comb
begin:NEXT_STATE_LOGIC
    load_coeff = 0;
    coefficient_num = '0;
    nxtstate = state;
    case(state)
        IDLE:
            begin
                if(new_coefficient_set & !modwait)
                    nxtstate = LOAD1;
            end
        LOAD1:
            begin
                load_coeff = 1;
                coefficient_num = 0;
                nxtstate = WAIT1;
            end
        WAIT1:
            begin
                if (!modwait) begin
                    coefficient_num = 0;
                    nxtstate = LOAD2;
                end
            end
        LOAD2:
            begin
                load_coeff = 1;
                coefficient_num = 1;
                nxtstate = WAIT2;
            end
        WAIT2:
            begin
                if (!modwait) begin
                    coefficient_num = 1;
                    nxtstate = LOAD3;
                end
            end
        LOAD3:
            begin
                load_coeff = 1;
                coefficient_num = 2;
                nxtstate = WAIT3;
            end
        WAIT3:
            begin
                if (!modwait)begin
                    nxtstate = LOAD4;
                    coefficient_num = 2;
                end
            end
        LOAD4:
            begin
                load_coeff = 1;
                coefficient_num = 3;
                nxtstate = IDLE;
            end
    endcase
    
end
endmodule