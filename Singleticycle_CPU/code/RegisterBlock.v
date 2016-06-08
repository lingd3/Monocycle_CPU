`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:46 04/24/2016
// Design Name:
// Module Name:    RegisterBlock
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
module RegisterBlock(
	input [4:0] rs,
	input [4:0] rt,
	input [4:0] rd,
	input [31:0] dataFromALU,
	input [31:0] dataFromDM,
	input RegWre,
	input RegOut,
	input ALUM2Reg,
	input clk,
	output [31:0] dataOut1,
	output [31:0] dataOut2
	);

	reg [31:0] register [1:31]; // r1 - r31
	wire [31:0] writeData;
	wire [4:0] writeReg;
	integer i;
	
	initial begin
	   for (i = 1; i < 32; i=i+1)
			register[i] = 32'h00000000;
	end
	
	assign writeData = (ALUM2Reg == 0) ? dataFromALU : dataFromDM;
	assign writeReg = (RegOut == 0) ? rt : rd;

	assign dataOut1 = (rs == 0) ? 0 : register[rs];  // read
	assign dataOut2 = (rt == 0) ? 0 : register[rt];  // read

	always @(posedge clk) begin
		if ((writeReg != 0) && (RegWre == 1)) // write
			register[writeReg] <= writeData;
	end

endmodule
