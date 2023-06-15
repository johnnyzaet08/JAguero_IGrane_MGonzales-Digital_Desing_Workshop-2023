module DividerClock (
  input logic clk,      // Input clock
  input logic reset,    // Reset signal
  output logic clk_out  // Output divided clock
);

  // Internal signal for output clock
  logic clk_out_internal;
  logic clk_aux;

  // Divide the clock by 2
  always @(posedge clk or posedge reset) begin
    if (reset)
      clk_out_internal <= 0;
    else
      clk_out_internal <= ~clk_out_internal;
  end

  // Synchronize the output clock with the main clock
  always @(posedge clk or posedge reset) begin
    if (reset)
      clk_aux <= 0;
    else
      clk_aux <= clk_out_internal;
  end
  
  assign clk_out = clk_aux;
  
endmodule
