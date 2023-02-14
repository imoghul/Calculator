module ALU #(parameter inSize = 4)
            (input clk,
             input rst,
             input en,
             input [1:0] operation,
             input [inSize-1:0] A,
             input [inSize-1:0] B,
             output [inSize+inSize-1:0] result,
             output valid);
    
    wire [inSize+inSize-1:0] prod;
    wire [inSize-1:0] add,sub,div,rem;
    
    adder #(.inSize(inSize)) adder_DUT (.clk(clk),.rst(rst),.en(en),.A(A),.B(B),.sum(add),.valid(valid));
    multiplier #(.inSize(inSize)) mult_DUT (.clk(clk),.rst(rst),.en(en),.A(A),.B(B),.product(prod),.valid(valid));
    adder #(.inSize(inSize)) sub_DUT (.clk(clk),.rst(rst),.en(en),.A(A),.B(-B),.sum(sub),.valid(valid));
    divider #(.inSize(inSize)) div_DUT (.clk(clk),.rst(rst),.en(en),.dividend(A),.divisor(B),.quotient(div),.remainder(rem),.valid(valid));
    
    mux41 #(.inSize(inSize+inSize)) mux_DUT(operation,add,sub,prod,div,result);
    
endmodule
