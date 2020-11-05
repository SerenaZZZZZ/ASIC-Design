onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_fir_filter/DUT/datapath/outreg_data
add wave -noupdate /tb_fir_filter/DUT/datapath/src1_data
add wave -noupdate /tb_fir_filter/DUT/datapath/src2_data
add wave -noupdate /tb_fir_filter/DUT/datapath/overflow
add wave -noupdate /tb_fir_filter/DUT/magnitude/in
add wave -noupdate /tb_fir_filter/DUT/magnitude/out
add wave -noupdate /tb_fir_filter/tb_test_case_num
add wave -noupdate /tb_fir_filter/tb_test_sample_num
add wave -noupdate /tb_fir_filter/DUT/controller/state
add wave -noupdate /tb_fir_filter/DUT/controller/err
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb_fir_filter/tb_expected_fir_out
add wave -noupdate /tb_fir_filter/tb_expected_err
add wave -noupdate /tb_fir_filter/tb_expected_one_k_samples
add wave -noupdate /tb_fir_filter/DUT/datapath/overflow
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/clk
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/n_reset
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/w_en
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/r1_sel
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/r2_sel
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/w_sel
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/w_data
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/r1_data
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/r2_data
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/outreg_data
add wave -noupdate /tb_fir_filter/DUT/datapath/RF/write_enables
add wave -noupdate -childformat {{{/tb_fir_filter/DUT/datapath/RF/regs_matrix[9]} -radix hexadecimal} {{/tb_fir_filter/DUT/datapath/RF/regs_matrix[8]} -radix hexadecimal} {{/tb_fir_filter/DUT/datapath/RF/regs_matrix[7]} -radix hexadecimal} {{/tb_fir_filter/DUT/datapath/RF/regs_matrix[6]} -radix hexadecimal}} -subitemconfig {{/tb_fir_filter/DUT/datapath/RF/regs_matrix[9]} {-radix hexadecimal} {/tb_fir_filter/DUT/datapath/RF/regs_matrix[8]} {-radix hexadecimal} {/tb_fir_filter/DUT/datapath/RF/regs_matrix[7]} {-radix hexadecimal} {/tb_fir_filter/DUT/datapath/RF/regs_matrix[6]} {-radix hexadecimal}} /tb_fir_filter/DUT/datapath/RF/regs_matrix
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2642346 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 165
configure wave -valuecolwidth 132
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
WaveRestoreZoom {0 ps} {3675 ns}
