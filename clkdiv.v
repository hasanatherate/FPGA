module CLK_DIVIDER(
    input CLK_IN,
    output reg CLK_OUT = 0,
    input [1:0] DIVISOR
);
reg [1:0] counter = 0;

always @(posedge CLK_IN)
begin
    if (counter < DIVISOR)
        counter = counter + 1;
    else
    begin
        CLK_OUT = ~CLK_OUT;
        counter = 0;
    end
end
endmodule
module clkdivtb ();
reg CLK_IN;
wire CLK_OUT;
reg [1:0] DIVISOR;

CLK_DIVIDER C1 (CLK_IN, CLK_OUT, DIVISOR);

initial
begin
    CLK_IN = 1'b0;
    DIVISOR = 2'b00;
end

always
    #10 CLK_IN = ~CLK_IN;

initial
begin
    #200; DIVISOR = 2'b00;
    #200; DIVISOR = 2'b01;
    #200; DIVISOR = 2'b10;
    #200; DIVISOR = 2'b11;
    #100; $finish;
end
endmodule
