`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2020 04:27:05 PM
// Design Name: 
// Module Name: Timer_tb
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


module Timer_tb();
reg clock;
reg reset;
logic [17:0] Trigger;
logic DoneSig;
logic Confirmed;

 Timer DUT (
.clock(clock), 
.reset(reset), 
.DoneSig(DoneSig),
.Confirmed(Confirmed), 
.Trigger(Trigger)
);
always begin
#5
clock = ~clock;
end

initial begin
clock = 0;
reset = 1;

#50

DoneSig = 1;
reset = 0;

#500

reset = 0;

#50

reset = 0;

end
endmodule
