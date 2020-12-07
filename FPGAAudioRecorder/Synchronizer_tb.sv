`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2020 03:25:30 PM
// Design Name: 
// Module Name: Synchronizer_tb
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


module Synchronizer_tb();
reg clock;
reg reset;
logic d;
logic q;

Synchronizer DUT (
.clock(clock),
.reset(reset),
.d(d),
.q(q)
);
always begin
#5
clock = ~clock;
end

initial begin
clock = 0;
reset = 1;

#50

d = 1;
reset = 0;

#50
d = 0;
reset = 0;

#50
d = 1;
reset = 0;

#50
d = 0;
reset = 0;

#50
d = 1;
reset = 0;

#50
d = 0;
reset = 0;

#50
d = 1;
reset = 0;

#50
d = 0;
reset = 0;
end
endmodule