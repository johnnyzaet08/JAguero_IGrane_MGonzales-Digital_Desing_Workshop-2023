`timescale 1ns/1ps

module Experimento_3_TB;


parameter CLK = 10; 

	reg clk;
	reg reset;
	wire [1:0] cdO_2bits;
	wire [3:0] cdO_4bits;
	wire [5:0] cdO_6bits;
	wire [6:0] display1;
	wire [6:0] display2;


	Experimento_3 #(.N(2)) cd_2bits
	
	(
	  .clk(clk),
	  .reset(reset),
	  .display1(display1),
	  .display2(display2)
	);
	
	Experimento_3 #(.N(4)) cd_4bits
	
	(
	  .clk(clk),
	  .reset(reset),
	  .display1(display1),
	  .display2(display2)
	);

	Experimento_3 #(.N(6)) cd_6bits
	
	(
	  .clk(clk),
	  .reset(reset),
	  .display1(display1),
	  .display2(display2)
	);

	initial begin
	
		$display("Testing countdown timers...");
		clk = 1'b0;
		reset = 1'b0;
		
		repeat (120) begin
			  #5 clk = !clk;
		end

		#10;
		
		$display("activating reset...");
		reset = 1'b1;
		
		assert (cdO_2bits === 3) else $error ("2-bit countdown reset failed!!!!");
		assert (cdO_4bits === 15) else $error ("4-bit countdown reset failed!!!!");
		assert (cdO_6bits === 63) else $error ("6-bit countdown reset failed!!!!");
		
		repeat (20) begin
			  #5 clk = !clk;
		end
		
		#5;
		
		$display("Countdown timer test finished!");
	

	end

endmodule