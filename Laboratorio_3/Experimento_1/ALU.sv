module ALU #( parameter N = 4 ) (
	input [N-1:0] A, B, // ALU N-bit inputs
	input [3:0] ALU_Sel, // ALU 3-bit selector
	input logic trigger,

	output [N-1:0] ALU_Out, // ALU N-bit output
	output CarryOut, // ALU carry out flag
	output Zero, // ALU zero out flag
	output Negative, // ALU Negative out flag
	output Overflow, // ALU overflow out flag
	
	
	output [6:0] display1, //Output display1
	output [6:0] display2, //Output display2
	output [6:0] display3, //Output display3
	
	output [3:0] oper
 
);
	
	reg[3:0] oper_aux;
		
	Opcode opcode0 (ALU_Sel[0], oper_aux[0]);
	Opcode opcode1 (ALU_Sel[1], oper_aux[1]);
	Opcode opcode2 (ALU_Sel[2], oper_aux[2]);
	Opcode opcode3 (ALU_Sel[3], oper_aux[3]);
	
	OpcodeConverter opcodeconverter (oper_aux, oper);
	

	//DisplayConverter converter(oper[3], oper[2], oper[1] oper[0], display1);


endmodule
