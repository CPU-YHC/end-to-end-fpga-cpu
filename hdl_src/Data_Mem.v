`timescale 1ns / 1ps

module Data_Memory(
    input clk,
    input wire [7:0] addr,
    input wire [7:0] data,
    input wire WE,
    output reg [7:0] read_data,
    input wire [15:0] switches,
    input wire [4:0] buttons,
    output wire [15:0] leds,
    output wire [7:0] seg_data
    );
    
    reg [7:0] registers [0:255];
    reg [7:0] led_reg1;
    reg [7:0] led_reg2;
    reg [7:0] seg_data_reg;
    
    always @(posedge clk) begin
        if (WE) begin
            case (addr)
                8'hF3: led_reg1[7:0] <= data;
                8'hF4: led_reg2[7:0] <= data;
                8'hF5: seg_data_reg[7:0] <= data;
                default: registers[addr] <= data;
            endcase
        end
    end
    
    always @(*) begin
    case (addr)
        8'hF0: read_data = switches[7:0];
        8'hF1: read_data = switches[15:8];
        8'hF2: read_data = buttons[4:0];
        default: read_data = registers[addr];
    endcase
    end

    assign leds = {led_reg2, led_reg1};
    assign seg_data = seg_data_reg;
    
endmodule
