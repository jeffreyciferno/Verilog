`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2020 02:20:51 PM
// Design Name: 
// Module Name: Synchronizer
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


module Synchronizer(
input   d,
input    clock,
input   reset,
output   q
    );
    wire connect;
    
    FlipFlop U1(.data(d), .clk(clock), .reset(reset), .q(connect));
    FlipFlop U2(.data(connect), .clk(clock), .reset(reset), .q(q));
endmodule
