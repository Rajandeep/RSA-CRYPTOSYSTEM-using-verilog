`timescale 1ns / 1ps
//2:1 mux 
module mux(
    output reg out, //Output
    input sel, //Input 1
    input a, //Input 2
    input b //Select Line
    );
    
    wire not_sel;
    always @(sel or not_sel)
        out = (sel&a)|(not_sel&b);
    
    assign not_sel = ~sel;
    
endmodule
