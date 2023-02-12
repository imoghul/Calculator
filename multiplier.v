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


	reg [inSize+inSize-1:0] temp;
	always @(A or B) begin
		temp = 0;
		for(int i = 0;i<inSize+inSize;i++)
			if(b[i]) temp = temp+(a<<i);
		result = temp;
	end
	assign product = result;
	assign valid = en&&!rst;

endmodule
