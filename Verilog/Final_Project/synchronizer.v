`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 05:15:51 AM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer( 
input clk,
input rst, 
input in,
output reg out
);
reg q1;

always@(posedge clk, posedge rst) begin
    if(rst == 1'b1) begin
        q1 <= 0;
        out <= 0;
    end
 
    else begin
        q1 <= in;
        out <= q1;
    end
    
end

endmodule