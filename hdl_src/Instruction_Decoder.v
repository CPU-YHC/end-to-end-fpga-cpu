`timescale 1ns / 1ps

module Instruction_Decoder(
    input wire [15:0] instruction,
    output wire [3:0] opcode,
    output wire [1:0] rd,
    output wire [1:0] r1,
    output wire [1:0] r2,
    output wire [7:0] imm
    );
    
    assign opcode = instruction[15:12];
    assign rd = instruction[11:10];
    assign r1 = instruction[9:8];
    assign r2 = instruction[7:6];
    assign imm = instruction[7:0];
endmodule
