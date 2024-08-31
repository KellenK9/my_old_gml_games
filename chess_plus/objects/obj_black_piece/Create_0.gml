/// @description Set Frame

curr_selected = false
taken = 0
occupying_castle = false

if(y == 13){
	if(x == 83 or x == 237){
		image_index = 2
	}
	if(x == 105 or x == 215){
		image_index = 1
	}
	if(x == 127 or x == 193){
		image_index = 3
	}
	if(x == 149){
		image_index = 4
	}
	if(x == 171){
		image_index = 5
	}
}

if(image_index == 3){
	instance_create_depth(x, y, -1500, obj_black_hat)
}
