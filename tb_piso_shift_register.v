`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 15:13:21
// Design Name: 
// Module Name: tb_piso_shift_register
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


module tb_piso_shift_register;

    reg clk;
    reg reset;
    reg load;
    reg shift_dir;
    reg [3:0] parallel_in;
    wire serial_out;

    piso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .shift_dir(shift_dir),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tLoad\tDir\tParallelIn\tSerialOut");
        $monitor("%0t\t%b\t%b\t%b\t%b\t\t%b", 
                 $time, reset, load, shift_dir, parallel_in, serial_out);

        clk = 0;
        reset = 1;
        load = 0;
        shift_dir = 0;
        parallel_in = 4'b0000;

        #10 reset = 0;

        load = 1;
        parallel_in = 4'b1011;
        #10 load = 0;

        shift_dir = 0;  
        #10;  
        #10;  
        #10;  
        #10; 

        load = 1;
        parallel_in = 4'b1101;
        #10 load = 0;

        shift_dir = 1;  
        #10;  
        #10; 
        #10;
        #10;


        #20 $finish;
    end

endmodule

