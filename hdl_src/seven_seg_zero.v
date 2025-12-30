module alu(
    input wire [7:0] a,
    input wire [7:0] b,
    input wire [2:0] op,
    output reg [7:0] result,
    output wire zero,
    output wire carry,
    output wire negative
);
    
    reg [8:0] temp;
    
    always @(*) begin
        case (op)
        3'd0: temp = a + b;
        3'd1: temp = a - b;
        3'd2: temp = a & b;
        3'd3: temp = a | b;
        3'd4: temp = a ^ b;
        3'd5: temp = ~a;
        3'd6: temp = a << 1;
        3'd7: temp = a >> 1;
        endcase
        result = temp[7:0];
    end
    assign zero = (result == 8'b0) ? 1'b1 : 1'b0;
    assign carry = temp[8];
    assign negative = result[7];


endmodule