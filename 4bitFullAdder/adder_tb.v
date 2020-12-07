//Test Bench template for testing 1-bit adder module

`timescale 1ns / 1ps  //define the time scale/step of simulation

module adder_tb();  //create a simulation module
reg a;       //input signals to design under test (DUT)
reg b;       //input signals
reg Cin;     //input signals
wire s;      //output signals
wire Cout;   //output signals

/*This section specifies the DUT i.e. your 1-bit full adder. Make sure input/output names match your module's input/output lists. In this case, "design_1_wrapper" is the module name of your DUT. The rest lines define the connection between the DUT's input/output and the testbench signals. The format is ".<DUT_port>(<testbench_signals>)"*/

design_1_wrapper DUT(       
				.Cin(Cin),
				.Cout(Cout),
				.a(a),
				.b(b),
				.s(s));

/*This section defines the input stimulus value at different simulation time. Each "#50" advances simulation time by 50ns (the time unit is defined by `timescale).*/

initial begin
a =1'b0;
b = 1'b0;
Cin = 1'b0;

#50
a =1'b1;
b = 1'b0;
Cin = 1'b0;

#50
a =1'b0;
b = 1'b1;
Cin = 1'b0;

#50
a =1'b1;
b = 1'b1;
Cin = 1'b0;

#50
a =1'b0;
b = 1'b0;
Cin = 1'b1;

#50
a =1'b1;
b = 1'b0;
Cin = 1'b1;

#50
a =1'b0;
b = 1'b1;
Cin = 1'b1;

#50
a =1'b1;
b = 1'b1;
Cin = 1'b1;
end 
endmodule

/*Use this template to create your own testbench to test your 4-bit adder/subtractor*/

