`timescale 1ns/1ps
module tb_sr_ff;
    reg S, R, clk;
    wire Q, Qn;

    sr_ff u_ff (.clk(clk), .S(S), .R(R), .Q(Q), .Qn(Qn));

    initial clk = 0;
    always #10 clk = ~clk;  

    initial begin
        $dumpfile("sr_ff.vcd"); $dumpvars(0, tb_sr_ff);
        S=0; R=1;            // reset at first edge (10 ns)
        #15 R=0;             // t=15  hold
        #20 S=1;             // t=35  set: Q waits for edge at 50
        #20 S=0;             // t=55  hold
        #20 R=1;             // t=75  reset: Q waits for edge at 90
        #20 R=0;             // t=95  hold
        #5  S=1;             // t=100 short S pulse between edges...
        #3  S=0;             // t=103 ...ignored (no edge during it)
        #12 S=1; R=1;        // t=115 forbidden input, captured at 130
        #20 R=0;             // t=135 back to set, captured at 150
        #20 S=0;             // t=155 hold
        #25 $finish;
    end
endmodule