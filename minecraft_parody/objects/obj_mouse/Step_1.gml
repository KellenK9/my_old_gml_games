/// @description Change Block Type

if(keyboard_check_pressed(vk_left)){
	image_index -= 1
	if(image_index == -1){
		image_index = array_length(obj_controller.eligible_points_arr)
	}
}
if(keyboard_check_pressed(vk_right)){
	image_index += 1
	if(image_index == 1 + array_length(obj_controller.eligible_points_arr)){
		image_index = 0
	}
}