module decoder(input logic  [1:0] Op,
					input logic  [5:0] Funct,
					input logic  [3:0] Rd,
					output logic [1:0] FlagW,
					output logic 		 PCS, RegW, MemW,
					output logic 		 MemToReg, ALUSrc,
					output logic [1:0] ImmSrc, RegSrc,
					output logic [3:0] ALUControl
					);
					
		logic [9:0] controls;
		logic 		Branch, ALUOp;
		
		always_comb
			casex(Op)
															//Data-Processing immediate
				2'b00: if (Funct[5]) controls = 10'b0000101001;
						
															//Data-Processing register
						 else				controls = 10'b0000001001;
						 
															//LDR
				2'b01: if (Funct[0]) controls = 10'b0001111000;
					
															// STR
						 else				controls = 10'b1001110100;
						 
															// B
				2'b10: 					controls = 10'b0110100010;
				
															// Unimplemented
				default:					controls = 10'bx;
			endcase
			
		assign {RegSrc, ImmSrc, ALUSrc, MemToReg, RegW, MemW, Branch, ALUOp} = controls;
		
		// Decode ALU /* Must change to implement OUR OWN ALU */
		always_comb
			if (ALUOp) begin
				case(Funct[4:1])
					4'b0100: ALUControl = 4'b0000; // ADD
					4'b0010: ALUControl = 4'b0001; // SUB
					4'b0000: ALUControl = 4'b0010; // AND
					4'b1100: ALUControl = 4'b0011; // OR
					default: ALUControl = 4'bx;  // No implementado
				endcase
				
				FlagW[1] = Funct[0];
				FlagW[0] = Funct[0] & (ALUControl == 4'b0000 | ALUControl == 4'b0001);
				
			end else begin
				ALUControl = 4'b0000;
				FlagW		  = 2'b00;
			end
			
			assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule