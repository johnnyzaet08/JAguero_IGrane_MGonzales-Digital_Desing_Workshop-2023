module top(input logic clk, clk_M, reset);

	logic [31:0] PC;
	logic [31:0] Instr, ReadData;
	logic [31:0] WriteData, DataAdr;
	logic MemWrite;

	logic [1:0] MemorySelector;
	
	logic [31:0] ReadData_1, ReadData_2, ReadData_3;
	logic MemWrite_2, MemWrite_3;
	
	arm arm1(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData, MemorySelector);
	
	ROM_Instruction rom_instruction(PC, clk_M, Instr);
	
	mux1 mux_readData(ReadData_1, ReadData_2, ReadData_3, MemorySelector, ReadData);
	mux3 mux_memWrite(MemorySelector, MemWrite, MemWrite_2, MemWrite_3);
	
	
	ROM rom(DataAdr, clk_M, ReadData_1);

	RAM_Histogram ramHisto(DataAdr, clk_M, WriteData, MemWrite_2, ReadData_2);
	RAM_Image ramImage(DataAdr, clk_M, WriteData, MemWrite_3, ReadData_3);

endmodule