module stepm(clk, rst, dir, step_ctrl, dout);
    input clk, rst, dir;
    input [1:0] step_ctrl;
    output [3:0] dout;
    reg [3:0] dout;
    reg [20:0] dclk;
    reg div_clk;

    always @(posedge clk)
    begin
        dclk = dclk + 1;
    end

    always @(posedge clk)
    begin
        case(step_ctrl)
            2'b00: div_clk = dclk[20];
            2'b01: div_clk = dclk[18];
            2'b10: div_clk = dclk[16];
            2'b11: div_clk = dclk[14];
        endcase
    end

    always @(posedge div_clk)
    begin
        if (!rst)
            dout = 4'b1001;
        else
        begin
            case(dir)
                1'b0: dout = {dout[0], dout[3:1]};
                1'b1: dout = {dout[2:0], dout[3]};
            endcase
        end
    end
endmodule
