`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2020 06:10:56 PM
// Design Name: 
// Module Name: top
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


module top(
input logic clock,
input logic reset, 
input logic [3:0] Trans_Mem1_ADDRB, 
input logic Trans_Mem1_RENB, 
output logic [7:0] Trans_Mem1_DOUTB, 
input logic [3:0] Trans_Mem2_ADDRB, 
input logic Trans_Mem2_RENB, 
output logic [7:0] Trans_Mem2_DOUTB,
//debug ports
output logic [2:0] controller_state,
output logic [21:0] current_instruction,
output logic IN_MEM_CNT_EN,
output logic TM_MEM1_CNT_EN,
output logic TM_MEM2_CNT_EN
    );
    
    logic intCNT, intTRANSCNT1,intTRANSCNT2, TransMemWEA1,TransMemWEA2;
    logic [7:0] A, B, ALUout; 
    logic [3:0] Mode, InstMemADDRA, TransMemADDRA1, TransMemADDRA2; 
    logic [21:0] DOUTA;
    
//debug
always @(posedge clock)
begin
    IN_MEM_CNT_EN = intCNT;
    TM_MEM1_CNT_EN = intTRANSCNT1;
    TM_MEM2_CNT_EN = intTRANSCNT2;
end

Controller Controller(
.clock(clock),
.reset(reset),
.A(A),
.B(B),
.Inst_Mem_Data(DOUTA),
.Mode(Mode),
.Inst_Mem_CNT_EN(intCNT),
.Trans_Mem1_CNT_EN(intTRANSCNT1),
.Trans_Mem2_CNT_EN(intTRANSCNT2),
.Trans_Mem1_WEN(TransMemWEA1),
.Trans_Mem2_WEN(TransMemWEA2),
//debug
.current_instr(current_instruction),
.controller_state(controller_state)
);

ALU ALU1(
.A(A),
.B(B),
.Select(Mode),
.ALUout(ALUout)
);

Counter CounterInst(
.clock(clock),
.reset(reset),
.address(InstMemADDRA),
.CNT_EN(intCNT)
);

Counter TransMem1(
.clock(clock),
.reset(reset),
.address(TransMemADDRA1),
.CNT_EN(intTRANSCNT1)
);

Counter TransMem2(
.clock(clock),
.reset(reset),
.address(TransMemADDRA2),
.CNT_EN(intTRANSCNT2)
);
 
 instructMEM IMEM (
 .clka(clock),
 .addra(InstMemADDRA),
 .ena(1'b1),
 .dina(22'd0),
 .wea(1'b0),
 .douta(DOUTA)
 );
 
 DualPortTransmit DPT1 (
 .clka(clock),
 .clkb(clock),
 .addra(TransMemADDRA1),
 .dina(ALUout),
 .wea(TransMemWEA1),
 .ena(1'b1),
 .enb(Trans_Mem1_RENB),
 .addrb(Trans_Mem1_ADDRB),
 .doutb(Trans_Mem1_DOUTB)
 );
 
 DualPortTransmit DPT2 (
 .clka(clock),
 .clkb(clock),
 .addra(TransMemADDRA2),
 .dina(ALUout),
 .wea(TransMemWEA2),
 .ena(1'b1),
 .enb(Trans_Mem2_RENB),
 .addrb(Trans_Mem2_ADDRB),
 .doutb(Trans_Mem2_DOUTB)
 );
endmodule
