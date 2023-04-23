/*module vga(input  logic			clk,
			  output logic 		vgaclk, // 25.175 MHz VGA clock 
			  output logic 		hsync, vsync,
			  output logic 		sync_b, blank_b,
			  output logic [7:0] r, g, b);
	
		logic [9:0] x, y;
		
		pll vgapll(.refclk(clk), .rst(), .outclk_0(vgaclk), .locked());
		
		vgaController vgaCont(vgaclk, hsync, vsync, sync_b, blank_b, x, y);
		
		videoGen videoGen(x, y, r, g, b);
endmodule


module vgaController #(parameter HACTIVE = 10'd640,
											HFP	  = 10'd16,
											HSYN	  = 10'd96,
											HBP	  = 10'd48,
											HMAX	  = HACTIVE + HFP + HSYN + HBP,
											VBP 	  = 10'd32,
											VACTIVE = 10'd480,
											VFP	  = 10'd11,
											VSYN	  = 10'd2,
											VMAX	  = VACTIVE + VFP + VSYN + VBP)
							 (input logic 			vgaclk,
							  output logic 		hsync, vsync, sync_b, blank_b,
							  output logic [9:0] x, y);
		
		always @ (posedge vgaclk) begin
			x++;
			if (x == HMAX) begin
				x = 0;
				y++;
				if (y == VMAX)
					y = 0;
			end
		end
		
		assign hsync  = ~(x >= HACTIVE + HFP & x < HACTIVE + HFP + HSYN);
		assign vsync  = ~(y >= VACTIVE + VFP & y < VACTIVE + VFP + VSYN);
		assign sync_b = hsync & vsync;
		
		assign blank_b = (x < HACTIVE) & (y < VACTIVE);
endmodule


module videoGen(input  logic [9:0] x, y,
					 output logic [7:0] r, g, b);

		logic pixel, inrect;
		
		//chargenrom chargenrom(y[8:3]+8'd65, x[2:0], y[2:0], pixel);
		rectgen rectgen(x, y, 10'd0, 10'd0, 10'd620, 10'd480, inrect);
		assign {r, b} = (y[3] == 0) ? {{8{pixel}}, 8'h00} : {8'h00, {8{pixel}}};
		assign g		  = inrect ? 8'hFF : 8'h00;
					 
endmodule

module chargenrom(input logic [7:0] ch,
						input logic [2:0] xoff, yoff,
						output logic 		pixel);
						
						
		logic [5:0] charrom[2047:0];
		logic [7:0] line;
		
		initial
			$readmemb("charrom.txt", charrom);
		
		assign line = charrom[yoff + {ch-65, 3'b000}];
		
		assign pixel = line[3'd7-xoff];
		
endmodule

module rectgen(input  logic [9:0] x, y, left, top, right, bot,
					output logic 		 inrect);
					
		assign inrect = (x >= left & x < right & y >= top & y < bot);
	
endmodule*/


`timescale 1ns / 1ps

// image generator of a road and a sky 640x480 @ 60 fps

////////////////////////////////////////////////////////////////////////
module vga(
	input clk,           // 50 MHz
	output vgaclk,		// 25 MHz
	output hsync,      // horizontal sync
	output vsync,	   // vertical sync
	output [7:0] r,
	output [7:0] g,
	output [7:0] b  
);

	reg [9:0] counter_x = 0;  // horizontal counter
	reg [9:0] counter_y = 0;  // vertical counter
	reg [7:0] r_red = 0;
	reg [7:0] r_blue = 0;
	reg [7:0] r_green = 0;
	
	reg reset = 0;  // for PLL

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// clk divider 50 MHz to 25 MHz

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

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// pattern generate
		always @ (posedge clk)
		begin
			////////////////////////////////////////////////////////////////////////////////////// SECTION 1
			/*if (counter_y < 117)
				begin              
					r_red <= 8'hF5;    // yellow
					r_blue <= 8'hA8;
					r_green <= 8'hED;
				end  // if (counter_y < 135)*/
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 1
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 2
		   if (counter_y >= 35 && counter_y < 150)
				begin 
					if (counter_x < 265)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // if (counter_x < 324)
					else if (counter_x >= 265 && counter_x < 270)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 270 && counter_x < 390)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 390 && counter_x < 395)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 395 && counter_x < 510)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 510 && counter_x < 515)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 515)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 604)
					end  // else if (counter_y >= 135 && counter_y < 205)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 2
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 3
			else if (counter_y >= 150 && counter_y < 155)
				begin 
					r_red <= 8'hEB;    // black
					r_blue <= 8'h4E;
					r_green <= 8'h98;
						
				end  // else if (counter_y >= 205 && counter_y < 217)
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 3
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 4
			else if (counter_y >= 155 && counter_y < 275)
				begin 
					if (counter_x < 265)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // if (counter_x < 324)
					else if (counter_x >= 265 && counter_x < 270)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 270 && counter_x < 390)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 390 && counter_x < 395)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 395 && counter_x < 510)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 510 && counter_x < 515)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 515)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 604)
					end
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 4
			else if (counter_y >= 275 && counter_y < 280)
				begin 
					r_red <= 8'hEB;    // black
					r_blue <= 8'h4E;
					r_green <= 8'h98;
						
				end  // else if (counter_y >= 205 && counter_y < 217)
			////////////////////////////////////////////////////////////////////////////////////// SECTION 5
			else if (counter_y >= 280 && counter_y < 400)
				begin 
					if (counter_x < 265)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // if (counter_x < 324)
					else if (counter_x >= 265 && counter_x < 270)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 270 && counter_x < 390)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 390 && counter_x < 395)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 395 && counter_x < 510)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 510 && counter_x < 515)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 515)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 604)
					end
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 5
			else if (counter_y >= 400 && counter_y < 405)
				begin 
					r_red <= 8'hEB;    // black
					r_blue <= 8'h4E;
					r_green <= 8'h98;
						
				end  // else if (counter_y >= 205 && counter_y < 217)
			////////////////////////////////////////////////////////////////////////////////////// SECTION 6
			else if (counter_y >= 405)
				begin 
					if (counter_x < 265)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // if (counter_x < 324)
					else if (counter_x >= 265 && counter_x < 270)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 270 && counter_x < 390)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 390 && counter_x < 395)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 395 && counter_x < 510)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 510 && counter_x < 515)
						begin 
							r_red <= 8'hEB;    // black
							r_blue <= 8'h4E;
							r_green <= 8'h98;
						end  // else if (counter_x >= 324 && counter_x < 604)
					else if (counter_x >= 515)
						begin 
							r_red <= 8'hF5;    // yellow
							r_blue <= 8'hA8;
							r_green <= 8'hED;
						end  // else if (counter_x >= 604)
					end
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 6
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 7
			
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 7
		end  // always
						
	// end pattern generate

	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// color output assignments
	// only output the colors if the counters are within the adressable video time constraints
	assign r = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_red : 8'h00;
	assign b = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_blue : 8'h00;
	assign g = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_green : 8'h00;
	// end color output assignments
	
endmodule  // VGA_image_gen