module top(input logic 			 clk, reset,
			  output logic [31:0] WriteData, DataAdr,
			  output logic 		 MemWrite);

	logic [31:0] PC, Instr, ReadData;
	
	arm arm(clk, reset, PC, Instr, MemWrite, DataAdr, WriteData, ReadData);
	imem imem(PC, Instr);
	dmem dmen(clk, MemWrite, DataAdr, WriteData, ReadData);


endmodule