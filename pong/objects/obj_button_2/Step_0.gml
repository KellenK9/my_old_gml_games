/// @description Steps

if(position_meeting(mouse_x, mouse_y, self)){
	image_index = 1
	if(mouse_check_button_pressed(mb_any)){
		audio_play_sound(Sound_click, 1, false)
		global.ai_speed = 0.2
		global.min_angle = 0.1
		global.ai_level = 2
	}
}
else{
	image_index = 0
}

if(global.ai_level == 2){
	image_index = 2
}