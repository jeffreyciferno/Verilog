`timescale 1ns / 1ps

module Deserializer_tb();

logic clock, enable, reset, lr;
logic done;
reg scaledclock;
logic [15:0] data_o ;
logic data_i;
logic [8:0] counter;

Deserializer DUT(
.clock_i(clock),
.enable_i(enable),
.done_o(done),
.data_o(data_o),
.pdm_clk_o(scaledclock),
.pdm_lrsel_o(lr),
.pdm_data_i(data_i),
.counter1(counter)
);

always begin 
    #5 clock = ~clock;
end

initial begin
clock = 0;
enable = 0;
reset = 1;
#100
reset = 0;
enable = 1;
data_i = 0;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 1;

#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 0;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 1;
#10
data_i = 1;
#10

#1000
data_i = 0;
#100
$finish;
end
endmodule;

