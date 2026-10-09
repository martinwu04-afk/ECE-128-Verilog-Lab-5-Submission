// Martin Wu
`timescale 1ns/1ps

module d_ff (input wire clk, input wire rst, input wire D, output reg Qs, output reg Qa);  

    // Synchronous reset: only wakes up on the clock edge
    always @(posedge clk) begin
        if (rst) Qs <= 1'b0;
        else     Qs <= D;
    end

    // Asynchronous reset: also wakes up the moment rst goes high
    always @(posedge clk or posedge rst) begin
        if (rst) Qa <= 1'b0;
        else     Qa <= D;
    end
endmodule
