module alu #( parameter M = 32 ) (
	input logic [M-1:0] A, B, // ALU N-bit inputs
	
	input logic [3:0] ALU_Sel, // ALU 3-bit selector

	output logic [M-1:0] ALU_Out,
	
	output logic [3:0] Alu_Flags
	
);
	
	reg[M-1:0] mult_aux;
	logic[M-1:0] sum;
	logic[M-1:0] subs;
	logic[2*M-1:0] mult;
	logic[M-1:0] div;
	logic[M-1:0] mo;
	logic[M-1:0] and_;
	logic[M-1:0] or_;
	logic[M-1:0] xor_;
	logic[M-1:0] shift_l;
	logic[M-1:0] shift_r;
	
	Multiplexor #(.N(M)) mux_1 (sum, subs, mult, div, mo, and_, or_, xor_, shift_l, shift_r, ALU_Sel, ALU_Out, mult_aux); //Change ALU_Sel to oper_aux for testbech and implementation in FPGA
	
	full_adder #(.N(M)) adder (A, B, 1'b0, sum, Alu_Flags[1]);
	substractor #(.N(M)) tractor (A, B, subs, Alu_Flags[3]);
	multiplier #(.N(M)) multip (A, B, mult, Alu_Flags[0]);
	
	divider #(.N(M)) divid (A, B, div, Alu_Flags[2]);
	mod #(.N(M)) moder (A, B, mo);
	
	and_gate #(.N(M)) agate(A, B, and_);
	or_gate #(.N(M)) ogate(A, B, or_);
	xor_gate #(.N(M)) xgate(A, B, xor_);
	
	//shifting shiftlft(A, 0, shift_l);
	//shifting shiftrght(A, 1, shift_r);
	


endmodule
