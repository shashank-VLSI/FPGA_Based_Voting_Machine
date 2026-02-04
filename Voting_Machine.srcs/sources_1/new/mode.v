`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.02.2026 16:14:50
// Design Name: 
// Module Name: mode
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


module mode(clk,rst,button1,button2,button3,button4,mode,
            valid_vote_m,cand1_vote_rc,cand2_vote_rc,
            cand3_vote_rc,cand4_vote_rc,out);
input clk,rst,mode,valid_vote_m,button1,button2,button3,button4;
input [7:0] cand1_vote_rc,cand2_vote_rc,cand3_vote_rc,cand4_vote_rc;
output reg [7:0] out;

reg [31:0] counter;

 always@(posedge clk)
 begin 
 if(rst)
 counter<=0;
 
 else 
 begin 
 if(valid_vote_m)
    counter<=counter+1;    // valid vote gets high for only one cycle
else if(counter!=0 & counter<100000000)
    counter<=counter+1;   // incremented after counter becomes 1
else 
 counter<=0;
 end
 end  

always@(posedge clk)
begin

if(rst)
out<=0;

if(!mode & counter>0)     // mode 0 is voting mode 1 in for result  
 out<=8'hff;

else if (!mode) out<=0;

else if(mode)
begin 
if(button1)
out<=cand1_vote_rc;
else if(button2)
out<=cand2_vote_rc;
else if(button3)
out<=cand3_vote_rc;
else if(button4)
out<=cand4_vote_rc;
end 

end
endmodule
