/// @description Steps

if(position_meeting(mouse_x, mouse_y, self)){
	image_index = 1
	if(mouse_check_button_pressed(mb_any)){
		game_end()
	}
}
else{
	image_index = 0
}