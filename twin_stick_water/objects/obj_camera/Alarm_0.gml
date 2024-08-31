/// @description
window_center();
if(instance_exists(obj_test_character_rod)){
	camera_set_view_pos(view,obj_test_character_rod.x - (view_width/2),obj_test_character_rod.y - (view_height/2))
}
else if(instance_exists(obj_canoe)){
	camera_set_view_pos(view,obj_canoe.x - (view_width/2),obj_canoe.y - (view_height/2))
}