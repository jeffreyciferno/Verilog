`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2020 08:06:52 PM
// Design Name: 
// Module Name: Serializer_tb
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


/*reg clock;
logic enable;
reg [15:0] Inputd;
logic DoneSig;
logic Outputd; 
logic audio;

 Serializer DUT(
.clock_i(clock),  
.enable_i(enable),
.done_o(DoneSig), 
.data_i(Inputd),
.pdm_audio_o(Outputd),
.pdm_sdaudio_o(audio)
);
always begin
#5
clock = ~clock;
end

initial begin
clock = 0;

#50

Inputd = 16'b0001110001110001;

#50
enable = 1;

#50
enable = 0;


end

*/

module Serializer_tb();

logic clock, enable;
logic done, pdm_sd_audio;
logic out;
logic [15:0] data;


Serializer DUT(
.clock_i(clock),
.enable_i(enable),
.done_o(done),
.data_i(data),
.pdm_audio_o(out),
.pdm_sdaudio_o(pdm_sd_audio)

);


always begin 
    #5 clock = ~clock;
end

initial begin
    clock = 0;
    enable = 1;

    data = 16'b0000_1111_0000_1111;

    #1
    enable = 0;

    #10
    enable = 1;

    #160
    data = 16'b0000_1111_0000_1111;
    enable = 0;

    #10
    enable = 1;

    #200
    $finish;
end
endmodule
