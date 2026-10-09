// Martin Wu
`timescale 1ns/1ps

module sr_ff (input wire clk, input wire S, input wire R, output wire Q, output wire Qn);
    reg S_hold, R_hold;

    always @(posedge clk) begin
        S_hold <= S;
        R_hold <= R;
    end

    sr_latch u_latch (.S(S_hold), .R(R_hold), .EN(1'b1), .Q(Q), .Qn(Qn));
endmodule
