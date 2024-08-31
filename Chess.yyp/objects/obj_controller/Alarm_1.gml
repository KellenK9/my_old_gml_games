/// @description turns 1's to 0's in move matrices

for(i=0; i<16; i++){
	for(j=1; j<65; j++){
		if(global.white_moves[i,j] == 1){
			global.white_moves[i,j] = 0;
		}
		if(global.black_moves[i,j] == 1){
			global.black_moves[i,j] = 0;
		}
	}
}