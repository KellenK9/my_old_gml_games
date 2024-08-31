/// @description Change camera view

//if(keyboard_check_pressed(ord("Q"))){
//	if (scale_pos > 0){
//		scale_pos = scale_pos - 1;
//	}
//}
//else if(keyboard_check_pressed(ord("E"))){
//	if (scale_pos < 13){
//		scale_pos = scale_pos + 1;
//	}
//}
//window_scale = scales_arr[scale_pos];
//view_width = 1920/window_scale;
//view_height = 1080/window_scale;

nearest_node = instance_nearest(obj_player.x, obj_player.y, obj_node)
distance = point_distance(obj_player.x, obj_player.y, nearest_node.x, nearest_node.y)
zoom_value = zoom_offset - (distance * zoom_multiplier)
if(zoom_value < 1){
	zoom_value = 1
}

//view_width = 1920/zoom_value
//view_height = 1080/zoom_value
