/// @description updates variables

if(place_meeting(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),self) && mouse_check_button_pressed(mb_left)){
	image_index = 1;
	if(global.gui_open == true){
		global.gui_open = false;
	}
	else{
		global.gui_open = true;
	}
}