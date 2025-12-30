`timescale 1ns / 1ps

module ID_EX_Reg(
    input clk,
    input reset,
    input [7:0] ID_PC_plus_1,
    input [7:0] ID_reg_data_1,
    input [7:0] ID_reg_data_2,
    input [1:0] ID_rd,
    input [7:0] ID_imm,
    input [2:0] ID_alu_op,
    input ID_alu_src,
    input ID_mem_read,
    input ID_mem_write,
    input ID_mem_to_reg,
    input ID_r2_to_rd,
    input ID_reg_write,
    input ID_jump,
    input ID_branch_zero,
    input ID_branch_neg,
    input ID_halt,
    
    output reg [7:0] EX_PC_plus_1,
    output reg [7:0] EX_reg_data_1,
    output reg [7:0] EX_reg_data_2,
    output reg [1:0] EX_rd,
    output reg [7:0] EX_imm,
    output reg [2:0] EX_alu_op,
    output reg EX_alu_src,
    output reg EX_mem_read,
    output reg EX_mem_write,
    output reg EX_mem_to_reg,
    output reg EX_r2_to_rd,
    output reg EX_reg_write,
    output reg EX_jump,
    output reg EX_branch_zero,
    output reg EX_branch_neg,
    output reg EX_halt
    );
    
    always @(posedge clk) begin
        if (!reset) begin
            EX_PC_plus_1 <= ID_PC_plus_1;
            EX_reg_data_1 <= ID_reg_data_1;
            EX_reg_data_2 <= ID_reg_data_2;
            EX_rd <= ID_rd;
            EX_imm <= ID_imm;
            EX_alu_op <= ID_alu_op;
            EX_alu_src <= ID_alu_src;
            EX_mem_read <= ID_mem_read;
            EX_mem_write <= ID_mem_write;
            EX_mem_to_reg <= ID_mem_to_reg;
            EX_r2_to_rd <= ID_r2_to_rd;
            EX_reg_write <= ID_reg_write;
            EX_jump <= ID_jump;
            EX_branch_zero <= ID_branch_zero;
            EX_branch_neg <= ID_branch_neg;
            EX_halt <= ID_halt;
        end else begin
            EX_PC_plus_1 <= 0;
            EX_reg_data_1 <= 0;
            EX_reg_data_2 <= 0;
            EX_rd <= 0;
            EX_imm <= 0;
            EX_alu_op <= 0;
            EX_alu_src <= 0;
            EX_mem_read <= 0;
            EX_mem_write <= 0;
            EX_mem_to_reg <= 0;
            EX_r2_to_rd <= 0;
            EX_reg_write <= 0;
            EX_jump <= 0;
            EX_branch_zero <= 0;
            EX_branch_neg <= 0;
            EX_halt <= 0;
        end
        
    end
    
endmodule
