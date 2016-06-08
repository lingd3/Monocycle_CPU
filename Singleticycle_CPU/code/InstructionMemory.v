`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:16:34 04/24/2016
// Design Name:
// Module Name:    InstructionMemory
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
module InstructionMemory(
	input InsMemRW,
	input [31:0] iAddr,
	output reg [5:0] opCode,
	output reg [4:0] rs,
	output reg [4:0] rt,
	output reg [4:0] rd,
	output reg [15:0] imm
    );

	reg [31:0] memory [0:511];
	reg [31:0] dataOut;

	initial begin
		memory[400] = 32'b000001_00000_00001_0000000000000111;  // addi $1, $0, 7   $1 = 7
	   memory[404] = 32'b010000_00000_00010_0000000000000011;  // ori  $2, $0, 3   $2 = 3
	   memory[408] = 32'b000010_00001_00010_00011_00000000000; // sub  $3, $1, $2  $3 = 4
	   memory[412] = 32'b010001_00011_00010_00100_00000000000; // and  $4, $3, $2  $4 = 0
	   memory[416] = 32'b010010_00100_00011_00101_00000000000; // or   $5, $4, $3  $5 = 4
	   memory[420] = 32'b000000_00100_00101_00100_00000000000; // add  $4, $4, $5  $4 = 4
	   memory[424] = 32'b110000_00101_00100_0000000000000011;  // beq  $4, $5, 3   jump to 440
	   memory[428] = 32'b100110_00001_00010_0000000000010000;  // sw   $2, 16($1)
	   memory[432] = 32'b100111_00001_00110_0000000000010000;  // lw   $6, 16($1)
	   memory[436] = 32'b100000_00110_00000_00011_00000000000; // move $3, $6
	   memory[440] = 32'b110000_00101_00011_1111111111111010;  // beq  $5, $3, -6
	   memory[444] = 32'b111111_00000_00000_0000000000000000;  // halt
		opCode = 6'b000000;
		rs = 5'b000000;
		rt = 5'b000000;
		rd = 5'b000000;
	end

	always @(iAddr) begin
		if (InsMemRW == 0) begin
			dataOut = memory[iAddr];
			opCode = dataOut[31:26];
			rs = dataOut[25:21];
			rt = dataOut[20:16];
			rd = dataOut[15:11];
			imm = dataOut[15:0];
		end
	end
endmodule
