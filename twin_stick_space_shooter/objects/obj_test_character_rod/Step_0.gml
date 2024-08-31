/// @description Step

get_gamepad_input();

angle = darctan2(-yaxis, xaxis)
distance = sqrt(sqr(xaxis) + sqr(yaxis))
angle_r = darctan2(-yaxis_r, xaxis_r)
distance_r = sqrt(sqr(xaxis_r) + sqr(yaxis_r))

//alarm sounding
if(alarm[0] < 0){
	alarm_sounding = true
}
else{
	alarm_sounding = false
}
if(alarm[1] < 0){
	alarm_sounding2 = true
}
else{
	alarm_sounding2 = false
}


if(distance > deadzone and alarm_sounding2){
	rotation_velocity += r_acceleration * dsin(image_angle + 180 - angle)
	x_speed += acceleration * lengthdir_x(char_speed,angle)
	y_speed += acceleration * lengthdir_y(char_speed,angle)
}
else{
	rotation_velocity = rotation_velocity * r_deceleration
	x_speed = x_speed * deceleration
	y_speed = y_speed * deceleration
}

if(distance_r > deadzone and alarm_sounding){
	rotation_velocity += r_acceleration * dsin(image_angle - angle_r)
	x_speed += acceleration * lengthdir_x(char_speed,angle_r) //* dcos(angle_r + image_angle)
	y_speed += acceleration * lengthdir_y(char_speed,angle_r) //* dcos(angle_r + image_angle)
}
else{
	rotation_velocity = rotation_velocity * r_deceleration
	x_speed = x_speed * deceleration
	y_speed = y_speed * deceleration
}
	
if(x_speed > max_speed){
	x_speed = max_speed
}
else if(x_speed < -max_speed){
	x_speed = -max_speed
}
if(y_speed > max_speed){
	y_speed = max_speed
}
else if(y_speed < -max_speed){
	y_speed = -max_speed
}

//move
x -= x_speed
y -= y_speed	

//rotate
image_angle += rotation_velocity

//fires laser
if(distance_r > deadzone and alarm_sounding){
	laser1 = instance_create_depth(x + lengthdir_x(dist_from_center, image_angle) + lengthdir_x(laser_spawn_distance,angle_r), y + lengthdir_y(dist_from_center, image_angle) + lengthdir_y(laser_spawn_distance,angle_r), -500, obj_test_laser)
	laser1.image_angle = angle_r
	alarm[0] = firing_timer
	audio_play_sound(sound_laser1, 0.5, false)
}
if(distance > deadzone and alarm_sounding2){
	laser2 = instance_create_depth(x - lengthdir_x(dist_from_center, image_angle) + lengthdir_x(laser_spawn_distance,angle), y - lengthdir_y(dist_from_center, image_angle) + lengthdir_y(laser_spawn_distance,angle), -500, obj_test_laser)
	laser2.image_angle = angle
	alarm[1] = firing_timer
	audio_play_sound(sound_laser1, 0.5, false)
}

//close game
if(b_pressed){
	game_end()
}

//take damage when off screen
if(x < 0 or x > room_width or y < 0 or y > room_height){
	global.player_health -= 1
}