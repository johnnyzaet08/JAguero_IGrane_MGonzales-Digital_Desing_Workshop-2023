module flipflopen (
	input logic clk_P,
	input logic reset,
	input logic reset_aux,
	output logic reset_out
);

	always_ff @(posedge clk_P) begin
		if (reset & reset_aux)
			reset_out = 1'b0;
		else if (reset)
			reset_out = 1'b1;
		else if (reset_aux)
			reset_out = 1'b1;
		else
			reset_out = 1'b0;
	end

endmodule
