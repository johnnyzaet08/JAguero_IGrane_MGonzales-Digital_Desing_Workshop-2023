module InputRegister #( parameter N = 4 ) (
	input [N-1:0] A,B,
	input [3:0] sel, 
	input clk, reset,
	output reg [N-1:0] regA, regB,
	output reg [3:0] regSel
);
													 
	always @(posedge clk or posedge reset) begin
	
		if(reset) begin
			regA <= 0;
			regB <= 0;
			regSel <= 0;
		end else begin
			regA <= A;
			regB <= B;
			regSel <= sel;
		end
	end
	
endmodule

module OutputRegister #( parameter N = 4 ) (
	input [N-1:0] Output,
	input clk, reset, CarryOut, Zero, Negative, Overflow,
	output reg reg_CarryOut, reg_Zero, reg_Negative, reg_Overflow,
	output reg [N-1:0] reg_Output
);
													 
	always @(negedge clk or posedge reset) begin
	
		if(reset) begin
			reg_CarryOut <= 0;
			reg_Zero <= 0;
			reg_Negative <= 0;
			reg_Overflow <= 0;
			reg_Output <= 0;
		end else begin
			reg_CarryOut <= CarryOut;
			reg_Zero <= Zero;
			reg_Negative <= Negative;
			reg_Overflow <= Overflow;
			reg_Output <= Output;
		end
	end
	
endmodule