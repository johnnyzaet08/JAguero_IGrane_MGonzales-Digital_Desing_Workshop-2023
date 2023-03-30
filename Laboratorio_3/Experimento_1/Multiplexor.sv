module Multiplexor #(parameter N=4)
	(
	input logic trigger,
	input logic reset,
	input [N-1:0] out_suma, 
	input [N-1:0] out_subs, 
	input [2*N-1:0] out_mult, 
	input [N-1:0] out_div,
	input [N-1:0] out_mod, 
	input [N-1:0] out_and, 
	input [N-1:0] out_or, 
	input [N-1:0] out_xor, 
	input [N-1:0] out_shift_l,
	input [N-1:0] out_shift_r, 
	input [3:0] select,
	output [N-1:0] out,
	output [N-1:0] outaux
	);

	logic [N-1:0] out_alu;
	logic [N-1:0] out_alu_aux;
	int i;
	
always @ (posedge trigger or posedge reset) begin
	if(trigger == 1'b1) begin
				
		out_alu_aux <= '0;
	
		 case (select)
			  4'b0000: out_alu = out_suma;
			  4'b0001: out_alu = out_subs;
			  4'b0010: begin
							out_alu = out_mult[N-1:0];
							out_alu_aux <= out_mult[2*N-1:N];
						  end
			  4'b0011: out_alu = out_div;
			  4'b0100: out_alu = out_mod;
			  4'b0101: out_alu = out_and;
			  4'b0110: out_alu = out_or;
			  4'b0111: out_alu = out_xor;
			  4'b1000: out_alu = out_shift_l;
			  4'b1001: out_alu = out_shift_r;
			  default: out_alu = out_suma;
		 endcase
		 
	end
	if(reset) begin
		
		out_alu = 0;
		out_alu_aux <= 0;
		
	end
end

assign out = out_alu;
assign outaux = out_alu_aux;

endmodule