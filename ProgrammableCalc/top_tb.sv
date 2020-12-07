`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 02:42:15 PM
// Design Name: 
// Module Name: top_tb
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

module top_tb();

    //input
    reg clock;
    reg reset;
    reg [3:0] Trans_Mem1_ADDRB;
    reg Trans_Mem1_RENB;
    reg [3:0] Trans_Mem2_ADDRB;
    reg Trans_Mem2_RENB;
    wire [7:0] Trans_Mem1_DOUTB;
    wire [7:0] Trans_Mem2_DOUTB;
    logic [2:0] controller_state;
    logic [21:0] current_instruction;
    logic IN_MEM_CNT_EN;
    logic TM_MEM1_CNT_EN;
    logic TM_MEM2_CNT_EN;
    
top DUT(
.clock(clock),
.reset(reset),
.Trans_Mem1_ADDRB(Trans_Mem1_ADDRB),
.Trans_Mem1_RENB(Trans_Mem1_RENB),
.Trans_Mem2_ADDRB(Trans_Mem2_ADDRB),
.Trans_Mem2_RENB(Trans_Mem2_RENB),
.Trans_Mem1_DOUTB(Trans_Mem1_DOUTB),
.Trans_Mem2_DOUTB(Trans_Mem2_DOUTB),
//debug
.controller_state(controller_state),
.current_instruction(current_instruction),
.IN_MEM_CNT_EN(IN_MEM_CNT_EN),
.TM_MEM1_CNT_EN(TM_MEM1_CNT_EN),
.TM_MEM2_CNT_EN(TM_MEM2_CNT_EN)
);

always begin
#5
clock = ~clock;
end

initial begin
clock = 0;
reset = 1;

#500

Trans_Mem1_RENB = 0;
Trans_Mem2_RENB = 0;

Trans_Mem1_ADDRB = 4'd0;
Trans_Mem2_ADDRB = 4'd0;

reset = 0;

#200

Trans_Mem1_RENB = 1;
Trans_Mem2_RENB = 1;

Trans_Mem1_ADDRB = 4'd0;
Trans_Mem2_ADDRB = 4'd0;

#10
assert (Trans_Mem1_DOUTB == 8'h12);
assert (Trans_Mem2_DOUTB == 8'hBA);

#200
Trans_Mem1_ADDRB = 4'd1;
Trans_Mem2_ADDRB = 4'd1;

#10
assert (Trans_Mem1_DOUTB == 8'h1D);
assert (Trans_Mem2_DOUTB == 8'h1D);

#200
Trans_Mem1_ADDRB = 4'd2;
Trans_Mem2_ADDRB = 4'd2;

#10
assert (Trans_Mem1_DOUTB == 8'h1D);
assert (Trans_Mem2_DOUTB == 8'h00);

#200
Trans_Mem1_ADDRB = 4'd3;
Trans_Mem2_ADDRB = 4'd3;

#10
assert (Trans_Mem1_DOUTB == 8'h1B);
assert (Trans_Mem2_DOUTB == 8'h01);

#300
$finish;

end
endmodule


