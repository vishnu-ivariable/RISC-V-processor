`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 11:17:10
// Design Name: 
// Module Name: data_mem
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


module data_mem(clk,address,write_data,read_data,mem_write);
input clk;
input [31:0]address,write_data;
input mem_write;
output [31:0] read_data;

reg [31:0] mem[1023:0];

always @(posedge clk) begin 
if(mem_write) 
    mem[address[31:2]]<=write_data;
end

assign read_data = mem[address[31:2]];

endmodule
