`timescale 1ns/1ps

module testbench();
	logic 		 clk;
	logic 		 reset;
	
	// Instantiate top
	top dut(clk, reset);
	
	// Initialize
	initial
	begin
		reset <= 1;
		#22;
		reset <= 0;
	end
	
	// Clock to sequence tests
	always
	begin
		clk <= 1;
		#5;
		clk <= 0;
		#5;
	end

	
endmodule