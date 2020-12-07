`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2020 02:37:56 PM
// Design Name: 
// Module Name: Controller
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


module Controller(
input logic clock,
    input logic reset, 
    input logic [21:0] Inst_Mem_Data,
    output logic [7:0] A,
    output logic [7:0] B,
    output logic [3:0] Mode,
    output logic Inst_Mem_CNT_EN,
    output logic Trans_Mem1_CNT_EN,
    output logic Trans_Mem1_WEN,
    output logic Trans_Mem2_CNT_EN,
    output logic Trans_Mem2_WEN,
    //debug ports
    output logic [21:0] current_instr,
    output logic [2:0] controller_state
    );
        reg [21:0] instruct;
        reg [3:0] current_State;
        reg [3:0] next_State;   
        reg [1:0] processor;
      
        //One hot
        parameter Reset = 5'b00001; 
        parameter Fetch = 5'b00010;
        parameter Execute = 5'b00100; 
        parameter Store = 5'b01000;
        parameter Terminate = 5'b10000;

initial
    current_State = Reset;       
        
always @(posedge clock || reset)
begin
    if(reset)
        current_State = Reset;
    else
        current_State = next_State;
        //debug
        controller_state = current_State;
        current_instr = instruct;
end

//casestate
always @(*)
begin
    case(current_State)
        Reset:
        next_State = Fetch;
        Fetch: 
        next_State = Execute;
        Execute: 
        next_State = Store; 
        Store:
        if( (Inst_Mem_Data[21:20] == 0) || (Inst_Mem_Data[21:20] == 3) )
        next_State = Terminate;
        else next_State = Fetch; 
        Terminate :
        next_State = Terminate;
   endcase
end

//output
always @(*)
    case(current_State)
    Reset:
    begin
         A = 0 ; 
         B = 0 ; 
         Mode = 0;
         Inst_Mem_CNT_EN = 0;
         Trans_Mem1_CNT_EN = 0;
         Trans_Mem1_WEN = 0;
         Trans_Mem2_CNT_EN = 0;
         Trans_Mem2_WEN = 0;  
   end
    Fetch:
    begin

         Inst_Mem_CNT_EN = 1;
         Trans_Mem1_CNT_EN = 0;
         Trans_Mem1_WEN = 0; 
         Trans_Mem2_CNT_EN = 0; 
         Trans_Mem2_WEN = 0;
         instruct = Inst_Mem_Data;
   end
    Execute:
    begin
         A =  instruct[15:8];
         B = instruct[7:0];
         Mode = instruct[19:16];
         Inst_Mem_CNT_EN = 0;  
         Trans_Mem1_CNT_EN = 0;
         Trans_Mem1_WEN = 0;
         Trans_Mem2_CNT_EN = 0;
         Trans_Mem2_WEN = 0; 
    end
   Store:
   begin
        if(processor == 2'b10)
        begin
             Trans_Mem1_WEN = 1; 
             Trans_Mem1_CNT_EN = 1; 
             Trans_Mem2_CNT_EN = 0;
             Trans_Mem2_WEN = 0;

             next_State = Fetch;
         end
      else if(processor == 2'b01)
      begin
             Trans_Mem2_WEN = 1;
             Trans_Mem2_CNT_EN = 1;
             Trans_Mem1_WEN = 0;
             Trans_Mem1_CNT_EN = 0;

             next_State = Fetch;
       end
         processor = instruct[21:20];
    end
    Terminate:
    begin 
         A = 0;
         B = 0;
         Mode = 0;
         Inst_Mem_CNT_EN = 0;
         Trans_Mem1_CNT_EN = 0;
         Trans_Mem1_WEN = 0;
         Trans_Mem2_CNT_EN = 0;
         Trans_Mem1_WEN = 0;
    end
    endcase
endmodule
