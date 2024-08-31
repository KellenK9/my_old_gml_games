/// @description Step

if(mouse_check_button_pressed(mb_any)){
	if(position_meeting(mouse_x, mouse_y, self.id)){
		game_end()
	}
}

if (gamepad_is_connected(0)){
	b_pressed = gamepad_button_check_pressed(0, gp_face2)
	if(b_pressed > 0){
		game_end()
	}
}