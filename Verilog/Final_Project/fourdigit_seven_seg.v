`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 04:28:28 AM
// Design Name: 
// Module Name: fourdigit_seven_seg
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


module fourdigit_seven_seg(
input en,
input [3:0] num,
input [0:1] in_anode,
output reg [0:6] segments,
output reg [0:3] anode_active);

always @ (*) begin

    if (en==0) begin
        anode_active[0]=1;
        anode_active[1]=1;
        anode_active[2]=1;
        anode_active[3]=1;
        segments = 7'b1111111;
    end

    else begin
   
        case(in_anode)
            2'b00: anode_active=4'b1110;
            2'b01: anode_active=4'b1101;
            2'b10: anode_active=4'b1011;
            2'b11: anode_active=4'b0111;
        endcase

        case(num)

            0: segments = 7'b0000001;
            1: segments = 7'b1001111;
            2: segments = 7'b0010010;
            3: segments = 7'b0000110;
            4: segments = 7'b1001100;
            5: segments = 7'b0100100;
            6: segments = 7'b0100000;
            7: segments = 7'b0001111;
            8: segments = 7'b0000000;
            9: segments = 7'b0001100;
            10: segments = 7'b1111110; //positive
            11: segments = 7'b1111111; //negative
            12: segments = 7'b0110001;
            13: segments = 7'b1000010;
            14: segments = 7'b0110000;
            15: segments = 7'b0111000;
            default: segments = 7'b1111111;

        endcase
    end
end

endmodule

