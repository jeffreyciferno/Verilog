`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 08:07:01 PM
// Design Name: 
// Module Name: toplab3
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

module toplab3(input clk,input reset,input left,input right,output la, lb, lc, ra, rb, rc);

wire new_clk;

Thunderbird_lights DUT1(
.clk(new_clk),
.reset(reset),
.left(left),
.right(right),
.la(la),
.lb(lb),
.lc(lc),
.ra(ra),
.rb(rb),
.rc(rc)
);

Clock_Scaler DUT2 (
.clk(clk),
.reset(reset),
.scaled_clk(new_clk)
);

endmodule