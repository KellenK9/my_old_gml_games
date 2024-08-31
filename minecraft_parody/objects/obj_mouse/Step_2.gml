/// @description Create Block

if(mouse_check_button_released(mb_left)){
	new_block = instance_create_depth(x, y, depth, obj_grass_block)
	new_block.image_index = image_index
	
	//block_taken = false
	//for(var i=0; i<ds_list_size(obj_controller.taken_points_arr; i+=1)){
	//	if(obj_controller.taken_points_arr[i][0] == x and obj_controller.taken_points_arr[i][1] == y){
	//		block_taken = true
	//	}
	//}
	
	//ds_list_add(obj_controller.taken_points_arr, [x, y])
}

//if(mouse_check_button_released(mb_right))