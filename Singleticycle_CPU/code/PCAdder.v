`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:13:24 04/24/2016
// Design Name:
// Module Name:    PCAdder
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
module PCAdder(
	input [31:0] addressInput,
	output reg [31:0] addressOutput
    );

	initial begin
		addressOutput <= 32'bz;
	end

	always @(addressInput)
		begin
			addressOutput = addressInput + 4;
		end

endmodule
