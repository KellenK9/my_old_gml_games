/// @desc
#macro view view_camera[0]
camera_set_view_size(view,view_width,view_height);

if(instance_exists(obj_test_character_rod)){
	var _x = clamp(obj_test_character_rod.x-(view_width/2),0,room_width-view_width)
	var _y = clamp(obj_test_character_rod.y-(view_height/2),0,room_height-view_height)
	
	var _cur_x = camera_get_view_x(view);
	var _cur_y = camera_get_view_y(view);
	
	var _spd = .05;
	camera_set_view_pos(view,lerp(_cur_x,_x,_spd),lerp(_cur_y,_y,_spd))
}
else if(instance_exists(obj_canoe)){
	var _x = clamp(obj_canoe.x-(view_width/2),0,room_width-view_width)
	var _y = clamp(obj_canoe.y-(view_height/2),0,room_height-view_height)
	
	var _cur_x = camera_get_view_x(view);
	var _cur_y = camera_get_view_y(view);
	
	var _spd = .05;
	camera_set_view_pos(view,lerp(_cur_x,_x,_spd),lerp(_cur_y,_y,_spd))
}