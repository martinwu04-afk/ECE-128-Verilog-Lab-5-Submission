// Martin Wu
`timescale 1ns/1ps
module tb_tff_counter;
    reg clk, rst, T, en;
    wire Qt;
    wire [2:0] count;

    tff          u_tff (.clk(clk), .rst(rst), .T(T),  .Q(Qt));
    counter3_tff u_cnt (.clk(clk), .rst(rst), .en(en), .Q(count));

    initial clk = 0;
    always #10 clk = ~clk;   // rising edges at 10, 30, 50, ...

    initial begin
        rst=1; T=0; en=0;
        #15  rst=0;          // t=15
        #40  T=1;            // t=55   T-FF toggles every edge
        #80  T=0;            // t=135  T-FF holds
        #40  en=1;           // t=175  counter counts 0..7 and wraps to 0
        #200 en=0;           // t=375  counter holds
        #40  en=1;           // t=415  counter resumes
        #60  rst=1;          // t=475  reset: count goes to 0 immediately
        #10  rst=0;          // t=485
        #30  $finish;        // t=515
    end
endmodule