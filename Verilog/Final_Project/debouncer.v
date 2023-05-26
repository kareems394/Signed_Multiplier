`timescale 1ns / 1ps
module debouncer(
input clk,
input rst,
input sin,
output out
);

reg q0,q1,q2;

    always @(posedge clk, posedge rst ) begin
   
        if (rst==1'b1) begin
            q0<=0;
            q1<=0;
            q2<=0;
        end
        else begin
           q0<=sin;
           q1<=q0;
           q2<=q1;
        end
    end
   
    wire val;
    
    assign val=q0&&q1&&q2;
    assign out=(rst)? 0: val;
 
endmodule