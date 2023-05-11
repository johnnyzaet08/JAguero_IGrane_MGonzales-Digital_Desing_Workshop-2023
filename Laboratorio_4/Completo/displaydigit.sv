/////////////////////////////////////////////////
// Each digit is 18 pixels wide
// The digits are generated like a 7 segment display
// Input values of 0-9 display a value
// Other input values set to background color
// The area controlled by this digit is 18x42 pixels
/////////////////////////////////////////////////

module displaydigit #(parameter XPOS=0, parameter YPOS=0) (
    input wire [9:0] hc,        //horizontal counter
    input wire [9:0] vc,        //vertical counter
    input wire [3:0] val,       //value of the tile
    output logic [7:0] red_d,	    //red vga output
    output logic [7:0] green_d,     //green vga output
    output logic [7:0] blue_d	    //blue vga output
);

	parameter H_LINE_H = 3;
	parameter W_LINE_H = 18;
	parameter H_LINE_V = 18;
	parameter W_LINE_V = 3;
	parameter H_LINE_C = 4;
	parameter W_LINE_C = 12;

	wire A = val[3];
	wire B = val[2];
	wire C = val[1];
	wire D = val[0];
	
	reg [6:0] segment;
	
	assign segment[0] = ~A&~B&~C&D | ~A&B&~C&~D | A&~B&C&D | A&B&~C&D; 
	assign segment[1] = B&C&~D | A&C&D | A&B&~D | ~A&B&~C&D;
	assign segment[2] = A&B&~D | A&B&C | ~A&~B&C&~D; 
	assign segment[3] = ~B&~C&D | B&C&D | ~A&B&~C&~D | A&~B&C&~D; 
	assign segment[4] = ~A&D | ~B&~C&D | ~A&B&~C; 
	assign segment[5] = ~A&~B&D | ~A&~B&C | ~A&C&D | A&B&~C&D; 
	assign segment[6] = ~A&~B&~C | ~A&B&C&D | A&B&~C&~D; 
	
	always @(*)
		begin
		
			if(vc >= YPOS && vc < YPOS+H_LINE_H && segment[0] == 1'b0)
				begin
					red_d <= 8'h00;
					green_d <= 8'h00;
					blue_d <= 8'h00;
				end
			else if(vc >= YPOS+H_LINE_H && vc < YPOS+H_LINE_H+H_LINE_V)
				begin
					if(hc >= XPOS && hc < XPOS+W_LINE_V && segment[5] == 1'b0)
						begin
							red_d <= 8'h00;
							green_d <= 8'h00;
							blue_d <= 8'h00;
						end
					else if(hc >= XPOS+W_LINE_V && hc < XPOS+W_LINE_V+W_LINE_C && vc >= YPOS+H_LINE_H+16 && segment[6] == 1'b0)
						begin
							red_d <= 8'h00;
							green_d <= 8'h00;
							blue_d <= 8'h00;
						end
					else if(hc >= XPOS+W_LINE_V+W_LINE_C && hc < XPOS+2*W_LINE_V+W_LINE_C && segment[1] == 1'b0)
						begin
							red_d <= 8'h00;
							green_d <= 8'h00;
							blue_d <= 8'h00;
						end
					else
						begin
							red_d <= 8'h61;    // yellow
							green_d <= 8'hB2;
							blue_d <= 8'hF0;
						end
				end
			else if(vc >= YPOS+H_LINE_H+H_LINE_V && vc < YPOS+H_LINE_H+2*H_LINE_V)
				begin
					if(hc >= XPOS && hc < XPOS+W_LINE_V && segment[4] == 1'b0)
						begin
							red_d <= 8'h00;
							green_d <= 8'h00;
							blue_d <= 8'h00;
						end
					else if(hc >= XPOS+W_LINE_V && hc < XPOS+W_LINE_V+W_LINE_C && vc < YPOS+H_LINE_H+18 && segment[6] == 1'b0)
						begin
							red_d <= 8'h00;
							green_d <= 8'h00;
							blue_d <= 8'h00;
						end
					else if(hc >= XPOS+W_LINE_V+W_LINE_C && hc < XPOS+2*W_LINE_V+W_LINE_C && segment[2] == 1'b0)
						begin
							red_d <= 8'h00;
							green_d <= 8'h00;
							blue_d <= 8'h00;
						end
					else
						begin
							red_d <= 8'h61;    // yellow
							green_d <= 8'hB2;
							blue_d <= 8'hF0;
						end
				end
			else if(vc >= YPOS+H_LINE_H+2*H_LINE_V && vc < YPOS+2*H_LINE_H+2*H_LINE_V && segment[3] == 1'b0)
				begin
					red_d <= 8'h00;
					green_d <= 8'h00;
					blue_d <= 8'h00;
				end
			else
				begin
					red_d <= 8'h61;    // yellow
					green_d <= 8'hB2;
					blue_d <= 8'hF0;
				end
		
		end

endmodule 