`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 11:13:59
// Design Name: 
// Module Name: pc
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


module pc(clk,rst,pc_nxt,pc);
input clk,rst;
output reg [31:0] pc;
input [31:0] pc_nxt;

always@(posedge clk) begin
if(rst)
    pc<=32'b0;
else 
    pc<=pc_nxt;
end 

endmodule
