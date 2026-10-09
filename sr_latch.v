// Martin Wu
`timescale 1ns/1ps

module sr_latch (input  wire S, input  wire R, input  wire EN, output wire Q, output wire Qn);
    wire s_g, r_g;
    and  #1 g1 (s_g, S, EN);
    and  #1 g2 (r_g, R, EN);
    nor  #1 g3 (Q,  r_g, Qn);
    nor  #1 g4 (Qn, s_g, Q);
endmodule
