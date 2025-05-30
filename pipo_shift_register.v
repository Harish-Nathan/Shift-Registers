`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2025 10:01:10
// Design Name: 
// Module Name: pipo_shift_register
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


module pipo_shift_register(
    input wire clk, reset,
    input wire load,      
    input wire [3:0] parallel_in,
    output reg [3:0] parallel_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            parallel_out <= 4'b0000;
        end else if (load) begin
            parallel_out <= parallel_in;
        end
    end

endmodule
