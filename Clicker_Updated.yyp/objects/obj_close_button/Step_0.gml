/// @description Step

if(position_meeting(mouse_x, mouse_y, self) && global.glove_menu_open == false){
	image_index = 1
	if(mouse_check_button_pressed(mb_left)){
		if(global.closed == true){
			global.closed = false
		}
		else{
			global.closed = true
		}
	}
}
else{
	image_index = 0
}