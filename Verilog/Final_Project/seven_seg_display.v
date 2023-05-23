`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 04:10:10 AM
// Design Name: 
// Module Name: seven_seg_display
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

module seven_seg_display(
input clk,
input flag,
input sf, 
input reset, 
input btnl, 
input btnr, 
input [19:0] d, 
output [0:6] seg, 
output [0:3] ana
);

wire clk_out;
clockDivider #(25000) clock (.clk(clk), .rst(reset),  .clk_out(clk_out));

wire[1:0] a;
counter_to_decoder #(2, 4) coun_decod (.clk(clk_out), .reset(reset),.en(1'b1), .count(a)); //check 2,4


wire clk_out2;
clockDivider clock2(.clk(clk),.rst(reset),.clk_out(clk_out2));
wire [11:0] Q;
bcd_circuit bcd (.clk(clk_out2),.flg(flag),.data(d) , .btnl(btnl),.btnr(btnr) ,.Q(Q));

reg [3:0]b;

wire[3:0] sign;
assign sign=(sf==1)? 4'b1010:4'b1011;


always @ (*) begin

case(a)
    2'b00:b=Q[3:0];
    2'b01:b=Q[7:4];
    2'b10:b=Q[11:8];
    2'b11:b=sign; //the SF flag
endcase

end

fourdigit_seven_seg four_seven (.en(1'b1),.num(b),.in_anode(a),.segments(seg),.anode_active(ana));

endmodule