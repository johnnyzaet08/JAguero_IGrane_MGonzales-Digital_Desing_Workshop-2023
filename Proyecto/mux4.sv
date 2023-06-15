module mux4 (
  input logic AddressSelector,
  input logic [31:0] Address_1,
  input logic [31:0] Address_2,
  output logic [31:0] Address_out
);
  
  always @(*)
		if (AddressSelector) Address_out <= Address_1;
		else 		  Address_out <= Address_2;

endmodule