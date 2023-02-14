module mux41 #(parameter inSize = 8)
              (input [1:0] select,
               input [inSize-1:0]A,
               input [inSize-1:0] B,
               input [inSize-1:0] C,
               input [inSize-1:0] D,
               output [inSize-1:0] out);
    
    wire [inSize-1:0] sel0;
    wire [inSize-1:0] sel1;
    wire [inSize-1:0] sel2;
    assign sel2 = select == 2?C:D;
    assign sel1 = select == 1?B:sel2;
    assign sel0 = select == 0?A:sel1;
    assign out  = sel0;
    
endmodule
