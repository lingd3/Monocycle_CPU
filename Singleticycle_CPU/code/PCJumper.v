`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    17:13:39 04/24/2016
// Design Name:
// Module Name:    PCJumper
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
module PCJumper(
	input PCSrc,
	input [31:0] initAddressInput,  // 原指令地址
	input [31:0] addressOffset,  // 偏移�
	output reg [31:0] addressOutput  // 输出的指令地址
    );

	initial begin
		addressOutput <= 32'bz;
	end

	always @(initAddressInput) begin
		if (PCSrc == 0)
			addressOutput = initAddressInput;
		else
			addressOutput = initAddressInput + (addressOffset << 2);
	end

endmodule
