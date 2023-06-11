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
				case (Funct[4:1])
					4'b0100: ALUControl = 4'b0000; // ADD
					4'b0010: ALUControl = 4'b0001; // SUB
					4'b0000: ALUControl = 4'b0010; // AND
					4'b1100: ALUControl = 4'b0011; // ORR
					4'b0001: ALUControl = 4'b0100; // EOR
					4'b1101: ALUControl = 4'b0101; // MOV
					4'b1010: ALUControl = 4'b0110; // CMP

					4'b0101: ALUControl = 4'b1000; // LDR
					4'b0110: ALUControl = 4'b1001; // STR
					4'b1000: ALUControl = 4'b1010; // LDMm
					4'b1001: ALUControl = 4'b1011; // STM

					4'b1010: ALUControl = 4'b1100; // B
					4'b1011: ALUControl = 4'b1101; // BL
					4'b0100: ALUControl = 4'b1110; // BX

					default: ALUControl = 4'bx;  // Opcode not implemented
				endcase

				
				FlagW[1] = Funct[0];
				FlagW[0] = Funct[0] & (ALUControl == 4'b0000 | ALUControl == 4'b0001);
				
			end else begin
				ALUControl = 4'b0000;
				FlagW		  = 2'b00;
			end
			
			assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule