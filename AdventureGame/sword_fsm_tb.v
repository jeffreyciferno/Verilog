`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2015 04:53:03 PM
// Design Name: 
// Module Name: sword_fsm_tb
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


module sword_fsm_tb();
reg clock = 1'b0;
reg reset;
reg SW;
wire V;

SwordFSM_wrapper DUT(
    .clock(clock),
    .reset(reset),
    .SW(SW),
    .V(V)
    );

always 
    #5 clock = ~clock;

initial
begin
    reset = 1;
    SW = 0;
    
    #10
    reset = 0;
    
    #30 
    SW = 1;
    
    #30 
    reset = 1;
    
    #100  $finish;

end

endmodule
