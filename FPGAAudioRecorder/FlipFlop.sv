`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 02:41:02 PM
// Design Name: 
// Module Name: FlipFlop
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


module FlipFlop(
 input  logic data  , // Data Input
 input   clk   , // Clock Input
 input   reset , // Reset input 
 output logic q       // Q output
 );
 
 always@ ( posedge clk or negedge reset)
 begin
    if (clk == 0 && data == 0)
            q = q;
    if (clk == 0 && data == 1)
            q = q;
    if (clk == 1 && data == 0)
            q = 0;
    if (clk == 1 && data == 1)
            q = 1;
end
endmodule
