`timescale 1ns/1ps
module divider(Z, R, done, X, Y, start, clk);
    output [7:0] Z;
    output [15:0] R;
    output done;
    input [15:0] X;
    input [7:0] Y;
    input start;
    input clk;
    reg [7:0] Q;
    reg [15:0] R;
    reg [15:0] y;
    reg [15:0] x;
    reg [5:0] cnt;
    reg done;
    reg last;
    initial $monitor("x = %d R = %d",x,R);

    always @(posedge clk) begin
        done <= 0;
        last <= 0;
        if (start)
            cnt <= 0;
        else
            cnt <= cnt + 1;
        if (cnt == 6'd14)
            last <= 1;
        else if (cnt == 6'd15)
            done <= 1;
    end
    
    always @(posedge clk)
        if (start) begin
            x = X;
            R = 0;           
        end
        else if (~last && (R < Y)) begin
            R = {R[14:0],x[15]};
            x[15:1] = x[14:0];
            R = R + Y;
            x[0] = 1'b0;
        end
        else if (~last && (R > Y)) begin
            R = {R[14:0],x[15]};
            x[15:1] = x[14:0]; 
            R = R - Y;
            x[0] = 1'b1;
        end
            
    assign Z = x;
endmodule