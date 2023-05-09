module display_game_over(
	input wire clk,
	input wire [9:0] counter_x,
	input wire [9:0] counter_y,
	output reg [7:0] o_red,
	output reg [7:0] o_green,
	output reg [7:0] o_blue  
);

		reg [7:0] r_red = 0;
		reg [7:0] r_blue = 0;
		reg [7:0] r_green = 0;

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// pattern generate
		always @ (posedge clk)
		begin
			////////////////////////////////////////////////////////////////////////////////////// SECTION 1
			if (counter_y < 168) // Dead zone
				begin
					r_red = 8'h00;    // black
					r_blue = 8'h00;
					r_green = 8'h00;
				end
			else if (counter_y >= 168 && counter_y < 185) // Forehead
				begin
					if (counter_x < 330)
						begin
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end
					else if (counter_x >= 330  && counter_x < 594)
						begin
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end
					else if (counter_x >= 594)
						begin
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end
				end
			else if (counter_y >= 185 && counter_y < 224) // Eyes
				begin
					if (counter_x < 330)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end 
					if (counter_x >= 330 && counter_x < 376)	// row 0 col 0
						begin 
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end 
					else if (counter_x >= 376 && counter_x < 391)
						begin 
							r_red = 8'h00;    // Black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					else if (counter_x >= 391 && counter_x < 538) // row 0 col 1
						begin 
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end  
					else if (counter_x >= 538 && counter_x < 552)
						begin 
							r_red = 8'h00;    // Black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					else if (counter_x >= 552 && counter_x < 594) // row 0 col 2
						begin 
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end 
					else if (counter_x >= 594)
						begin 
							r_red = 8'h00;    // Black
							r_blue = 8'h00;
							r_green = 8'h00;
						end	
				end  // End eyes
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 1
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 2
			else if (counter_y >= 224 && counter_y < 266) // Mustache zone
				begin
					if (counter_x < 330)
						begin
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end
					else if (counter_x >= 330  && counter_x < 594)
						begin
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end
					else if (counter_x >= 594)
						begin
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end
				end
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 2
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 3
			else if (counter_y >= 289 && counter_y < 304) // Ending of mouth
				begin
					if (counter_x < 330)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end 
					if (counter_x >= 330 && counter_x < 376)	// row 0 col 0
						begin 
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end 
					else if (counter_x >= 376 && counter_x < 391)
						begin 
							r_red = 8'h00;    // Black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					else if (counter_x >= 391 && counter_x < 538) // row 0 col 1
						begin 
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end  
					else if (counter_x >= 538 && counter_x < 552)
						begin 
							r_red = 8'h00;    // Black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					else if (counter_x >= 552 && counter_x < 594) // row 0 col 2
						begin 
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end 
					else if (counter_x >= 594)
						begin 
							r_red = 8'h00;    // Black
							r_blue = 8'h00;
							r_green = 8'h00;
						end	
				end  // End mouth
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 3
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 4
			
			else if (counter_y >= 266 && counter_y < 289) // Beginning of mouth
				begin
					if (counter_x < 330)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end 
					if (counter_x >= 330 && counter_x < 376)	// row 0 col 0
						begin 
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end 
					else if (counter_x >= 376 && counter_x < 552)
						begin 
							r_red = 8'h00;    // Black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					else if (counter_x >= 552 && counter_x < 594) // row 0 col 2
						begin 
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end 
					else if (counter_x >= 594)
						begin 
							r_red = 8'h00;    // Black
							r_blue = 8'h00;
							r_green = 8'h00;
						end	
				end  // End mouth
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 4
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 5
			else if (counter_y >= 304 && counter_y < 339)
				begin
					if (counter_x < 330)
						begin
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end
					else if (counter_x >= 330  && counter_x < 594)
						begin
							r_red = 8'hCD;    // Red
							r_blue = 8'h27;
							r_green = 8'h27;
						end
					else if (counter_x >= 594)
						begin
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end
				end
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 5
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 6
			else if (counter_y >= 339) // Dead zone
				begin
					r_red <= 8'h00;    // white
					r_blue <= 8'h00;
					r_green <= 8'h00;
				end  // if (counter_x < 324)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 7
		end  // always
						
	// end pattern generate

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// color output assignments
	// only output the colors if the counters are within the adressable video time constraints
	assign o_red = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_red : 8'h00;
	assign o_blue = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_blue : 8'h00;
	assign o_green = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_green : 8'h00;
	// end color output assignments


endmodule