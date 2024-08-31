/// @description Step

num_frames = 12

if(global.closed == true){
	if(image_index != num_frames - 1){
		image_speed = 1
	}
	else{
		image_speed = 0
	}
}
else{
	if(image_index != 0){
		image_speed = -1
	}
	else{
		image_speed = 0
	}
}
