// $Id: $
// File name:   ahb_lite_slave.sv
// Created:     3/31/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

module ahb_lite_slave
(
	input clk, n_rst, modwait, err, hsel, hsize, hwrite,
	input [1:0]coefficient_num, htrans,
	input [3:0]haddr,
	input [15:0]fir_out, hwdata,
	output reg data_ready, new_coefficient_set, hresp,
	output reg [15:0]sample_data, fir_coefficient, hrdata
);

typedef enum bit [1:0] {IDLE, W, R,ERR} stateType;
stateType nxtstate, state;
reg[15:0][7:0] mapping, nxt_mapping;
reg [3:0] nxt_haddr;
reg nxt_data_ready, nxt_hsize;

always_ff @(posedge clk, negedge n_rst)
begin
	if (!n_rst) begin
		state <= IDLE;
		mapping <= '{default:'0};
		nxt_hsize <= '0;
		nxt_haddr <= '0;
		data_ready <= 0;//output
	end
	else begin
		state <= nxtstate;
		mapping <= nxt_mapping;
		nxt_hsize <= hsize;//input
		nxt_haddr <= haddr;//input
		data_ready <= nxt_data_ready;//output
		
	end
end

always_comb
begin
	hresp = 0;
	if (hsel & (((haddr==0 | haddr==1 | haddr==2 | haddr==3 | haddr==15) & hwrite) | (haddr==15 & !hwrite))) begin
		hresp = 1;
	end
	nxtstate = IDLE;
	case(state)
	IDLE: 
	begin
		if (hwrite & hsel & (htrans != 0))
			nxtstate = W;
		else if (!hwrite & hsel & (htrans != 0))
			nxtstate = R;
	end
	W:
	begin
		if (hwrite & hsel & (htrans != 0))
			nxtstate = W;
		else if (!hwrite & hsel & (htrans != 0))
			nxtstate = R;
	end
	R:
	begin
		if (hwrite & hsel & (htrans != 0))
			nxtstate = W;
		else if (!hwrite & hsel & (htrans != 0))
			nxtstate = R;
	end

	endcase
end

always_comb
begin
	nxt_mapping = mapping;
	nxt_data_ready = data_ready;
	nxt_mapping[3] = fir_out[15:8];
	nxt_mapping[2] = fir_out[7:0];
	//nxt_mapping[0][0] = modwait;
	//nxt_mapping[0][7] = err;
	nxt_mapping[15] = '0;

	if (new_coefficient_set | modwait) begin
		nxt_mapping[0] = 1;
		nxt_mapping[1] = 0;
	end 
	else if (err == 1) begin
		nxt_mapping[0] = 0;
		nxt_mapping[1] = 1;
	end 
	else begin
		nxt_mapping[0] = 0;
		nxt_mapping[1] = 0;
	end

	sample_data = {mapping[5], mapping[4]};
	new_coefficient_set = mapping[14];
	if (coefficient_num == 3)
		nxt_mapping[14] = 0;
	fir_coefficient[15:8] = mapping[coefficient_num*2 + 7];
	fir_coefficient[7:0] = mapping[coefficient_num*2 + 6];
	//
	hrdata = '0;
	if (modwait)
		nxt_data_ready = 0;

	case(state)
	W:
	begin
		if (nxt_haddr == 4 | nxt_haddr == 5)
			nxt_data_ready = 1;
		if (nxt_hsize==0) begin
			if (nxt_haddr % 2 == 0)
				nxt_mapping[nxt_haddr] = hwdata[7:0];
			else if (nxt_haddr % 2 == 1)
				nxt_mapping[nxt_haddr] = hwdata[15:8];
		end
		else if (nxt_hsize == 1) begin
			if (nxt_haddr == 14 | nxt_haddr == 15)
				nxt_mapping[14] = hwdata[7:0];
			else if ((nxt_haddr % 2 == 0) && (nxt_haddr != 14)) begin
				nxt_mapping[nxt_haddr + 1] = hwdata[15:8];
				nxt_mapping[nxt_haddr] = hwdata[7:0];
			end
			else if ((nxt_haddr % 2 == 1) && (nxt_haddr != 15)) begin
				nxt_mapping[nxt_haddr] = hwdata[15:8];
				nxt_mapping[nxt_haddr - 1] = hwdata[7:0];
			end
		end
	end
	
	R:
	begin
		if (nxt_hsize==0) begin
			if (nxt_haddr % 2 == 0)
				hrdata = {8'b0, mapping[nxt_haddr]};
			else if (nxt_haddr % 2 == 1)
				hrdata = {mapping[nxt_haddr], 8'b0};
		end
		else if (nxt_hsize==1) begin
			if (nxt_haddr == 14 | nxt_haddr ==15)
				hrdata = {8'b0, mapping[14]};
			else if ((nxt_haddr % 2 == 0) && (nxt_haddr != 14))
				hrdata = {mapping[nxt_haddr + 1], mapping[nxt_haddr]};
			else if ((nxt_haddr % 2 == 1) && (nxt_haddr != 15))
				hrdata = {mapping[nxt_haddr], mapping[nxt_haddr-1]};
		end
	end
	endcase
end

endmodule

