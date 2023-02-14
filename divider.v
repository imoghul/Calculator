module divider #(parameter inSize = 8)
                (input clk,
                 input rst,
                 input en,
                 input [inSize-1:0] dividend,
                 input [inSize-1:0] divisor,
                 output [inSize-1:0] quotient,
                 output [inSize-1:0] remainder,
                 output valid);
    
    reg [inSize-1:0] dividend_reg;
    reg [inSize-1:0] divisor_reg;
    reg [inSize-1:0] quotient_reg;
    reg [inSize-1:0] remainder_reg;
    reg [inSize-1:0] q;
    reg [inSize-1:0] r;
    integer i;
    always @(*) begin
        dividend_reg  = dividend;
        divisor_reg   = divisor;
        quotient_reg  = 0;
        remainder_reg = 0;
        
        for (i = inSize - 1; i > = 0; i = i - 1) begin
            remainder_reg    = remainder_reg << 1;
            remainder_reg[0] = dividend_reg[i];
            if (remainder_reg > = divisor_reg) begin
                remainder_reg   = remainder_reg - divisor_reg;
                quotient_reg[i] = 1;
            end
        end
        
        q = quotient_reg;
        r = remainder_reg;
    end
    assign quotient  = q;
    assign remainder = r;
    assign valid     = en&&!rst;
endmodule
