module TimeAnalyzer #( parameter N = 4 ) (
	input [N-1:0] A, B,
	input [3:0] Sel,
	input clk, reset,
	output [N-1:0] Output,
	output [3:0] flags_Output
);

	reg [N-1:0] reg_InputA, reg_InputB;
	reg [3:0] reg_InputSel;
	reg [3:0] reg_flagsInput;
	reg [N-1:0] reg_Output;
	
	InputRegister #(.N(N)) InputReg(Sel, A, B, clk, reset, reg_InputA, reg_InputB, reg_InputSel);
	
	/*
	
	Aqui se instancia la ALU con parametro N y pasando los registros creados como inputs y outputs
	
	*/
	
	OutputRegister #(.N(N)) OutputReg(reg_Output, clk, reset, reg_flagsInput[0], reg_flagsInput[1], reg_flagsInput[2], reg_flagsInput[3], Output);
	
endmodule