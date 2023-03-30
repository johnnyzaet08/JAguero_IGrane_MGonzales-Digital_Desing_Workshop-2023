module DisplayConverter (
	input [3:0] number, 
	output [6:0] segment
);

	assign A = number[3];
	assign B = number[2];
	assign C = number[1];
	assign D = number[0];

	assign segment[0] = ~A&~B&~C&D | ~A&B&~C&~D | A&~B&C&D | A&B&~C&D; 
	assign segment[1] = B&C&~D | A&C&D | A&B&~D | ~A&B&~C&D;
	assign segment[2] = A&B&~D | A&B&C | ~A&~B&C&~D; 
	assign segment[3] = ~B&~C&D | B&C&D | ~A&B&~C&~D | A&~B&C&~D; 
	assign segment[4] = ~A&D | ~B&~C&D | ~A&B&~C; 
	assign segment[5] = ~A&~B&D | ~A&~B&C | ~A&C&D | A&B&~C&D; 
	assign segment[6] = ~A&~B&~C | ~A&B&C&D | A&B&~C&~D; 

endmodule 