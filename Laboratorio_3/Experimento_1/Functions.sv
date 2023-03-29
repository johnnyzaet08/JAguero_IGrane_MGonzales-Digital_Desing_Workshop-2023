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
		output [N-1:0] Q, R,
		output logic zero
	);
	
	reg [N-1:0] dividend;
	reg [N-1:0] divisor;
	reg [N-1:0] quotient;
	reg [N-1:0] remainder;
	reg [N-1:0] shifted_divisor;
	reg [N:0]   count;
    
	assign Q = quotient;
	assign R = remainder;
    
	always @(*) begin
		dividend = A;
		divisor = B;
		quotient = 0;
		remainder = 0;
		count = N+1;
        
		// Shift divisor to align with dividend
		shifted_divisor = divisor << N;
		if (divisor == 0) begin
			zero = 1;
		end else begin
			zero = 0;
         while (count > 0) begin
				count = count - 1;
            remainder = remainder << 1;
            remainder[0] = dividend[N-1];
            dividend = dividend << 1;
            
            if (remainder >= shifted_divisor) begin
					remainder = remainder - shifted_divisor;
               quotient[count] = 1;
				end
			end
		end
	end

endmodule

<<<<<<< Updated upstream
=======
/*
>>>>>>> Stashed changes
// N-bit MOD module
module MOD #( parameter N )
	(
		input [N-1:0] A, B,
		output [N-1:0] out
	);
	
	logic [N:0] ext_a;
	logic [N:0] quotient;
	
	assign ext_a = {{DATA_WIDTH{a[DATA_WIDTH-1]}}, a};
	assign quotient = ext_a / b;
	assign out = ext_a - (quotient * b);
<<<<<<< Updated upstream
	
endmodule

// N-bit full adder module
module full-adder #( parameter N ) 
	(
		input [N-1:0] A, B,
		input logic c_in,
		output [N-1:0] sum, 
		output logic c_out
	);
	
	assign {c_out, sum} = A + B + c_in;
	
endmodule

=======
	
endmodule */

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

>>>>>>> Stashed changes
// N-bit substractor module
module substractor #( parameter N )
	(
		input [N-1:0] A, B,
<<<<<<< Updated upstream
		output [N-1:0] sub
	);
	
	assign sub = A - B;
=======
		output [N-1:0] sub,
		output logic negative
	);
	
	assign sub = A - B;
	assign negative = (sub < 0);
>>>>>>> Stashed changes
	
endmodule

// N-bit multiplier module
module multiplier #( parameter N )
	(
		input [N-1:0] A, B,
<<<<<<< Updated upstream
		output [2*N-1:0] mult
=======
		output [2*N-1:0] mult,
		output logic overflow
>>>>>>> Stashed changes
	);
	
	assign mult = A * B;
	
<<<<<<< Updated upstream
=======
	always @(*) begin
		localparam max_val = (1 << (2*N)) - 1; // maximum value that can be represented by 2*N bits
		
		if (mult > max_val) begin
			assign overflow = 1;
		end else begin
			assign overflow = 0;
		end
	end
	
>>>>>>> Stashed changes
endmodule