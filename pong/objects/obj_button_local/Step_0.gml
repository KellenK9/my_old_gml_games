/// @description Steps

if(position_meeting(mouse_x, mouse_y, self)){
	image_index = 1
	if(mouse_check_button_pressed(mb_any)){
		audio_play_sound(Sound_click, 1, false)
		global.ai = false
		if(variable_global_exists("ai_speed") == false){
			global.ai_speed = 0.2
		}
		if(variable_global_exists("min_angle") == false){
			global.min_angle = 0.1
		}
		room_goto(Room1)
	}
}
else{
	image_index = 0
}