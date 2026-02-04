`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 15:32:15
// Design Name: 
// Module Name: button_control
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


module button_control(clk, rst, button, valid_vote);
input clk,rst,button;
output reg valid_vote;

// we are using 100MHz clk so 1sec/10ns=100000000

reg [31:0] counter;

always@(posedge clk)
begin
if(rst)
    counter<=0;
else begin 
    if(button & counter<100000001)
    counter<=counter+1;
    else if(!button)
    counter<=0;
end
end 

always@(posedge clk)
begin 
    if(rst)
    valid_vote<=1'b0;
    else 
    begin
    if(counter==100000000)
        valid_vote<=1'b1;
    else 
    valid_vote<= 1'b0;
    end
end

endmodule
