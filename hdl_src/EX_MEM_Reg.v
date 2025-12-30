`timescale 1ns / 1ps


module EX_MEM_Reg(
    input clk,
    input reset,
    input [7:0] EX_alu_result,
    input EX_zero_flag,
    input EX_neg_flag,
    input [7:0] EX_reg_data_2,
    input [1:0] EX_rd,
    input [7:0] EX_branch_target,
    input EX_reg_write,
    input EX_mem_read,
    input EX_mem_write,
    input EX_mem_to_reg,
    input EX_jump,
    input EX_branch_zero,
    input EX_branch_neg,
    input EX_halt,
    
    output reg [7:0] MEM_alu_result,
    output reg MEM_zero_flag,
    output reg MEM_neg_flag,
    output reg [7:0] MEM_reg_data_2,
    output reg [1:0] MEM_rd,
    output reg [7:0] MEM_branch_target,
    output reg MEM_reg_write,
    output reg MEM_mem_read,
    output reg MEM_mem_write,
    output reg MEM_mem_to_reg,
    output reg MEM_jump,
    output reg MEM_branch_zero,
    output reg MEM_branch_neg,
    output reg MEM_halt
    );
    
    
    always @(posedge clk) begin
        if (!reset) begin
            MEM_alu_result <= EX_alu_result;
            MEM_zero_flag <= EX_zero_flag;
            MEM_neg_flag <= EX_neg_flag;
            MEM_reg_data_2 <= EX_reg_data_2;
            MEM_rd <= EX_rd;
            MEM_branch_target <= EX_branch_target;
            MEM_mem_read <= EX_mem_read;
            MEM_mem_write <= EX_mem_write;
            MEM_reg_write <= EX_reg_write;
            MEM_mem_to_reg <= EX_mem_to_reg;
            MEM_jump <= EX_jump;
            MEM_branch_zero <= EX_branch_zero;
            MEM_branch_neg <= EX_branch_neg;
            MEM_halt <= EX_halt;
        end else begin
            MEM_alu_result <= 0;
            MEM_zero_flag <= 0;
            MEM_neg_flag <= 0;
            MEM_reg_data_2 <= 0;
            MEM_rd <= 0;
            MEM_branch_target <= 0;
            MEM_mem_read <= 0;
            MEM_mem_write <= 0;
            MEM_reg_write <= 0;
            MEM_mem_to_reg <= 0;
            MEM_jump <= 0;
            MEM_branch_zero <= 0;
            MEM_branch_neg <= 0;
            MEM_halt <= 0;
        end
    end
endmodule
