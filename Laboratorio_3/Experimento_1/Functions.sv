// N-bit and_gate module
module and_gate #( parameter N )
	(
		input [N-1:0] a, b, 
		output [N-1:0] out
	);
	
  assign out = a & b;
  
endmodule

// N-bit not_gate module
module not_gate #( parameter N )
	(
		input [N-1:0] a, 
		output [N-1:0] out
	);
	
  assign out = ~a;
  
endmodule

// N-bit or_gate module
module or_gate #( parameter N )
	(
		input [N-1:0] a, b, 
		output [N-1:0] out
	);
	
  assign out = a | b;
  
endmodule

// N-bit xor_gate module
module xor_gate #( parameter N )
	(
		input [N-1:0] a, b, 
		output [N-1:0] out
	);
	
  assign out = a ^ b;
  
endmodule


// N-bit divider module
module divider #( parameter N ) 
	(
		input [N-1:0] A, B, 
		output [N-1:0] Q, R 
	);

endmodule

// N-bit MOD module
module MOD #( parameter N)
	(
		input [N-1:0] A, B,
		output [N-1:0] out
	);
	
	logic [N:0] ext_a;
	logic [N:0] quotient;
	
	assign ext_a = {{DATA_WIDTH{a[DATA_WIDTH-1]}}, a};
	assign quotient = ext_a / b;
	assign out = ext_a - (quotient * b);
	
endmodule