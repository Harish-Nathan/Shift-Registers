`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 15:12:53
// Design Name: 
// Module Name: piso_shift_register
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


module piso_shift_register (
    input wire clk, reset,
    input wire load,             
    input wire shift_dir,       
    input wire [3:0] parallel_in,
    output reg serial_out
);

    reg [3:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            shift_reg <= 4'b0000;
            serial_out <= 1'b0;
        end else if (load) begin
            shift_reg <= parallel_in;
        end else begin
            if (shift_dir == 0) begin
                // Right shift
                serial_out <= shift_reg[0];
                shift_reg[0] <= shift_reg[1];
                shift_reg[1] <= shift_reg[2];
                shift_reg[2] <= shift_reg[3];
                shift_reg[3] <= 1'b0;
            end else begin
                // Left shift
                serial_out <= shift_reg[3];
                shift_reg[3] <= shift_reg[2];
                shift_reg[2] <= shift_reg[1];
                shift_reg[1] <= shift_reg[0];
                shift_reg[0] <= 1'b0;
            end
        end
    end

endmodule

