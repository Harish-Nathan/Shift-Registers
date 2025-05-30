`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.05.2025 10:01:49
// Design Name: 
// Module Name: tb_pipo_shift_register
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

module tb_pipo_shift_register;

    reg clk;
    reg reset;
    reg load;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    pipo_shift_register uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tLoad\tParallelIn\tParallelOut");
        $monitor("%0t\t%b\t%b\t%b\t\t%b", 
                 $time, reset, load, parallel_in, parallel_out);

        clk = 0;
        reset = 1;
        load = 0;
        parallel_in = 4'b0000;

        #10 reset = 0;

        load = 1;
        parallel_in = 4'b1010;
        #10 load = 0;

        #10;

        load = 1;
        parallel_in = 4'b1100;
        #10 load = 0;

        #10;

        load = 1;
        parallel_in = 4'b0111;
        #10 load = 0;

        #20 $finish;
    end

endmodule

