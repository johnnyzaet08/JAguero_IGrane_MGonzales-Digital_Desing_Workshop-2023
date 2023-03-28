module Opcode(
  input push_button,
  output reg switch_state
);

  always @ (posedge push_button)
    switch_state <= ~switch_state;

endmodule