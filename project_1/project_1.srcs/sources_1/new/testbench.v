`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2024 10:43:22 AM
// Design Name: 
// Module Name: testbench
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


module testbench();
    reg clk=0, rst;
    wire [31:0] PC, Instruction, ReadData1, ReadData2, ALUResult, MemReadData, WriteData;
    wire [31:0] NextPC, SignImm; wire [4:0] WriteRegister;
    wire [6:0]op;
    wire [2:0]ALUControl;
    // wire Zero;
    wire PCSrc, Branch, MemWrite, ALUSrc, RegWrite;

Pipeline_top pipeline (.clk(clk), .rst(rst));

    assign PC = pipeline.PCD; 
    assign NextPC = pipeline.PCPlus4D; 
    assign Instruction = pipeline.instructions; 
    assign ReadData1 = pipeline.RS1_E;
    assign ReadData2 = pipeline.RS2_E; 
    assign ALUResult = pipeline.ALU_ResultM;
    assign MemReadData = pipeline.ReadDataW;
    assign WriteData = pipeline.WriteDataM; 
    assign SignImm = pipeline.Decode.Imm_Ext_D;
    assign WriteRegister = pipeline.RDW;
    // assign Zero = pipeline.Execute.ZeroE;
    assign ALUControl = pipeline.ALUControlE;
    assign op = pipeline.Decode.control.Op;
    assign PCSrc = pipeline.PCSrcE; 
    assign Branch = pipeline.BranchE;
    assign MemWrite = pipeline.MemWriteE; 
    assign ALUSrc = pipeline.ALUSrcE;
    assign RegWrite = pipeline.RegWriteE;
    always begin
        clk = ~clk;
        #50;
    end

    initial begin
        rst <= 1'b0;
        #200;
        rst <= 1'b1;
        #1000;
        $finish;    
    end

endmodule