`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 05:20:40 AM
// Design Name: 
// Module Name: push_button
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


module push_button(
input clk,
input rst,
input x,
output z
);
    
    wire clk_out;
    wire [1:0] out;
    clockDivider #(2500000) clock (.clk(clk), .rst(rst),  .clk_out(clk_out));
    debouncer deb(.clk(clk_out),.rst(rst),.sin(x), .out(out[1]));
    synchronizer synch(  .clk(clk_out), .rst(rst), .in(out[1]), .out(out[0]));
    rising_edge_detector detect( .clk(clk_out), .rst(rst), .w(out[0]), .z(z));
endmodule
