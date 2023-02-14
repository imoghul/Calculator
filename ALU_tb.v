module ALU_tb;

  reg rst_n, clock;
  reg [3:0] A,B;
  wire valid,en;
  wire [7:0] result;
  reg [1:0] operation; 

  ALU #(.inSize(4)) DUT (
    .rst( rst_n ),
    .clk( clock ),
    .en( en ),
    .operation( operation ),
    .A( A ),
    .B( B ),
    .result( result ),
    .valid( valid )
  );

  // free-running clock
  initial clock = 0;
  always #5 clock = ~clock;
  assign en = 1;
  initial begin
  
	  $dumpfile("ALU_tb.vcd");
	  $dumpvars(0, DUT);
	  $monitor("A is %d, B is %d, result is %d, operation is %d",A,B, result, operation);
  
  end
  // active low synchronous reset
  initial begin
        rst_n = 1;
    #10 rst_n = 0;
	A = 1;
	B = 2;
	operation = 0;
    #10 A=7;
        B=4;
	operation = 2;
    #10 A=5;
        B=3;
	operation = 1;

  end
  
  initial begin
   #40 $finish;
  end

endmodule
