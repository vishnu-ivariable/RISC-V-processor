`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 11:03:21
// Design Name: 
// Module Name: instruction_mem
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


module instruction_mem(address,instruction);
input [31:0] address;
output [31:0] instruction;

reg [31:0] mem[1023:0];

assign instruction = mem[address[31:2]];

initial begin

mem[0] = 32'b0000000_00010_00001_000_00011_0110011; // ADD x3, x1, x2
mem[1] = 32'b0100000_00010_00001_000_00100_0110011; // SUB x4, x1, x2
mem[2] = 32'b0000000_00010_00001_100_00101_0110011; // XOR x5, x1, x2
mem[3] = 32'b000000000000_00001_010_00110_0000011; // LW x6, 0(x1)
mem[4] = 32'b000000000000_00001_000_00111_0010011; // ADDI x7, x1, 0 (MOV x7, x1)
//mem[0] = 32'b0000000_00010_00001_000_00011_0110011;
//mem[1] = 32'h00200093;
end 

endmodule
