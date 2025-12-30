`timescale 1ns / 1ps

module Register_File(
    input clk,
    input wire [1:0] r1,
    input wire [1:0] r2,
    input wire [1:0] w,
    input wire [7:0] data,
    input wire WE,
    output wire [7:0] r1_out,
    output wire [7:0] r2_out
    );
    
    reg [7:0] registers [0:3];
    
    always @(posedge clk) begin
        if (WE && w != 0) begin
            registers[w] <= data;
        end
    end
    
    assign r1_out = (r1 == 0) ? 0 : registers[r1];
    assign r2_out = (r2 == 0) ? 0 : registers[r2];
    
endmodule
