`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/01/2020 03:01:26 PM
// Design Name: 
// Module Name: ClockScalerDeserializer
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


module ClockScalerDeserializer(
input logic clock_i, reset_i,
output logic scaledclock);

reg [19:0] counter = 0;

    always @ (posedge clock_i)
    begin
        scaledclock <= 0;
        if (reset_i)
            begin
                scaledclock <= 0;
                counter <= 0;
            end

            if (counter >= 100)
                begin
                    counter <= 0;
                    scaledclock <= ~scaledclock;
                end
            else
                begin
                counter <= counter + 1;
                end
    end

endmodule
