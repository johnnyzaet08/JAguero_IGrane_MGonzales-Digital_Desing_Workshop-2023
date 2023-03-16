module Experimento_1(input [3:0] input_bin,
					output logic [7:0] output_bcd,
					output logic [6:0] segments);
   
	integer i;
		
	always @(input_bin) begin
		 output_bcd = 0;
		 segments = 0;
		
		//Se itera una vez por cada bit de entrada	
		 for (i = 0; i < 4; i = i+1) begin	
				
				//Si cada digito BCD es mayor o igual a 5, se suman 3 (double-dabble)
				if (output_bcd[3:0] >= 5) output_bcd[3:0] = output_bcd[3:0] + 3;		
				if (output_bcd[7:4] >= 5) output_bcd[7:4] = output_bcd[7:4] + 3;
				
				//Se realiza un corrimiento de 1 bit
				output_bcd = {output_bcd[6:0],input_bin[3-i]};				 
		 end
		
		case (output_bcd)
		  8'b0000_0000 : segments = 7'b0000001; //0
		  8'b0000_0001 : segments = 7'b1001111; //1
		  8'b0000_0010 : segments = 7'b0010010; //2
		  8'b0000_0011 : segments = 7'b0000110; //3
		  8'b0000_0100 : segments = 7'b1001100; //4 
		  8'b0000_0101 : segments = 7'b0100100; //5
		  8'b0000_0110 : segments = 7'b0100000; //6
		  8'b0000_0111 : segments = 7'b0001111; //7
		  8'b0000_1000 : segments = 7'b0000000; //8
		  8'b0000_1001 : segments = 7'b0000100; //9
		  8'b0001_0000 : segments = 7'b0001000; //10 - A
		  8'b0001_0001 : segments = 7'b1100000; //11 - B
		  8'b0001_0010 : segments = 7'b0110001; //12 - C
		  8'b0001_0011 : segments = 7'b1000010; //13 - D
		  8'b0001_0100 : segments = 7'b0110000; //14 - E
		  8'b0001_0101 : segments = 7'b0111000; //15 - F
		  default: segments = 7'b1111111; //off
		endcase 
		 
	end
endmodule