module Logica(input int matrixIn[3:0][3:0], input logic [3:0] movement, input clk, rst, output int matrixOut[3:0][3:0]);

	// parametros locales
	localparam 
	SIZE = 16,
	WIN_CONDITION = 2048,
	NEW_VALUE = 2;
	
	logic WON = 0;
	logic LOST = 0;
	logic [2:0] state, next_state;
	
	// asignar a la matriz donde se va a trabajar la matriz de entrada
	int matrixWork[3:0][3:0];
	assign matrixWork = matrixIn;
	
	// estados de la maquina de estados
	localparam
	RESET= 3'b001, // inicio/reset
	LOSE = 3'b010, // perder
	WIN = 3'b011, // ganar
	MOVE = 3'b100, // mover hacia un lado
	MERGE = 3'b101, // combinar celdas
	END = 3'b110, // fin del juego
	CONTINUE = 3'b111; // continua el juego
	
	// logica para chequear y sumar blockes andjuntos
	task hacer_sumas(input int matrixVer [3:0][3:0], input logic [3:0] movement,output int matrixSum [3:0][3:0]);
		matrixSum = matrixVer;
		case (movement)
			4'b0001: begin
				// para revisar hacia la derecha
				for (int i = 0; i < 4; i++) begin
					for (int j = 3; j >= 0; j--) begin
						if (j < 3) begin 
							if (matrixSum[i][j] == matrixSum[i][j+1]) begin
								matrixSum[i][j+1] *= 2;
								matrixSum[i][j] = 0;
							end
						end
					end
				end
			end
			4'b0010: begin
				// para revisar hacia la izquierda
				for (int i = 0; i < 4; i++) begin
					for (int j = 0; j < 4; j++) begin
						if (j > 0) begin 
							if (matrixSum[i][j] == matrixSum[i][j-1]) begin
								matrixSum[i][j-1] *= 2;
								matrixSum[i][j] = 0;
							end
						end
					end
				end
			end
			4'b0100: begin
				// para revisar hacia arriba
				for (int i = 0; i < 4; i++) begin
					for (int j = 0; j < 4; j++) begin
						if (i > 0) begin 
							if (matrixSum[i][j] == matrixSum[i-1][j]) begin
								matrixSum[i-1][j] *= 2;
								matrixSum[i][j] = 0;
							end
						end
					end
				end
			end
			4'b1000: begin
				// para revisar hacia abajo
				for (int i = 3; i >= 0; i--) begin
					for (int j = 0; j < 4; j++) begin
						if (i < 3) begin
							if (matrixSum[i][j] == matrixSum[i+1][j]) begin
								matrixSum[i+1][j] *= 2;
								matrixSum[i][j] = 0;
							end
						end
					end
				end
			end
		endcase
	endtask
				
		
	
	/*always_ff @ (posedge clk or posedge rst)
		if (rst) state = 3'b000;
		else state = next_state;*/
	
	always @ (*)
		begin
			case (state)
				RESET: begin
					matrixWork = '{ '{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0}, '{0,0,0,0} };
					// tambien se requiere hacer la parte de asignar un par de valores inciales aleatoriamente en el tablero
					state <= CONTINUE;
				end
				CONTINUE: begin
					//assign matrixOut = matrixWork; <----- Esto esta dando error!
					if (WON||LOST) begin
						state <= END;
					end else begin
						// asignar de manera aleatoria el nuevo valor en el tablero
						state <= MOVE;
					end
				end
				MOVE: begin
					// chequear si hay bloques uno a la par del otro para hacerles el merge
					state <= MERGE;
					// si no state <= CONTINUE
				end 
				MERGE: begin
					// aqui se verifica el tablero y se hacen los merges necesarios
					hacer_sumas(matrixWork, movement, matrixWork);
					state <= CONTINUE;
				end
				END: begin
					// logica para perder, es decir que no haya ningun espacio en 0
					state <= RESET;
				end
				WIN: begin
					// logica para ganar, es decir que se haya llegado a WIN_CONDITION
					state <= RESET;
				end
			endcase
		end
endmodule