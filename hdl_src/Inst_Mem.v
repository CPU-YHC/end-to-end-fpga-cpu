`timescale 1ns / 1ps

module Inst_Mem(
    input wire [7:0] addr,
    output reg [15:0] instruction
    );
    
always @(*) begin
case (addr)
    8'd0: instruction = 16'b1000_01_00_01000010;  // R1 = 0x42 (66 decimal)
    8'd1: instruction = 16'b0000_00_00_00000000;  // NOP
    8'd2: instruction = 16'b0000_00_00_00000000;  // NOP
    8'd3: instruction = 16'b0000_00_00_00000000;  // NOP
    8'd4: instruction = 16'b1000_10_00_11110101;  // R2 = display address
    8'd5: instruction = 16'b0000_00_00_00000000;  // NOP
    8'd6: instruction = 16'b0000_00_00_00000000;  // NOP
    8'd7: instruction = 16'b0000_00_00_00000000;  // NOP
    8'd8: instruction = 16'b1010_01_10_00000000;  // Display = 0x42
    8'd9: instruction = 16'b1111_00_00_00000000;  // HLT
    default: instruction = 16'b1111_00_00_00000000;  // HLT
endcase
end
endmodule
