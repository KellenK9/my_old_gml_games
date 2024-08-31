/// @desc
#macro view view_camera[0]
camera_set_view_size(view,view_width,view_height);

/*
if(instance_exists(object_character)){
	var _x = clamp(object_character.x-(view_width/2)+(object_character.sprite_width/2),0,room_width-view_width)
	var _y = clamp(object_character.y-(view_height/2)+(object_character.sprite_height/2),0,room_height-view_height)
	
	var _cur_x = camera_get_view_x(view);
	var _cur_y = camera_get_view_y(view);
	
	var _spd = .01;
	camera_set_view_pos(view,lerp(_cur_x,_x,_spd),lerp(_cur_y,_y,_spd))
}
*/
if (keyboard_check(ord("D")) && keyboard_check(ord("A"))){
	right_speed = 0;
}
else if keyboard_check(ord("D")){
	if(right_speed > 10){
		
	}
	else if (right_speed < 0){
		right_speed = 0;
	}
	else{
		right_speed = right_speed + .1;
	}
}
else if keyboard_check(ord("A")){
	if(right_speed < -10){
		
	}
	else if (right_speed > 0){
		right_speed = 0;
	}
	else{
		right_speed = right_speed - .1;
	}
}
else{
	if(abs(right_speed)<.2){
		right_speed = 0;
	}
	else{
		right_speed = right_speed/1.1;
	}
}
if (keyboard_check(ord("S")) && keyboard_check(ord("W"))){
	right_speed = 0;
}
else if keyboard_check(ord("S")){
	if(down_speed > 10){
		
	}
	else if (down_speed < 0){
		down_speed = 0;
	}
	else{
		down_speed = down_speed + .1;
	}
}
else if keyboard_check(ord("W")){
	if(down_speed < -10){
		
	}
	else if (down_speed > 0){
		down_speed = 0;
	}
	else{
		down_speed = down_speed - .1;
	}
}
else{
	if(abs(down_speed)<.2){
		down_speed = 0;
	}
	else{
	down_speed = down_speed / 1.1;
	}
}

curr_x = curr_x + (right_speed/2)
curr_y = curr_y + (down_speed/2)

camera_set_view_pos(view,curr_x,curr_y)

if keyboard_check_pressed(ord("Q")){
	if(alarm[1]<0 && alarm[2]<0){
		alarm[1] = 2;
	}
}
if keyboard_check_pressed(ord("E")){
	if(alarm[1]<0 && alarm[2]<0){
		alarm[2] = 2;
	}
}