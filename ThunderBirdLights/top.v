`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 01:20:11 PM
// Design Name: 
// Module Name: top
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


module top(input clk,input reset,input left,input right,output la, lb, lc, ra, rb, rc);

wire connection;

Thunderbird_lights DUT1(
.clk(connection),
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
.scaled_clk(connection)
);

endmodule

