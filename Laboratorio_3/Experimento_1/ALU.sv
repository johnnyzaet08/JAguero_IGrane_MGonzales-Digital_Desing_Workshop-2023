module ALU #(
 parameter N = 4, // Bit width of inputs and output
) (
 input [N-1:0] A, B, // ALU N-bit inputs
 input [3:0] ALU_Sel, // ALU 3-bit selector
 
 output [N-1:0] ALU_Out, // ALU N-bit output
 output CarryOut // ALU carry out flag
 output Zero // ALU zero out flag
 output Negative // ALU Negative out flag
 output Overflow // ALU overflow out flag

 
);


endmodule


