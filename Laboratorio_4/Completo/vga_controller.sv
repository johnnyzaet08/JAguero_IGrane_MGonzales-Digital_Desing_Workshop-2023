module vga_controller(
	input wire clk,           // 50 MHz
	output wire vgaclk,		// 25 MHz
	input wire [63:0] vals,
	input wire gameover,
	input wire gamecompleted,
	output wire hsync,      // horizontal sync
	output wire vsync,	   // vertical sync
	output reg [7:0] r_red,
	output reg [7:0] r_green,
	output reg [7:0] r_blue  
);

	reg [7:0] red1, red2, red3;
	reg [7:0] green1, green2, green3;
	reg [7:0] blue1, blue2, blue3;	
	
	reg [9:0] counter_x = 0;  // horizontal counter
	reg [9:0] counter_y = 0;  // vertical counter

	pll vgapll(.refclk(clk), .rst(), .outclk_0(vgaclk), .locked());
	// end clk divider 50 MHz to 25 MHz
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// counter and sync generation
	always @(posedge vgaclk)  // horizontal counter
		begin 
			if (counter_x < 799)
				counter_x <= counter_x + 1;  // horizontal counter (including off-screen horizontal 160 pixels) total of 800 pixels 
			else
				counter_x <= 0;              
		end  // always 
	
	always @ (posedge vgaclk)  // vertical counter
		begin 
			if (counter_x == 799)  // only counts up 1 count after horizontal finishes 800 counts
				begin
					if (counter_y < 525)  // vertical counter (including off-screen vertical 45 pixels) total of 525 pixels
						counter_y <= counter_y + 1;
					else
						counter_y <= 0;              
				end  // if (counter_x...
		end  // always
	// end counter and sync generation  

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// hsync and vsync output assignments
	assign hsync = (counter_x >= 0 && counter_x < 96) ? 1:0;  // hsync high for 96 counts                                                 
	assign vsync = (counter_y >= 0 && counter_y < 2) ? 1:0;   // vsync high for 2 counts
	// end hsync and vsync output assignments
	
	
	always @ (*)
		begin
			if (gamecompleted == 1'b1) //game completed
				begin
					r_red <= red1;
					r_green <= green1;
					r_blue <= blue1;
				end
			else if (gameover == 1'b1) //game over
				begin
					r_red <= red2;
					r_green <= green2;
					r_blue <= blue2;
				end
			else
				begin
					r_red <= red3;
					r_green <= green3;
					r_blue <= blue3;
				end
		end

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	display_game_completed display_completed(
		.clk(clk),
		.counter_x(counter_x),
		.counter_y(counter_y),
		.o_red(red1),
		.o_green(green1),
		.o_blue(blue1)
	);
	 
	display_game_over display_over(
		.clk(clk),
		.counter_x(counter_x),
		.counter_y(counter_y),
		.o_red(red2),
		.o_green(green2),
		.o_blue(blue2)
	);

	displaygrid display_grid(
		.vals(vals),
		.counter_x(counter_x),
		.counter_y(counter_y),
		.r_red(red3),
		.r_green(green3),
		.r_blue(blue3)
	);


endmodule