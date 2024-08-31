/// @description Step

get_gamepad_input();

angle = darctan2(-yaxis, xaxis)
distance = sqrt(sqr(xaxis) + sqr(yaxis))
angle_r = darctan2(-yaxis_r, xaxis_r)
distance_r = sqrt(sqr(xaxis_r) + sqr(yaxis_r))

paddle_force = 0
paddle_force_r = 0

if(distance > deadzone){
	//rotation_velocity += r_acceleration * dsin(image_angle + 180 - angle)
	if(abs(angle - prev_angle) < 180){
		paddle_force = r_acceleration * max(1, distance - prev_distance + 1) * (angle - prev_angle)
	}
	else{
		//rotation_velocity += r_acceleration * max(1, distance_r - prev_distance_r + 1) * (angle_r - prev_angle_r)
	}
	left_paddle.image_angle = angle
	//x_speed += acceleration * lengthdir_x(char_speed,angle)
	//y_speed += acceleration * lengthdir_y(char_speed,angle)
	if(distance > 0.9){
		next_index = 0
	}
	else if(distance > 0.8){
		next_index = 1
	}
	else if(distance > 0.7){
		next_index = 2
	}
	else if(distance > 0.6){
		next_index = 3
	}
	else if(distance > 0.5){
		next_index = 4
	}
	else if(distance > 0.4){
		next_index = 5
	}
	else{
		next_index = 6
	}
	left_paddle.image_index = next_index
}
else{
	rotation_velocity = rotation_velocity * r_deceleration
	left_paddle.image_index = paddle_frames - 1
}

if(distance_r > deadzone){
	//rotation_velocity += r_acceleration * dsin(image_angle - angle_r)
	if(abs(angle_r - prev_angle_r) < 180){
		paddle_force_r = r_acceleration * max(1, distance_r - prev_distance_r + 1) * (angle_r - prev_angle_r)
	}
	else{
		//rotation_velocity += r_acceleration * max(1, distance_r - prev_distance_r + 1) * (angle_r - prev_angle_r)
	}
	right_paddle.image_angle = angle_r
	//x_speed += acceleration * lengthdir_x(char_speed,angle_r) //* dcos(angle_r + image_angle)
	//y_speed += acceleration * lengthdir_y(char_speed,angle_r) //* dcos(angle_r + image_angle)
	if(distance_r > 0.9){
		next_index = 0
	}
	else if(distance_r > 0.8){
		next_index = 1
	}
	else if(distance_r > 0.7){
		next_index = 2
	}
	else if(distance_r > 0.6){
		next_index = 3
	}
	else if(distance_r > 0.5){
		next_index = 4
	}
	else if(distance_r > 0.4){
		next_index = 5
	}
	else{
		next_index = 6
	}
	right_paddle.image_index = next_index
}
else{
	rotation_velocity = rotation_velocity * r_deceleration
	right_paddle.image_index = paddle_frames - 1
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

//adjust rotation velocity and speed from paddle forces
if(paddle_force * paddle_force_r < 0){
	force = 0
	if(paddle_force > 0){
		force = min(abs(paddle_force), abs(paddle_force_r))
	}
	else{
		force = -min(abs(paddle_force), abs(paddle_force_r))
	}
	x_speed += acceleration * lengthdir_x(canoe_speed,image_angle-90) * force
	y_speed += acceleration * lengthdir_y(canoe_speed,image_angle-90) * force
}
else{
	rotation_velocity += paddle_force
	rotation_velocity += paddle_force_r
	
	//x_speed = x_speed * deceleration
	//y_speed = y_speed * deceleration
}
x_speed = x_speed * deceleration
y_speed = y_speed * deceleration

//move
x -= x_speed
y -= y_speed

//move paddle
right_paddle.x = x + (canoe_width * dcos(image_angle))
left_paddle.x = x - (canoe_width * dcos(image_angle))
right_paddle.y = y - (canoe_width * dsin(image_angle))
left_paddle.y = y + (canoe_width * dsin(image_angle))

//get previous joystick inputs
prev_angle = angle
prev_angle_r = angle_r
prev_distance = distance
prev_distance_r = distance_r

//adjust for max rotation
if(rotation_velocity > max_rotation_velocity or rotation_velocity < -max_rotation_velocity){
	if(rotation_velocity > 0){
		rotation_velocity = max_rotation_velocity
	}
	else{
		rotation_velocity = -max_rotation_velocity
	}
}

//rotate
image_angle += rotation_velocity

//close game
if(b_pressed){
	game_end()
}

//take damage when off screen
if(x < 0 or x > room_width or y < 0 or y > room_height){
	global.player_health -= 1
}