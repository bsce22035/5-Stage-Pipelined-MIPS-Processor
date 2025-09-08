`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2024 11:54:43 AM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory (
    input clk,
    input MemRead,
    input MemWrite,
    input [31:0] Address,
    input [31:0] WriteData,
    output [31:0] ReadData
);

    reg [31:0] memory [0:255]; //data memory of 256 bit and width of 32 bit

    assign ReadData = (MemRead) ? memory[Address[31:2]] : 32'b0;//if memory read is 1 read the data from the memory address given

    always @(posedge clk) begin
        if (MemWrite) begin
            memory[Address[31:2]] <= WriteData;  //write the data to the memory address
        end
    end
endmodule

