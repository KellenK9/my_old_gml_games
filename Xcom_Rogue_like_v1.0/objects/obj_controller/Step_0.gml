/// @description Every step

if(mouse_check_button_pressed(mb_left)){
	if(position_meeting(mouse_x, mouse_y, obj_character)){
		char_hud_vis = true;
	}
}