`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.05.2025 13:54:59
// Design Name: 
// Module Name: tb_siso_shift_register
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


module tb_siso_shift_register;

    reg clk;
    reg reset;
    reg serial_in;
    reg shift_dir;        // 0: shift right, 1: shift left
    wire serial_out;

    siso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .shift_dir(shift_dir),
        .serial_out(serial_out)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        serial_in = 0;
        shift_dir = 0;

     
        #20 reset = 0;

        
        shift_dir = 0; // shift right
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;

        
        #50;

       
        shift_dir = 1; // shift left
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;


        #500 $finish;
    end

  
    initial begin
        $monitor("Time=%0t | Reset=%b | ShiftDir=%b | SerialIn=%b | ShiftReg=%b | SerialOut=%b",
                 $time, reset, shift_dir, serial_in, uut.shift_reg, serial_out);
    end

endmodule


