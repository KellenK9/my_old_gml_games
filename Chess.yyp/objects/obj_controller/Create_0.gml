/// @desc initialize global variables

/* Comment Section for notes about entire program

-add castling
-add en pasant
-add pawns getting to the end
-fix alarm 0, lines 370 and 850, sections conatin where the king can move and preventing moving into check
-fix left side of board being unable to move (queen, rook, bishop, knight)

*/

global.turn = 1; //1 for White's turn, 2 for black's
global.holding_piece = false; //if mouse is holding a piece
global.piece_clicked = false; //if a piece is selected to move
alarm[0] = 1; //updates available moves matrix
instance_held = noone;
global.whiteincheck = false;
global.blackincheck = false;
global.blackinCheckmate = false;
global.whiteinCheckmate = false;
global.stalemate = false;

//array holding all possible moves. [16x65] one for each color
//first value is the instance of the piece
//each other value is a square on the board
//values are 1 if piece can move their or 0 if not, 2 if that's where the piece currently is
//0 = instance, 1 = A1, 8 = H1, 9 = A2, 64 = H8
for(i=0; i<16; i++){
	for(j=1; j<65; j++){
		global.white_moves[i,j] = 0;
	}
}
global.white_moves[0,0] = global.Wpawn1ID; //pawns
global.white_moves[0,9] = 2;             //dictates space 9 to be taken up by the piece
global.white_moves[1,0] = global.Wpawn2ID;
global.white_moves[1,10] = 2;
global.white_moves[2,0] = global.Wpawn3ID;
global.white_moves[2,11] = 2;
global.white_moves[3,0] = global.Wpawn4ID;
global.white_moves[3,12] = 2;
global.white_moves[4,0] = global.Wpawn5ID;
global.white_moves[4,13] = 2;
global.white_moves[5,0] = global.Wpawn6ID;
global.white_moves[5,14] = 2;
global.white_moves[6,0] = global.Wpawn7ID;
global.white_moves[6,15] = 2;
global.white_moves[7,0] = global.Wpawn8ID; //pawns
global.white_moves[7,16] = 2;
global.white_moves[8,0] = global.Wrook2ID; //rook
global.white_moves[8,8] = 2;
global.white_moves[9,0] = global.Wknight2ID; //knight
global.white_moves[9,7] = 2;
global.white_moves[10,0] = global.Wbishop2ID; //bishop
global.white_moves[10,6] = 2;
global.white_moves[11,0] = global.WkingID; //king
global.white_moves[11,5] = 2;
global.white_moves[12,0] = global.WqueenID; //queen
global.white_moves[12,4] = 2;
global.white_moves[13,0] = global.Wbishop1ID; //bishop
global.white_moves[13,3] = 2;
global.white_moves[14,0] = global.Wknight1ID; //knight
global.white_moves[14,2] = 2;
global.white_moves[15,0] = global.Wrook1ID; //rook
global.white_moves[15,1] = 2;

for(i=0; i<16; i++){
	for(j=1; j<65; j++){
		global.black_moves[i,j] = 0;
	}
}
global.black_moves[0,0] = global.Bpawn1ID; //pawns
global.black_moves[0,49] = 2;
global.black_moves[1,0] = global.Bpawn2ID;
global.black_moves[1,50] = 2;
global.black_moves[2,0] = global.Bpawn3ID;
global.black_moves[2,51] = 2;
global.black_moves[3,0] = global.Bpawn4ID;
global.black_moves[3,52] = 2;
global.black_moves[4,0] = global.Bpawn5ID;
global.black_moves[4,53] = 2;
global.black_moves[5,0] = global.Bpawn6ID;
global.black_moves[5,54] = 2;
global.black_moves[6,0] = global.Bpawn7ID;
global.black_moves[6,55] = 2;
global.black_moves[7,0] = global.Bpawn8ID; //pawns
global.black_moves[7,56] = 2;
global.black_moves[8,0] = global.Brook2ID; //rook
global.black_moves[8,64] = 2;
global.black_moves[9,0] = global.Bknight2ID; //knight
global.black_moves[9,63] = 2;
global.black_moves[10,0] = global.Bbishop2ID; //bishop
global.black_moves[10,62] = 2;
global.black_moves[11,0] = global.BkingID; //king
global.black_moves[11,61] = 2;
global.black_moves[12,0] = global.BqueenID; //queen
global.black_moves[12,60] = 2;
global.black_moves[13,0] = global.Bbishop1ID; //bishop
global.black_moves[13,59] = 2;
global.black_moves[14,0] = global.Bknight1ID; //knight
global.black_moves[14,58] = 2;
global.black_moves[15,0] = global.Brook1ID; //rook
global.black_moves[15,57] = 2;

//position array of 64, holding the color each square
//0 means empty, 1 means white, 2 means black
//0 = A1, 7 = H1, 8 = A2, 63 = H8
for(i=0; i<16; i++){
	global.positions[i] = 1;
}
for(i=16; i<48; i++){
	global.positions[i] = 0;
}
for(i=48; i<64; i++){
	global.positions[i] = 2;
}

//array of captured pieces
for(i=0; i<10; i++){ //first white pieces: pawn, knight, bishop, rook, queen. Then black
	global.taken[i] = 0;
}