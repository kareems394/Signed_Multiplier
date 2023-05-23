`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 04:26:32 AM
// Design Name: 
// Module Name: counter_to_decoder
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


module counter_to_decoder #(parameter x=3, n = 10) (input clk, reset,en, output reg [x-1:0]count);
/*parameter x = 3;
parameter n=10;*/


always @(posedge clk, posedge reset) begin
    if (reset == 1)
        count <= 0; // non-blocking assignment
 // initialize flip flop here
    else if(en) begin
        if(count == n-1)
            count <= 0;
        else
            count <= count + 1; // non-blocking assignment
 // normal operation
    end
end
endmodule