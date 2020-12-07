`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/18/2015 03:38:38 PM
// Design Name: 
// Module Name: Output_Sim
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


module Output_Sim();
reg D0;
reg D1;
reg D2;
reg D3;
wire S;

segment_g_0_wrapper DUT(        //Replace "segment_a" with the module name of your design under test.  
            .D0(D0),
            .D1(D1),
            .D2(D2),
            .D3(D3),
            .S(S)
            );
initial 
begin

D3 = 1'b0;
D2 = 1'b0;
D1 = 1'b0;
D0 = 1'b0;

#100
D3 = 1'b0;
D2 = 1'b0;
D1 = 1'b0;
D0 = 1'b1;

#100
D3 = 1'b0;
D2 = 1'b0;
D1 = 1'b1;
D0 = 1'b0;

#100
D3 = 1'b0;
D2 = 1'b0;
D1 = 1'b1;
D0 = 1'b1;

#100
D3 = 1'b0;
D2 = 1'b1;
D1 = 1'b0;
D0 = 1'b0;

#100
D3 = 1'b0;
D2 = 1'b1;
D1 = 1'b0;
D0 = 1'b1;

#100
D3 = 1'b0;
D2 = 1'b1;
D1 = 1'b1;
D0 = 1'b0;

#100
D3 = 1'b0;
D2 = 1'b1;
D1 = 1'b1;
D0 = 1'b1;

#100
D3 = 1'b1;
D2 = 1'b0;
D1 = 1'b0;
D0 = 1'b0;

#100
D3 = 1'b1;
D2 = 1'b0;
D1 = 1'b0;
D0 = 1'b1;

#100
D3 = 1'b1;
D2 = 1'b0;
D1 = 1'b1;
D0 = 1'b0;

#100
D3 = 1'b1;
D2 = 1'b0;
D1 = 1'b1;
D0 = 1'b1;

#100
D3 = 1'b1;
D2 = 1'b1;
D1 = 1'b0;
D0 = 1'b0;

#100
D3 = 1'b1;
D2 = 1'b1;
D1 = 1'b0;
D0 = 1'b1;

#100
D3 = 1'b1;
D2 = 1'b1;
D1 = 1'b1;
D0 = 1'b0;

#100
D3 = 1'b1;
D2 = 1'b1;
D1 = 1'b1;
D0 = 1'b1;

#100
$finish;
end

endmodule
