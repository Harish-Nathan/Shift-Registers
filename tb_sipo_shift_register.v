`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 14:34:06
// Design Name: 
// Module Name: tb_sipo_shift_register
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

module tb_sipo_shift_register;

    reg clk;
    reg reset;
    reg serial_in;
    reg shift_dir;  // 0 = right, 1 = left
    wire [3:0] parallel_out;
    wire serial_out;

    // Instantiate the SIPO module
    sipo_shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .shift_dir(shift_dir),
        .parallel_out(parallel_out),
        .serial_out(serial_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin

        // Initial values
        clk = 0;
        reset = 1;
        serial_in = 0;
        shift_dir = 0;

        // Hold reset
        #10 reset = 0;

        // --- Right shift loading ---
        shift_dir = 0;
        serial_in = 1;  #10;
        serial_in = 0;  #10;
        serial_in = 1;  #10;
        serial_in = 1;  #10;

        // Hold value
        #20;

        // --- Left shift loading ---
        shift_dir = 1;
        serial_in = 0;  #10;
        serial_in = 1;  #10;
        serial_in = 1;  #10;
        serial_in = 0;  #10;

        // Hold value
        #20;

        // Finish simulation
        $finish;
    end
    
    initial begin
    $display("Time\tReset\tDir\tSerialIn\tParallelOut\tSerialOut");
    $monitor("%0t\t%b\t\t%b\t%b\t\t%b\t\t%b", 
             $time, reset, shift_dir, serial_in, parallel_out, serial_out);
    end


endmodule

