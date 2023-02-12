module adder_tb;

  reg rst_n, clock;
  reg [3:0] A,B;
  wire valid,en;
  wire [4:0] sum;
  

  adder #(.inSize(4)) DUT (
    .rst( rst_n ),
    .clk( clock ),
    .en( en ),
    .A( A ),
    .B( B ),
    .sum( sum ),
    .valid( valid )
  );

  // free-running clock
  initial clock = 0;
  always #5 clock = ~clock;
  assign en = 1;
  // active low synchronous reset
  initial begin
        rst_n = 1;
    #10 rst_n = 0;
	A = 1;
	B = 2;
  end
  
  initial
    #400 $stop;


endmodule
