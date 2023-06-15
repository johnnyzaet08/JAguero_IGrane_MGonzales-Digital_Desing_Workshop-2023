`timescale 1ns/1ps

module testbench();
	logic 		 clk;
	logic 		 reset;
	logic			 enabledVGA;
	
	// Instantiate top
	top dut(clk, reset, enabledVGA);
	
	// Initialize
	initial
	begin
		reset <= 1;
		enabledVGA <= 0;
		#50;
		reset <= 0;
		enabledVGA <= 1;
	end
	
	// Clock to sequence tests
	always
	begin
		clk <= 1;
		#10;
		clk <= 0;
		#10;
	end
	
	
endmodule