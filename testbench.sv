module test;
  reg [3:0]A;
  wire [3:0]B;

  incrementer uut(A, B);  // Instantiate the Unit Under Test (UUT)

	initial 
      begin
		$dumpfile("dump.vcd");  $dumpvars(1, test);      // display the inputs and outputs
        $monitor( "A + 1 =%b + 0001 = %b", A, B);

	  // Initialize Inputs
      	   A = 0; 
      #10  A = 1; 
      #10  A = 2;  
      #10  A = 3; 
      #10  A = 4;  
      #10  A = 5; 
      #10  A = 6; 
      #10  A = 7; 
      #10  A = 8; 
      #10  A = 9; 
      #10  A = 10; 
      #10  A = 11; 
      #10  A = 12; 
      #10  A = 13; 
      #10  A = 14; 
       

      #10 $finish;
      end
endmodule   

