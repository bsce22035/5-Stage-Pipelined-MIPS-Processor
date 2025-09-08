`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/07/2024 03:00:49 PM
// Design Name: 
// Module Name: Predictor
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


module predictor(
    input wire clk,
    input wire rst,
    input wire branch,      // Signal indicating a branch instruction
    input wire taken,       // Actual outcome of the branch
    output reg prediction   // Prediction made by the predictor
);

    // State: 1 for taken, 0 for not taken
    reg state;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset the predictor to a known state, e.g., predict not taken
            state <= 1'b0;
            prediction <= 1'b0;
        end else if (branch) begin
            // Make a prediction
            prediction <= state;

            // Update the state based on the actual outcome
            state <= taken;
        end
    end

endmodule
