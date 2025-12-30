`timescale 1ns / 1ps

module Control_Unit(
    input wire [3:0] opcode,
    output reg [2:0] alu_op,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg mem_to_reg,
    output reg r2_to_rd,
    output reg alu_src,
    output reg jump,
    output reg branch_zero,
    output reg branch_neg,
    output reg halt
    );
    
    always @(*) begin
    alu_op = 3'b000;
    reg_write = 0;
    mem_read = 0;
    mem_write = 0;
    mem_to_reg = 0;
    r2_to_rd = 0;
    alu_src = 0;
    jump = 0;
    branch_zero = 0;
    branch_neg = 0;
    halt = 0;
    
    case (opcode)
        4'b0000: begin alu_op = 3'b000; reg_write = 1; end
        4'b0001: begin alu_op = 3'b001; reg_write = 1; end
        4'b0010: begin alu_op = 3'b010; reg_write = 1; end
        4'b0011: begin alu_op = 3'b011; reg_write = 1; end
        4'b0100: begin alu_op = 3'b100; reg_write = 1; end
        4'b0101: begin alu_op = 3'b101; reg_write = 1; end
        4'b0110: begin alu_op = 3'b110; reg_write = 1; end
        4'b0111: begin alu_op = 3'b111; reg_write = 1; end
        4'b1000: begin reg_write = 1; alu_src = 1; end
        4'b1001: begin reg_write = 1; mem_read = 1; mem_to_reg = 1; alu_src = 1; end
        4'b1010: begin mem_write = 1; alu_src = 1; r2_to_rd = 1; end
        4'b1011: begin reg_write = 1; end
        4'b1100: begin jump = 1; end
        4'b1101: begin branch_zero = 1; end
        4'b1110: begin branch_neg = 1; end
        4'b1111: begin halt = 1; end
        default: begin alu_op = 3'b000; reg_write = 0; end
    endcase
    end
endmodule
