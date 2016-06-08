`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:10:27 04/24/2016
// Design Name:
// Module Name:    CPU
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
module CPU(clk, reset, opCode, rbOut1, rbOut2, ALUResult, curPC, initPC, zero, extOut);
  input clk, reset;
  input [31:0] initPC;
  output [5:0] opCode;
  output [31:0] rbOut1, rbOut2, ALUResult, curPC, extOut;
  output zero;

  wire Extsel, PCWre, InsMemRW, RegOut, RegWre, ALUSrcB, ALUM2Reg, PCSrc, DataMemRW, zero;
  wire [31:0] rbOut1, rbOut2, curPC, ALUResult, DMOut, extOut;
  wire [5:0] opCode;
  wire [2:0] ALUOp;
  wire [15:0] imm;
  wire [4:0] rs, rt, rd;

  ControlUnit cu(
        .opcode(opCode),
        .Zero(zero),
        .RegWre(RegWre),
        .PCWre(PCWre),
        .ALUSrcB(ALUSrcB),
        .ALUOp(ALUOp),
        .ALUM2Reg(ALUM2Reg),
        .InsMemRW(InsMemRW),
        .RegOut(RegOut),
        .DataMemRW(DataMemRW),
        .PCSrc(PCSrc),
        .ExtSel(Extsel)
        );

  ALU alu(
      .ALUOp(ALUOp),
      .ALUSrcB(ALUSrcB),
      .inputData1(rbOut1),
      .inputData2(rbOut2),
      .extendInputData(extOut),
      .zero(zero),
      .result(ALUResult)
      );

  DataMemory dm(
      .DataMemRW(DataMemRW),
      .dAddr(ALUResult),
      .dataInput(rbOut2),
      .dataOut(DMOut)
      );

  InstructionMemory im(
      .InsMemRW(InsMemRW),
      .iAddr(curPC),
      .opCode(opCode),
      .rs(rs),
      .rt(rt),
      .rd(rd),
      .imm(imm)
      );

  RegisterBlock rb(
      .rs(rs),
      .rt(rt),
      .rd(rd),
      .dataFromALU(ALUResult),
      .dataFromDM(DMOut),
      .RegWre(RegWre),
      .RegOut(RegOut),
      .ALUM2Reg(ALUM2Reg),
      .clk(clk),
      .dataOut1(rbOut1),
      .dataOut2(rbOut2)
      );

  SignZeroExtend ext(
      .immediate(imm),
      .ExtSel(Extsel),
      .dataOut(extOut)
      );

  PC pc(
      .clk(clk),
      .reset(reset),
      .PCWre(PCWre),
      .PCSrc(PCSrc),
      .addressInput(curPC),
      .addressOffset(extOut),
		.addressOutput(curPC),
		.initPC(initPC)
      );

endmodule
