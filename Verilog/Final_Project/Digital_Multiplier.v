`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 04:17:09 AM
// Design Name: 
// Module Name: Digital_Multiplier
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Digital_Multiplier(
input clk, 
input rst,
input btnl, 
input btnr,
input [7:0]A, 
input [7:0] B,
output [0:6] seg, 
output [0:3] anode, 
output led
);
    wire z_flag , clk_out, btnl_detected, btnr_detected,sf;
    wire [15:0] product;
    wire [19:0] bcd;
    clockDivider clock(.clk(clk),.rst(rst),.clk_out(clk_out));
    push_button left_button( .clk(clk),.rst(rst), .x(btnl),.z(btnl_detected));
    push_button right_button( .clk(clk),.rst(rst), .x(btnr),.z(btnr_detected));
    multiplier multiply( .A(A),.B(B), .clk(clk_out), .rst(rst), .temp(product), .z_flag(z_flag), .sf(sf));
    Double_Dabble DD(.prod(product[14:0]), .bcd(bcd) );
    seven_seg_display Display(.clk(clk), .flag(z_flag),.sf(sf), .reset(rst), .btnl(btnl_detected), .btnr(btnr_detected), .d(bcd), .seg(seg), .ana(anode));
    assign led = !z_flag;
endmodule
