`timescale 1ns / 1ps

module IF_ID_Reg(
    input clk,
    input reset,
    input [15:0] IF_instruction,
    input [7:0] IF_PC_plus_1,
    output reg [15:0] ID_instruction,
    output reg [7:0] ID_PC_plus_1
    );
    
    always @(posedge clk) begin
        if (!reset) begin
            ID_instruction <= IF_instruction;
            ID_PC_plus_1 <= IF_PC_plus_1;
        end else begin
            ID_instruction <= 16'b0;
            ID_PC_plus_1 <= 0;
        end
        
    end
    
endmodule
