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
	reg[M-1:0] mult_aux;
	
	
	wire[M-1:0] sum;
	wire[M-1:0] subs;
	wire[2*M-1:0] mult;
	wire[M-1:0] div;
	wire[M-1:0] mod;
	wire[M-1:0] and_;
	wire[M-1:0] or_;
	wire[M-1:0] xor_;
	wire[M-1:0] shift_l;
	wire[M-1:0] shift_r;
	
		
	Opcode opcode0 (ALU_Sel[0], oper_aux[0]);
	Opcode opcode1 (ALU_Sel[1], oper_aux[1]);
	Opcode opcode2 (ALU_Sel[2], oper_aux[2]);
	Opcode opcode3 (ALU_Sel[3], oper_aux[3]);
	
	OpcodeConverter opcodeconverter (oper_aux, oper);
	
	Multiplexor mux_1 (trigger, reset, sum, subs, mult, div, mod, and_, or_, xor_, shift_l, shift_r, oper_aux, ALU_Out, mult_aux);
	
	full_adder #(.N(M)) adder (A, B, 1'b0, sum, CarryOut);
	and_gate #(.N(M)) agate (A, B, and_);
	substractor #(.N(M)) tractor (A, B, subs);
	multiplier #(.N(M)) multip (A, B, mult, Overflow);

	DisplayConverter converter1(ALU_Out[3:0], display1);
	DisplayConverter converter2 (mult_aux[3:0], display2);


endmodule
