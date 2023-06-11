module mux3 (
  input logic [1:0] MemorySelector,
  input logic MemWrite,
  output logic MemWrite_2,
  output logic MemWrite_3
);
  logic temp_MemWrite_2;
  logic temp_MemWrite_3;

  always_comb begin
    temp_MemWrite_2 = 1'b0;  // Default assignment
    temp_MemWrite_3 = 1'b0;  // Default assignment

    case (MemorySelector)
      2'b01: temp_MemWrite_2 = MemWrite;
      2'b10: temp_MemWrite_3 = MemWrite;
      default: begin
        temp_MemWrite_2 = 1'b0;
        temp_MemWrite_3 = 1'b0;
      end
    endcase
  end

  assign MemWrite_2 = temp_MemWrite_2;
  assign MemWrite_3 = temp_MemWrite_3;

endmodule
