`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 12:23:17
// Design Name: 
// Module Name: risc_processor_tb
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


module risc_processor_tb();
reg clk=1'b0,rst;

risc_processor rp(.clk(clk),.rst(rst));

    always 
    begin
        clk = ~ clk;
        #10;  
        
    end
    
    initial
    begin
     rp.reg_file.registers[1] = 32'h00000005; // x1 = 5
        rp.reg_file.registers[2] = 32'h00000003; // x2 = 3

        // Initialize data memory
        rp.data_mem.mem[0] = 32'h0000000A; // Data at address 0

        // Apply reset
        rst = 1;
        #10 rst = 0;

        // Wait for the result
        #500;

        // Display the results
        $display("x3 = %h (ADD)", rp.reg_file.registers[3]); // x3 = 5 + 3 = 8
        $display("x4 = %h (SUB)", rp.reg_file.registers[4]); // x4 = 5 - 3 = 2
        $display("x5 = %h (XOR)", rp.reg_file.registers[5]); // x5 = 5 ^ 3 = 6
        $display("x6 = %h (LW)", rp.reg_file.registers[6]); // x6 = data at address 0 = 10
        $display("x7 = %h (MOV)", rp.reg_file.registers[7]); // x7 = x1 = 5
        $finish;
//    rp.reg_file.registers[1] = 32'h00000005; // x1 = 5
//    rp.reg_file.registers[2] = 32'h00000003; // x2 = 3
//    #10
//        rst <= 1'b1;
//        #150;

//        rst <=1'b1;
//        #450;
//        $finish;
    end
endmodule



