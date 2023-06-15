module arm(input 	logic 		 clk, reset,
			  output logic [31:0] PC,
			  input  logic [31:0] Instr,
			  output logic 		 MemWrite,
			  output logic [31:0] ALUResult, WriteData,
			  input  logic [31:0] ReadData,
			  output logic [1:0]  MemorySelector,
			  output logic 		 Finished
			  );
			  
	logic [3:0] ALUFlags;
	logic 		RegWrite, ALUSrc, MemToReg, PCSrc;
	logic [1:0] RegSrc, ImmSrc;
	logic [3:0] ALUControl;
	
	controller c(clk, reset, Instr[31:12], ALUFlags, RegSrc, RegWrite,
					 ImmSrc, ALUSrc, ALUControl, MemWrite, MemToReg, PCSrc);
	
	datapath dp(clk, reset, RegSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemToReg, 
					PCSrc, ALUFlags, PC, Instr, ALUResult, WriteData, ReadData, MemorySelector, Finished);


endmodule