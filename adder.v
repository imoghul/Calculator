module adder #(parameter inSize = 4)
              (input clk,
               input rst,
               input en,
               input [inSize-1:0] A,
               input [inSize-1:0] B,
               output [inSize-1:0] sum,
               output valid);
    
    
    assign sum   = !rst&&en ? A+B : 0;
    assign valid = en&&!rst;
    
endmodule
