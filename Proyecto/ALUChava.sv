module ALUChava(input logic [31:0] A,
           input logic [31:0] B,
           input logic [3:0] ALUControl,
           output logic [3:0] ALUFlags,
           output logic [31:0] Result);

    always_comb begin
        case (ALUControl)
            4'b0000: begin  // ADD
                Result = A + B;
                ALUFlags = {Result[31], Result == 0, Result < A, (A[31] == B[31]) && (Result[31] != A[31])};
            end
            4'b0001: begin  // SUB
                Result = A - B;
                ALUFlags = {Result[31], Result == 0, A < B, (A[31] != B[31]) && (Result[31] != A[31])};
            end
            4'b0010: begin  // AND
                Result = A & B;
                ALUFlags = {Result[31], Result == 0, ALUFlags[2], ALUFlags[3]};
            end
            4'b0011: begin  // ORR
                Result = A | B;
                ALUFlags = {Result[31], Result == 0, ALUFlags[2], ALUFlags[3]};
            end
            4'b0100: begin  // EOR
                Result = A ^ B;
                ALUFlags = {Result[31], Result == 0, ALUFlags[2], ALUFlags[3]};
            end
            4'b0101: begin  // MOV
                Result = B;
                ALUFlags = {Result[31], Result == 0, ALUFlags[2], ALUFlags[3]};
            end
            4'b0110: begin  // CMP
                Result = A - B;
                ALUFlags = {Result[31], Result == 0, A < B, (A[31] != B[31]) && (Result[31] != A[31])};
            end
            4'b1000: begin  // LDR
                Result = A + B;
                ALUFlags = {Result[31], Result == 0, Result < A, (A[31] == B[31]) && (Result[31] != A[31])};
            end
            4'b1001: begin  // STR
                Result = A + B;
                ALUFlags = {ALUFlags[0], ALUFlags[1], ALUFlags[2], ALUFlags[3]};
            end
            4'b1010: begin  // LDMm
                Result = A + B;
                ALUFlags = {Result[31], Result == 0, Result < A, (A[31] == B[31]) && (Result[31] != A[31])};
            end
            default: begin  // Opcode not implemented
                Result = 32'bx;
                ALUFlags = 4'b0000;
            end
        endcase
    end

endmodule
