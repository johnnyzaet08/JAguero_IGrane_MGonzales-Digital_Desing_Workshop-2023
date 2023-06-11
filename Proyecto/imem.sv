module imem(input  logic [15:0] a,
				output logic [31:0] rd); // Instruction memory

	logic [15:0] RAM[63:0];
	
	initial
		$readmemh("C:/Users/Profesor/Downloads/JAguero_IGrane_MGonzales-Digital_Desing_Workshop-2023-develop_ignacio/JAguero_IGrane_MGonzales-Digital_Desing_Workshop-2023-develop_ignacio/Proyecto/memfiletwo.dat", RAM);
	
	assign rd = RAM[a[15:2]]; // word aligned
				
endmodule