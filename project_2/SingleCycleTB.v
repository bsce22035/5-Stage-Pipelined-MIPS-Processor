`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2024 11:59:31 AM
// Design Name: 
// Module Name: SingleCycleTB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SingleCycleTB();
    reg clk;reg reset;
    wire [31:0] PC, Instruction, ReadData1, ReadData2, ALUResult, MemReadData, WriteData;
    wire [31:0] NextPC, SignImm, ALUInput2; wire [4:0] WriteRegister; wire [3:0] ALUControl;
    wire [1:0] ALUOp; wire Zero, PCSrc, Branch, MemRead, MemWrite, RegDst, ALUSrc, MemtoReg, RegWrite;
    SingleCycleTop top (.clk(clk), .reset(reset));
    assign PC = top.pc_module.PC; assign NextPC = top.NextPC; 
    assign Instruction = top.imem.Instruction; assign ReadData1 = top.rf.ReadData1;
    assign ReadData2 = top.rf.ReadData2; assign ALUResult = top.alu.ALUResult;
    assign MemReadData = top.dmem.ReadData;
    assign WriteData = top.WriteData; assign SignImm = top.se.SignImm;
    assign ALUInput2 = top.ALUInput2; assign WriteRegister = top.WriteRegister;
    assign ALUControl = top.alu_control.ALUControl;
    assign ALUOp = top.cu.ALUOp; assign Zero = top.alu.Zero;
    assign PCSrc = top.PCSrc; assign Branch = top.cu.Branch;
    assign MemRead = top.cu.MemRead; assign MemWrite = top.cu.MemWrite;
    assign RegDst = top.cu.RegDst; assign ALUSrc = top.cu.ALUSrc;
    assign MemtoReg = top.cu.MemtoReg; assign RegWrite = top.cu.RegWrite;
    initial begin
        clk = 0; forever #5 clk = ~clk;
    end
    initial begin
        reset = 1; #10;
        reset = 0; #300;
        $finish;
    end
endmodule
