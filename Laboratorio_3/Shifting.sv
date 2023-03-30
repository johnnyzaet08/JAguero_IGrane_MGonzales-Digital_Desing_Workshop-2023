module Shifting #(parameter N = 3) (
						input [3:0]a,
						input shifter,
						output [3:0]y);
						
		logic [3:0]outTemp1, outTemp2, outTemp3;
	
		
		if (N == 1) begin // 1 Bit
			Shifting1Bit singleShift(a, shifter, y);
		end
		
		if (N == 2) begin // 2 Bits
			Shifting1Bit doubleShift1(a, shifter, outTemp1);
			Shifting1Bit doubleShift2(outTemp1, shifter, y);
		end
		
		if (N == 3) begin // 3 Bits
			Shifting1Bit tripleShift1(a, shifter, outTemp1);
			Shifting1Bit tripleShift2(outTemp1, shifter, outTemp2);
			Shifting1Bit tripleShift3(outTemp2, shifter, y);
		end
		
		if (N == 4) begin // 4 Bits
			Shifting1Bit quadrupleShift1(a, shifter, outTemp1);
			Shifting1Bit quadrupleShift2(outTemp1, shifter, outTemp2);
			Shifting1Bit quadrupleShift3(outTemp2, shifter, outTemp3);
			Shifting1Bit quadrupleShift4(outTemp3, shifter, y);
		end
						
						
endmodule