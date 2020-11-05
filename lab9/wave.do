onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_ahb_lite_fir_filter/tb_clk
add wave -noupdate /tb_ahb_lite_fir_filter/tb_n_rst
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsel
add wave -noupdate /tb_ahb_lite_fir_filter/tb_htrans
add wave -noupdate /tb_ahb_lite_fir_filter/tb_haddr
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hsize
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hwrite
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hwdata
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hrdata
add wave -noupdate /tb_ahb_lite_fir_filter/tb_hresp
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/data_ready
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/sample_data
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/new_coefficient_set
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/coefficient_num
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/fir_coefficient
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/loader/state
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/load_coeff
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/modwait
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/err
add wave -noupdate -radix decimal /tb_ahb_lite_fir_filter/DUT/fir_out
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/hresp
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/fir_filter/datapath/dest_data
add wave -noupdate /tb_ahb_lite_fir_filter/DUT/fir_filter/controller/state
add wave -noupdate -expand /tb_ahb_lite_fir_filter/DUT/fir_filter/datapath/RF/regs_matrix
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {170249 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {735 ns}
