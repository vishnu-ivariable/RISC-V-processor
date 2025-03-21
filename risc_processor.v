`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2025 11:46:58
// Design Name: 
// Module Name: risc_processor
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


module risc_processor(clk,rst);
input clk,rst;

wire [31:0]pc,pc_nxt,instruction,read_data1,read_data2,result,mem_read_data,write_data;
wire reg_write,alu_src,mem_write,carry;
wire [1:0] alu_control;

pc pc_module(.clk(clk),.rst(rst),.pc_nxt(pc_nxt),.pc(pc));

instruction_mem instruc_mem(.address(pc),.instruction(instruction));

register_file reg_file(.clk(clk),.rs1(instruction[19:15]),.rs2(instruction[24:20]),
                .rd(instruction[11:7]),.write_data(write_data),.read_data1(read_data1),
               .read_data2(read_data2),.reg_write(reg_write));
               
alu alu(.a(read_data1),.b(alu_src? instruction[31:20] : read_data2),.alu_control(alu_control),.carry(carry),.result(result));

data_mem data_mem(.clk(clk),.address(result),.write_data(read_data2),
                    .read_data(mem_read_data),.mem_write(mem_write));
                    
 control_unit control(.opcode(instruction[6:0]), .funct3(instruction[14:12]), .funct7(instruction[31:25]),
                        .reg_write(reg_write),.alu_src(alu_src),
                        .mem_write(mem_write), .mem_to_reg(mem_to_reg),.alu_control(alu_control));
                        
               
//assign write_data = mem_to_reg ? mem_read_data : result;
assign pc_nxt = pc+4;

endmodule
