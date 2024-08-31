/// @description Step

if(mouse_check_button_pressed(mb_any)){
	if(position_meeting(mouse_x, mouse_y, self.id)){
		room_goto(level1)
	}
}

if (gamepad_is_connected(0)){
	a_pressed = gamepad_button_check_pressed(0, gp_face1)
	if(a_pressed > 0){
		room_goto(level1)
	}
}