/// @description Steps

if(position_meeting(mouse_x, mouse_y, self)){
	image_index = 1
	if(mouse_check_button_pressed(mb_any)){
		audio_play_sound(Sound_click, 1, false)
		global.ai_speed = 0.1
		global.min_angle = 0.1
		global.ai_level = 1
	}
}
else{
	image_index = 0
}

if(global.ai_level == 1){
	image_index = 2
}