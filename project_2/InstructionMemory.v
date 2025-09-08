`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2024 11:39:57 AM
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory (
    input [31:0] Address,
    output [31:0] Instruction
);

    reg [31:0] memory [0:255];

    initial begin
        
            memory[0] = 32'h00221820;  // add x3, x2, x1       
            memory[4] = 32'h00253822;  // sub x7,x1,x5     //ALUop of sub=6
            memory[8] = 32'h00329812;  // sub x6,x3,x5     
            memory[12] = 32'h000819E5; // or x7,x8,x3     //ALUOP o or=1
          
            
        
    end

    assign Instruction = memory[Address[31:2]];
endmodule
