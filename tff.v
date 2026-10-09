// Martin Wu
`timescale 1ns/1ps
module tff (input  wire clk, input  wire rst, input  wire T, output reg  Q);
    always @(posedge clk or posedge rst) begin
        if (rst)    Q <= 1'b0;
        else if (T) Q <= ~Q;
        else        Q <= Q;
    end
endmodule
