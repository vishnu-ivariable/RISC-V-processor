`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 11:33:31
// Design Name: 
// Module Name: control_unit
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


module control_unit(opcode,funct3,funct7,reg_write,alu_src,mem_write,mem_to_reg,alu_control);
input [6:0]opcode;
input [2:0] funct3;
input [6:0] funct7;
output reg reg_write,alu_src,mem_write,mem_to_reg;
output reg [1:0] alu_control;

    always @(*) begin
        case (opcode)
            7'b0110011: begin
                 case (funct3)
                    3'b000: begin
                        if (funct7 == 7'b0000000) alu_control = 4'b0000; // ADD
                        else if (funct7 == 7'b0100000) alu_control = 4'b0001; // SUB
                    end
                    3'b100: alu_control = 4'b0010; // XOR
                    default: alu_control = 4'b0000;
                endcase
                reg_write = 1; alu_src = 0; mem_write = 0; mem_to_reg = 0;
            end
            7'b0000011: begin // LW (I-type)
                alu_control = 4'b0000; // ADD (for address calculation)
                reg_write = 1; alu_src = 1; mem_write = 0; mem_to_reg = 1;
            end
            7'b0010011: begin // ADDI (MOV)
                alu_control = 4'b0011; // MOV
                reg_write = 1; alu_src = 1; mem_write = 0; mem_to_reg = 0;
            end
            default: begin
                reg_write = 0; alu_src = 0; mem_write = 0; mem_to_reg = 0;
                alu_control = 4'b0000;
           end // R-type
//                reg_write = 1; alu_src = 0; mem_write = 0; 
//                alu_control = 2'b01; // ADD
//            end
//            7'b0010011: begin // I-type (ADDI)
//                reg_write = 1; alu_src = 1; mem_write = 0;
//                alu_control = 4'b0000; // ADD
//            end
            
//            default: begin
//                reg_write = 0; alu_src = 0; mem_write = 0;
//                alu_control = 4'b0000;
//            end
        endcase
    end
endmodule

