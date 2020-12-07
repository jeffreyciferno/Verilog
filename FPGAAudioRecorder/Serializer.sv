`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2020 02:39:29 PM
// Design Name: 
// Module Name: Serializer
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


module Serializer(
input        clock_i,  // 100 Mhz system clock 
input        enable_i,  //Enable the bitstream output to the audio filter input 
 //output signals 
output      logic done_o,  //Enable to load the next 16-bit audio data 
input logic [15:0] data_i,  //16-bit audio data input from memories 
 //PDM 
output logic pdm_audio_o,  // bitstream output to the audio filter input (pin A11) 
output logic pdm_sdaudio_o  // Audio enable (pin D12), tie high 
    );
    
    logic [4:0] count = 0;
        
        always@(posedge clock_i) begin
  
        done_o = 0;
        pdm_sdaudio_o = 1; 
            if(enable_i == 1)
            
            begin 
     
            if (count <= 15) 
                begin
                    pdm_audio_o = data_i[15-count];
                    count = count + 1;
                end 
                
                else 
                
                begin
                    done_o = 1;
                    count = 0;
                    pdm_audio_o = 0;
                end
                end
     
       end     

endmodule
