/// @description Get Moved

depth = -y - x

if(taken > 0){
	x = global.white_taken_x + ((taken mod 8) * 8)
	y = global.white_taken_y + (1.5 * (taken - (taken mod 8)))
	if(taken - (taken mod 8) > 0){
		x += 8
	}
}
else{
	if(!global.game_over){
		if(mouse_check_button_pressed(mb_any)){
			if(global.white_turn){
				if(position_meeting(mouse_x, mouse_y, self)){
					curr_selected = true
					original_x = x
					original_y = y
					for(i=0; i<64; i++){
						curr_tile = instance_find(obj_tile_parent, i)
						if(occupying_castle){
							piece_type = 6
						}
						else{
							piece_type = image_index
						}
						if(determine_if_valid(piece_type, original_x, original_y, curr_tile.x, curr_tile.y, false)){
							curr_tile.image_blend = c_gray
						}
					}
				}
			}
		}

		if(curr_selected){
			depth = -1000
			if(mouse_check_button(mb_any)){
				x = mouse_x
				y = mouse_y
			}
			else{
				for(i=0; i<64; i++){
					curr_tile = instance_find(obj_tile_parent, i)
					curr_tile.image_blend = c_white
				}
				var list = ds_list_create()
				instance_position_list(x, y, obj_white_piece, list, false)
				if(position_meeting(mouse_x, mouse_y, obj_tile_parent) and ds_list_size(list) == 1){
					move_valid = true
				}
				else{
					move_valid = false
				}
				closest_tile = instance_nearest(mouse_x, mouse_y, obj_tile_parent)
				curr_selected = false
				if(move_valid){
					if(occupying_castle){
						piece_type = 6
					}
					else{
						piece_type = image_index
					}
					move_valid = determine_if_valid(piece_type, original_x, original_y, closest_tile.x, closest_tile.y, true)
				}
				if(move_valid){
					global.white_turn = false
					x = closest_tile.x
					y = closest_tile.y
					audio_play_sound(sound_clack, 1, false)
					curr_castle = instance_nearest(x, y, obj_castle)
					if(point_distance(x, y, curr_castle.x, curr_castle.y) < 11){
						occupying_castle = true
						curr_castle.empty = false
					}
					if(position_meeting(x, y, obj_black_piece)){
						global.black_pieces_taken += 1
						taken_piece = instance_nearest(x, y, obj_black_piece)
						taken_piece.taken = global.black_pieces_taken
					}
				}
				else{
					x = original_x
					y = original_y
					audio_play_sound(sound_error, 1, false)
				}
				ds_list_destroy(list)
			}
		}
	}
}