`timescale 1ns/1ps

module testbench();
	logic 		 clk;
	logic			 clk_M;
	logic 		 reset;
	
	// Instantiate top
	top dut(clk, clk_M, reset);
	
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
		clk <= 0;
		#10;
		clk <= 1;
		#10;
	end
	
	// Clock Memory to sequence tests
	always
	begin
		clk_M <= 0;
		#5;
		clk_M <= 1;
		#5;
	end

	
endmodule