`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 10:47:50
// Design Name: 
// Module Name: register_file
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


module register_file(clk,rs1,rs2,rd,write_data,read_data1,read_data2,reg_write);
//from rsa source and dest reg are 5 bits
input clk; 
input [4:0] rs1,rs2,rd;
input [31:0] write_data;
input reg_write;
output [31:0] read_data1,read_data2;

reg [31:0] registers[31:0];

initial begin
    registers[0] = 32'b0;
end

assign read_data1 = registers[rs1];
assign read_data2 = registers[rs2];

always@(posedge clk) begin
if(reg_write && rd !=0)
    registers[rd] <= write_data;
end
endmodule
