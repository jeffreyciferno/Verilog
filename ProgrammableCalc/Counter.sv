`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2020 05:52:35 PM
// Design Name: 
// Module Name: Counter
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

module Counter ( 
input logic clock, 
input logic reset, 
input logic CNT_EN,
output logic [3:0] address 
); 

initial begin
 address = 4'd0;  
end

always @(reset)
begin
address = 0;  
end

always @(posedge clock)
begin
    
    if((CNT_EN == 1))
    address = address + 1;
    else if(reset == 1)
    address = 4'd0;
    end

endmodule
