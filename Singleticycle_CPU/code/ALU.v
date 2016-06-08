`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:14:18 04/24/2016
// Design Name:
// Module Name:    ALU
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
module ALU(
	input [2:0] ALUOp,
	input ALUSrcB,
	input [31:0] inputData1,
	input [31:0] inputData2,
	input [31:0] extendInputData,
	output reg zero,
	output reg [31:0] result
    );
    reg [31:0] inputDataB;

	initial begin
		zero = 1'bz;
		result = 32'bz;
	end

	always @(inputData1 or inputData2 or extendInputData or ALUOp or ALUSrcB) begin
		zero = 0;
		// 判断第二个操作数输入
		if (ALUSrcB == 1) begin
			inputDataB = extendInputData;
		end else begin
			inputDataB = inputData2;
		end

		case(ALUOp)
			3'b000: result = inputData1 + inputDataB;
			3'b001: result = inputData1 - inputDataB;
			3'b010: result = inputDataB - inputData1;
			3'b011: result = inputData1 | inputDataB;
			3'b100: result = inputData1 & inputDataB;
			3'b101: result = (!inputData1) & inputDataB;
			3'b110: result = inputData1 ^ inputDataB;
			3'b111: result = inputData1 ~^ inputDataB;
			default: result = 32'bz;
		endcase

		zero = (result == 0) ? 1 : 0;
	end


endmodule
