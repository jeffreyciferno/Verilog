`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2020 11:05:06 PM
// Design Name: 
// Module Name: Thurderbird_lights
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


module Thunderbird_lights(input clk,input reset, input left, right, output reg la, lb, lc, ra, rb, rc);

reg [6:0] current_state;
reg [6:0] next_state;

parameter s0 = 6'b000000;
parameter La = 6'b100000;
parameter Lb = 6'b010000;
parameter Lc = 6'b001000;
parameter Ra = 6'b000100;
parameter Rb = 6'b000010;
parameter Rc = 6'b000001;

always @ (posedge clk || reset)

begin 
    
    if (reset)
        current_state = s0;
    else
        current_state = next_state;

end
    
    
 ///start FSM LOGIC
 
    always @ (current_state)
    
                begin
 
                    case(current_state)
                    
                        s0: begin
                        if (left) next_state = La;
                        else if (right) next_state = Ra;
                        end
   
                        La: begin
                        next_state = Lb;
                        end
                        
                        Lb: begin
                        next_state = Lc;
                        end 
                        
                        Lc: begin
                        next_state = s0;
                        end 
                        
                        Ra: begin
                        next_state = Rb;
                        end
                        
                        Rb: begin
                        next_state = Rc;
                        end
                        
                        Rc: begin
                        next_state = s0;
                        end
                        
                        default: next_state = s0;
                        
                    endcase
                        
                end   
                                   
           always @ (*)
           
                begin
                
                    case(current_state)
                        
                        s0: {la,lb,lc,ra,rb,rc} = 6'b000000;

                        La: {la,lb,lc,ra,rb,rc} = 6'b100000;
                        
                        Lb: {la,lb,lc,ra,rb,rc} = 6'b110000;
                        
                        Lc: {la,lb,lc,ra,rb,rc} = 6'b111000;
                        
                        Ra: {la,lb,lc,ra,rb,rc} = 6'b000100;
                        
                        Rb: {la,lb,lc,ra,rb,rc} = 6'b000110;
                        
                        Rc: {la,lb,lc,ra,rb,rc} = 6'b000111;
                        
                        default: {la,lb,lc,ra,rb,rc} = 6'b000000;
                     
                     endcase
                end
endmodule
