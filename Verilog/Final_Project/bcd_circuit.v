`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 04:27:13 AM
// Design Name: 
// Module Name: bcd_circuit
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


module bcd_circuit(
input clk,
input flg,
input[19:0] data,
input btnl,
input btnr,
output [11:0]Q
);

 reg [27:0] q;

   
    always @(posedge clk or posedge flg) begin
      if(flg)
         q<=28'b0;
     
      else begin
        if(q==28'b0)begin
            q[27:8]<=data;
            q[7:0]<=8'b0;
        end
       
        if(btnl) begin
            if(q[27:24]!=4'b0)
                q<=q;
            if(q[27:24]==4'b0)
                q<= q<<4;
       end
       
        if(btnr) begin
            if(q[3:0]!=4'b0)
                q<=q;
            if(q[3:0]==4'b0)
                q<= q>>4;
      end 
    end
  end
      
      assign Q=q[19:8];
   
endmodule
