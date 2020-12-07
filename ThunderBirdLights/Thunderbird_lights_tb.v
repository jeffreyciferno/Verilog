`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 05:09:53 PM
// Design Name: 
// Module Name: Thunderbird_lights_tb
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


module Thunderbird_lights_tb();
reg clk = 1'b0;
reg reset;
reg left;
reg right;
wire la;
wire lb;
wire lc;
wire ra;
wire rb;
wire rc;

Thunderbird_lights DUT1(
.clk(clk),
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

parameter Time_Period = 1000000000;                
always 
    #(Time_Period/2) clk = ~clk;

initial
begin
reset = 1;
left = 0;
right = 0;

#5
reset = 0;

#15
left = 1;
#20
left = 0;

#20
right = 1;

#20
right = 0;

#20 $finish;
end

endmodule
