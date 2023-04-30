`timescale 1ns / 1ps

// image generator of a road and a sky 640x480 @ 60 fps

////////////////////////////////////////////////////////////////////////
module vga(
	input wire clk,           // 50 MHz
	output wire vgaclk,		// 25 MHz
	input wire [63:0] vals,
	output wire hsync,      // horizontal sync
	output wire vsync,	   // vertical sync
	output reg [7:0] r_red,
	output reg [7:0] r_green,
	output reg [7:0] r_blue  
);


	reg [9:0] counter_x = 0;  // horizontal counter
	reg [9:0] counter_y = 0;  // vertical counter
		
	wire [127:0] r_red_aux;
	wire [127:0] r_green_aux;
	wire [127:0] r_blue_aux;
	
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
		always @ (*)
		begin
		   if (counter_y >= 35 && counter_y < 152) // start row 0
				begin
					if (counter_x < 214)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end 
					if (counter_x >= 214 && counter_x < 331)	// row 0 col 0
						begin 
							r_red = r_red_aux[7:0];
							r_blue = r_blue_aux[7:0];
							r_green = r_green_aux[7:0];
						end 
					else if (counter_x >= 331 && counter_x < 335)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end  
					else if (counter_x >= 335 && counter_x < 452) // row 0 col 1
						begin 
							r_red = r_red_aux[15:8];
							r_blue = r_blue_aux[15:8];
							r_green = r_green_aux[15:8];
						end  
					else if (counter_x >= 452 && counter_x < 456)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end  
					else if (counter_x >= 456 && counter_x < 573) // row 0 col 2
						begin 
							r_red = r_red_aux[23:16];
							r_blue = r_blue_aux[23:16];
							r_green = r_green_aux[23:16];
						end 
					else if (counter_x >= 573 && counter_x < 577)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end 
					else if (counter_x >= 577 && counter_x < 694) // row 0 col 3
						begin 
							r_red = r_red_aux[31:24];
							r_blue = r_blue_aux[31:24];
							r_green = r_green_aux[31:24];
						end  
					else if (counter_x >= 694)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					end  // end row 0
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 2
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 3
			else if (counter_y >= 152 && counter_y < 156)
				begin
				if (counter_x < 214)
					begin
						r_red = 8'h00;    // black
						r_blue = 8'h00;
						r_green = 8'h00;
					end
				else if (counter_x >= 214 && counter_x < 694)
					begin 
						r_red = 8'hEB;    // orange
						r_blue = 8'h4E;
						r_green = 8'h98;
						
					end
				else if (counter_x >= 694)
					begin
						r_red = 8'h00;    // black
						r_blue = 8'h00;
						r_green = 8'h00;
					end
				end
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 3
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 4
			else if (counter_y >= 156 && counter_y < 273) //start row 1
				begin
					if (counter_x < 214)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end 
					if (counter_x >= 214 && counter_x < 331)	// row 1 col 0
						begin 
							r_red = r_red_aux[39:32];
							r_blue = r_blue_aux[39:32];
							r_green = r_green_aux[39:32];
						end 
					else if (counter_x >= 331 && counter_x < 335)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end  
					else if (counter_x >= 335 && counter_x < 452) // row 1 col 1
						begin 
							r_red = r_red_aux[47:40];
							r_blue = r_blue_aux[47:40];
							r_green = r_green_aux[47:40];
						end  
					else if (counter_x >= 452 && counter_x < 456)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end  
					else if (counter_x >= 456 && counter_x < 573) // row 1 col 2
						begin 
							r_red = r_red_aux[55:48];
							r_blue = r_blue_aux[55:48];
							r_green = r_green_aux[55:48];
						end 
					else if (counter_x >= 573 && counter_x < 577)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end 
					else if (counter_x >= 577 && counter_x < 694) // row 0 col 3
						begin 
							r_red = r_red_aux[63:56];
							r_blue = r_blue_aux[63:56];
							r_green = r_green_aux[63:56];
						end  
					else if (counter_x >= 694)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					end  // end row 1
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 4
			else if (counter_y >= 273 && counter_y < 277) 
				begin
				if (counter_x < 214)
					begin
						r_red = 8'h00;    // black
						r_blue = 8'h00;
						r_green = 8'h00;
					end
				else if (counter_x >= 214 && counter_x < 694)
					begin 
						r_red = 8'hEB;    // orange
						r_blue = 8'h4E;
						r_green = 8'h98;
						
					end
				else if (counter_x >= 694)
					begin
						r_red = 8'h00;    // black
						r_blue = 8'h00;
						r_green = 8'h00;
					end
				end
			////////////////////////////////////////////////////////////////////////////////////// SECTION 5
			else if (counter_y >= 277 && counter_y < 394) // start row 2
				begin
					if (counter_x < 214)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end 
					if (counter_x >= 214 && counter_x < 331)	// row 2 col 0
						begin 
							r_red = r_red_aux[71:64];
							r_blue = r_blue_aux[71:64];
							r_green = r_green_aux[71:64];
						end 
					else if (counter_x >= 331 && counter_x < 335)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end  
					else if (counter_x >= 335 && counter_x < 452) // row 2 col 1
						begin 
							r_red = r_red_aux[79:72];
							r_blue = r_blue_aux[79:72];
							r_green = r_green_aux[79:72];
						end  
					else if (counter_x >= 452 && counter_x < 456)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end  
					else if (counter_x >= 456 && counter_x < 573) // row 2 col 2
						begin 
							r_red = r_red_aux[87:80];
							r_blue = r_blue_aux[87:80];
							r_green = r_green_aux[87:80];
						end 
					else if (counter_x >= 573 && counter_x < 577)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end 
					else if (counter_x >= 577 && counter_x < 694) // row 2 col 3
						begin 
							r_red = r_red_aux[95:88];
							r_blue = r_blue_aux[95:88];
							r_green = r_green_aux[95:88];
						end  
					else if (counter_x >= 694)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					end  // end row 2
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 5
			else if (counter_y >= 394 && counter_y < 398)
				begin
				if (counter_x < 214)
					begin
						r_red = 8'h00;    // black
						r_blue = 8'h00;
						r_green = 8'h00;
					end
				else if (counter_x >= 214 && counter_x < 694)
					begin 
						r_red = 8'hEB;    // orange
						r_blue = 8'h4E;
						r_green = 8'h98;
						
					end
				else if (counter_x >= 694)
					begin
						r_red = 8'h00;    // black
						r_blue = 8'h00;
						r_green = 8'h00;
					end
				end
			////////////////////////////////////////////////////////////////////////////////////// SECTION 6
			else if (counter_y >= 398) //start row 3
				begin
					if (counter_x < 214)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end 
					if (counter_x >= 214 && counter_x < 331)	// row 3 col 0
						begin 
							r_red = r_red_aux[103:96];
							r_blue = r_blue_aux[103:96];
							r_green = r_green_aux[103:96];
						end 
					else if (counter_x >= 331 && counter_x < 335)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end  
					else if (counter_x >= 335 && counter_x < 452) // row 3 col 1
						begin 
							r_red = r_red_aux[111:104];
							r_blue = r_blue_aux[111:104];
							r_green = r_green_aux[111:104];
						end  
					else if (counter_x >= 452 && counter_x < 456)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end  
					else if (counter_x >= 456 && counter_x < 573) // row 3 col 2
						begin 
							r_red = r_red_aux[119:112];
							r_blue = r_blue_aux[119:112];
							r_green = r_green_aux[119:112];
						end 
					else if (counter_x >= 573 && counter_x < 577)
						begin 
							r_red = 8'hEB;    // orange
							r_blue = 8'h4E;
							r_green = 8'h98;
						end 
					else if (counter_x >= 577 && counter_x < 694) // row 3 col 3
						begin 
							r_red = r_red_aux[127:120];
							r_blue = r_blue_aux[127:120];
							r_green = r_green_aux[127:120];
						end  
					else if (counter_x >= 694)
						begin 
							r_red = 8'h00;    // black
							r_blue = 8'h00;
							r_green = 8'h00;
						end  
					end  // end row 0
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 6
			
			////////////////////////////////////////////////////////////////////////////////////// SECTION 7
			
			////////////////////////////////////////////////////////////////////////////////////// END SECTION 7
		end  // always
						
	// end pattern generate

	// Generate tiles
	displaytile #(.XIDX(0), .YIDX(0)) t0(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[7:0]), .green(r_green_aux[7:0]), .blue(r_blue_aux[7:0]));
	displaytile #(.XIDX(1), .YIDX(0)) t1(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[15:8]), .green(r_green_aux[15:8]), .blue(r_blue_aux[15:8]));
	displaytile #(.XIDX(2), .YIDX(0)) t2(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[23:16]), .green(r_green_aux[23:16]), .blue(r_blue_aux[23:16]));
	displaytile #(.XIDX(3), .YIDX(0)) t3(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[31:24]), .green(r_green_aux[31:24]), .blue(r_blue_aux[31:24]));
	displaytile #(.XIDX(0), .YIDX(1)) t4(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[39:32]), .green(r_green_aux[39:32]), .blue(r_blue_aux[39:32]));
	displaytile #(.XIDX(1), .YIDX(1)) t5(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[47:40]), .green(r_green_aux[47:40]), .blue(r_blue_aux[47:40]));
	displaytile #(.XIDX(2), .YIDX(1)) t6(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[55:48]), .green(r_green_aux[55:48]), .blue(r_blue_aux[55:48]));
	displaytile #(.XIDX(3), .YIDX(1)) t7(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[63:56]), .green(r_green_aux[63:56]), .blue(r_blue_aux[63:56]));
	displaytile #(.XIDX(0), .YIDX(2)) t8(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[71:64]), .green(r_green_aux[71:64]), .blue(r_blue_aux[71:64]));
	displaytile #(.XIDX(1), .YIDX(2)) t9(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[79:72]), .green(r_green_aux[79:72]), .blue(r_blue_aux[79:72]));
	displaytile #(.XIDX(2), .YIDX(2)) t10(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[87:80]), .green(r_green_aux[87:80]), .blue(r_blue_aux[87:80]));
	displaytile #(.XIDX(3), .YIDX(2)) t11(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[95:88]), .green(r_green_aux[95:88]), .blue(r_blue_aux[95:88]));
	displaytile #(.XIDX(0), .YIDX(3)) t12(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[103:96]), .green(r_green_aux[103:96]), .blue(r_blue_aux[103:96]));
	displaytile #(.XIDX(1), .YIDX(3)) t13(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[111:104]), .green(r_green_aux[111:104]), .blue(r_blue_aux[111:104]));
	displaytile #(.XIDX(2), .YIDX(3)) t14(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[119:112]), .green(r_green_aux[119:112]), .blue(r_blue_aux[119:112]));
	displaytile #(.XIDX(3), .YIDX(3)) t15(.counter_x(counter_x), .counter_y(counter_y), .red(r_red_aux[127:120]), .green(r_green_aux[127:120]), .blue(r_blue_aux[127:120]));

	/*
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// color output assignments
	// only output the colors if the counters are within the adressable video time constraints
	assign r = (counter_x > 134 && counter_x <= 774 && counter_y > 35 && counter_y <= 515) ? r_red : 8'h00;
	assign g = (counter_x > 134 && counter_x <= 774 && counter_y > 35 && counter_y <= 515) ? r_green : 8'h00;
	assign b = (counter_x > 134 && counter_x <= 774 && counter_y > 35 && counter_y <= 515) ? r_blue : 8'h00;
	// end color output assignments
	*/
	
endmodule  // VGA_image_gen