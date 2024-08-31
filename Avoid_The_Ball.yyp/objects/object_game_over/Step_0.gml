/// @desc keep updating
if(global.dead == true)
visible = true

if(position_meeting(mouse_x, mouse_y, object_game_over)){
	image_index = 1;
	if(mouse_check_button(mb_any)){
		room_restart();
	}
}
else{
	image_index = 0;
}