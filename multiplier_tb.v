module multiplier_tb;

  reg rst_n, clock;
  reg [3:0] A,B;
  wire valid,en;
  wire [7:0] product;
  

  multiplier #(.inSize(4)) DUT (
    .rst( rst_n ),
    .clk( clock ),
    .en( en ),
    .A( A ),
    .B( B ),
    .product( product ),
    .valid( valid )
  );

  // free-running clock
  initial clock = 0;
  always #5 clock = ~clock;
  assign en = 1;
  
  initial begin


	  $dumpfile("multiplier_tb.vcd");
	  $dumpvars(0,DUT);
	  $monitor("%d times %d = %d",A,B,product);

  end


  // active low synchronous reset
  initial begin
        rst_n = 1;
    #10 rst_n = 0;
	A = 3;
	B = 2;
  end
  
  initial
    #400 $stop;


endmodule
