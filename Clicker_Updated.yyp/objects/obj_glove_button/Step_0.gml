/// @description Step

if(global.glove_menu_open == false){
	if(position_meeting(mouse_x, mouse_y, self)){
		image_index = 1
		if(mouse_check_button_pressed(mb_left)){
			global.glove_menu_open = true
		}
	}
	else{
		image_index = 0
	}
}
else{
	image_index = 0
	if(mouse_check_button_pressed(mb_left)){
		if(!point_in_rectangle(mouse_x, mouse_y, 120, 68, 360, 202)){
			global.glove_menu_open = false
		}
	}
}

if(global.cursor == 1){
	cursor_sprite = spr_glove
}
else if(global.cursor == 2){
	cursor_sprite = spr_glove_blue
}
else if(global.cursor == 3){
	cursor_sprite = spr_glove_red
}
else if(global.cursor == 4){
	cursor_sprite = spr_glove_purple
}
else if(global.cursor == 5){
	cursor_sprite = spr_glove_orange
}
else if(global.cursor == 6){
	cursor_sprite = spr_glove_grey
}
else if(global.cursor == 7){
	cursor_sprite = spr_glove_yellow
}
else if(global.cursor == 8){
	cursor_sprite = spr_glove_teal
}