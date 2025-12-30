`timescale 1ns / 1ps

module Program_Counter(
    input wire clk,
    input wire reset,
    input wire load_en,
    input wire halt,
    input wire [7:0] load_val,
    output wire [7:0] pc_out
    );
    
    reg [7:0] counter;
    
    always @(posedge clk) begin
        if (reset) begin
            counter <= 0;
        end else if (halt) begin
            counter <= counter;
        end else if (load_en) begin
            counter <= load_val;
        end else begin
            counter <= counter + 1;
        end
    end
    
    assign pc_out = counter;
    
endmodule
