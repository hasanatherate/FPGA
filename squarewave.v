module squarewave(clk,rst,op,fqs);
input clk,rst,fqs;
output [7:0] op;
wire [7:0] op;
reg [7:0] temp;
reg [7:0] q;
always@(posedge clk)
begin
if(~rst)
q=8'b0;
else
q=q+1;
end
always@(q)
begin
if(fqs)
begin
if(q<=127)
temp=8'b00000000;
else
temp=8'b11111111;
end
else
begin
if((q>=0)&&(q<=64))
temp=8'b00000000;
else if((q>64)&&(q<=127)) 
temp=8'b11111111;
else if((q>127)&&(q<192))
temp=8'b00000000;
else if((q>192)&&(q<256)) 
temp=8'b11111111;end
end
assign op = temp;
endmodule
module squarewave_tb;
    reg clk, rst, fqs;
    wire [7:0] op;

    squarewave uut (
        .clk(clk),
        .rst(rst),
        .fqs(fqs),
        .op(op)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        fqs = 0;

        // Apply reset
        #10 rst = 1;

        // Test different frequencies
        #100 fqs = 1;
        #200 fqs = 0;

        // Finish simulation
        #300 $finish;
    end
endmodule
