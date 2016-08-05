`timescale 1ns / 1ps
module mod_tb;
    parameter WIDTH = 64;
    reg [WIDTH-1:0] a,n;
    wire [WIDTH-1:0] r,q;
    mod m1(a,n,r,q);
    defparam m1.WIDTH = WIDTH;
    
    initial begin
        a = 12345;
        n = 23;
    end
        
endmodule
