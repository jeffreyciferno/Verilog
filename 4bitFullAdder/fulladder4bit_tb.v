`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: ASU
// Engineer: Drunk SunDevils
// 
// Create Date: 08/28/2017 04:23:53 PM
// Design Name: 
// Module Name: fulladder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Run the simulation for at least 10250 ns
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fulladder4bit_tb(

);


reg signed [3:0]a;  // a operand  
reg signed [3:0]b;  // b operand
wire signed [3:0]s; // sum= a+b
reg addsubflag; // 0 for add, 1 for sub  
wire overflow; // overflow indicator


reg signed [3:0]sum_exp; // expected signed sum.
reg signed [4:0]sum_exp_no_overflow; // expected signed sum.

// for test bech only
integer ai,bi; // integer  represnetation of signed numbers; 
integer errorcount=0;
reg overflowExpected;

design_2_wrapper FA(.A0(a[0]),
.A1(a[1]),
.A2(a[2]),
.A3(a[3]),
.AddSub(addsubflag),
.B0(b[0]),
.B1(b[1]),
.B2(b[2]),
.B3(b[3]),
.OverFlow(overflow),
.S0(s[0]),
.S1(s[1]),
.S2(s[2]),
.S3(s[3]));


initial begin 
    
    addsubflag=1'b0; // addition
    
    for(ai=-8;ai<8;ai=ai+1)
    begin
      
    for(bi=-8;bi<8;bi=bi+1)
    begin  
        
      #10
          // assign    
          a<=ai[3:0];
          b<= bi[3:0];
      
          // Calculate expected result                    
          sum_exp = ai + bi;  
          sum_exp_no_overflow = ai + bi;           
          
        
          //if((sum_exp_no_overflow < -5'd8) || (sum_exp_no_overflow > 5'd7))
          if(sum_exp_no_overflow != sum_exp)
              overflowExpected = 1;
          else
              overflowExpected = 0; 
          
          
    
       
       #30 
            if( (sum_exp !=  s )  || (overflowExpected != overflow)) // compare expected with your result
            begin
            errorcount = errorcount + 1;
            $display("Input a=%4b, b=%4b, expected sum is=%4b , expected overflow=%d, while the resulted sum is %4b, resulted overflow is %d at time ", a,b,sum_exp,overflowExpected,s,overflow,$time);               
            end
            else
            $display("Results match the expected values at time ",$time);               
                    
            
      
                             
    end
            
    end
    
  
     
    if(errorcount>0)           
        $display(" WARNING::The Simulation Failed. "); 
    else
        $display("The simulation is successful. The functionality has been verified."); 
   
//    $finish; 
end


endmodule
