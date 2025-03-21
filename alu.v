`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 10:29:06
// Design Name: 
// Module Name: alu
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


module alu(a,b,alu_control,carry,result);
input [31:0]a,b;
input [3:0] alu_control;
output [31:0]result;
output carry;


assign result = (alu_control == 4'b0000) ? a+b :  
                (alu_control ==4'b0001) ? a-b :
                (alu_control ==4'b0010) ? a^b :
                (alu_control ==4'b0011) ? b : 32'b0 ;

   
endmodule
