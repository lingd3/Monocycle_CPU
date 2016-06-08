`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:13:53 04/24/2016
// Design Name:
// Module Name:    ControlUnit
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
module ControlUnit(
	input [5:0] opcode,
   input Zero,
	output reg RegWre,
   output reg PCWre,
	output reg ALUSrcB,
	output reg [2:0] ALUOp,
	output reg ALUM2Reg,
	output reg InsMemRW,
	output reg RegOut,
	output reg DataMemRW,
	output reg PCSrc,
	output reg ExtSel
    );

	always @(opcode or Zero) begin
		case(opcode)
			// add, R-format
			6'b000000:
			begin
				RegWre = 1;
				PCWre = 1;
				ALUSrcB = 0;
				ALUOp = 3'b000;
				ALUM2Reg = 0;
				RegOut = 1;
				DataMemRW = 0;
				PCSrc = 0;
				ExtSel = 0;
				InsMemRW = 0;
			end

			// sub, R-format
			6'b000010:
			begin
				PCWre = 1;
				ALUSrcB = 0;
				ALUM2Reg = 0;
				RegWre = 1;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 0;
				PCSrc = 0;
				RegOut = 1;
				ALUOp = 3'b001;
			end

			// addi, I-format
			6'b000001:
			begin
				PCWre = 1;
				ALUSrcB = 1;
				ALUM2Reg = 0;
				RegWre = 1;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 1;
				PCSrc = 0;
				RegOut = 0;
				ALUOp = 3'b000;
			end

			// ori, I-format
			6'b010000:
			begin
				PCWre = 1;
				ALUSrcB = 1;
				ALUM2Reg = 0;
				RegWre = 1;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 0;
				PCSrc = 0;
				RegOut = 0;
				ALUOp = 3'b011;
			end

			// and, R-format
			6'b010001:
			begin
				PCWre = 1;
				ALUSrcB = 0;
				ALUM2Reg = 0;
				RegWre = 1;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 0;
				PCSrc = 0;
				RegOut = 1;
				ALUOp = 3'b100;
			end

			// or, R-format
			6'b010010:
			begin
				PCWre = 1;
				ALUSrcB = 0;
				ALUM2Reg = 0;
				RegWre = 1;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 0;
				PCSrc = 0;
				RegOut = 1;
				ALUOp = 3'b011;
			end

			// move, R-format
			6'b100000:
			begin
				PCWre = 1;
				ALUSrcB = 0;
				ALUM2Reg = 0;
				RegWre = 1;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 0;
				PCSrc = 0;
				RegOut = 1;
				ALUOp = 3'b000;
			end

			// sw, I-format
			6'b100110:
			begin
				PCWre = 1;
				ALUSrcB = 1;
				ALUM2Reg = 0;
				RegWre = 0;
				InsMemRW = 0;
				DataMemRW = 1;
				ExtSel = 1;
				PCSrc = 0;
				RegOut = 0;
				ALUOp = 3'b000;
			end

			// lw, I-format
			6'b100111:
			begin
				PCWre = 1;
				ALUSrcB = 1;
				ALUM2Reg = 1;
				RegWre = 1;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 1;
				PCSrc = 0;
				RegOut = 0;
				ALUOp = 3'b000;
			end

			// beq, I-format
			6'b110000:
			begin
				PCWre = 1;
				ALUSrcB = 0;
				ALUM2Reg = 0;
				RegWre = 0;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 1;
				PCSrc = Zero;
				RegOut = 0;
				ALUOp = 3'b001;
			end

			// halt, J-format
			6'b111111:
			begin
				PCWre = 0;
				ALUSrcB = 0;
				ALUM2Reg = 0;
				RegWre = 0;
				InsMemRW = 0;
				DataMemRW = 0;
				ExtSel = 0;
				PCSrc = 0;
				RegOut = 0;
				ALUOp = 3'b000;
			end
		endcase
	end

endmodule
