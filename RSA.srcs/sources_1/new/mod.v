`timescale 1ns / 1ps

module mod(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] n,
    output [WIDTH-1:0] R,
    output [WIDTH-1:0] Q
    );
   parameter WIDTH = 19;
   reg [WIDTH-1:0] A,N;
   reg [WIDTH:0] p;   
   integer i;
  
   always@ (a or n) begin
       A = a;
       N = n;
       p = 0;
       for(i=0;i < WIDTH;i=i+1) begin 
           p = {p[WIDTH-2:0],A[WIDTH-1]};
           A[WIDTH-1:1] = A[WIDTH-2:0];
           p = p-N;
           if(p[WIDTH-1] == 1)begin
                A[0] = 1'b0;
                p = p + N;   
           end
           else
                A[0] =1'b1;
      end
         
   end    
   
   assign R = p,Q = A;
endmodule
