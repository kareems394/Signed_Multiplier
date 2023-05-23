`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 04:11:12 AM
// Design Name: 
// Module Name: clockDivider
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


module clockDivider #(parameter n = 3125000)
(input clk, 
input rst,
output reg clk_out
);

reg [21:0] count;

always @ (posedge clk, posedge rst) begin
    if (rst == 1'b1)
        count <= 22'b0;
    else if (count == n-1)
        count <= 22'b0;
    else
        count <= count + 1;
    end

always @ (posedge clk, posedge rst) begin
    if (rst)
        clk_out <= 0;
    else if (count == n-1)
        clk_out <= ~ clk_out;
    end
    
endmodule