`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 04:08:59 AM
// Design Name: 
// Module Name: Double_Dabble
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

module Double_Dabble(
   input [14:0] prod,
   output reg [19:0] bcd
   );
   
integer i;

always @(*) begin
    bcd=0;
    for (i=0;i<15;i=i+1) begin //Iterate once for each bit in input number
     if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3; //If any BCD digit is >= 5, add three
     if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
     if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
     if (bcd[15:12] >= 5) bcd[15:12] = bcd[15:12] + 3;
     if (bcd[19:16] >= 5) bcd[19:16] = bcd[19:16] + 3;
     bcd = {bcd[18:0],prod[14-i]}; //Shift one bit, and shift in proper bit from input
    end
end

endmodule
