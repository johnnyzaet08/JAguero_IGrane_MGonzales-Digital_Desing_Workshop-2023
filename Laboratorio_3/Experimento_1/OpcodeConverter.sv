module OpcodeConverter(
  input [3:0] opcode,
  output [3:0] func
);

  assign func = opcode;

endmodule