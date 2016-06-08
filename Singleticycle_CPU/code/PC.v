`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:11:47 04/24/2016
// Design Name:
// Module Name:    PC
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
module PC(
	input clk,
	input reset,
	input PCWre,
	input PCSrc,
	input [31:0] addressInput,
	output reg [31:0] addressOutput,
	input [31:0] addressOffset,
	input [31:0] initPC
    );

	reg [31:0] addedOutput;

	initial begin
		addressOutput = 32'h0000018c;
	end

	always @(posedge clk) begin
		if (PCWre != 1'b0) begin
			if (reset == 1'b0) begin
				addressOutput = initPC;
			end else begin
				addedOutput = addressInput + 4;
				if (PCSrc == 0)
					addressOutput = addedOutput;
				else
					addressOutput = addedOutput + (addressOffset << 2);
			end
		end
	end

endmodule
