module mux1 (
  input logic [31:0] ReadData_1, ReadData_2, ReadData_3,
  input logic [1:0] MemorySelector,
  output logic [31:0] ReadData
);
  logic [31:0] temp_ReadData;

  always_comb begin
    case (MemorySelector)
      2'b00: temp_ReadData = ReadData_1;
      2'b01: temp_ReadData = ReadData_2;
      2'b10: temp_ReadData = ReadData_3;
      default: temp_ReadData = 32'b0; // Optional: Handle uninitialized case
    endcase
  end

  assign ReadData = temp_ReadData;

endmodule