`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2020 01:47:05 PM
// Design Name: 
// Module Name: Timer
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


module Timer(
input logic clock, 
input logic reset, 
input logic DoneSig,
output logic Confirmed, 
output logic [17:0] Trigger
); 

initial begin
 Confirmed = 0;
 Trigger = 0;  
end

always @(reset)
begin
Confirmed = 0;
Trigger = 0;  
end

always @(posedge clock)
begin
    
    if((DoneSig == 1))
    Trigger = Trigger + 1;
    if(Trigger == 125000)
    Confirmed = 1;
    end

endmodule

