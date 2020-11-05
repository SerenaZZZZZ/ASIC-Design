onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_apb_slave/tb_test_case_num
add wave -noupdate /tb_apb_slave/tb_test_case
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb_apb_slave/tb_clk
add wave -noupdate /tb_apb_slave/tb_n_rst
add wave -noupdate /tb_apb_slave/tb_expected_data_read
add wave -noupdate /tb_apb_slave/tb_data_read
add wave -noupdate /tb_apb_slave/tb_expected_data_size
add wave -noupdate /tb_apb_slave/tb_data_size
add wave -noupdate /tb_apb_slave/tb_expected_bit_period
add wave -noupdate /tb_apb_slave/tb_bit_period
add wave -noupdate /tb_apb_slave/tb_test_bit_period
add wave -noupdate /tb_apb_slave/tb_prdata
add wave -noupdate /tb_apb_slave/tb_pslverr
add wave -noupdate /tb_apb_slave/tb_psel
add wave -noupdate /tb_apb_slave/tb_paddr
add wave -noupdate /tb_apb_slave/tb_penable
add wave -noupdate /tb_apb_slave/tb_pwrite
add wave -noupdate /tb_apb_slave/tb_pwdata
add wave -noupdate /tb_apb_slave/DUT/mapping
add wave -noupdate /tb_apb_slave/DUT/nxtmapping
add wave -noupdate /tb_apb_slave/DUT/state
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/clk
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/n_rst
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/data_ready
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/overrun_error
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/framing_error
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/psel
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/penable
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/pwrite
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/rx_data
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/pwdata
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/paddr
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/prdata
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/data_read
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/pslverr
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/data_size
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/bit_period
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/state
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/nxtstate
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/nxt_prdata
add wave -noupdate -expand -group DUT /tb_apb_slave/DUT/nxt_pslverr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {38225 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 185
configure wave -valuecolwidth 139
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {251190 ps}
