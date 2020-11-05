// $Id: $
// File name:   tb_mealy.sv
// Created:     2/16/2020
// Author:      Xiangyu Zhang
// Lab Section: 337-01
// Version:     1.0  Initial Design Entry
// Description: testbench for mealy machine '1101' detector


`timescale 1ns / 10ps

module tb_mealy();
  // Define parameters
  // Common parameters
  localparam CLK_PERIOD        = 2.5;
  localparam PROPAGATION_DELAY = 0.8; // Allow for 800 ps for FF propagation delay

  localparam  INACTIVE_VALUE     = 1'b1;
  localparam  SR_SIZE_BITS       = 10;
  localparam  SR_MAX_BIT         = SR_SIZE_BITS - 1;
  localparam  RESET_OUTPUT_VALUE = 0;

  // Declare Test Case Signals
  integer tb_test_num;
  string  tb_test_case;
  string  tb_stream_check_tag;
  int     tb_bit_num;
  logic   tb_check;

  // Declare the Test Bench Signals for Expected Results
  logic [SR_MAX_BIT:0] tb_expected_ouput;
  logic [SR_MAX_BIT:0]tb_test_data;

  logic tb_expected_ouput_bit;


  // Declare DUT Connection Signals
  logic                tb_clk;
  logic                tb_n_rst;
  logic                tb_i;
  logic                tb_o;

// Task for standard DUT reset procedure
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

  task send_stream;
    //input logic bit_stream [];
  begin 
    for(tb_bit_num = 0; tb_bit_num < SR_SIZE_BITS; tb_bit_num++) begin
      @(posedge tb_clk);
      tb_i = tb_test_data[tb_bit_num];
      tb_expected_ouput_bit = tb_expected_ouput[tb_bit_num];
      check_output_bit("bit check");
    end
  end
  endtask

  // Task to cleanly and consistently check DUT output values
  task check_output_bit;
    input string check_tag;
  begin
    tb_check    = 1'b1;
    if(tb_expected_ouput_bit == tb_o) begin // Check passed
      $info("Correct output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      $error("Incorrect output %s during %s test case", check_tag, tb_test_case);
    end

    // Wait some small amount of time so check pulse timing is visible on waves
    #(0.1);
    tb_check =1'b0;
  end
  endtask

  // Clock generation block
  always begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end

  // DUT Portmap
  mealy DUT (
              .clk(tb_clk), 
              .n_rst(tb_n_rst), 
              .i(tb_i), 
              .o(tb_o));


  // Test bench main process
  initial begin
    // Initialize all of the test inputs
    tb_n_rst            = 1'b1; // Initialize to be inactive
    tb_i        = 1'b1; // Initialize to inactive value
    tb_test_num         = 0;    // Initialize test case counter
    tb_test_case        = "Test bench initializaton";
    tb_stream_check_tag = "N/A";
    tb_bit_num          = -1;   // Initialize to invalid number
    tb_check            = 1'b0;
    // Wait some time before starting first test case
    #(0.1);

    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_i = 1'b0;
    tb_n_rst     = 1'b0;

    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    tb_expected_ouput = RESET_OUTPUT_VALUE;
    check_output_bit("after reset applied");

    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output_bit("after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(negedge tb_clk);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    // Check that internal state was correctly keep after reset release
    #(PROPAGATION_DELAY);
    check_output_bit("after reset was released");


    // ************************************************************************
    // Test Case 2: Normal Operation on Moore of all zeroes
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Moore: All zeroes";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b1;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = 10'b0000000000;

    // Define the expected result
    tb_expected_ouput = 10'b0000000000;

    // Contiguously stream enough zeros to fill the shift register
    send_stream();

    // ************************************************************************
    // Test Case 3: Normal Operation on Moore of all ones
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Moore: All zeroes";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b1;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = 10'b1111111111;

    // Define the expected result
    tb_expected_ouput = 10'b0000000000;

    send_stream();


    // ************************************************************************
    // Test Case 4: Normal Operation on Moore
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Normal Operation on Moore";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b1;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = 10'b1011011011;

    // Define the expected result
    tb_expected_ouput = 10'b0001001001;

    send_stream();


    // ************************************************************************
    // Test Case 5
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Normal Operation on Moore";
    tb_i = 1'b0;
    tb_o = 0;
    reset_dut();

    tb_i = 1'b0;
    tb_o = 0;
    tb_test_data = 10'b0110110110;
    tb_expected_ouput = 10'b0000100100;
    send_stream();

    // ************************************************************************
    // Test Case 6
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Normal Operation on Moore";
    tb_i = 1'b0;
    tb_o = 0;
    reset_dut();

    tb_i = 1'b0;
    tb_o = 0;
    tb_test_data = 10'b1101101100;
    tb_expected_ouput = 10'b0000010010;
    send_stream();

    // ************************************************************************
    // Test Case 7
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Normal Operation on Moore";
    tb_i = 1'b0;
    tb_o = 0;
    reset_dut();

    tb_i = 1'b0;
    tb_o = 0;
    tb_test_data = 10'b0000111010;
    tb_expected_ouput = 10'b0000000000;
    send_stream();

// ************************************************************************
    // Test Case 8
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Normal Operation on Moore";
    tb_i = 1'b0;
    tb_o = 0;
    reset_dut();

    tb_i = 1'b0;
    tb_o = 0;
    tb_test_data = 10'b0000001011;
    tb_expected_ouput = 10'b0001000000;
    send_stream();
  end
endmodule