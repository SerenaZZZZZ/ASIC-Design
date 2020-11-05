onerror {resume}
quietly virtual function -install /tb_ahb_lite_slave -env /tb_ahb_lite_slave { &{/tb_ahb_lite_slave/DUT/sample_data, /tb_ahb_lite_slave/tb_expected_sample }} sample_data
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_slave/tb_test_case_num
add wave -noupdate /tb_ahb_lite_slave/tb_test_case
add wave -noupdate /tb_ahb_lite_slave/DUT/clk
add wave -noupdate /tb_ahb_lite_slave/DUT/n_rst
add wave -noupdate /tb_ahb_lite_slave/DUT/modwait
add wave -noupdate /tb_ahb_lite_slave/DUT/err
add wave -noupdate /tb_ahb_lite_slave/DUT/hsel
add wave -noupdate /tb_ahb_lite_slave/DUT/hsize
add wave -noupdate /tb_ahb_lite_slave/DUT/nxt_hsize
add wave -noupdate /tb_ahb_lite_slave/DUT/hwrite
add wave -noupdate /tb_ahb_lite_slave/DUT/coefficient_num
add wave -noupdate /tb_ahb_lite_slave/DUT/htrans
add wave -noupdate /tb_ahb_lite_slave/DUT/haddr
add wave -noupdate /tb_ahb_lite_slave/DUT/nxt_haddr
add wave -noupdate /tb_ahb_lite_slave/DUT/fir_out
add wave -noupdate /tb_ahb_lite_slave/DUT/hwdata
add wave -noupdate /tb_ahb_lite_slave/DUT/data_ready
add wave -noupdate /tb_ahb_lite_slave/tb_expected_data_ready
add wave -noupdate /tb_ahb_lite_slave/DUT/nxt_data_ready
add wave -noupdate /tb_ahb_lite_slave/DUT/new_coefficient_set
add wave -noupdate /tb_ahb_lite_slave/tb_expected_new_coeff_set
add wave -noupdate /tb_ahb_lite_slave/DUT/hresp
add wave -noupdate /tb_ahb_lite_slave/DUT/sample_data
add wave -noupdate /tb_ahb_lite_slave/tb_expected_sample
add wave -noupdate /tb_ahb_lite_slave/DUT/fir_coefficient
add wave -noupdate /tb_ahb_lite_slave/tb_expected_coeff
add wave -noupdate /tb_ahb_lite_slave/DUT/hrdata
add wave -noupdate /tb_ahb_lite_slave/DUT/nxtstate
add wave -noupdate /tb_ahb_lite_slave/DUT/state
add wave -noupdate /tb_ahb_lite_slave/DUT/mapping
add wave -noupdate /tb_ahb_lite_slave/DUT/nxt_mapping
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {53865 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 181
configure wave -valuecolwidth 125
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
WaveRestoreZoom {0 ps} {505609 ps}
