`timescale 1ns/1ps
module tb_d_ff;
    reg clk, rst, D;
    wire Qs, Qa;

    d_ff u_dff (.clk(clk), .rst(rst), .D(D), .Qs(Qs), .Qa(Qa));

    initial clk = 0;
    always #10 clk = ~clk;   // rising edges at 10, 30, 50, ...

    initial begin
        rst=1; D=0;
        #12 rst=0;           // t=12
        #3  D=1;             // t=15  captured at edge 30
        #20 D=0;             // t=35
        #10 D=1;             // t=45  captured at edge 50
        #10 rst=1;           // t=55  reset mid-cycle: Qa clears now, Qs at edge 70
        #20 rst=0;           // t=75
        #20 rst=1;           // t=95  short reset pulse...
        #3  rst=0;           // t=98  ...Qa clears, Qs never sees it
        #34 $finish;         // t=132
    end
endmodule