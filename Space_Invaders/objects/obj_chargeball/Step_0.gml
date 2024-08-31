/// @description Step

if(released == true){
	y = y - 2
	//image_index = 8
}
else if(image_index < 15 and alarm[0] < 0){
	alarm[0] = 6
}

if(global.dead == true){
	instance_destroy(id)
}