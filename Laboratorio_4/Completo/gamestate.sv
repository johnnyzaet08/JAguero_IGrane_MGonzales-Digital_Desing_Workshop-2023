// Performs logic to comput game state and update signals

module gamestate(
    input [63:0] tilevals,
    output wire [15:0] score,
    output wire game_over,       // Says if game is in finished state
	 output wire game_complete
);

    wire tiles_full;
    wire r1, r2, r3, r4;
    wire c1, c2, c3, c4;


    // Game is over if every tile is filled
    assign tiles_full = |tilevals[63:60] & |tilevals[59:56] & |tilevals[55:52] & |tilevals[51:48] &
                       |tilevals[47:44] & |tilevals[43:40] & |tilevals[39:36] & |tilevals[35:32] &
                       |tilevals[31:28] & |tilevals[27:24] & |tilevals[23:20] & |tilevals[19:16] &
                       |tilevals[15:12] & |tilevals[11:8] & |tilevals[7:4] & |tilevals[3:0];
    // Check if rows have no same adjacent tiles
    // each thing is true if there is a pair that has a match to be made
    assign r1 = (tilevals[63:60] == tilevals[59:56]) || (tilevals[59:56] == tilevals[55:52]) || (tilevals[55:52] == tilevals[51:48]);
    assign r2 = (tilevals[47:44] == tilevals[43:40]) || (tilevals[43:40] == tilevals[39:36]) || (tilevals[39:36] == tilevals[35:32]);
    assign r3 = (tilevals[31:28] == tilevals[27:24]) || (tilevals[27:24] == tilevals[23:20]) || (tilevals[23:20] == tilevals[19:16]);
    assign r4 = (tilevals[15:12] == tilevals[11:8]) || (tilevals[11:8] == tilevals[7:4]) && (tilevals[7:4] == tilevals[3:0]);
    // Check if columns have no same adjacent tiles
    assign c1 = (tilevals[63:60] == tilevals[47:44]) || (tilevals[47:44] == tilevals[31:28]) || (tilevals[31:28] == tilevals[15:12]);
    assign c2 = (tilevals[59:56] == tilevals[43:40]) || (tilevals[43:40] == tilevals[27:24]) || (tilevals[27:24] == tilevals[11:8]);
    assign c3 = (tilevals[55:52] == tilevals[39:36]) || (tilevals[39:36] == tilevals[23:20]) || (tilevals[23:20] == tilevals[7:4]);
    assign c4 = (tilevals[51:48] == tilevals[35:32]) || (tilevals[35:32] == tilevals[19:16]) || (tilevals[19:16] == tilevals[3:0]);

    assign game_over = tiles_full & ~(r1 | r2 | r3 | r4 | c1 | c2 | c3 | c4);
	 
	 /* Logick to check for highest value and if highest_value == 2048 begin assign game_completed = TRUE*/
	 assign game_completed = (tilevals[63:60] == 4'd2048 | tilevals[59:56] == 4'd2048 | tilevals[55:52] == 4'd2048 |
								tilevals[51:48] == 4'd2048 | tilevals[47:44] == 4'd2048 | tilevals[43:40] == 4'd2048 |
								tilevals[39:36] == 4'd2048 | tilevals[35:32] == 4'd2048 | tilevals[31:28] == 4'd2048 |
								tilevals[27:24] == 4'd2048 | tilevals[23:20] == 4'd2048 | tilevals[19:16] == 4'd2048 |
								tilevals[15:12] == 4'd2048 | tilevals[11:8] == 4'd2048 | tilevals[7:4] == 4'd2048 | 
								tilevals[3:0] == 4'd2048);

    assign score = (tilevals[63:60] == 0 ? 0 : 16'd1 << tilevals[63:60])
                   + (tilevals[59:56] == 0 ? 0 : 16'd1 << tilevals[59:56])
                   + (tilevals[55:52] == 0 ? 0 : 16'd1 << tilevals[55:52])
                   + (tilevals[51:48] == 0 ? 0 : 16'd1 << tilevals[51:48])
                   + (tilevals[47:44] == 0 ? 0 : 16'd1 << tilevals[47:44])
                   + (tilevals[43:40] == 0 ? 0 : 16'd1 << tilevals[43:40])
                   + (tilevals[39:36] == 0 ? 0 : 16'd1 << tilevals[39:36])
                   + (tilevals[35:32] == 0 ? 0 : 16'd1 << tilevals[35:32])
                   + (tilevals[31:28] == 0 ? 0 : 16'd1 << tilevals[31:28])
                   + (tilevals[27:24] == 0 ? 0 : 16'd1 << tilevals[27:24])
                   + (tilevals[23:20] == 0 ? 0 : 16'd1 << tilevals[23:20])
                   + (tilevals[19:16] == 0 ? 0 : 16'd1 << tilevals[19:16])
                   + (tilevals[15:12] == 0 ? 0 : 16'd1 << tilevals[15:12])
                   + (tilevals[11:8] == 0 ? 0 : 16'd1 << tilevals[11:8])
                   + (tilevals[7:4] == 0 ? 0 : 16'd1 << tilevals[7:4])
                   + (tilevals[3:0] == 0 ? 0 : 16'd1 << tilevals[3:0]);

endmodule