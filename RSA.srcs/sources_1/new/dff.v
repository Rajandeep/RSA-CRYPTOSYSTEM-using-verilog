`timescale 1ns / 1ps
//Positive edge triggered D Flip Flop with asynch reset and a 2:1 mux
module dff(
    input D, //Input
    input rst, //Active High Reset
    input clk, //Clock 
    output reg q //Output
    );
    
    always @(posedge clk or posedge rst) begin
        if(rst) q<=0;
        else q<=D;
    end
    
endmodule
