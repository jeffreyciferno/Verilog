`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/02/2020 12:29:03 PM
// Design Name: 
// Module Name: Clock_Scaler
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


module Clock_Scaler(input clk, input reset, output reg scaled_clk);

reg [25:0] count;

always@(posedge reset || clk)
begin
    if (reset)
        begin
            scaled_clk = 0;
            count = 0;
        end
    else
        begin
            count = count + 1;
            if ( count == 50000000)
                begin
                    count = 0;
                    scaled_clk = ~scaled_clk;
                end
        end
end
endmodule
