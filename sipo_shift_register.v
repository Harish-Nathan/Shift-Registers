`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 14:33:49
// Design Name: 
// Module Name: sipo_shift_register
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


module sipo_shift_register (
    input wire clk, reset,
    input wire serial_in,shift_dir,
    output reg [3:0] parallel_out,
    output reg serial_out
);

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            parallel_out <= 4'b0000;
            serial_out <= 0;
        end else begin
            if (shift_dir == 0) begin
                // Shift Right
                serial_out <= parallel_out[0];
                parallel_out[0] <= parallel_out[1];
                parallel_out[1] <= parallel_out[2];
                parallel_out[2] <= parallel_out[3];
                parallel_out[3] <= serial_in;
            end else begin
                // Shift Left
                serial_out <= parallel_out[3];
                parallel_out[3] <= parallel_out[2];
                parallel_out[2] <= parallel_out[1];
                parallel_out[1] <= parallel_out[0];
                parallel_out[0] <= serial_in;
            end
        end
    end

endmodule

