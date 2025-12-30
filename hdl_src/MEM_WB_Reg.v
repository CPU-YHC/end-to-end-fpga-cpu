`timescale 1ns / 1ps


module MEM_WB_Reg(
    input clk,
    input reset,
    input [7:0] MEM_alu_result,
    input [7:0] MEM_mem_data,
    input [1:0] MEM_rd,
    input MEM_reg_write,
    input MEM_mem_to_reg,
    output reg [7:0] WB_alu_result,
    output reg [7:0] WB_mem_data,
    output reg [1:0] WB_rd,
    output reg WB_reg_write,
    output reg WB_mem_to_reg
    );
    
    always @(posedge clk) begin
        if (!reset) begin
            WB_alu_result <= MEM_alu_result;
            WB_mem_data <= MEM_mem_data;
            WB_rd <= MEM_rd;
            WB_reg_write <= MEM_reg_write;
            WB_mem_to_reg <= MEM_mem_to_reg;
        end else begin
            WB_alu_result <= 0;
            WB_mem_data <= 0;
            WB_rd <= 0;
            WB_reg_write <= 0;
            WB_mem_to_reg <= 0;
        end
    end
endmodule
