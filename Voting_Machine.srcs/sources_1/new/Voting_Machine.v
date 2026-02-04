`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 16:00:25
// Design Name: 
// Module Name: Voting_Machine
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


module Voting_Machine(button1,button2,button3,button4,clk,rst,mode_v,led);
input clk,rst,button1,button2,button3,button4,mode_v;
output [7:0] led;

wire valid_vote1,valid_vote2,valid_vote3,valid_vote4;

wire valid_vote_m;
assign valid_vote_m = valid_vote1|valid_vote2|valid_vote3|valid_vote4;

wire [7:0] cand1_vote_rc;
wire [7:0] cand2_vote_rc;
wire [7:0] cand3_vote_rc;
wire [7:0] cand4_vote_rc;

button_control B1(.clk(clk), .rst(rst), .button(button1), .valid_vote(valid_vote1));
button_control B2(.clk(clk), .rst(rst), .button(button2), .valid_vote(valid_vote2));
button_control B3(.clk(clk), .rst(rst), .button(button3), .valid_vote(valid_vote3));
button_control B4(.clk(clk), .rst(rst), .button(button4), .valid_vote(valid_vote4));

vote_accumulator VA(.clk(clk),.rst(rst),.mode(mode_v),.cand1_valid_vote(valid_vote1),.cand2_valid_vote(valid_vote2),
                     .cand3_valid_vote(valid_vote3),.cand4_valid_vote(valid_vote4),
                        .cand1_vote_rc(cand1_vote_rc),.cand2_vote_rc(cand2_vote_rc),
            .cand3_vote_rc(cand3_vote_rc),.cand4_vote_rc(cand4_vote_rc));
                        
mode M (.clk(clk),.rst(rst),.button1(button1),.button2(button2),.button3(button3),.button4(button4),.mode(mode_v),
            .valid_vote_m(valid_vote_m),.cand1_vote_rc(cand1_vote_rc),.cand2_vote_rc(cand2_vote_rc),
            .cand3_vote_rc(cand3_vote_rc),.cand4_vote_rc(cand4_vote_rc),.out(led));                        


endmodule
