module modN_ctr # (parameter N = 10, parameter WIDTH = 4)
( input clk, input rstn,
output reg[WIDTH-1:0] out);
reg [32:0]clk_1; // make this comment during simulation
reg clkreg; // make this comment during simulation
always @ (posedge clk) begin// make this comment during simulation clk_1= clk_1+1; // make this comment during simulation clkreg=clk_1[20]; // make this comment during simulation
end // make this comment during simulation
always @ (posedge clkreg) begin //use clk instead of clkreg during simulation if (!rstn) begin
out <= 0; end else begin
if (out == N-1) out <= 0;
else
out <= out + 1;
end end
endmodule
Testbecnh:
module tb;
parameter N = 10; parameter WIDTH = 4;
reg clk;
reg rstn;
wire [WIDTH-1:0] out;
modN_ctr u0 ( .clk(clk),.rstn(rstn), .out(out));
always #10 clk = ~clk;
initial begin
{clk, rstn} <= 0;
$monitor ("T=%0t rstn=%0b out=0x%0h", $time, rstn, out); repeat(2) @ (posedge clk);
rstn<= 1;repeat(20) @ (posedge clk);
$finish;
end endmodule
