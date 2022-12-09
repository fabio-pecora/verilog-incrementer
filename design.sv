module halfadder(S,C,x,y);
  input x,y;
  output S,C;
  
  xor U1(S,x,y);
  and U2(C,x,y);
 
endmodule

module fulladder(S,C,x,y,cin);
  input x,y,cin;
  output S,C;
  
  wire S1,D1,D2;
  
  halfadder HA1(S1,D1,x,y);
  halfadder HA2(S,D2,S1,cin);
  or U3(C,D2,D1);
  
endmodule

module four_bit_adder(S,C4,A,B,Cin);
  input[3:0]A,B;
  input Cin;
  output [3:0]S;
  output C4;
  wire C1,C2,C3;
  
  fulladder FA1(S[0],C1,A[0],B[0],Cin);
  fulladder FA2(S[1],C2,A[1],B[1],C1);
  fulladder FA3(S[2],C3,A[2],B[2],C2);
  fulladder FA4(S[3],C4,A[3],B[3],C3);
  
endmodule

module adder_subtractor(S,C,A,B,M);
	
	input[3:0]A,B;
	input M;
	output [3:0]S;
	output C;
	
	wire [3:0]X;
   
    //assign M=1;
	
	xor U4(X[0],B[0],M);
	xor U5(X[1],B[1],M);
	xor U6(X[2],B[2],M);
	xor U7(X[3],B[3],M);
	
	four_bit_adder FBA1(S,C,A,X,M);

endmodule

module incrementer(A, B);
  input [3:0] A;
  output [3:0] B;
  wire [3:0]X;
  assign X[0] = 1;
  assign X[1] = 0;
  assign X[2] = 0;
  assign X[3] = 0;
  
  
  four_bit_adder FBA1(B,C,A,X,0);

endmodule


