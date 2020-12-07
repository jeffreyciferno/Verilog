`timescale 1ns / 1ps

module Deserializer(
input  logic        clock_i,
input  logic        reset_i,
input  logic        enable_i,
output logic        done_o,
output logic [15:0] data_o,

input  logic pdm_data_i,
output logic pdm_clk_o,
output logic pdm_lrsel_o,
output logic [8:0] counter1);


    logic [15:0] data;
    logic [4:0] count = 4'b0000;
    logic shift;
    logic [8:0] counter = 8'b00000000;
    assign counter1 = counter;
    assign pdm_clk_o = shift;
    assign pdm_lrsel_o = 0;
      
    always@(posedge clock_i) 
    begin
        if (reset_i) 
        begin
            count = 0;
            shift = 0;
            done_o = 0;
            data_o = 0;
        end
  /*      
  ////clock scaler      
            if (reset_i == 1)
        begin
            pdm_clk_o = 0;
            counter = 0;
        end
    else
        begin
           counter = counter + 1;
            if ( counter == 100)
                begin
                   
                    pdm_clk_o = ~pdm_clk_o;
                     counter = 0;
                end
        end */
//clockscaler
        
        
        if (enable_i) 
        begin
            if (shift == 0) 
            begin
                done_o = 0;
                shift = 1;
            end 
             
            begin
                
                if (count < 16) 
                begin
                    data[15-count] = pdm_data_i;
                    data_o[count] = data[15-count];
                    count = count + 1;
                    done_o = 0;
                    
                end 
                else if(count == 16) 
                begin 
                    done_o = 1;
                    count = 0;
                    data_o = 16'b0;
                    
                end
                else
                begin
                    done_o = 0;
                end
                shift = 0;
            end
        end
    end
    
endmodule

   