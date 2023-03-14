`timescale 1ns/1ps

module Experimento_3 #( parameter N = 6 ) (
	input logic clk, 
	input logic reset,
	output logic [6:0] display1, 
	output logic [6:0] display2
);

	

	reg[N-1:0] contador;
	reg[N-1:0] contador_temp = (2**N) - 1;
	
	convertidor_a_display convertidor1(contador[3], contador[2], contador[1], contador[0], display1);
	convertidor_a_display convertidor2(1'b0, 1'b0, contador[5], contador[4], display2);
		
	
	always @(posedge clk or posedge reset)
		begin
			if (reset)
				begin
					contador_temp = (2**N) - 1;
					contador = contador_temp;
				end
			else
				begin
					if (contador_temp == 0)
						begin
							contador_temp = (2**N) - 1;
							contador = contador_temp;
						end
					else
						begin
							contador_temp = contador_temp - 1;
							contador = contador_temp;
						end
				end
		end
		
endmodule