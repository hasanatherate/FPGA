module jboothMultiplier(PRODUCT, A, B);
    output reg signed [7:0] PRODUCT;
    input signed [3:0] A, B;
    reg [1:0] temp;
    integer i;
    reg e;
    reg [3:0] B1;

    always @(A, B)
    begin
        PRODUCT = 8'd0;
        e = 1'b0;
        B1 = -B;
        for (i = 0; i < 4; i = i + 1)
        begin
            temp = {A[i], e};
            case (temp)
                2'd2: PRODUCT[7:4] = PRODUCT[7:4] + B1;
                2'd1: PRODUCT[7:4] = PRODUCT[7:4] + B;
            endcase
            PRODUCT = PRODUCT >> 1;
            PRODUCT[7] = PRODUCT[6];
            e = A[i];
        end
    end
endmodule

// Test bench
module jboothMultiplierTb;
    wire [7:0] Y;
    reg [3:0] A, B;
    jboothMultiplier jbm(Y, A, B);

    initial
    begin
        A = 2; B = 2; #10;
        A = 3; B = 3; #10;
        A = 3; B = 4; #10;
        A = 3; B = -4; #10;
        A = 3; B = 5; #10;
        A = 0; B = 0; #10;
        A = 1; B = 1; #10;
        A = 15; B = 15; #10;
        A = 2; B = 6; #10;
    end
endmodule
