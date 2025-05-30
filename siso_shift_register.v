`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 13:15:59
// Design Name: 
// Module Name: siso_shift_register
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
/////////////////////////////////////// ///////////////////////////////////////////


module siso_shift_register(
    input wire serial_in,shift_dir,
    input wire clk,reset,
    output reg serial_out
    );
    reg [3:0] shift_reg;
    
    always@(posedge clk or posedge reset)begin
        if(reset)begin
            shift_reg <= 4'b0000;
            serial_out <= 1'b0;
        end else begin
            if(shift_dir == 1'b0)begin
                shift_reg[3] <= serial_in;
                shift_reg[2] <= shift_reg[3];
                shift_reg[1] <= shift_reg[2];
                shift_reg[0] <= shift_reg[1];
                serial_out <= shift_reg[0]; 
            end else begin
                shift_reg[0] <= serial_in;
                shift_reg[1] <= shift_reg[0];
                shift_reg[2] <= shift_reg[1];
                shift_reg[3] <= shift_reg[2];
                serial_out <= shift_reg[3];
            end
        end
    end   
endmodule
