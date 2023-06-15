module VGA_Controller (
  input logic clk,
  input logic reset,
  input logic [31:0] pixel,
  input logic enabled,
  output reg vga_hsync,
  output reg vga_vsync,
  output reg [7:0] vga_r,
  output reg [7:0] vga_g,
  output reg [7:0] vga_b,
  output logic [31:0] DataAdrVGA
);
  reg [9:0] counter_x = 0;  // contador horizontal
  reg [9:0] counter_y = 0;  // contador vertical
  
  reg [7:0] r_red = 0;
  reg [7:0] r_blue = 0;
  reg [7:0] r_green = 0;
  
  localparam IMG_WIDTH = 256;
  localparam IMG_HEIGHT = 256;

  always @(posedge clk) begin
    if (counter_x < 799)
      counter_x <= counter_x + 1;
    else
      counter_x <= 0;
  end

  always @(posedge clk) begin
    if (counter_x == 799) begin
      if (counter_y < 525)
        counter_y <= counter_y + 1;
      else
        counter_y <= 0;
    end
  end
  
  assign vga_hsync = (counter_x >= 0 && counter_x < 96) ? 1'b1 : 1'b0;
  assign vga_vsync = (counter_y >= 0 && counter_y < 2) ? 1'b1 : 1'b0;
  
  
  always @ (*)
		begin
			if (enabled) begin
				if (counter_y - 35 <= IMG_HEIGHT && counter_y - 35 > 0) 
					begin
						if (counter_x - 144 <= IMG_WIDTH && counter_x - 144 > 0) 
							begin
								DataAdrVGA <= (counter_x - 144) * (counter_y - 35);
								r_red = pixel[7:0];
								r_blue = pixel[7:0];
								r_green = pixel[7:0];
							end
						else if (counter_x > IMG_WIDTH + 144) 
							begin
								r_red = 8'h00;
								r_blue = 8'h00;
								r_green = 8'h00;
							end
					end
				else if (counter_y > IMG_HEIGHT + 35) 
					begin
						r_red = 8'h00;
						r_blue = 8'h00;
						r_green = 8'h00;
					end
			end //if
			else begin
				r_red = 8'hFF;
				r_blue = 8'hFF;
				r_green = 8'hFF;
			end
		end //ALWAYS
		
	assign vga_r = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_red : 8'h00;
	assign vga_b = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_blue : 8'h00;
	assign vga_g = (counter_x > 144 && counter_x <= 783 && counter_y > 35 && counter_y <= 514) ? r_green : 8'h00;

endmodule