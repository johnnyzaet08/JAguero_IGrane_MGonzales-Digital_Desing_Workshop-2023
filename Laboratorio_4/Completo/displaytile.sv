module displaytile #(parameter XIDX=0, parameter YIDX=0) (
	 input wire [3:0] val,   			//power of 2 of the tile's value
    input wire [9:0] counter_x,    	//horizontal counter
    input wire [9:0] counter_y,    	//vertical counter
    output wire [7:0] red_t,				//red vga output
    output wire [7:0] green_t,			//green vga output
    output wire [7:0] blue_t				//blue vga output
);

	///////// POSITIONING LOGIC /////////
    parameter TILE_LEN = 117;   	
	 parameter LINE_LEN = 3;
	 
    parameter OUTER_PADX = 214;   	
	 parameter OUTER_PADY = 35;

    parameter LEFT_PAD_D = 18;    	// edge of tile to start of numbers
    parameter TOP_PAD_D = 37;     	// top of tile to start of numbers
    parameter DIGIT_LEN_X = 18; 	// digit length - horizontal
	 parameter DIGIT_LEN_Y = 42; 	// digit length - vertical
	 parameter PAD_DIGITS = 3; 		// pad between digits
		

	// Calculate pixel location of top left corner
    parameter xpos = OUTER_PADX + XIDX * TILE_LEN + XIDX * LINE_LEN; 	// start of leftmost digit
    parameter ypos = OUTER_PADY + YIDX * TILE_LEN + YIDX * LINE_LEN;   				// top location of digits

	 reg [3:0] ones, tens, hundreds, thousands;
	 
	 wire [7:0] red1, red2, red3, red4;
    wire [7:0] green1, green2, green3, green4;
    wire [7:0] blue1, blue2, blue3, blue4;
	 
	always @ (*)
		begin
				
			case(val)
			 0: begin
				 ones = 4'b1111;
				 tens = 4'b1111;
				 hundreds = 4'b1111;
				 thousands = 4'b1111;
			 end
			 1: begin
				 ones = 4'd2;
				 tens = 4'b1111;
				 hundreds = 4'b1111;
				 thousands = 4'b1111;
			 end
			 2: begin
				 ones = 4'd4;
				 tens = 4'b1111;
				 hundreds = 4'b1111;
				 thousands = 4'b1111;
			 end
			 3: begin
				 ones = 4'd8;
				 tens = 4'b1111;
				 hundreds = 4'b1111;
				 thousands = 4'b1111;
			 end
			 4: begin
				 ones = 4'd6;
				 tens = 4'd1;
				 hundreds = 4'b1111;
				 thousands = 4'b1111;
			 end
			 5: begin
				 ones = 4'd2;
				 tens = 4'd3;
				 hundreds = 4'b1111;
				 thousands = 4'b1111;
			 end
			 6: begin
				 ones = 4'd4;
				 tens = 4'd6;
				 hundreds = 4'b1111;
				 thousands = 4'b1111;
			 end
			 7: begin
				 ones = 4'd8;
				 tens = 4'd2;
				 hundreds = 4'd1;
				 thousands = 4'b1111;
			 end
			 8: begin
				 ones = 4'd6;
				 tens = 4'd5;
				 hundreds = 4'd2;
				 thousands = 4'b1111;
			 end
			 9: begin
				 ones = 4'd2;
				 tens = 4'd1;
				 hundreds = 4'd5;
				 thousands = 4'b1111;
			 end
			 10: begin
				 ones = 4'd4;
				 tens = 4'd2;
				 hundreds = 4'd0;
				 thousands = 4'd1;
			 end
			 11: begin
				 ones = 4'd8;
				 tens = 4'd4;
				 hundreds = 4'd0;
				 thousands = 4'd2;
			 end
			 12: begin
				 ones = 4'd6;
				 tens = 4'd9;
				 hundreds = 4'd0;
				 thousands = 4'd4;
			 end
			 13: begin
				 ones = 4'd2;
				 tens = 4'd9;
				 hundreds = 4'd1;
				 thousands = 4'd8;
			 end
			 default: begin
				 ones = 4'b1111;
				 tens = 4'b1111;
				 hundreds = 4'b1111;
				 thousands = 4'b1111;
			 end
        endcase
		  
		  if (counter_y >= ypos && counter_y < ypos+TILE_LEN)
				begin
					if (counter_x >= xpos && counter_x < xpos+TILE_LEN)
						begin
							if (counter_y >= ypos+TOP_PAD_D && counter_y < ypos+TOP_PAD_D+DIGIT_LEN_Y)
								begin
									if(counter_x >= xpos+LEFT_PAD_D && counter_x < xpos+LEFT_PAD_D+DIGIT_LEN_X && thousands != 4'b1111) 
										begin
											red_t <= red4;    // thousands 7 segments number
											green_t <= green4;
											blue_t <= blue4;
										end
									else if(counter_x >= xpos+LEFT_PAD_D+DIGIT_LEN_X+PAD_DIGITS && counter_x < xpos+LEFT_PAD_D+PAD_DIGITS+2*DIGIT_LEN_X && hundreds != 4'b1111)
										begin
											red_t <= red3;    // hundreds 7 segments number
											green_t <= green3;
											blue_t <= blue3;
										end
									else if(counter_x >= xpos+LEFT_PAD_D+2*DIGIT_LEN_X+2*PAD_DIGITS && counter_x < xpos+LEFT_PAD_D+2*PAD_DIGITS+3*DIGIT_LEN_X && tens != 4'b1111)
										begin
											red_t <= red2;    // tens 7 segments number
											green_t <= green2;
											blue_t <= blue2;
										end
									else if(counter_x >= xpos+LEFT_PAD_D+3*DIGIT_LEN_X+3*PAD_DIGITS && counter_x < xpos+LEFT_PAD_D+3*PAD_DIGITS+4*DIGIT_LEN_X && ones != 4'b1111)
										begin
											red_t <= red1;    // ones 7 segments number
											green_t <= green1;
											blue_t <= blue1;
										end
									else
										begin
											red_t <= 8'h61;    // yellow
											green_t <= 8'hB2;
											blue_t <= 8'hF0;
										end
								end
							else
								begin
									red_t <= 8'h61;    // yellow
									green_t <= 8'hB2;
									blue_t <= 8'hF0;
								end
							
						end
				end
		  
		end  // always
		
		displaydigit #(.XPOS(xpos+LEFT_PAD_D), .YPOS(ypos+TOP_PAD_D)) d1000(
			 .hc(counter_x),        //horizontal counter
			 .vc(counter_y),        //vertical counter
			 .val(thousands),       //value of the tile
			 .red_d(red4),	    		//red vga output
			 .green_d(green4),     	//green vga output
			 .blue_d(blue4)	    	//blue vga output
		);
		
		displaydigit #(.XPOS(xpos+LEFT_PAD_D+DIGIT_LEN_X+PAD_DIGITS), .YPOS(ypos+TOP_PAD_D)) d100 (
			 .hc(counter_x),        //horizontal counter
			 .vc(counter_y),        //vertical counter
			 .val(hundreds),       	//value of the tile
			 .red_d(red3),	    		//red vga output
			 .green_d(green3),     	//green vga output
			 .blue_d(blue3)	    	//blue vga output
		);
		
		displaydigit #(.XPOS(xpos+LEFT_PAD_D+2*DIGIT_LEN_X+2*PAD_DIGITS), .YPOS(ypos+TOP_PAD_D)) d10 (
			 .hc(counter_x),        //horizontal counter
			 .vc(counter_y),        //vertical counter
			 .val(tens),       		//value of the tile
			 .red_d(red2),	    		//red vga output
			 .green_d(green2),     	//green vga output
			 .blue_d(blue2)	    	//blue vga output
		);
		
		displaydigit #(.XPOS(xpos+LEFT_PAD_D+3*DIGIT_LEN_X+3*PAD_DIGITS), .YPOS(ypos+TOP_PAD_D)) d1 (
			 .hc(counter_x),        //horizontal counter
			 .vc(counter_y),        //vertical counter
			 .val(ones),       		//value of the tile
			 .red_d(red1),	    		//red vga output
			 .green_d(green1),     	//green vga output
			 .blue_d(blue1)	    	//blue vga output
		);
	
	
endmodule