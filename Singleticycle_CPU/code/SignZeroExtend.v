`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:11:14 04/24/2016
// Design Name:
// Module Name:    SignZeroExtend
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
module SignZeroExtend(
	 input [15:0] immediate,
	 input ExtSel,
	 output reg [31:0] dataOut
    );

	 initial begin
	 	dataOut <= 32'bz;
	 end

	 always @(immediate) begin
	 	if (ExtSel == 0)
	 		dataOut = {16'b0000000000000000, immediate};
	 	else
	 		dataOut = {{16{immediate[15]}}, immediate};
	 end


endmodule
