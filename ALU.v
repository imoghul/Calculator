module ALU 

# (
	parameter inSize = 4
)

(

	input clk,
	input rst,
	input en,
	input [1:0] operation,
	input [inSize-1:0] A,
	input [inSize-1:0] B,
	output [inSize+inSize-1:0] result,
	output valid
);

	wire add,sub,prod,div;

	assign add = adder adder_DUT(.clk(clk),.rst(rst),.en(en),.A(A),.B(B),.sum(result[inSize:0]),.valid(valid));
	assign prod = multiplier mult_DUT(.clk(clk),.rst(rst),.en(en),.A(A),.B(B),.product(result),.valid(valid));
	assign sub = adder sub_DUT(.clk(clk),.rst(rst),.en(en),.A(A),.B(-B),.sum(result[inSize:0]),.valid(valid));
	assign div = 0;

	assign result = mux41 mux_DUT(operation,add,sub,prod,div,result);

endmodule
