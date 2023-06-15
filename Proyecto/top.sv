module top ( 
				input logic clk, reset, enabledVGA,
			   output logic Finished, LReset,
			   output wire [7:0] red,
				output wire [7:0] green,
				output wire [7:0] blue,
				output wire hsync,
				output wire vsync
				);

	logic [31:0] PC;
	logic [31:0] Instr, ReadData;
	logic [31:0] WriteData, DataAdr, DataAdrVGA, DataAdrPro;
	logic MemWrite;
	
	logic clk_M;
	logic clk_V;
	logic clk_P;
	logic Finished_aux;
	logic reset_out;
	logic EnabledAddresAux;

	assign clk_M = ~clk;
	assign EnabledAddresAux = enabledVGA & Finished;
	
	logic [1:0] MemorySelector;
	
	logic [31:0] ReadData_1, ReadData_2, ReadData_3;
	logic MemWrite_2, MemWrite_3;
	
	ClockDivider clockToVGA(.refclk(clk), .rst(), .outclk_0(clk_V), .locked());
	ClockDividerProcessor clockToPro(.refclk(clk), .rst(), .outclk_0(clk_P), .locked());
	
	arm arm1(clk_P, reset_out, PC, Instr, MemWrite, DataAdrPro, WriteData, ReadData, MemorySelector, Finished_aux);
	
	flopenr #(1) finish(clk_P, reset, Finished_aux, 1'b1, Finished);
	flipflopen flipflop(clk, reset, Finished, reset_out);
	assign LReset = reset_out;
		
	mux1 mux_readData(ReadData_1, ReadData_2, ReadData_3, MemorySelector, ReadData);
	mux3 mux_memWrite(MemorySelector, MemWrite, MemWrite_2, MemWrite_3);
	mux4 mux_addresMem(EnabledAddresAux, DataAdrVGA, DataAdrPro, DataAdr);

	ROM_Instruction rom_instruction(PC, clk_M, Instr);
	ROM rom(DataAdr, clk_M, ReadData_1);

	RAM_Histogram ramHisto(DataAdr, clk_M, WriteData, MemWrite_2, ReadData_2);
	RAM_Image ramImage(DataAdr, clk_M, WriteData, MemWrite_3, ReadData_3);
	
	VGA_Controller controller(clk_V, reset, ReadData_3, EnabledAddresAux, hsync, vsync, red, green, blue, DataAdrVGA);

endmodule