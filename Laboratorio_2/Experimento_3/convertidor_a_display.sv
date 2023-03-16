module convertidor_a_display (
	input A, B, C, D, 
	output [6:0] segmento
);

	assign segmento[0] = ~A&~B&~C&D | ~A&B&~C&~D | A&~B&C&D | A&B&~C&D; 
	assign segmento[1] = B&C&~D | A&C&D | A&B&~D | ~A&B&~C&D;
	assign segmento[2] = A&B&~D | A&B&C | ~A&~B&C&~D; 
	assign segmento[3] = ~B&~C&D | B&C&D | ~A&B&~C&~D | A&~B&C&~D; 
	assign segmento[4] = ~A&D | ~B&~C&D | ~A&B&~C; 
	assign segmento[5] = ~A&~B&D | ~A&~B&C | ~A&C&D | A&B&~C&D; 
	assign segmento[6] = ~A&~B&~C | ~A&B&C&D | A&B&~C&~D; 

endmodule 