`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 15:46:45
// Design Name: 
// Module Name: vote_accumulator
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


module vote_accumulator(clk,rst,mode,cand1_valid_vote,cand2_valid_vote,cand3_valid_vote,cand4_valid_vote,
                        cand1_vote_rc,cand2_vote_rc,cand3_vote_rc,cand4_vote_rc);
input clk,rst,mode,cand1_valid_vote,cand2_valid_vote,cand3_valid_vote,cand4_valid_vote;
output reg  [7:0] cand1_vote_rc,cand2_vote_rc,cand3_vote_rc,cand4_vote_rc;

always@(posedge clk)
begin
if(rst)
begin
cand1_vote_rc<=0;
cand2_vote_rc<=0;
cand3_vote_rc<=0;
cand4_vote_rc<=0;
end

else 
begin
if (cand1_valid_vote & !mode )
    cand1_vote_rc<=cand1_vote_rc+1;
else if(cand2_valid_vote & !mode)
    cand2_vote_rc<=cand2_vote_rc+1;
else if(cand3_valid_vote & !mode)
    cand3_vote_rc<=cand3_vote_rc+1;
else if(cand4_valid_vote & !mode)
    cand4_vote_rc<=cand4_vote_rc+1;
end
end
endmodule
