/// @description Controls Everything

global.white_turn = true
global.white_taken_x = 248
global.white_taken_y = 22
global.black_taken_x = 248
global.black_taken_y = 60
global.white_pieces_taken = 0
global.black_pieces_taken = 0
global.game_over = false
global.white_can_castle = true
global.black_can_castle = true

tile_depth = 0
promotion_depth = -1
piece_depth = -100
tile_width = 22
y_min = (tile_width / 2) + 2
y_max = room_height - y_min + tile_width
x_min = ((room_width - room_height) / 2) + y_min
x_max = room_width - x_min + tile_width
tile_switch = true

//Create Tiles
for(x_pos = x_min; x_pos < x_max; x_pos += tile_width){
	for(y_pos = y_min; y_pos < y_max; y_pos += tile_width){
		if(tile_switch){
			instance_create_depth(x_pos, y_pos, tile_depth, obj_tile1)
			tile_switch = false
		}
		else{
			instance_create_depth(x_pos, y_pos, tile_depth, obj_tile2)
			tile_switch = true
		}
	}
	if(tile_switch){
		tile_switch = false
	}
	else{
		tile_switch = true
	}
}

//Create Pieces
for(x_pos = x_min; x_pos < x_max; x_pos += tile_width){
	for(y_pos = y_min; y_pos < y_max; y_pos += tile_width){
		if(y_pos == 13 or y_pos == 35){
			if(y_pos == 13 and (x_pos == x_min or x_pos == x_max - tile_width)){
				instance_create_depth(x_pos, y_pos, piece_depth, obj_castle)
			}
			else{
				instance_create_depth(x_pos, y_pos, piece_depth, obj_black_piece)
			}
		}
		if(y_pos == 167 or y_pos == 145){
			if(y_pos == 167 and (x_pos == x_min or x_pos == x_max - tile_width)){
				instance_create_depth(x_pos, y_pos, piece_depth, obj_castle)
			}
			else{
				instance_create_depth(x_pos, y_pos, piece_depth, obj_white_piece)
			}
		}
	}
}

//Create Promotions
instance_create_depth(x_min+tile_width, y_min+tile_width, -1, obj_promotion)
instance_create_depth(x_max-(2*tile_width), y_max-(2*tile_width), -1, obj_promotion)

//Create Buttons
instance_create_depth(x_max+26, 162, 0, obj_bless_button)
