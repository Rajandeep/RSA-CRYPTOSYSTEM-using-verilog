`timescale 1ns / 1ps
`define WIDTH 32
module tb_inverter;
    reg [`WIDTH-1:0] p;
	reg [`WIDTH-1:0] q;
	reg clk;
	reg reset;
	wire finish;
	wire [`WIDTH-1:0] e;
	wire [`WIDTH*2-1:0] d;
	
	inverter uut(p,q,clk,reset,finish,e,d);
	
	initial begin
	   p = 32'd23;
	   q = 32'd5;
	   clk = 0;
	   reset = 0;
	   #10 reset = 1;
	   #10 reset = 0;
	end
	
	always #5 clk = ~clk;
endmodule
