// Martin Wu
`timescale 1ns/1ps
module counter3_tff (input wire clk, input wire rst, input wire en, output wire [2:0] Q);
    wire t0 = en;
    wire t1 = en & Q[0];
    wire t2 = en & Q[0] & Q[1];

    tff ff0 (.clk(clk), .rst(rst), .T(t0), .Q(Q[0]));
    tff ff1 (.clk(clk), .rst(rst), .T(t1), .Q(Q[1]));
    tff ff2 (.clk(clk), .rst(rst), .T(t2), .Q(Q[2]));
endmodule
