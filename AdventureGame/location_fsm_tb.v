`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2015 03:28:52 PM
// Design Name: 
// Module Name: location_fsm
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


module location_fsm_tv();
reg clock = 1'b0;
reg reset;
reg V;
reg N;
reg S;
reg E;
reg W;
wire SW;
wire D;
wire WIN;

wire [6:0] Q;

LocationFSM_wrapper DUT(
    .D(D),
    .E(E),
    .N(N),
    .S(S),
    .SW(SW),
    .V(V),
    .W(W),
    .WIN(WIN),
    .clock(clock),
    .q0(Q[0]),
    .q1(Q[1]),
    .q2(Q[2]),
    .q3(Q[3]),
    .q4(Q[4]),
    .q5(Q[5]),
    .q6(Q[6]),
    .reset(reset));
                
               
always 
    #5 clock = ~clock;

initial
begin
reset = 1;
V = 0;
N = 0;
S = 0;
E = 0;
W = 0;

#53
reset = 0;

#15
N = 1;

#10
N = 0;

#20
S = 1;

#10
S = 0;

#20
W = 1;
#10
W = 0;

#20
E = 1;
#10
E = 0;

#20
W = 1;
#10
W = 0;

#20
E = 1;
#10
E = 0;

#20
S = 1;
#10
S = 0;

#20
S = 1;
#10
S = 0;

#20
W = 1;
#10
W = 0;

#20
E = 1;
#10
E = 0;

#20
N = 1;
#10
N = 0;

#20
S = 1;
#10
S = 0;

#20
E = 1;
#10
E = 0;

#100

//With V = 1
#5
reset = 1;
V = 1;

#15
reset = 0;

#15
N = 1;

#10
N = 0;

#20
S = 1;

#10
S = 0;

#20
W = 1;
#10
W = 0;

#20
E = 1;
#10
E = 0;

#20
W = 1;
#10
W = 0;

#20
E = 1;
#10
E = 0;

#20
S = 1;
#10
S = 0;

#20
S = 1;
#10
S = 0;

#20
W = 1;
#10
W = 0;

#25
E = 1;
#10
E = 0;

#20
N = 1;
#10
N = 0;

#20
S = 1;
#10
S = 0;

#20
E = 1;
#10
E = 0;

#100  $finish;
end  

endmodule
