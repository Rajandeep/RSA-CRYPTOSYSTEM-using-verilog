`timescale 1ns / 1ps
module control(
    input [WIDTH-1:0] p,q, //Input Random Primes
    input clk,//system wide clock
    input reset,//resets inverter module
    input reset1,//resets modular exponentiation module
    input encrypt_decrypt,//1 for encryption and 0 for decryption
    input [WIDTH-1:0] msg_in,//input either message or cipher
    output [WIDTH*2-1:0] msg_out,//output either decrypted message or cipher
    output mod_exp_finish//finish signal indicator of mod exp module
    );
    
    parameter WIDTH = 32;//defines size of input ports
    
    wire inverter_finish;
    wire [WIDTH*2-1:0] e,d;
    wire [WIDTH*2-1:0] exponent = encrypt_decrypt?e:d;
    wire [WIDTH*2-1:0] modulo = p*q;
    wire mod_exp_reset  = 1'b0;
    
    reg [WIDTH*2-1:0] exp_reg,msg_reg;
    reg [WIDTH*2-1:0] mod_reg;
    
    always @(posedge clk)begin
         exp_reg <= exponent;
         mod_reg <= modulo;
         msg_reg <= msg_in;
    end
    
    inverter i(p,q,clk,reset,inverter_finish,e,d);
    defparam i.WIDTH = WIDTH;
    mod_exp m(msg_reg,mod_reg,exp_reg,clk,reset1,mod_exp_finish,msg_out);
    defparam m.WIDTH = WIDTH;
    
endmodule
