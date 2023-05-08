module display_game_completed(
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
			if (counter_y < 135)
				begin              
					r_red <= 8'hFF;    // white
					r_blue <= 8'hFF;
					r_green <= 8'hFF;
				end  // if (counter_y < 135)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 1
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 2
			else if (counter_y >= 135 && counter_y < 205)
				begin 
					if (counter_x < 324)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // if (counter_x < 324)
					else if (counter_x >= 324 && counter_x < 604)
						begin 
							r_red <= 8'hFF;    // yellow
							r_blue <= 8'h00;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 604)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 604)
					end  // else if (counter_y >= 135 && counter_y < 205)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 2
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 3
			else if (counter_y >= 205 && counter_y < 217)
				begin 
					if (counter_x < 324)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // if (counter_x < 324)
					else if (counter_x >= 324 && counter_x < 371)
						begin 
							r_red <= 8'hFF;    // yellow
							r_blue <= 8'h00;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 324 && counter_x < 371)
					else if (counter_x >= 371 && counter_x < 383)
						begin 
							r_red <= 8'h00;    // black
							r_blue <= 8'h00;
							r_green <= 8'h00;
						end  // else if (counter_x >= 371 && counter_x < 383)
					else if (counter_x >= 383 && counter_x < 545)
						begin 
							r_red <= 8'hFF;    // yellow
							r_blue <= 8'h00;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 383 && counter_x < 545)
					else if (counter_x >= 545 && counter_x < 557)
						begin 
							r_red <= 8'h00;    // black
							r_blue <= 8'h00;
							r_green <= 8'h00;
						end  // else if (counter_x >= 545 && counter_x < 557)
					else if (counter_x >= 557 && counter_x < 604)
						begin 
							r_red <= 8'hFF;    // yellow
							r_blue <= 8'h00;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 557 && counter_x < 604)
					else if (counter_x >= 604)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 604)
				end  // else if (counter_y >= 205 && counter_y < 217)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 3
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 4
			else if (counter_y >= 217 && counter_y < 305)
				begin
					if (counter_x < 324)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // if (counter_x < 324)
					else if (counter_x >= 324 && counter_x < 604)
						begin 
							r_red <= 8'hFF;    // yellow
							r_blue <= 8'h00;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 604)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 604)	
				end  // else if (counter_y >= 217 && counter_y < 305)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 4
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 5
			else if (counter_y >= 305 && counter_y < 310)
				begin
					if (counter_x < 324)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // if (counter_x < 324)
					else if (counter_x >= 324 && counter_x < 371)
						begin 
							r_red <= 8'hFF;    // yellow
							r_blue <= 8'h00;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 324 && counter_x < 371)
					else if (counter_x >= 371 && counter_x < 557)
						begin 
							r_red <= 8'h00;    // black
							r_blue <= 8'h00;
							r_green <= 8'h00;
						end  // else if (counter_x >= 371 && counter_x < 557)
					else if (counter_x >= 557 && counter_x < 604)
						begin 
							r_red <= 8'hFF;    // yellow
							r_blue <= 8'h00;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 557 && counter_x < 604)
					else if (counter_x >= 604)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 604)	
				end  // else if (counter_y >= 217 && counter_y < 305)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 5
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 6
			else if (counter_y >= 305 && counter_y < 414)
				begin
					if (counter_x < 324)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // if (counter_x < 324)
					else if (counter_x >= 324 && counter_x < 604)
						begin 
							r_red <= 8'hFF;    // yellow
							r_blue <= 8'h00;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 604)
						begin 
							r_red <= 8'hFF;    // white
							r_blue <= 8'hFF;
							r_green <= 8'hFF;
						end  // else if (counter_x >= 604)	
				end  // else if (counter_y >= 305 && counter_y < 414)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 6
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 7
			else if (counter_y <= 414)
				begin              
					r_red <= 8'hFF;    // white
					r_blue <= 8'hFF;
					r_green <= 8'hFF;
				end  // if (counter_y >= 414)
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

	/* Design "¡Has ganado!" message to display. The same way vga controller is programmed */

endmodule