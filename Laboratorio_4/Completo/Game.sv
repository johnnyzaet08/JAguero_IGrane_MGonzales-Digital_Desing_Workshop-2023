`timescale 1ns / 1ps

module Game(
    input wire clk,				//master clock = 50MHz
    input wire RST,				//center pushbutton for reset
    input wire BTN_RIGHT,   	//right-most pushbutton
    input wire BTN_LEFT,    	//left-most pushbutton
    input wire BTN_TOP,     	//top-most pushbutton
    input wire BTN_BOT,     	//bottom-most pushbutton
	 input reg [3:0] win_goal,
    output wire [6:0] display1,    	//seven-segment display 1
	 output wire [6:0] display2,    	//seven-segment display 2
	 output wire [6:0] display3,    	//seven-segment display 3
	 output wire [6:0] display4,    	//seven-segment display 4
    output wire [7:0] red,		//red vga output - 3 bits
    output wire [7:0] green,	//green vga output - 3 bits
    output wire [7:0] blue,	//blue vga output - 2 bits
    output wire hsync,			//horizontal sync out
    output wire vsync,			//vertical sync out
	 output wire vgaclk,			//VGA clock - 25MHz
	 output reg game_over,
	 output reg game_completed,
	 output reg [3:0] use_win_goal,
	 output wire move_en,
	 output wire gen_active
	);

 
    // processed reset button
    wire rst;
    wire btn_right, btn_left, btn_top, btn_bot;
	 
	 
	 // fsm variables
	 wire fsm_reset, trigger;
	 logic [2:0] state, next_state;
	 localparam
	 RESET= 3'b001, // reset
	 LOSE = 3'b010, // lost
	 WIN = 3'b011, // won
	 MOVE = 3'b100, // move
	 CONTINUE = 3'b101; // continue

	 
    wire gen_rand;//, gen_active, move_en;
	 reg game_over_aux = 1'b0, game_completed_aux = 1'b0;

	 
    wire [63:0] moved_vals, tilevals;
    wire [15:0] score;
    wire [3:0] score1, score10, score100, score1000; // Values to drive 7-segment display
    assign score1 = score % 10;
    assign score10 = score > 9  ? (score % 100) / 10 : 4'b0000;
    assign score100 = score > 99  ? (score % 1000) / 100 : 4'b0000;
    assign score1000 = score > 999  ? (score % 10000) / 1000 : 4'b0000;

	 
    // Instantiate all button debouncers
    button b_rst(
        .clk(clk),
        .btn(RST),
        .out(rst)
    );
    
    button b_right(
        .clk(clk),
        .btn(BTN_RIGHT),
        .out(btn_right)
    );
    
    button b_left(
        .clk(clk),
        .btn(BTN_LEFT),
        .out(btn_left)
    );
    
    button b_top(
        .clk(clk),
        .btn(BTN_TOP),
        .out(btn_top)
    );
    
    button b_bottom(
        .clk(clk),
        .btn(BTN_BOT),
        .out(btn_bot)
    );

	 
    // Register movements
    movement register_movement(
       .up(btn_top),
		 .down(btn_bot),
       .left(btn_left),
       .right(btn_right),
       .rst(fsm_reset),
       .enable(move_en),
       .inTilevals(tilevals),
       .outTilevals(moved_vals)
	);
	
    //Generate random numbers
    rng random_number(
        .clk(clk),
        .up(btn_top),
		  .down(btn_bot),
        .left(btn_left),
        .right(btn_right),
		  .enable(move_en),
        .rst(fsm_reset),
        .in_vals(moved_vals),
        .out_vals(tilevals),
        .waiting(gen_active)
    );
	 

    // 7-segment display	 
	 displayconverter converter1(score1, display1);
	 displayconverter converter2(score10, display2);
	 displayconverter converter3(score100, display3);
	 displayconverter converter4(score1000, display4);

    // VGA controller
	 vga_controller controller_vga(
		.clk(clk),           	// 50 MHz
		.vgaclk(vgaclk),			// 25 MHz
		.vals(tilevals),			
		.hsync(hsync),      		// horizontal sync
		.vsync(vsync),	   		// vertical sync
		.r_red(red),
		.r_green(green),
		.r_blue(blue),
		.gameover(game_over_aux),
		.gamecompleted(game_completed_aux)
	 );
	
	
	//Game state
    gamestate game_state(
        .tilevals(tilevals),
		  .win_condition(use_win_goal),
        .score(score),
        .game_over(game_over),
		  .game_complete(game_completed)
    );
	 
	 always_ff @ (posedge clk or posedge rst)
		if (rst) state = RESET;
		else state = next_state;
	
	always @ (*)
		begin
			case (state)
				RESET: begin
					fsm_reset = rst;
					next_state <= CONTINUE;
					game_over_aux <= 1'b0;
					game_completed_aux <= 1'b0;
					use_win_goal <= 4'b0000; 
					use_win_goal <= win_goal;
				end
				CONTINUE: begin
					trigger = 1'b0;
					move_en = ~game_over & ~game_completed;
					
					if (game_over == 1'b1) begin
						next_state <= LOSE;
					end else if (game_completed == 1'b1) begin
						next_state <= WIN;
					end else if (move_en == 1'b1) begin
						next_state <= MOVE;
					end
				end
				MOVE: begin
					if (btn_right | btn_left | btn_top | btn_bot) begin
						trigger = 1'b1;
						next_state <= CONTINUE;
					end
				end 
				LOSE: begin
					game_over_aux = 1'b1;
				end
				WIN: begin
					game_completed_aux = 1'b1;
				end
			endcase
		end

endmodule
