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
		input [N-1:0] a, b, 
		output [N-1:0] out_,
		output logic zero
	);
	
	reg [N-1:0] divisor;
	reg [N-1:0] out_aux;
	
	
	always @(*) begin
		divisor = b;
		
		if (divisor == 0) begin
			zero = 1;
			out_aux = 0;
		end else begin
			zero = 0;
			out_aux = a / b;
		end
	end
	
	assign out_ = out_aux;

endmodule

// N-bit MOD module

module mod #( parameter N )
	(
		input [N-1:0] A, B,
		output [N-1:0] out
	);
	
	assign out = A % B;
	
endmodule

// N-bit full adder module
module full_adder #( parameter N ) 
	(
		input [N-1:0] A, B,
		input logic c_in,
		output [N-1:0] sum, 
		output logic c_out
	);
	
	assign {c_out, sum} = A + B + c_in;
	
endmodule

// N-bit substractor module
module substractor #( parameter N )
	(
		input [N-1:0] A, B,
		output [N-1:0] sub,
		output logic negative
	);
		
	assign sub = A - B;
	assign negative = (B > A);
	
endmodule

// N-bit multiplier module
module multiplier #( parameter N )
	(
		input [N-1:0] A, B,
		output [2*N-1:0] mult,
		output logic overflow
	);
	
	assign mult = A * B;

	always @(*) begin
		localparam max_val = (1 << (2*N)) - 1; // maximum value that can be represented by 2*N bits
		
		if (mult > max_val) begin
			overflow = 1;
		end else begin
			overflow = 0;
		end
	end
	
endmodule

module shifting(
			input [3:0]a,
			input shifter,
			output [3:0]y);

		
		logic [5:0]s;
		logic [1:0]t;
		
		// 1 Bit
		// And gates
		assign s[0] = a[3] & shifter;
		assign s[1] = ~shifter & a[2];
		assign s[2] = a[2] & shifter;
		assign s[3] = ~shifter & a[1];
		assign s[4] = a[1] & shifter;
		assign s[5] = ~shifter & a[0];
		
		// Or gates
		assign t[0] = s[0] | s[3];
		assign t[1] = s[2] | s[5];
		
		// Outputs
		assign y[3] = s[1];
		assign y[2] = t[0];
		assign y[1] = t[1];
		assign y[0] = s[4];	
		
	
endmodule