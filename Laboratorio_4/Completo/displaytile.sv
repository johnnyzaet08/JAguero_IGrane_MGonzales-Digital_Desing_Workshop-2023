module displaytile #(parameter XIDX=0, parameter YIDX=0) (
    input wire [9:0] counter_x,    	//horizontal counter
    input wire [9:0] counter_y,    	//vertical counter
    //input wire [3:0] val,   			//power of 2 of the tile's value
    output wire [7:0] red,				//red vga output
    output wire [7:0] green,			//green vga output
    output wire [7:0] blue				//blue vga output
);

	///////// POSITIONING LOGIC /////////
    wire TILE_LEN = 117;   	
	 wire LINE_LEN = 3;
	 
    wire OUTER_PADX = 134;   	
	 wire OUTER_PADY = 35;

    wire LEFT_PAD = 18;    	// edge of tile to start of numbers
    wire TOP_PAD = 37;     	// top of tile to start of numbers
    wire DIGIT_LEN = 21; 	// digit length + padding
		

	// Calculate pixel location of top left corner
    wire xpos = OUTER_PADX + XIDX * TILE_LEN + XIDX * LINE_LEN; 	// start of leftmost digit
    wire ypos = OUTER_PADY + YIDX * TILE_LEN + XIDX * LINE_LEN;   				// top location of digits

	always @ (*)
		begin
		   if (counter_y >= ypos && counter_y < ypos + TILE_LEN)
				begin
					if (counter_x >= xpos && counter_x < xpos + TILE_LEN)
						begin 
							red <= 8'hAE;    // Purple
							green <= 8'h10;
							blue <= 8'hFF;
						end  // if (counter_x >= xpos && counter_x < xpos + TILE_LEN)
				end // if (counter_y >= ypos && counter_y < ypos + TILE_LEN)
		end  // always
	
endmodule