function determine_if_valid(piece_type, starting_x, starting_y, new_x, new_y, piece_placed){
	
	//Pieces can't move to the square they were just on
	if(starting_x == new_x and starting_y == new_y){
		return false;
	}
	
	//Pieces can't attack their own color
	if(piece_placed){
		pieces_present = 1
	}
	else{
		pieces_present = 0
	}
	if(global.white_turn){
		var list = ds_list_create()
		instance_position_list(new_x, new_y, obj_white_piece, list, false)
		if(ds_list_size(list) > pieces_present){
			ds_list_destroy(list)
			return false
		}
		else{
			ds_list_destroy(list)
		}
	}
	else{
		var list = ds_list_create()
		instance_position_list(new_x, new_y, obj_black_piece, list, false)
		if(ds_list_size(list) > pieces_present){
			ds_list_destroy(list)
			return false
		}
		else{
			ds_list_destroy(list)
		}
	}
	
	//coords should range from 0 to 7
	starting_x_coord = (starting_x - 81)/22
	new_x_coord = (new_x - 81)/22
	starting_y_coord = (starting_y - 13)/22
	new_y_coord = (new_y - 13)/22
	
	if(piece_type == 0){ //Drunken Fool
		if(global.white_turn){
			if(abs(starting_x_coord - new_x_coord) == 1 and new_y_coord - starting_y_coord == -1){
				return true
			}
			else{
				if(abs(starting_x_coord - new_x_coord) == 2 and new_y_coord - starting_y_coord == -2){
					if(position_meeting(mean(starting_x, new_x), mean(starting_y, new_y), obj_white_piece)){
						return true
					}
				}
			}
			return false
		}
		else{
			if(abs(starting_x_coord - new_x_coord) == 1 and new_y_coord - starting_y_coord == 1){
				return true
			}
			else{
				if(abs(starting_x_coord - new_x_coord) == 2 and new_y_coord - starting_y_coord == 2){
					if(position_meeting(mean(starting_x, new_x), mean(starting_y, new_y), obj_black_piece)){
						return true
					}
				}
			}
			return false
		}
	}
	if(piece_type == 1){ //Knight
		if((abs(starting_x_coord - new_x_coord) == 1 and abs(starting_y_coord - new_y_coord) == 2) or (abs(starting_x_coord - new_x_coord) == 2 and abs(starting_y_coord - new_y_coord) == 1)){
			return true;
		}
		else{
			return false;
		}
	}
	if(piece_type == 2 or piece_type == 6){ //Rook or Castle
		if(starting_x_coord == new_x_coord and starting_y_coord != new_y_coord){
			distance = abs(starting_y_coord - new_y_coord)
			if(distance == 1){
				return true;
			}
			for(var i=1; i<distance; i++){
				if(position_meeting(starting_x, lerp(starting_y, new_y, i/distance), obj_piece_parent)){
					return false;
				}
			}
			return true;
		}
		if(starting_x_coord != new_x_coord and starting_y_coord == new_y_coord){
			distance = abs(starting_x_coord - new_x_coord)
			if(distance == 1){
				return true;
			}
			for(var i=1; i<distance; i++){
				if(position_meeting(lerp(starting_x, new_x, i/distance), starting_y, obj_piece_parent)){
					return false;
				}
			}
			return true;
		}
		return false;
	}
	if(piece_type == 3){ //Bishop
		if(abs(starting_x_coord - new_x_coord) == abs(starting_y_coord - new_y_coord)){
			distance = abs(starting_y_coord - new_y_coord)
			if(distance == 1){
				return true;
			}
			for(var i=1; i<distance; i++){
				if(position_meeting(lerp(starting_x, new_x, i/distance), lerp(starting_y, new_y, i/distance), obj_piece_parent)){
					return false;
				}
			}
			return true;
		}
		else{
			return false;
		}
	}
	if(piece_type == 4){ //Queen
		//Move like bishop
		if(abs(starting_x_coord - new_x_coord) == abs(starting_y_coord - new_y_coord)){
			distance = abs(starting_y_coord - new_y_coord)
			if(distance == 1){
				return true;
			}
			for(var i=1; i<distance; i++){
				if(position_meeting(lerp(starting_x, new_x, i/distance), lerp(starting_y, new_y, i/distance), obj_piece_parent)){
					return false;
				}
			}
			return true;
		}
		//Move like rook
		if(starting_x_coord == new_x_coord and starting_y_coord != new_y_coord){
			distance = abs(starting_y_coord - new_y_coord)
			if(distance == 1){
				return true;
			}
			for(var i=1; i<distance; i++){
				if(position_meeting(starting_x, lerp(starting_y, new_y, i/distance), obj_piece_parent)){
					return false;
				}
			}
			return true;
		}
		if(starting_x_coord != new_x_coord and starting_y_coord == new_y_coord){
			distance = abs(starting_x_coord - new_x_coord)
			if(distance == 1){
				return true;
			}
			for(var i=1; i<distance; i++){
				if(position_meeting(lerp(starting_x, new_x, i/distance), starting_y, obj_piece_parent)){
					return false;
				}
			}
			return true;
		}
		return false;
	}
	if(piece_type == 5){ //King
		if(abs(starting_x_coord - new_x_coord) < 2 and abs(starting_y_coord - new_y_coord) < 2){
			if(piece_placed){
				if(global.white_turn){
					global.white_can_castle = false
				}
				else{
						global.black_can_castle = false
				}
			}
			return true;
		}
		if((global.white_turn and global.white_can_castle) or (!global.white_turn and global.black_can_castle)){
			if(starting_x_coord - new_x_coord == -2){
				if(new_y_coord == starting_y_coord){
					if(!position_meeting(new_x-22, new_y, obj_piece_parent)){
						if(position_meeting(new_x+22, new_y, obj_castle)){
							if(piece_placed){
								if(global.white_turn){
									global.white_can_castle = false
								}
								else{
									global.black_can_castle = false
								}
								curr_castle = instance_nearest(new_x+22, new_y, obj_castle)
								curr_castle.x = starting_x+22
							}
							return true;
						}
					}
				}
			}
			if(starting_x_coord - new_x_coord == 2){
				if(new_y_coord == starting_y_coord){
					if(!position_meeting(new_x+22, new_y, obj_piece_parent)){
						if(position_meeting(new_x-44, new_y, obj_castle)){
							if(piece_placed){
								if(global.white_turn){
									global.white_can_castle = false
								}
								else{
									global.black_can_castle = false
								}
								curr_castle = instance_nearest(new_x-44, new_y, obj_castle)
								curr_castle.x = starting_x-22
							}
							return true;
						}
					}
				}
			}
		}
		return false;
	}
	return false;
}