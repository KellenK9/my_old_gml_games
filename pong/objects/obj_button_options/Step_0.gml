/// @description Steps

if(position_meeting(mouse_x, mouse_y, self)){
	image_index = 1
	if(mouse_check_button_pressed(mb_any)){
		audio_play_sound(Sound_click, 1, false)
		if(variable_global_exists("ai_level") == false){
			global.ai_level = 2
		}
		room_goto(Room_options)
	}
}
else{
	image_index = 0
}