# Step 1:  Read in the source file
analyze -format sverilog -lib WORK { apb_slave.sv}
elaborate apb_slave -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW
 create_clock "clk" -name "clk" -period 2.5

# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/apb_slave.rep
report_area >> reports/apb_slave.rep
report_power -hier >> reports/apb_slave.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/apb_slave.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
