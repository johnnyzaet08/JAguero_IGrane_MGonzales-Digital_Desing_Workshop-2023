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
module divider #( parameter N ) (
    input [N-1:0] A, B,  //Entradas aqui
    output logic [N-1:0] Q, R,  //Cociente y remanente aqui
    output logic dbz  //Pasar el flag aqui
);

    logic [N-1:0] b1;
    logic [N-1:0] quo, quo_next;
    logic [N:0] acc, acc_next;
    logic [$clog2(N)-1:0] i;
	 logic busy;
	 logic done;
	 logic valid;
    logic clk = 1;
	 logic reset = 0;
	 logic start = 1;

    // division algorithm iteration
    always_comb begin
        if (acc >= {1'b0, b1}) begin
            acc_next = acc - b1;
            {acc_next, quo_next} = {acc_next[N-1:0], quo, 1'b1};
        end else begin
            {acc_next, quo_next} = {acc, quo} << 1;
        end
    end

    always_ff @(posedge clk) begin
        done <= 0;
        if (start) begin
            valid <= 0;
            i <= 0;
            if (B == 0) begin
                busy <= 0;
                done <= 1;
                dbz <= 1;
            end else begin
                busy <= 1;
                dbz <= 0;
                b1 <= B;
                {acc, quo} <= {{N{1'b0}}, A, 1'b0};
            end
        end else if (busy) begin
            if (i == N-1) begin
                busy <= 0;
                done <= 1;
                valid <= 1;
                Q <= quo_next;
                R <= acc_next[N:1];
            end else begin
                i <= i + 1;
                acc <= acc_next;
                quo <= quo_next;
            end
        end
        if (reset) begin
            busy <= 0;
            done <= 0;
            valid <= 0;
            dbz <= 0;
            Q <= 0;
            R <= 0;
        end
    end
	 
endmodule

/*
// N-bit MOD module
module MOD #( parameter N )
	(
		input [N-1:0] A, B,
		output [N-1:0] out
	);
	
	logic [N:0] ext_a;
	logic [N:0] quotient;
	
	assign ext_a = {{DATA_WIDTH{A[DATA_WIDTH-1]}}, A};
	assign quotient = ext_a / B;
	assign out = ext_a - (quotient * B);
	
endmodule
*/
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
	assign negative = (sub < 0);
	
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