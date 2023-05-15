module decoder(input logic  [1:0] Op,
					input logic  [5:0] Funct,
					input logic  [3:0] Rd,
					output logic [1:0] FlagW,
					output logic 		 PCS, RegW, MemW,
					output logic 		 MemToReg, ALUSrc,
					output logic [1:0] ImmSrc, RegSrc, ALUControl
					);
					
		logic [9:0] controls;
		logic 		Branch, ALUOp;
		
		always_comb
			casex(Op)
				2'b00: if (Funct[5]) controls = 10'b0000101001;
						
						 else				controls = 10'b0000001001;
						 
				2'b01: if (Funct[0]) controls = 10'b0001111000;
					
						 else				controls = 10'b1001110100;
						 
				2'b10: 					controls = 10'b0110100010;
				
				default:					controls = 10'bx;
			endcase
			
		assign {RegSrc, ImmSrc, ALUSrc, MemToReg, RegW, MemW, Branch, ALUOp} = controls;
		
		// Decode ALU /* Must change to implement OUR OWN ALU */
		always_comb
			if (ALUOp) begin
				case(Funct[4:1])
					4'b0100: ALUControl = 2'b00; // ADD
					4'b0010: ALUControl = 2'b01; // SUB
					4'b0000: ALUControl = 2'b10; // AND
					4'b1100: ALUControl = 2'b11; // OR
					default: ALUControl = 2'bx;  // No implementado
				endcase
				
				FlagW[1] = Funct[0];
				FlagW[0] = Funct[0] & (ALUControl == 2'b00 | ALUControl == 2'b01);
				
			end else begin
				ALUControl = 2'b00;
				FlagW		  = 2'b00;
			end
			
			assign PCS = ((Rd == 4'b1111) & RegW) | Branch;
endmodule