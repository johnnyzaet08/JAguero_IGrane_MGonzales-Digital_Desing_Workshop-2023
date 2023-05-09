module Game_TB;

	timeunit 1ns;
	timeprecision 100ps;

	 wire clock;				//master clock = 50MHz
    wire RST;				//center pushbutton for reset
    wire BTN_R;   	//right-most pushbutton
    wire BTN_L;    	//left-most pushbutton
    wire BTN_T;     	//top-most pushbutton
    wire BTN_B;    	//bottom-most pushbutton
	 reg [3:0] win_goal;
    wire [6:0] display1;    	//seven-segment display 1
	 wire [6:0] display2;    	//seven-segment display 2
	 wire [6:0] display3;    	//seven-segment display 3
	 wire [6:0] display4;    	//seven-segment display 4
    wire [7:0] red;		//red vga output - 3 bits
    wire [7:0] green;	//green vga output - 3 bits
    wire [7:0] blue;	//blue vga output - 2 bits
    wire hsync;			//horizontal sync out
    wire vsync;			//vertical sync out
	 wire vgaclk;			//VGA clock - 25MHz
	 reg game_over;
	 reg game_completed;
	 reg [3:0] use_win_goal;
	 wire move_en;
	 wire gen_active;
	 reg [2:0] current_state;
	 
	 localparam
	 RESET= 3'b001, // reset
	 LOSE = 3'b010, // lost
	 WIN = 3'b011, // won
	 MOVE = 3'b100, // move
	 CONTINUE = 3'b101; // continue


Game Game_Test(
	 .clk(clock),				//master clock = 50MHz
    .RST(RST),				//center pushbutton for reset
    .BTN_RIGHT(BTN_R),   	//right-most pushbutton
    .BTN_LEFT(BTN_L),    	//left-most pushbutton
    .BTN_TOP(BTN_T),     	//top-most pushbutton
    .BTN_BOT(BTN_B),     	//bottom-most pushbutton
	 .win_goal(win_goal),
    .display1(display1),    	//seven-segment display 1
	 .display2(display2),    	//seven-segment display 2
	 .display3(display3),    	//seven-segment display 3
	 .display4(display4),    	//seven-segment display 4
    .red(red),		//red vga output - 3 bits
    .green(green),	//green vga output - 3 bits
    .blue(blue),	//blue vga output - 2 bits
    .hsync(hsync),			//horizontal sync out
    .vsync(vsync),			//vertical sync out
	 .vgaclk(vgaclk),			//VGA clock - 25MHz
	 .game_over(game_over),
	 .game_completed(game_completed),
	 .use_win_goal(use_win_goal),
	 .move_en(move_en),
	 .gen_active(gen_active),
	 .current_state(current_state)
	);
	
	always #10 clock = ~clock;
	
	initial begin
		clock = 0;
		RST = 1'b0;
		BTN_R = 1'b0;
		BTN_L = 1'b0;
		BTN_T = 1'b0;
		BTN_B = 1'b0;
		win_goal = 4'b0101;
		
		#10
		RST = 1'b1;
		#15
		assert(current_state === RESET) else $error("State RESET failed");
		RST = 1'b0;
		#10
		assert(current_state === CONTINUE) else $error ("State CONTINUE after RESET failed");
		#10
		assert(current_state === MOVE) else $error ("State MOVE after CONTINUE failed 1");
		BTN_R = 1'b1;
		#10
		assert(current_state === CONTINUE) else $error("State CONTINUE after MOVE failed");
		BTN_R = 1'b0;
		#10
		assert(current_state === MOVE) else $error("State MOVE after CONTINUE failed 2");
		
	end
		
endmodule