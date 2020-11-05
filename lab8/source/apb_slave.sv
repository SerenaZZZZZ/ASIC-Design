// $Id: $
// File name:   apb_slave.sv
// Created:     3/3/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module apb_slave(
    input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable, pwrite,
    input [7:0] rx_data, pwdata,
    input [2:0] paddr, // the lave’s address bus
    output reg [7:0] prdata, // the read data bus
    output reg data_read, pslverr,
    output reg [3:0] data_size, // the value from the Data Size configuration register
    output reg [13:0] bit_period // the value from the Bit Period configuration register
);

typedef enum bit [1:0] {IDLE, R, W, ERR} stateType;
stateType state, nxtstate;
reg [7:0] mapping[6:0], nxtmapping[6:0]; //7*8 matrix

reg [7:0] nxt_prdata;
reg nxt_pslverr;

always_ff @(posedge clk, negedge n_rst)
begin:reg_logic
    if(!n_rst) begin
        state <= IDLE;
        mapping <= '{default:'0};
        pslverr <= 0;
        prdata <= '0;
    end
    else begin
        state <= nxtstate;
        mapping <= nxtmapping;
        pslverr <= nxt_pslverr;
        prdata <= nxt_prdata;
    end

end

always_comb
begin:upper_state_logic
    
    nxtstate = IDLE;

            //if(psel && (((paddr != (2|3|4)) && pwrite) | ((paddr != (0|1|2|3|4|6)) && !pwrite)))
    if (state == IDLE) begin
        if ((psel) && (((pwrite) && !((paddr == 2) | (paddr == 3) | (paddr == 4))) | ((!pwrite) && !((paddr == 0) | (paddr == 1) | (paddr == 2) | (paddr == 3) | (paddr == 4) | (paddr == 6)))))
            nxtstate = ERR;
        else if(pwrite & psel)
            nxtstate = W;
        else if(!pwrite & psel)
            nxtstate = R;
    end
end

always_comb
begin:upper_out_logic
    //nxtmapping = mapping;
    nxt_prdata = '0;
    data_read = 0;
	nxt_pslverr = 0;
    bit_period = {mapping[3][5:0],mapping[2][7:0]};
    data_size = mapping[4][3:0];

    //0x0
    nxtmapping[0] = data_ready;
    nxtmapping[1]='0;//new
    nxtmapping[2] = mapping[2];
    nxtmapping[3] = mapping[3];
    nxtmapping[4] = mapping[4];
    //0x1
    if (framing_error)
        nxtmapping[1] = 1;
    else if (overrun_error)
        nxtmapping[1] = 2;
    //else
    //    nxtmapping[1] = 0;
    //0x5
    nxtmapping[5] = '0;
    //0x6
    nxtmapping[6] = rx_data;

    case(nxtstate)
    R:
        begin
            nxt_prdata = mapping[paddr];    
            if (paddr == 6) begin
                data_read = 1;  
                //nxt_prdata = mapping[paddr];
            end              
        end
    ERR:
        nxt_pslverr = 1;
    endcase

    if (state == W)
        nxtmapping[paddr] = pwdata;

end

endmodule
