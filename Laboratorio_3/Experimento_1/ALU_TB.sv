module ALU_TB;

	parameter N = 4;
	
	logic [N-1:0] A;
	logic [N-1:0] B;
	logic [3:0] sel;
	
	logic Negative;
	logic Zero;
	logic CarryOut;
	logic Overflow;
	logic [N-1:0] Result;
	
	ALU #(.N(N)) DUT(
		.A(A),
		.B(B),
		.ALU_Sel(sel),
		.CarryOut(CarryOut),
		.Zero(Zero),
		.Negative(Negative),
		.Overflow(Overflow),
		.ALU_Out(Result)  //Requiere que la ALU tenga un output
	);
	
	
	initial begin
		// Test case 1 - Sumador
		A = 4'b1010;
		B = 4'b0111;
		sel = 4'b0000;
		#40;
		
		A = 4'b1111;
		B = 4'b1111;
		sel = 4'b0000;
		#40;
		
		
		// Test case 2 - Restador
		A = 4'b1010;
		B = 4'b0111;
		sel = 4'b0001;
		#40;
		
		A = 4'b1110;
		B = 4'b0011;
		sel = 4'b0001;
		#40;
		
		//Test case 3 - Multiplicador
		A = 4'b0010;
		B = 4'b0010;
		sel = 4'b0010;
		#40;
		
		A = 4'b0011;
		B = 4'b0001;
		sel = 4'b0010;
		#40;
		
		//Test case 4 - Divisor
		A = 4'b0011;
		B = 4'b0011;
		sel = 4'b0011;
		#40;
		
		A = 4'b0101;
		B = 4'b0011;
		sel = 4'b0011;
		#40;
		
		//Test case 5 - Modulo
		A = 4'b0011;
		B = 4'b0011;
		sel = 4'b0100;
		#40;
		
		A = 4'b0101;
		B = 4'b0011;
		sel = 4'b0100;
		#40;
		
		// Test case 6 - AND
		A = 4'b1010;
		B = 4'b0111;
		sel = 4'b0101;
		#40;
		
		A = 4'b1110;
		B = 4'b0101;
		sel = 4'b0101;
		#40;
		
		
		// Test case 7 - OR
		A = 4'b1010;
		B = 4'b0111;
		sel = 4'b0110;
		#40;
		
		A = 4'b1110;
		B = 4'b0101;
		sel = 4'b0110;
		#40;
		
		
		// Test case 8 - XOR
		A = 4'b1010;
		B = 4'b0111;
		sel = 4'b0111;
		#40;
		
		A = 4'b1110;
		B = 4'b0011;
		sel = 4'b0111;
		#40;
		
	
		// Test case 9 - Shift left
		A = 4'b1010;
		B = 4'b0000;
		sel = 4'b1000;
		#40;
		
		A = 4'b0110;
		B = 4'b0000;
		sel = 4'b1000;
		#40;
		
		
		//Test case 10 - Shift Right
		A = 4'b1010;
		B = 4'b0000;
		sel = 4'b1001;
		#40;
		
		A = 4'b1110;
		B = 4'b0000;
		sel = 4'b1001;
		#40;
		
		end
		
endmodule