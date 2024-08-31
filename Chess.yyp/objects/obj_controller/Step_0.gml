/// @desc every frame update

//var instance_held; //instance id being held

global.turn_change = false;

//checks if holding piece
if(mouse_check_button(mb_left)){
	if(global.turn == 1 && global.holding_piece == false){
		if(position_meeting(mouse_x, mouse_y, obj_parent_white)){
			global.holding_piece = true;
			global.piece_clicked = true;
			instance_destroy(obj_highlights_squares);
			can_draw = true;
			instance_held = collision_point(mouse_x, mouse_y, obj_parent_white, false, true);
			prev_x = instance_held.x;
			prev_y = instance_held.y;
		}
		else{
			if(global.piece_clicked == true && position_meeting(mouse_x, mouse_y, obj_highlights_squares)){
				square_x = instance_nearest(mouse_x,mouse_y,obj_highlights_squares).x;
				square_y = instance_nearest(mouse_x,mouse_y,obj_highlights_squares).y;
				instance_held.x = square_x + 2;
				instance_held.y = square_y + 2;
				if(global.turn == 1){
					global.turn = 2;
				}
				else{
					global.turn = 1;
				}
				global.turn_change = true;
			}
			global.piece_clicked = false;
			instance_destroy(obj_highlights_squares);
			can_draw = true;
		}
	}
	else if(global.holding_piece == false){
		if(position_meeting(mouse_x, mouse_y, obj_parent_black)){
			global.holding_piece = true;
			global.piece_clicked = true;
			instance_destroy(obj_highlights_squares);
			can_draw = true;
			instance_held = collision_point(mouse_x, mouse_y, obj_parent_black, false, true);
			prev_x = instance_held.x;
			prev_y = instance_held.y;
		}
		else{
			if(global.piece_clicked == true && position_meeting(mouse_x, mouse_y, obj_highlights_squares)){
				square_x = instance_nearest(mouse_x,mouse_y,obj_highlights_squares).x;
				square_y = instance_nearest(mouse_x,mouse_y,obj_highlights_squares).y;
				instance_held.x = square_x + 2;
				instance_held.y = square_y + 2;
				if(global.turn == 1){
					global.turn = 2;
				}
				else{
					global.turn = 1;
				}
				global.turn_change = true;
			}
			global.piece_clicked = false;
			instance_destroy(obj_highlights_squares);
			can_draw = true;
		}
	}
}
else{
	if(instance_held != noone && instance_exists(obj_highlights_squares)){
		square_x = instance_nearest(instance_held.x,instance_held.y,obj_highlights_squares).x; //dictates what happens if piece is released
		square_y = instance_nearest(instance_held.x,instance_held.y,obj_highlights_squares).y;
		if(point_distance(instance_held.x-2,instance_held.y-2,square_x,square_y) < 10){
			instance_held.x = square_x + 2;
			instance_held.y = square_y + 2;
			if(global.turn == 1){
				global.turn = 2;
			}
			else{
				global.turn = 1;
			}
			global.turn_change = true;
			instance_destroy(obj_highlights_squares);
		}
		else{
			instance_held.x = prev_x;
			instance_held.y = prev_y;
		}
	}
	else if(instance_held != noone){
		instance_held.x = prev_x;
		instance_held.y = prev_y;
	}
	
	global.holding_piece = false;
}

//determines if a piece captured another
piece_captured = noone;
if(global.turn_change == true){
	if(global.turn == 2 && position_meeting(instance_held.x + 14, instance_held.y + 14, obj_parent_black)){
		piece_captured = instance_position(instance_held.x+14, instance_held.y+14, obj_parent_black);
		for(i=0; i<16; i++){
			if(piece_captured == global.black_moves[i,0]){
				for(j=1; j<65; j++){
					if(global.black_moves[i,j] == 2){
						global.black_moves[i,j] = 0;
					}
				}
			}
		}
		instance_destroy(piece_captured);
	}
	if(global.turn == 1 && position_meeting(instance_held.x + 14, instance_held.y + 14, obj_parent_white)){
		piece_captured = instance_position(instance_held.x+14, instance_held.y+14, obj_parent_white);
		for(i=0; i<16; i++){
			if(piece_captured == global.white_moves[i,0]){
				for(j=1; j<65; j++){
					if(global.white_moves[i,j] == 2){
						global.white_moves[i,j] = 0;
					}
				}
			}
		}
		instance_destroy(piece_captured);
	}
} //no need to update positions array, that's done later

//moves piece with mouse if holding
if(global.holding_piece == true){
	instance_held.x = mouse_x - 16;
	instance_held.y = mouse_y - 16;
}


//highlights piece if selected/clicked and the squares it can go
if(global.piece_clicked == true && can_draw == true){
	for(i=0; i<16; i++){
		if(global.turn ==1){
			if(global.white_moves[i,0] == instance_held.id){
				for(j=1; j<65; j++){
					if(global.white_moves[i,j] == 1){
						instance_create_depth(obj_board.x-125+(32*((j-1)%8)),obj_board.y-118+16+(32*(7-((j-1-((j-1)%8))/8))),-1000,obj_highlights_squares);
					}
				}
			}
		}
		else{
			if(global.black_moves[i,0] == instance_held.id){
				for(j=1; j<65; j++){
					if(global.black_moves[i,j] == 1){
						instance_create_depth(obj_board.x-125+(32*((j-1)%8)),obj_board.y-118+16+(32*(7-((j-1-((j-1)%8))/8))),-1000,obj_highlights_squares);
					}
				}
			}
		}
	}
	can_draw = false;
}

//determines what spaces each piece can move after each turn
if(global.turn_change == true){
	if(alarm[0] < 0 && alarm[1] < 0){
		alarm[0] = 2;
		alarm[1] = 1;
	}
}

//update array of piece locations after each turn
if(global.turn_change == true){
	//scour move matrices to find instance_held
	for(i=0; i<16; i++){
		if(global.white_moves[i,0] == instance_held.id){
			for(j=1; j<65; j++){
				if(global.white_moves[i,j] == 2){ //remove old place values for piece
					global.white_moves[i,j] = 0;
					global.positions[j-1] = 0;
				}
			}
			num = 1; //use coordinates of instance_held to determine square's number
			if(instance_held.x > 332){
				num = num + 7;
			}
			else if(instance_held.x > 332-(32*1)){
				num = num + 6;
			}
			else if(instance_held.x > 332-(32*2)){
				num = num + 5;
			}
			else if(instance_held.x > 332-(32*3)){
				num = num + 4;
			}
			else if(instance_held.x > 332-(32*4)){
				num = num + 3;
			}
			else if(instance_held.x > 332-(32*5)){
				num = num + 2;
			}
			else if(instance_held.x > 332-(32*6)){
				num = num + 1;
			}
			if(instance_held.y < 47){
				num = num + (8*7);
			}
			else if(instance_held.y < 47+(32*1)){
				num = num + (8*6);
			}
			else if(instance_held.y < 47+(32*2)){
				num = num + (8*5);
			}
			else if(instance_held.y < 47+(32*3)){
				num = num + (8*4);
			}
			else if(instance_held.y < 47+(32*4)){
				num = num + (8*3);
			}
			else if(instance_held.y < 47+(32*5)){
				num = num + (8*2);
			}
			else if(instance_held.y < 47+(32*6)){
				num = num + (8);
			}
			global.positions[num-1] = 1; //update move matrix of matching color and positions array with new location
			global.white_moves[i,num] = 2;
		}
		if(global.black_moves[i,0] == instance_held.id){
			for(j=1; j<65; j++){
				if(global.black_moves[i,j] == 2){ //remove old place values for piece
					global.black_moves[i,j] = 0;
					global.positions[j-1] = 0;
				}
			}
			num = 1; //use coordinates of instance_held to determine square's number
			if(instance_held.x > 332){
				num = num + 7;
			}
			else if(instance_held.x > 332-(32*1)){
				num = num + 6;
			}
			else if(instance_held.x > 332-(32*2)){
				num = num + 5;
			}
			else if(instance_held.x > 332-(32*3)){
				num = num + 4;
			}
			else if(instance_held.x > 332-(32*4)){
				num = num + 3;
			}
			else if(instance_held.x > 332-(32*5)){
				num = num + 2;
			}
			else if(instance_held.x > 332-(32*6)){
				num = num + 1;
			}
			if(instance_held.y < 47){
				num = num + (8*7);
			}
			else if(instance_held.y < 47+(32*1)){
				num = num + (8*6);
			}
			else if(instance_held.y < 47+(32*2)){
				num = num + (8*5);
			}
			else if(instance_held.y < 47+(32*3)){
				num = num + (8*4);
			}
			else if(instance_held.y < 47+(32*4)){
				num = num + (8*3);
			}
			else if(instance_held.y < 47+(32*5)){
				num = num + (8*2);
			}
			else if(instance_held.y < 47+(32*6)){
				num = num + (8);
			}
			global.positions[num-1] = 2; //update move matrix of matching color and positions array with new location
			global.black_moves[i,num] = 2;
		}
	}
	instance_held = noone;
}

//updates array of captured white pieces
pawnstw = 0;
bishopstw = 0;
knightstw = 0;
rookstw = 0;
queenstw = 0;
for(i=0; i<16; i++){
	piece_taken = true;
	for(j=1; j<65; j++){
		if(global.white_moves[i,j] == 2){
			piece_taken = false;
		}
	}
	if(piece_taken == true){
		if(i<8){
			pawnstw++;
			if(global.taken[0] < pawnstw){
				global.taken[0]++;
			}
		}
		else if(i == 9 || i == 14){
			knightstw++;
			if(global.taken[1] < knightstw){
				global.taken[1]++;
			}
		}
		else if(i == 10 || i == 13){
			bishopstw++;
			if(global.taken[2] < bishopstw){
				global.taken[2]++;
			}
		}
		else if(i == 8 || i == 15){
			rookstw++;
			if(global.taken[3] < rookstw){
				global.taken[3]++;
			}
		}
		else if(i == 12){
			queenstw++;
			if(global.taken[4] < queenstw){
				global.taken[4]++;
			}
		}
	}
}
//updates array of captured black pieces
pawnstb = 0;
bishopstb = 0;
knightstb = 0;
rookstb = 0;
queenstb = 0;
for(i=0; i<16; i++){
	piece_taken = true;
	for(j=1; j<65; j++){
		if(global.black_moves[i,j] == 2){
			piece_taken = false;
		}
	}
	if(piece_taken == true){
		if(i<8){
			pawnstb++;
			if(global.taken[5] < pawnstb){
				global.taken[5]++;
			}
		}
		else if(i == 9 || i == 14){
			knightstb++;
			if(global.taken[6] < knightstb){
				global.taken[6]++;
			}
		}
		else if(i == 10 || i == 13){
			bishopstb++;
			if(global.taken[7] < bishopstb){
				global.taken[7]++;
			}
		}
		else if(i == 8 || i == 15){
			rookstb++;
			if(global.taken[8] < rookstb){
				global.taken[8]++;
			}
		}
		else if(i == 12){
			queenstb++;
			if(global.taken[9] < queenstb){
				global.taken[9]++;
			}
		}
	}
}

//determines location of kings
for(i=1; i<65; i++){
	if(global.white_moves[11,i] == 2){
		whitekingspace = i;
	}
	if(global.black_moves[11,i] == 2){
		blackkingspace = i;
	}
}
//determines if kings are in check
for(i=0; i<16; i++){
	if(global.black_moves[i,whitekingspace] == 1){
		global.whiteincheck = true;
	}
}
for(i=0; i<16; i++){
	if(global.white_moves[i,blackkingspace] == 1){
		global.blackincheck = true;
	}
}

//determines if checkmate
if(global.whiteincheck == true){ //white
	global.whiteinCheckmate = true;
	for(i=1; i<65; i++){
		if(global.white_moves[11,i] == 1){
			global.whiteinCheckmate = false;
		}
	}
}
if(global.blackincheck == true){ //black
	global.blackinCheckmate = true;
	for(i=1; i<65; i++){
		if(global.black_moves[11,i] == 1){
			global.blackinCheckmate = false;
		}
	}
}

//determines if in stalemate
global.stalemate = true;
for(i=0; i<16; i++){
	for(j=1; j<65; j++){
		if(global.turn == 1){ //if white's turn
			if(global.white_moves[i,j] == 1){
				global.stalemate = false;
			}
		}
		else{ //if black's turn
			if(global.black_moves[i,j] == 1){
				global.stalemate = false;
			}
		}
	}
}







