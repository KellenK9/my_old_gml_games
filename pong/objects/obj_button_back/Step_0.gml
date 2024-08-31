/// @description Steps

if(position_meeting(mouse_x, mouse_y, self)){
	image_index = 1
	if(mouse_check_button_pressed(mb_any)){
		audio_play_sound(Sound_click, 1, false)
		room_goto(Room_menu)
	}
}
else{
	image_index = 0
}