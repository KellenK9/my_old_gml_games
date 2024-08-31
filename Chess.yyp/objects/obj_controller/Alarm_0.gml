/// @desc determines spaces that pieces can move to

//types: 1-king, 2-queen, 3-bishop, 4-knight, 5-rook, 6-pawn

//white pieces
for(i=0; i<16; i++){
	if(instance_exists(global.white_moves[i,0])){
		curr_space = 0;
		if(i<8){
			type = 6;
		}
		else if(i==8 || i==15){
			type = 5;
		}
		else if(i==9 || i==14){
			type = 4;
		}
		else if(i==10 || i==13){
			type = 3;
		}
		else if(i==11){
			type = 1;
		}
		else if(i==12){
			type = 2;
		}
		for(j=1; j<65; j++){
			if(global.white_moves[i,j] == 2){
				curr_space = j;
			}
		}
		if(type == 6){ //dictates spaces white pawns can move
			if(global.positions[curr_space+7] == 0){
				global.white_moves[i, curr_space+8] = 1;
			}
			if(curr_space%8 != 1 && global.positions[curr_space+6] == 2){
				global.white_moves[i, curr_space+7] = 1;
			}
			if(curr_space%8 != 0 && global.positions[curr_space+8] == 2){
				global.white_moves[i, curr_space+9] = 1;
			}
			if(curr_space < 20 && global.positions[curr_space+7] == 0){
				if(global.positions[curr_space+15] == 0 && curr_space < 17){
					global.white_moves[i, curr_space+16] = 1;
				}
			}
		}
		else if(type == 5){ //dictates spaces white rooks can move
			in_loop = true
			xx = curr_space;
			do{
				xx = xx + 1;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space;
			do{
				xx = xx - 1;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 8;
				if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space;
			do{
				xx = xx - 8;
				if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
		}
		else if(type == 3){ //dictates spaces white bishops can move
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 9;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space;
			do{
				xx = xx + 7;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 7;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 9;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
		}
		else if(type == 2){ //dictates queens spaces to move
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 1;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 1;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 8;
				if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 8;
				if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 9;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 7;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true;
			xx = curr_space;
			do{
				xx = xx - 7;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space;
			do{
				xx = xx - 9;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 1){
					global.white_moves[i, xx] = 1;
					if(global.positions[xx-1] == 2){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
		}
		else if(type == 1){ //dictates kings spaces to move to
			for(i=0; i<64; i++){ //array of safe spaces, 0 means safe, 1 means unsafe
				unsafe_spaces[i] = 0;
			}
			for(i=0; i<16; i++){ //determines spaces targeted
				for(j=1; j<65; j++){
					if(global.black_moves[i,j] == 1){
						unsafe_spaces[j-1] = 1;
					}
				}
			}
			if(curr_space < 57){
				if(global.positions[curr_space+7] != 1){ //move up
					if(unsafe_spaces[curr_space+7] == 0){
						global.white_moves[i, curr_space+8] = 1;
					}
				}
			}
			if(curr_space > 8){
				if(global.positions[curr_space-9] != 1){ //move down
					if(unsafe_spaces[curr_space-9] == 0){
						global.white_moves[i, curr_space-8] = 1;
					}
				}
			}
			if(curr_space < 57 && curr_space%8!=0){
				if(global.positions[curr_space+8] != 1){ //move up-right
					if(unsafe_spaces[curr_space+8] == 0){
						global.white_moves[i, curr_space+9] = 1;
					}
				}
			}
			if(curr_space < 57 && curr_space%8!=1){
				if(global.positions[curr_space+6] != 1){ //move up-left
					if(unsafe_spaces[curr_space+6] == 0){
						global.white_moves[i, curr_space+7] = 1;
					}
				}
			}
			if(curr_space > 8 && curr_space%8!=0){
				if(global.positions[curr_space-8] != 1){ //move down-right
					if(unsafe_spaces[curr_space-8] == 0){
						global.white_moves[i, curr_space-7] = 1;
					}
				}
			}
			if(curr_space > 8 && curr_space%8!=1){
				if(global.positions[curr_space-10] != 1){ //move down-left
					if(unsafe_spaces[curr_space-10] == 0){
						global.white_moves[i, curr_space-9] = 1;
					}
				}
			}
			if(curr_space%8!=0){
				if(global.positions[curr_space] != 1){ //move right
					if(unsafe_spaces[curr_space] == 0){
						global.white_moves[i, curr_space+1] = 1;
					}
				}
			}
			if(curr_space%8!=1){
				if(global.positions[curr_space-2] != 1){ //move left
					if(unsafe_spaces[curr_space-2] == 0){
						global.white_moves[i, curr_space-1] = 1;
					}
				}
			}
		}
		else if(type == 4){ //dictates where a knight can move
			if(curr_space < 49 && curr_space%8!=0){
				if(global.positions[curr_space+16] != 1){ //move up-up-right
					global.white_moves[i, curr_space+17] = 1;
				}
			}
			if(curr_space < 49 && curr_space%8!=1){
				if(global.positions[curr_space+14] != 1){ //move up-up-left
					global.white_moves[i, curr_space+15] = 1;
				}
			}
			if(curr_space > 16 && curr_space%8!=0){
				if(global.positions[curr_space-16] != 1){ //move down-down-right
					global.white_moves[i, curr_space-15] = 1;
				}
			}
			if(curr_space > 16 && curr_space%8!=1){
				if(global.positions[curr_space-18] != 1){ //move down-down-left
					global.white_moves[i, curr_space-17] = 1;
				}
			}
			if(curr_space < 57 && curr_space%8!=0 && curr_space%8!=7){
				if(global.positions[curr_space+9] != 1){ //move right-right-up
					global.white_moves[i, curr_space+10] = 1;
				}
			}
			if(curr_space < 57 && curr_space%8!=1 && curr_space%8!=2){
				if(global.positions[curr_space+5] != 1){ //move left-left-up
					global.white_moves[i, curr_space+6] = 1;
				}
			}
			if(curr_space > 8 && curr_space%8!=0 && curr_space%8!=7){
				if(global.positions[curr_space-7] != 1){ //move right-right-down
					global.white_moves[i, curr_space-6] = 1;
				}
			}
			if(curr_space > 8 && curr_space%8!=1 && curr_space%8!=2){
				if(global.positions[curr_space-11] != 1){ //move left-left-down
					global.white_moves[i, curr_space-10] = 1;
				}
			}
		}
	}
}









//types: 1-king, 2-queen, 3-bishop, 4-knight, 5-rook, 6-pawn
//Black pieces
for(i=0; i<16; i++){
	if(instance_exists(global.black_moves[i,0])){
		curr_space = 0;
		if(i<8){
			type = 6;
		}
		else if(i==8 || i==15){
			type = 5;
		}
		else if(i==9 || i==14){
			type = 4;
		}
		else if(i==10 || i==13){
			type = 3;
		}
		else if(i==11){
			type = 1;
		}
		else if(i==12){
			type = 2;
		}
		for(j=1; j<65; j++){
			if(global.black_moves[i,j] == 2){
				curr_space = j;
			}
		}
		if(type == 6){ //dictates spaces black pawns can move
			if(global.positions[curr_space-9] == 0){
				global.black_moves[i, curr_space-8] = 1;
			}
			if(curr_space%8 != 1 && global.positions[curr_space-10] == 1){
				global.black_moves[i, curr_space-9] = 1;
			}
			if(curr_space%8 != 0 && global.positions[curr_space-8] == 1){
				global.black_moves[i, curr_space-7] = 1;
			}
			if(curr_space > 30 && global.positions[curr_space-9] == 0){
				if(global.positions[curr_space-17] == 0 && curr_space > 48){
					global.black_moves[i, curr_space-16] = 1;
				}
			}
		}
		else if(type == 5){ //dictates spaces black rooks can move
			in_loop = true
			xx = curr_space;
			do{
				xx = xx + 1;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 1;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 8;
				if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 8;
				if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
		}
		else if(type == 3){ //dictates spaces black bishops can move
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 9;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 7;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 7;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 9;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
		}
		else if(type == 2){ //dictates queens spaces to move
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 1;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 1;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 8;
				if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 8;
				if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 9;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx + 7;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(xx > 64){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 7;
				if(xx%8 == 1){
					in_loop = false;
				}
				else if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
			in_loop = true
			xx = curr_space
			do{
				xx = xx - 9;
				if(xx%8 == 0){
					in_loop = false;
				}
				else if(xx < 2){
					in_loop = false;
				}
				else if(global.positions[xx-1] != 2){
					global.black_moves[i, xx] = 1;
					if(global.positions[xx-1] == 1){
						in_loop = false;
					}
				}
				else{
					in_loop = false;
				}
			}
			until(in_loop == false);
		}
		else if(type == 1){ //dictates kings spaces to move to
			for(i=0; i<64; i++){ //array of safe spaces, 0 means safe, 1 means unsafe
				unsafe_spaces[i] = 0;
			}
			for(i=0; i<16; i++){ //determines spaces targeted
				for(j=1; j<65; j++){
					if(global.white_moves[i,j] == 1){
						unsafe_spaces[j-1] = 1;
					}
				}
			}
			if(curr_space < 57){
				if(global.positions[curr_space+7] != 2){ //move up
					if(unsafe_spaces[curr_space+7] == 0){
						global.black_moves[i, curr_space+8] = 1;
					}
				}
			}
			if(curr_space > 8){
				if(global.positions[curr_space-9] != 2){ //move down
					if(unsafe_spaces[curr_space-9] == 0){
						global.black_moves[i, curr_space-8] = 1;
					}
				}
			}
			if(curr_space < 57 && curr_space%8!=0){
				if(global.positions[curr_space+8] != 2){ //move up-right
					if(unsafe_spaces[curr_space+8] == 0){
						global.black_moves[i, curr_space+9] = 1;
					}
				}
			}
			if(curr_space < 57 && curr_space%8!=1){
				if(global.positions[curr_space+6] != 2){ //move up-left
					if(unsafe_spaces[curr_space+6] == 0){
						global.black_moves[i, curr_space+7] = 1;
					}
				}
			}
			if(curr_space > 8 && curr_space%8!=0){
				if(global.positions[curr_space-8] != 2){ //move down-right
					if(unsafe_spaces[curr_space-8] == 0){
						global.black_moves[i, curr_space-7] = 1;
					}
				}
			}
			if(curr_space > 8 && curr_space%8!=1){
				if(global.positions[curr_space-10] != 2){ //move down-left
					if(unsafe_spaces[curr_space-10] == 0){
						global.black_moves[i, curr_space-9] = 1;
					}
				}
			}
			if(curr_space%8!=0){
				if(global.positions[curr_space] != 2){ //move right
					if(unsafe_spaces[curr_space] == 0){
						global.black_moves[i, curr_space+1] = 1;
					}
				}
			}
			if(curr_space%8!=1){
				if(global.positions[curr_space-2] != 2){ //move left
					if(unsafe_spaces[curr_space-2] == 0){
						global.black_moves[i, curr_space-1] = 1;
					}
				}
			}
		}
		else if(type == 4){ //dictates where a knight can move
			if(curr_space < 49 && curr_space%8!=0){
				if(global.positions[curr_space+16] != 2){ //move up-up-right
					global.black_moves[i, curr_space+17] = 1;
				}
			}
			if(curr_space < 49 && curr_space%8!=1){
				if(global.positions[curr_space+14] != 2){ //move up-up-left
					global.black_moves[i, curr_space+15] = 1;
				}
			}
			if(curr_space > 16 && curr_space%8!=0){
				if(global.positions[curr_space-16] != 2){ //move down-down-right
					global.black_moves[i, curr_space-15] = 1;
				}
			}
			if(curr_space > 16 && curr_space%8!=1){
				if(global.positions[curr_space-18] != 2){ //move down-down-left
					global.black_moves[i, curr_space-17] = 1;
				}
			}
			if(curr_space < 57 && curr_space%8!=0 && curr_space%8!=7){
				if(global.positions[curr_space+9] != 2){ //move right-right-up
					global.black_moves[i, curr_space+10] = 1;
				}
			}
			if(curr_space < 57 && curr_space%8!=1 && curr_space%8!=2){
				if(global.positions[curr_space+5] != 2){ //move left-left-up
					global.black_moves[i, curr_space+6] = 1;
				}
			}
			if(curr_space > 8 && curr_space%8!=0 && curr_space%8!=7){
				if(global.positions[curr_space-7] != 2){ //move right-right-down
					global.black_moves[i, curr_space-6] = 1;
				}
			}
			if(curr_space > 8 && curr_space%8!=1 && curr_space%8!=2){
				if(global.positions[curr_space-11] != 2){ //move left-left-down
					global.black_moves[i, curr_space-10] = 1;
				}
			}
		}
	}
}