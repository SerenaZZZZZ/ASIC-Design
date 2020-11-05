// $Id: $
// File name:   controller.sv
// Created:     3/1/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: regulate and control the operation sequence and input signals to the other components in the system so your system can operate as specified.

module controller(
    input clk, n_rst, dr, lc, overflow,
    output reg cnt_up, clear, modwait, err,
    output reg [2:0] op,
    output reg [3:0] src1, src2, dest
);
reg mod;
typedef enum bit [4:0] {IDLE, LOAD1, WAIT1, LOAD2, WAIT2, LOAD3, WAIT3, LOAD4, STORE, ZERO, SORT1, SORT2, SORT3, SORT4, MUL1, ADD1, MUL2, SUB2, MUL3, ADD3, MUL4, SUB4, EIDLE} stateType;
stateType nxtstate;
stateType state;
always_ff@(posedge clk, negedge n_rst)
begin: REG_LOGIC
    if (!n_rst) begin
        state <= IDLE;
        modwait <= 0;
        end
    else begin
        state <= nxtstate;
        modwait <= mod;
        end
end


always_comb
begin:NEXT_STATE_LOGIC
    nxtstate = state;
    case(state)
        IDLE:
            begin
                if(lc)
                    nxtstate = LOAD1;
                else if (dr)
                    nxtstate = STORE;
            end
        LOAD1:
            begin
                nxtstate = WAIT1;
            end
        WAIT1:
            begin
                if(lc)
                    nxtstate = LOAD2;
            end
        LOAD2:
            begin
                nxtstate = WAIT2;
            end
        WAIT2:
            begin
                if (lc)
                    nxtstate = LOAD3;
            end
        LOAD3:
            begin
                nxtstate = WAIT3;
            end
        WAIT3:
            begin
                if(lc)
                    nxtstate = LOAD4;
            end
        LOAD4:
            begin
                nxtstate = IDLE;
            end
        STORE:
            begin
                if(!dr)
                    nxtstate = EIDLE;
                else
                    nxtstate = ZERO;
            end
        ZERO:
            begin
                nxtstate = SORT1;  
            end
        SORT1:
            begin
                nxtstate = SORT2;
            end
        SORT2:
            begin
                nxtstate = SORT3;
            end 
        SORT3: 
            begin
                nxtstate = SORT4;
            end 
        SORT4: 
            begin
                nxtstate = MUL1;
            end 
        MUL1: 
            begin
                if(overflow)
                    nxtstate = EIDLE;
                else
                    nxtstate = ADD1;
            end
        ADD1: 
            begin
                if(overflow)
                    nxtstate = EIDLE;
                else
                    nxtstate = MUL2;
            end
        MUL2: 
            begin
                if(overflow)
                    nxtstate = EIDLE;
                else
                    nxtstate = SUB2;
            end
        SUB2: 
            begin
                if(overflow)
                    nxtstate = EIDLE;
                else
                    nxtstate = MUL3;
            end
        MUL3: 
            begin
                if(overflow)
                    nxtstate = EIDLE;
                else
                    nxtstate = ADD3;
            end
        ADD3: 
            begin
                if(overflow)
                    nxtstate = EIDLE;
                else
                    nxtstate = MUL4;
            end
        MUL4: 
            begin
                if(overflow)
                    nxtstate = EIDLE;
                else
                    nxtstate = SUB4;
            end
        SUB4:
            begin
                if(overflow)
                    nxtstate = EIDLE;
                else
                    nxtstate = IDLE;
            end
        EIDLE:
            begin
                if(dr)
                    nxtstate = STORE;
            end
    endcase
end

always_comb
begin:OUT_LOGIC
    op = 0;
    src1 = 0;
    src2 = 0;
    dest = 0;
    err = 0;
    mod = 1;
    cnt_up = 0;
    clear = 0;
    case(state)
        IDLE:
            mod = 0;
        LOAD1:
            begin
                op = 3'b011;
                dest = 9;
                clear = 1;
            end
        WAIT1:
            mod = 0;
        LOAD2:
            begin
                op = 3'b011;
                dest = 8;
                clear = 1;
            end
        WAIT2:
            mod = 0;
        LOAD3:
            begin
                op = 3'b011;
                dest = 7;
                clear = 1;
            end
        WAIT3:
            mod = 0;
        LOAD4:
            begin
                op = 3'b011;
                dest = 6;
                clear = 1;
            end
        STORE:
            begin
                op = 3'b010;
                dest = 5;
            end
        ZERO:
            begin
                op = 3'b101;//sub
                src1 = 0;
                src2 = 0;
                dest = 0;
                cnt_up = 1;
            end
        SORT1:
            begin
                op = 3'b001;
                src1 = 2;
                dest = 1;
            end
        SORT2:
            begin
                op = 3'b001;
                src1 = 3;
                dest = 2;
            end 
        SORT3: 
            begin
                op = 3'b001;
                src1 = 4;
                dest = 3;
            end 
        SORT4: 
            begin
                op = 3'b001;
                src1 = 5;
                dest = 4;
            end 
        MUL1: 
            begin
                op = 3'b110;
                src1 = 1;
                src2 = 6;
                dest = 10;
            end
        ADD1: 
            begin
                op = 3'b100;
                src1 = 0;
                src2 = 10;
                dest = 0;
            end
        MUL2: 
            begin
                op = 3'b110;
                src1 = 2;
                src2 = 7;
                dest = 10;
            end
        SUB2: 
            begin
                op = 3'b101;
                src1 = 0;
                src2 = 10;
                dest = 0;
            end
        MUL3: 
            begin
                op = 3'b110;
                src1 = 3;
                src2 = 8;
                dest = 10;
            end
        ADD3: 
            begin
                op = 3'b100;
                src1 = 0;
                src2 = 10;
                dest = 0;
            end
        MUL4: 
            begin
                op = 3'b110;
                src1 = 4;
                src2 = 9;
                dest = 10;
            end
        SUB4:
            begin
                op = 3'b101;
                src1 = 0;
                src2 = 10;
                dest = 0;
            end
        EIDLE:
            begin
                err = 1;
                mod = 0;
            end
    endcase
end
endmodule