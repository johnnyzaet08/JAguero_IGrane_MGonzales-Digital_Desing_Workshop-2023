module Experimento_1_TB();

   logic [3:0] input_bin;
   logic [7:0] output_bcd;
	logic [6:0] segments;
	
	Experimento_1 bin_to_bcd(.input_bin(input_bin), .output_bcd(output_bcd), .segments(segments));
	
	initial begin
		input_bin = 4'b0000; #20; //0
		input_bin = 4'b0001; #20; //1
		input_bin = 4'b0010; #20; //2
		input_bin = 4'b0011; #20; //3
		input_bin = 4'b0100; #20; //4
		input_bin = 4'b0101; #20; //5
		input_bin = 4'b0110; #20; //6 
		input_bin = 4'b0111; #20; //7
		input_bin = 4'b1000; #20; //8
		input_bin = 4'b1001; #20; //9
		input_bin = 4'b1010; #20; //10
		input_bin = 4'b1011; #20; //11
		input_bin = 4'b1100; #20; //12
		input_bin = 4'b1101; #20; //13
		input_bin = 4'b1110; #20; //14
		input_bin = 4'b1111; #20; //15
	end	
	
endmodule