`timescale 1ns / 1ps
`define WIDTH 256
module tb_main;
    reg [`WIDTH-1:0] p,q;
    reg clk,reset,reset1,encrypt_decrypt;
    reg [`WIDTH-1:0] msg_in;
    wire [`WIDTH-1:0] msg_out;
    wire mod_exp_finish;
    
    control uut(p,q,clk,reset,reset1,encrypt_decrypt,msg_in,msg_out,mod_exp_finish);
    defparam uut.WIDTH = `WIDTH;
    
    initial begin
        p = 128'd113680897410347;
        q = 128'd7999808077935876437321;
        clk = 0;
        reset =0; reset1=0;
        encrypt_decrypt = 0;
        msg_in = 256'h00000000000000000000000000000000005de5d98773da289d6625bc1ebcbf74;
        #10 reset = 1;
        #10 reset = 0;
        #2980 $finish;
    end
    
    initial begin 
        #1000 reset1 = 1;
        #10 reset1 = 0;
    end
    
    always #5 clk = ~clk;
    
endmodule
