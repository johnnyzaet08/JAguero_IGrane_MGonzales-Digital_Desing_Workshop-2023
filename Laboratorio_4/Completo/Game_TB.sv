`timescale 1ns/1ps

module Game_TB;

	logic clk = 0;				//master clock = 50MHz
	logic RST;				//center pushbutton for reset
	logic BTN_RIGHT;   	//right-most pushbutton
	logic BTN_LEFT;    	//left-most pushbutton
	logic BTN_TOP;     	//top-most pushbutton
	logic BTN_BOT;     	//bottom-most pushbutton
	reg [3:0] win_goal;
	logic [15:0] score;
	logic [6:0] display1;    	//seven-segment display 1
	logic [6:0] display2;    	//seven-segment display 2
	logic [6:0] display3;    	//seven-segment display 3
	logic [6:0] display4;    	//seven-segment display 4
	logic [7:0] red;		//red vga  - 3 bits
	logic [7:0] green;	//green vga  - 3 bits
	logic [7:0] blue;	//blue vga  - 2 bits
	logic hsync;			//horizontal sync out
	logic vsync;			//vertical sync out
	logic vgaclk;			//VGA clock - 25MHz
	reg game_over;
	reg game_completed;
	reg [3:0] use_win_goal;
	logic move_en;
	logic gen_active;
	reg [2:0] current_state;

	Game myGame(
		   clk,				//master clock = 50MHz
		   RST,				//center pushbutton for reset
		   BTN_RIGHT,   	//right-most pushbutton
		   BTN_LEFT,    	//left-most pushbutton
		   BTN_TOP,     	//top-most pushbutton
		   BTN_BOT,     	//bottom-most pushbutton
		   win_goal,
			score,
		   display1,    	//seven-segment display 1
		   display2,    	//seven-segment display 2
		   display3,    	//seven-segment display 3
		   display4,    	//seven-segment display 4
		   red,		//red vga  - 3 bits
		   green,	//green vga  - 3 bits
		   blue,	//blue vga  - 2 bits
		   hsync,			//horizontal sync out
		   vsync,			//vertical sync out
		   vgaclk,			//VGA clock - 25MHz
		   game_over,
		   game_completed,
		   use_win_goal,
		   move_en,
		   gen_active,
		   current_state
	);
	
	
	 
	initial begin
		RST = 1'b0;
		BTN_RIGHT = 1'b0;
		BTN_LEFT = 1'b0;
		BTN_TOP = 1'b0;
		BTN_BOT = 1'b0;
		win_goal = 4'b0100;
		RST = 1'b1;
		#10
		RST = 1'b0;
		score = 16'b0;
		clk = 1'b0;
		
		clk = 1'b1;
		BTN_RIGHT = 1'b1;
		
		#10;
		
		RST = 1'b1;
		
		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		
		#10;
		
		BTN_RIGHT = 1'b0;
		
		#10;
		
		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		
		#10;
		
		BTN_TOP = 1'b1;
		
		#10;
		
		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		
		#10;
		
		clk = 1'b0;
		
		#10;
		
		clk = 1'b1;
		
		BTN_TOP = 1'b0;
		
		#10;
		
		BTN_LEFT = 1'b1;
		
		#10;
		
		BTN_LEFT = 1'b0;
		BTN_RIGHT = 1'b1;
		
		#10;
		
		BTN_LEFT = 1'b1;
		BTN_RIGHT = 1'b0;
		
		#10;
		
		BTN_LEFT = 1'b0;
		BTN_RIGHT = 1'b1;
		
		#10;
		
		BTN_LEFT = 1'b1;
		BTN_RIGHT = 1'b0;
		
		
		
		
	end
	
endmodule