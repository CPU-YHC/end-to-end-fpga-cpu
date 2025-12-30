`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

module top(
    input clk,
    input reset_n,
    input [15:0] switches,
    input [4:0] buttons,
    output [15:0] leds,
    output [6:0] seg,
    output [7:0] an,
    output dp
    );
    
    wire reset;
    wire slow_clk;
    wire [7:0] seg_data;
    assign reset = ~reset_n;
    
    wire [7:0] debug_pc;
    
    assign leds[7:0] = debug_pc[7:0];
    
//    clock_divider clk_div(
//        .clk_in(clk),
//        .reset(reset),
//        .clk_out(slow_clk)
//    );

    
    CPU_Pipelined CPU(
        .clk(clk),
        .reset(reset),
        .switches(switches),
        .buttons(buttons),
        .leds(),
        .seg_data(seg_data),
        .halt_out(),
        .pc_out()
    );
    
    hex_display CPU_Display(
        .clk(clk),
        .hex(seg_data),
        .seg(seg),
        .an(an),
        .dp(dp)
    );
endmodule
