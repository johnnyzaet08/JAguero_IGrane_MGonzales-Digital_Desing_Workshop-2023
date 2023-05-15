module arm(input 	logic 		 clk, reset,
			  output logic [31:0] PC,
			  input  logic [31:0] Instr,
			  output logic 		 MemWrite,
			  output logic 		 AluResult, WriteData,
			  input  logic [31:0] ReadData
			  );
			  
	logic [3:0] ALUFlags;
	logic 		RegWrite, ALUSrc, MemToReg, PCSrc;
	logic [1:0] RegSrc, ImmSrc, ALUControl;
	
	controller c(clk, reset, Instr[31:12], ALUFlags, RegSrc, RegWriteRegWrite,
					 ImmSrc, ALUSrc, ALUControl, MemWrite, MemToReg, PCSrc);
	
	//datapath dp(clk, reset, RegSrc, RegWrite, ImmSrc, ALUSrc, ALUControl, MemToReg, 
	//				OCSrc, ALUFlags, PC, Instr, ALUResult, WriteData, ReadData);


endmodule