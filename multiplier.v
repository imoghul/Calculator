module multiplier 

# (
	parameter inSize = 4
)

(

	input clk,
	input rst,
	input en,
	input [inSize-1:0] A,
	input [inSize-1:0] B,
	output [inSize+inSize-1:0] product,
	output valid
);

	integer i;
	reg [inSize+inSize-1:0] result;
	always @(A or B) begin
		result = 0;
		for(i = 0;i<inSize+inSize;i++)
			if(B[i]) result = result+(A<<i);
	end
	assign product = result;
	assign valid = en&&!rst;

endmodule
