module extend(input logic  [23:0] Instr,
				  input logic  [1:0]  ImmSrc,
				  output logic [31:0] ExtImm,
				  output logic [1:0]  MemorySelector
				  );
				  

		always_comb begin
			case(ImmSrc)
				
				2'b00: ExtImm = {20'b0, Instr[11:0]}; // 8 Bit
				
				2'b01: begin
							if(Instr[1:0] == 2'b01 | Instr[1:0] == 2'b10)
								ExtImm = {{22{1'b0}}, Instr[11:2]}; // 12 bit
							else 
								ExtImm = {{20{1'b0}}, Instr[11:0]}; // 12 bit
						 end
							
				2'b10: ExtImm = {{6{Instr[23]}}, Instr[23:0], 2'b00}; // 24 bit
				
				default: ExtImm = 32'bx;
			endcase
		end
		
		always_comb begin
			 if (ImmSrc == 2'b01)
					MemorySelector = Instr[1:0];
			 else
				MemorySelector = 2'b0;
	   end
endmodule