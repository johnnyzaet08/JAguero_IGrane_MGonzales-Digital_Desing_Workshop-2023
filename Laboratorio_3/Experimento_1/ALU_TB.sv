module ALU_TB;

	parameter N = 4;
	
	reg trigg;
	reg res;
	reg [N-1:0] A;
	reg [N-1:0] B;
	reg [3:0] sel;
	
	wire Negative;
	wire Zero;
	wire CarryOut;
	wire Overflow;
	wire [N-1:0] Result;
	wire [3:0] oper;
	
	ALU #(.M(N)) Alu_TEST(
		.A(A),
		.B(B),
		.trigger(trigg),
		.reset(res),
		.ALU_Sel(sel),
		.CarryOut(CarryOut),
		.Zero(Zero),
		.Negative(Negative),
		.Overflow(Overflow),
		.ALU_Out(Result)  //Requiere que la ALU tenga un output
	);
	
	
	initial begin
	
		// Test case 1 - Sumador
		sel = 4'b0000;
		A = 4'b1010;
		B = 4'b0111;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b0000;
		A = 4'b1111;
		B = 4'b1111;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		
		// Test case 2 - Restador
		sel = 4'b0001;
		A = 4'b1010;
		B = 4'b0111;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b0001;
		A = 4'b1110;
		B = 4'b0011;

		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		//Test case 3 - Multiplicador
		sel = 4'b0010;
		A = 4'b0010;
		B = 4'b0010;

		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b0010;
		A = 4'b0011;
		B = 4'b0001;

		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		//Test case 4 - Divisor
		sel = 4'b0011;
		A = 4'b0011;
		B = 4'b0011;

		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b0011;
		A = 4'b0101;
		B = 4'b0011;

		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		//Test case 5 - Modulo
		sel = 4'b0100;
		A = 4'b0011;
		B = 4'b0011;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b0100;
		A = 4'b0101;
		B = 4'b0011;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		// Test case 6 - AND
		sel = 4'b0101;
		A = 4'b1010;
		B = 4'b0111;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b0101;
		A = 4'b1110;
		B = 4'b0101;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		
		// Test case 7 - OR
		sel = 4'b0110;
		A = 4'b1010;
		B = 4'b0111;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b0110;
		A = 4'b1110;
		B = 4'b0101;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		
		// Test case 8 - XOR
		sel = 4'b0111;
		A = 4'b1010;
		B = 4'b0111;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b0111;
		A = 4'b1110;
		B = 4'b0011;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
	
		// Test case 9 - Shift left
		sel = 4'b1000;
		A = 4'b1010;
		B = 4'b0000;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b1000;
		A = 4'b0110;
		B = 4'b0000;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		
		//Test case 10 - Shift Right
		sel = 4'b1001;
		A = 4'b1010;
		B = 4'b0000;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		sel = 4'b1001;
		A = 4'b1110;
		B = 4'b0000;
		
		res = 1'b0;
		trigg = 1'b1;
		#40;
		res = 1'b1;
		trigg = 1'b0;
		#40;
		
		end
		
endmodule