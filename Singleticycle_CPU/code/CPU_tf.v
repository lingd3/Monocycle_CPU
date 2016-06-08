`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:23:23 04/25/2016
// Design Name:   CPU
// Module Name:   C:/Users/Yunzhao/Desktop/MySingleCycleCPU/CPU/CPU_tf.v
// Project Name:  CPU
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_tf;

	// Inputs
	reg clk;
	reg reset;
	reg [31:0] initPC;

	// Outputs
	wire [5:0] opCode;
	wire [31:0] rbOut1;
	wire [31:0] rbOut2;
	wire [31:0] ALUResult;
	wire [31:0] curPC;
	wire [31:0] extOut;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk), 
		.reset(reset), 
		.opCode(opCode), 
		.rbOut1(rbOut1), 
		.rbOut2(rbOut2), 
		.ALUResult(ALUResult), 
		.curPC(curPC),
		.initPC(initPC),
		.zero(zero),
		.extOut(extOut)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		initPC = 32'h0000018c;

		// Wait 1000 ns for global reset to finish
		#1000;
        
		// Add stimulus here
		reset = 1;
		
	end
	always #1000 clk = ~clk;
      
endmodule

