// $Id: $mg40
// File name:   tb_flex_counter.sv
// Created:     2/6/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: .

`timescale 1ns / 10ps

module tb_flex_counter();

  // Define local parameters used by the test bench
  parameter NUM_CNT_BITS = 4;
  localparam  CLK_PERIOD    = 1;
  localparam  FF_SETUP_TIME = 0.190;
  localparam  FF_HOLD_TIME  = 0.100;
  localparam  CHECK_DELAY   = (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts

  //localparam  INACTIVE_VALUE     = '0;
  //localparam  RESET_OUTPUT_VALUE = INACTIVE_VALUE;
  
  // Declare DUT portmap signals
  reg tb_clk;
  reg tb_n_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg [NUM_CNT_BITS-1:0] tb_rollover_val;
  reg [NUM_CNT_BITS-1:0] tb_count_out;
  reg tb_rollover_flag;
  
  // Declare test bench signals
  integer tb_test_case;
  //string tb_test_case;
  //integer tb_stream_test_num;
  //string tb_stream_check_tag;
  
//Verification Task 1: DUT Reset Task
  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

//Verification Task 2: Normal Operation DUT Output Check Task (both count_out and rollover_flag must be checked)
  task check_output;
    input logic  [NUM_CNT_BITS-1:0] expected_count;
    input logic  expected_flag;  
    input int tb_test_case;    
    //input string check_tag;
  begin
    if(expected_count == tb_count_out) begin // Check passed
      $info("Correct counter output for test case %d", tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect counter output for test case %d", tb_test_case);
    end

    if(expected_flag == tb_rollover_flag) begin // Check passed
      $info("Correct flag output for test case %d", tb_test_case);
    end
    else begin // Check failed
      $error("IcCorrect flag output for test case %d", tb_test_case);
    end
    
    //#(0.1);
    
    //tb_test_case = 7;
  end
  
  endtask

//Verification Task 3: Normal Clear Task (pulse the clear for 1 cycle)
    task clear;
    //TODO
    @(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;

    endtask





//Clock generation block
  always
  begin: CLK_GEN
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end
  
//DUT Port map
  flex_counter DUT(
      .clk(tb_clk), 
      .n_rst(tb_n_rst), 
      .clear(tb_clear), 
      .count_enable(tb_count_enable), 
      .rollover_val(tb_rollover_val), 
      .count_out(tb_count_out), 
      .rollover_flag(tb_rollover_flag)
  );
  




  // Test bench main process
  initial
  begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear  = 1'b1; // Initialize input to inactive  value
    tb_count_enable  = 1'b0; // Initialize input to inactive  value
    tb_rollover_val = 4;               // Initialize test case counter
    //tb_test_case = "Test bench initializaton";
    //tb_stream_test_num = 0;
    //tb_stream_check_tag = "N/A";
    @(posedge tb_clk);
		tb_clear = 1'b1;
		@(posedge tb_clk);
		tb_clear = 1'b0;
    // Wait some time before starting first test case
    //#(0.1);


//Test Case 1: Power-on-Reset
    tb_count_enable  = 1'b0;
    tb_n_rst = 1'b1;
    clear();
    reset_dut();
    tb_clear  = 1'b1; 
    tb_count_enable  = 1'b0;
    tb_rollover_val = 4;   
    tb_n_rst  = 1'b1;    
    
    
    // Release the reset away from a clock edge
    @(posedge tb_clk);
    #(CHECK_DELAY);
    // Check that internal state was correctly keep after reset release
    //expected_count = 0;
    //expected_flag = 0;
    check_output(0,0,1);


//Test Case 2: Rollover for a rollover value that is not a power of two
    tb_count_enable  = 1'b0;
    tb_n_rst = 1'b1;
    clear();
    reset_dut();
    tb_clear  = 1'b0; 
    tb_count_enable  = 1'b0;
    tb_rollover_val = 3;   
    tb_n_rst  = 1'b1;  
    @(negedge tb_clk); 
    #(CHECK_DELAY);

    check_output(0,0,2);


//Test case 3: Continuous counting
    tb_count_enable  = 1'b0;
    tb_n_rst = 1'b1;
    clear();
    reset_dut();
    tb_clear  = 1'b0; 
    tb_count_enable  = 1'b1;
    tb_rollover_val = 5;   
    tb_n_rst  = 1'b1;  
    
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);

    #(CHECK_DELAY);

    check_output(1,0,3);

//Test case 4: Discontinuous counting
    tb_count_enable  = 1'b0;
    tb_n_rst = 1'b1;
    clear();
    reset_dut();
    tb_count_enable  = 1'b0;
    tb_rollover_val = 5;   
    tb_n_rst  = 1'b1;  
    
    @(posedge tb_clk);
    tb_count_enable  = 1'b0;
    @(posedge tb_clk);
    @(posedge tb_clk);
    tb_count_enable  = 1'b1;
    @(posedge tb_clk);
    @(posedge tb_clk);
    tb_count_enable  = 1'b0;
    @(posedge tb_clk);

    #(CHECK_DELAY);

    check_output(2,0,4);



//Test case 5: Clearing while counting to check clear vs. count enable priority
    tb_count_enable  = 1'b0;
    tb_n_rst = 1'b1;
    clear();
    reset_dut();
    tb_count_enable  = 1'b1;
    tb_rollover_val = 5;   
    tb_n_rst  = 1'b1;  

    @(posedge tb_clk);
    @(posedge tb_clk);
    tb_n_rst  = 1'b0;  
    @(posedge tb_clk);
    tb_n_rst  = 1'b1;  
    @(posedge tb_clk);
    @(posedge tb_clk);

    #(CHECK_DELAY);

    check_output(2,0,5);




    tb_count_enable  = 1'b0;
    tb_n_rst = 1'b1;
    clear();
    reset_dut();
    tb_count_enable  = 1'b0;
    tb_rollover_val = 5;   
    tb_n_rst  = 1'b1;   

    @(posedge tb_clk);
    @(posedge tb_clk);
    tb_rollover_val  = 4'd6;  
    @(posedge tb_clk);
    tb_rollover_val  = 4'd8;   
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);

    #(CHECK_DELAY);

    check_output(0,0,6);



  end
endmodule
