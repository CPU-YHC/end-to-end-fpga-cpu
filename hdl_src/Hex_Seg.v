`timescale 1ns / 1ps
module hex_display(
    input  wire clk,
    input  wire [7:0] hex,
    output reg  [6:0] seg,
    output reg [7:0] an,
    output wire dp
);
    assign dp = 1'b1;
    
    reg [16:0] refresh_counter;
    wire digit_select;
    wire [3:0] current_nibble;
    
    always @(posedge clk) begin
        refresh_counter <= refresh_counter + 1;
    end
    
    assign digit_select = refresh_counter[16];
    
    assign current_nibble = digit_select ? hex[7:4] : hex[3:0];
    
    always @(*) begin
        if (digit_select)
            an = 8'b11111101;
        else
            an = 8'b11111110;
    end
    
    always @(*) begin
            case (current_nibble)
                4'd0:  seg = 7'b1000000;
                4'd1:  seg = 7'b1111001; 
                4'd2:  seg = 7'b0100100;
                4'd3:  seg = 7'b0110000;
                4'd4:  seg = 7'b0011001;
                4'd5:  seg = 7'b0010010;
                4'd6:  seg = 7'b0000010;
                4'd7:  seg = 7'b1111000;
                4'd8:  seg = 7'b0000000;
                4'd9:  seg = 7'b0010000;
                4'd10:  seg = 7'b0001000;
                4'd11:  seg = 7'b0000011;
                4'd12:  seg = 7'b1000110;
                4'd13:  seg = 7'b0100001;
                4'd14:  seg = 7'b0000110;
                4'd15:  seg = 7'b0001110;
                default: seg = 7'b1111111;
            endcase
    end
endmodule
