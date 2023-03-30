module Shifting1Bit (
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