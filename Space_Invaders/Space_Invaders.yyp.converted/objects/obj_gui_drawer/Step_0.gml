/// @description Clickable GUI
if(global.dead == true){
	if(mouse_check_button_pressed(mb_any)){
		room_restart()
	}
	if(keyboard_check_pressed(vk_space) or keyboard_check_pressed(vk_enter)){
		room_restart()
	}
}