Program:
module random_counter_lfsr(input clk, rst_n, input[4:0] initialized_value,
output[4:0] counter_random);
wire [4:0] counter_lfsr;
wire d_xor;
reg [20:0]clk_1; // make this comment during simulation reg clkreg; // make this comment during simulation
always @(posedge clk) // make this comment during simulation begin// make this comment during simulation
clk_1=clk_1+1; // make this comment during simulation clkreg= clk_1[16]; // make this comment during simulation end// make this comment during simulation
xor xor_u(d_xor,counter_lfsr[1],counter_lfsr[4]); D_FF u0(.q(counter_lfsr[0]), .d(counter_lfsr[4]),
.rst_n(rst_n),.clk(clkreg),.init_value(initialized_value[0])); //use clk during simulation D_FF u1(.q(counter_lfsr[1]), .d(counter_lfsr[0]), .rst_n(rst_n),
.clk(clkreg),.init_value(initialized_value[1])); //use clk during simulation D_FF u2(.q(counter_lfsr[2]), .d(d_xor), .rst_n(rst_n),
.clk(clkreg),.init_value(initialized_value[2])); //use clk during simulation D_FF u3(.q(counter_lfsr[3]), .d(counter_lfsr[2]), .rst_n(rst_n),
.clk(clkreg),.init_value(initialized_value[3])); //use clk during simulation D_FF u4(.q(counter_lfsr[4]), .d(counter_lfsr[3]), .rst_n(rst_n),
.clk(clkreg),.init_value(initialized_value[4])); //use clk during simulation assign counter_random = counter_lfsr;
endmodule
module D_FF (q, d, rst_n, clk,init_value); output q;
input d, rst_n, clk,init_value;
reg q;
always @(posedge clk or negedge rst_n) if (~rst_n)
q <= init_value;
else
q <= d; endmodule
Testbench:
module randomcounter_testbench(); reg clk, reset;
reg [4:0] initialized_value;
wire [4:0] counter_random;
random_counter_lfsr dut( clk, reset,initialized_value,counter_random); initial begin
clk=0;
forever #5 clk=~clk;
end
initial begin
reset=0; initialized_value=5'b11111; #20;
reset=1;
end
endmodule