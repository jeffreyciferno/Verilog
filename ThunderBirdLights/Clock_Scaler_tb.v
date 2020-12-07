`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 04:23:44 PM
// Design Name: 
// Module Name: Clock_Scaler_tb
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


module Clock_Scaler_tb();
reg clock = 1'b0;
reg reset;
wire scaled_clk;
    
Clock_Scaler DUT2 (
.clk(clock),
.reset(reset),
.scaled_clk(scaled_clk)
);

parameter Time_Period = 10;
always @(*)
    #(Time_Period) clock = ~clock;
    
initial
begin

#20
reset = 1;

#20
reset = 0;

#100000000 $finish;
end 

endmodule
