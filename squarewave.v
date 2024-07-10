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
