`timescale 1ns/1ps

module Controlador(
	input clock,
	output reg [2:0] red,
	output reg [2:0] green,
	output reg [1:0] blue,
	output reg hsync,
	output reg vsync
);

	reg [9:0] hcount = 0;
	reg [9:0] vcount = 0;
	reg [1:0] counter = 0;
	reg enable;

	// Enable
	always @ (posedge clock)
	begin
		if (counter == 3)
		begin
			counter <= 1'b0;
			enable <= 1'b1;
		end
		else
		begin
			counter <= counter + 1'b1;
			enable <= 1'b0;
		end
	end
	
	// Vsync and Hsync
	always @ (posedge clock)
	begin
		if (enable == 1)
		begin
			if (hcount == 799)
			begin
				hcount <= 0;
				if (vcount == 524)
					vcount <= 0;
			end
			else
				vcount <= vcount +1'b1;
		end
		else
		begin
			hcount <= hcount +1'b1;
			if (vcount >= 490 && vcount < 492)
				vsync <= 1'b0;
			else
				vsync <= 1'b1;
			if (hcount >= 656 && hcount < 752)
				hsync <= 1'b0;
			else
				hsync <= 1'b1;
		end
	end
	
	always @ (posedge clock)
	begin
		if (enable)
		begin
		
			if (hcount > 230 && hcount < 410 && vcount > 200 && vcount < 280)
			begin
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
		
			else if (hcount > 220 && hcount < 420 && vcount > 190 && vcount < 290)
			begin
				red <= 3'b000;
				green <= 3'b111;
				blue <= 2'b00;
			end
			
			else
			begin
				red <= 3'b000;
				green <= 3'b000;
				blue <= 2'b00;
			end
			
		end
	end


endmodule