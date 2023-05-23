
`timescale 1ns/1ns

module multiplier(
input [7:0] A,
input [7:0] B,
input clk, 
input rst, 
output reg [15:0] temp, 
output reg z_flag,
output reg sf
);
    
    reg [7:0] outregR;
    reg [15:0] outregL;
    wire [7:0] A_comp;
    wire [7:0] outmuxL;
    two_comp tc(.A(A),.B(A_comp));
    assign outmuxL = (A[7])? A_comp :A;
    
    wire [7:0] out_twos;
    two_comp twos(.A(B),.B(out_twos));
    wire [7:0] out_muxR;
    assign out_muxR=(B[7])? out_twos:B;
    
    always @ (posedge clk or posedge rst) begin 
        if(rst)begin
            outregL <= {8'b0,outmuxL};
            outregR <= {out_muxR};   
            temp <= 16'b0;
            sf <= 1'b0;
        end
        else begin 
            if(outregR != 8'b0)begin
                sf <= (A[7] ^ B[7]);
                z_flag <=1'b1;
                outregL <= outregL <<1;
                outregR <= outregR >>1;
            if(outregR[0] ==1'b1)
                temp <= outregL + temp;
            else
                temp <= temp;
            end
            else begin
                z_flag<= 1'b0;
            end
        end
    end

endmodule