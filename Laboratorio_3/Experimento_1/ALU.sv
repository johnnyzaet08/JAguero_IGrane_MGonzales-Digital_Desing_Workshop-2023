module ALU #( parameter M = 4 ) (
	input [M-1:0] A, B, // ALU N-bit inputs
	input [3:0] ALU_Sel, // ALU 3-bit selector
	input logic trigger,
	input logic reset,

	output CarryOut, // ALU carry out flag
	output Zero, // ALU zero out flag
	output Negative, // ALU Negative out flag
	output Overflow, // ALU overflow out flag
	
	output [6:0] display1, //Output display1
	output [6:0] display2, //Output display2
	
	output [3:0] oper
 
);
	
	reg[3:0] oper_aux;
	reg[M-1:0] ALU_Out;
		
	Opcode opcode0 (ALU_Sel[0], oper_aux[0]);
	Opcode opcode1 (ALU_Sel[1], oper_aux[1]);
	Opcode opcode2 (ALU_Sel[2], oper_aux[2]);
	Opcode opcode3 (ALU_Sel[3], oper_aux[3]);
	
	OpcodeConverter opcodeconverter (oper_aux, oper);
	
	full_adder #(.N(M)) adder (A, B, 1'b0, ALU_Out, CarryOut);

	//DisplayConverter converter1 (oper_aux, display1);
	DisplayConverter converter1(ALU_Out[3:0], display1);
	//DisplayConverter converter2 (ALU_Out[7:4], display2);


endmodule
