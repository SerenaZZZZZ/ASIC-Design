// $Id: $
// File name:   sync_low.sv
// Created:     2/4/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: Reset to Logic Low Synchronizer

module sync_low (
    input wire clk, n_rst,
    input wire async_in,
    output reg sync_out
);
reg ff1;
always_ff @ (posedge clk, negedge n_rst)
begin
    if(1'b0 == n_rst) 
        begin
            ff1 <= 0;
            sync_out <= 0;
        end
    else 
        begin
            ff1<= async_in;
            sync_out <= ff1;
    end
end

endmodule