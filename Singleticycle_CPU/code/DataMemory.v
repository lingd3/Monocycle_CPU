`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:17:15 04/24/2016
// Design Name:
// Module Name:    DataMemory
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module DataMemory(
	input DataMemRW,
	input [31:0] dAddr,
	input [31:0] dataInput,
	output reg [31:0] dataOut
    );

	reg [31:0] memory [0:31];
	integer i;

	initial begin
		for (i = 0; i < 32; i = i + 1)
			memory[i] = 32'b0;
	end

	always @(dAddr or DataMemRW) begin
		if (DataMemRW == 0) begin  // lw
			dataOut = memory[dAddr];
		end else begin  // sw
			memory[dAddr] = dataInput;
		end
	end

endmodule
