module sisomod(clk,clear,si,so); input clk,si,clear;
output so;
reg so;
reg [3:0] tmp;
reg [20:0]clk_1;
reg clkreg;
always @(posedge clk )// // make this comment during simulation begin// make this comment during simulation
clk_1=clk_1+1; // make this comment during simulation
clkreg= clk_1[16]; // make this comment during simulation
end// make this comment during simulation
always @(posedge clkreg )// use clk during simulation
begin
if (clear)
tmp<= 4'b0000;
else
tmp[0] <= si;
tmp <= tmp << 1;
so = tmp[3]; end endmodule
module sisot_b; reg clk;
reg clear;
reg si;
wire so;
sisomod uut(.clk(clk), .clear(clear),.si(si),.so(so)); initial begin
clk = 0;
clear = 0;
si = 0;
#5 clear=1'b1;
#5 clear=1'b0;
#10 si=1'b1;
#10 si=1'b0;
#10 si=1'b0;
#10 si=1'b1;
#10 si=1'b0;
#10 si=1'bx;
end
always #5 clk = ~clk; initial #150 $stop; endmodule
