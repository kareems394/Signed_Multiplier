`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 05:19:50 AM
// Design Name: 
// Module Name: rising_edge_detector
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


module rising_edge_detector(
input clk, 
input rst, 
input w, 
output reg z
);

reg [1:0] state, nextState;
parameter [1:0] A=2'b00, B=2'b01, C=2'b10; // States Encoding

always @ (w or state) begin

case (state)
A: if (w==0) nextState = A;
   else nextState = B;
B: if (w==0) nextState = A;
   else nextState = C;
C: if (w==0) nextState = A;
   else nextState = C;
default: nextState = A;
endcase
end
// State register with clock edge trigger
always @ (posedge clk or posedge rst) begin
    if (rst) begin
        state <= A;
        z <= 1'b0; // reset output to 0 on reset
    end
    else begin
        state <= nextState;
        if (w == 1 && state == A && nextState == B) begin
            z <= 1'b1; // set output to 1 on rising edge
        end
        else begin
            z <= 1'b0; // set output to 0 otherwise
        end
    end
end
endmodule