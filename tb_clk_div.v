// Martin Wu
`timescale 1ns/1ps
module tb_clk_div;
    reg clk_in, rst;
    wire clk_out;

    clk_div #(.F_IN(100_000_000), .F_OUT(25_000_000)) dut (.clk_in(clk_in), .rst(rst), .clk_out(clk_out));

    initial clk_in = 0;
    always #5 clk_in = ~clk_in;   // 100 MHz (10 ns period)

    initial begin
        rst=1;
        #22  rst=0;
        #200 $finish;
    end
endmodule