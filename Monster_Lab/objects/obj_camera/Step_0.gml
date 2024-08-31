/// @description Change camera view

if(keyboard_check_pressed(ord("Q"))){
	if (scale_pos > 0){
		//scale_pos = scale_pos - 1;
	}
}
else if(keyboard_check_pressed(ord("E"))){
	if (scale_pos < 13){
		//scale_pos = scale_pos + 1;
	}
}
global.window_scale = scales_arr[scale_pos];
view_width = 1920/global.window_scale;
view_height = 1080/global.window_scale;