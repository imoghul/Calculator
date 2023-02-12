module mux41
(
	input [1:0] select,
	input A,
	input B,
	input C,
	input D,
	output out
)

	assign out = select==0 ? A: (select == 1? B:(select == 2 ? C:D));

endmodule
