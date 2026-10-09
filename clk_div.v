// Martin Wu
`timescale 1ns/1ps

// Clock divider: 100 MHz in -> 25 MHz out (divide by 4)
module clk_div (input wire clk_in, input wire rst, output wire clk_out);
    reg [1:0] cnt;                      // 2-bit counter: 0,1,2,3,0,1,...

    always @(posedge clk_in or posedge rst) begin
        if (rst) cnt <= 0;
        else     cnt <= cnt + 1;
    end

    assign clk_out = cnt[1];            // top bit: 0,0,1,1,0,0,1,1 -> 25 MHz
endmodule