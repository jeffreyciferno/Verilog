`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2020 02:08:49 PM
// Design Name: 
// Module Name: ALU
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


module ALU( input[7:0] A,B, input[3:0] Select, output [7:0] ALUout, output Cout);

reg [7:0] Result;
wire [8:0] copper;
assign ALUout = Result;
assign copper = {1'b0,A} + {1'b0,B};
assign Cout = copper[8];

always @(*)
begin
    case(Select)
    4'b0000: Result = A + B;
    4'b0001: Result = A - B;
    4'b0010: Result = A;
    4'b0011: Result = B;
    4'b0100: Result = &A;
    4'b0101: Result = |A;
    4'b0110: Result = !A;
    4'b0111: Result = ~A;
    4'b1000: Result = A&B;
    4'b1001: Result = A|B;
    4'b1010: Result = A^B;
    4'b1011: Result = A<<<B[2:0];
    4'b1100: Result = A>>>B[2:0];
    4'b1101: Result = A + 1;
    4'b1110: Result = A - 1;
    4'b1111: Result = 0 - A;
endcase
end
endmodule
