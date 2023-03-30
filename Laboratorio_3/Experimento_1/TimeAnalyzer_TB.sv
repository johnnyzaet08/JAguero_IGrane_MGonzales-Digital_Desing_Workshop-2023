module TimeAnalyzer_TB;

	parameter N = 4;

	logic clk, reset;
	logic [N-1:0] A, B, Output;
	logic [3:0] Sel, flags_Output;
	
	TimeAnalyzer #(.N(4)) timeAnalyzer(A, B, Sel, clk, reset, Output, flags_Output);
	
	initial begin
	A = 3;
	B = 2;
	clk = 1; #10; Sel = 0; #10; clk = 0; #10;
	clk = 1; #5; Sel = 1; #5; clk = 0; #5;
	clk = 1; #5; Sel = 3; #5; clk = 0; #5;
	clk = 1; #5; Sel = 1; #5; clk = 0; #5;
	clk = 1; #5; Sel = 5; #5; clk = 0; #5;
	clk = 1; #5; Sel = 1; #5; clk = 0; #5;
	clk = 1; #5; Sel = 7; #5; clk = 0; #5;
	clk = 1; #5; Sel = 1; #5; clk = 0; #5;
	clk = 1; #5; Sel = 9; #5; clk = 0; #5;
	clk = 1; #5; Sel = 1; #5; clk = 0; #5;
	
	end

endmodule