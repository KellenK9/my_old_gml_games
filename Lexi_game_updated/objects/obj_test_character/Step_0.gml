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

//rotate
if(distance > deadzone){
	image_angle = angle
}

//movement
if(move_from_knockback_enabled == false){
	if(burst_enabled == false){
		if(rt_held){
			x += lengthdir_x(char_speed,angle);
			y += lengthdir_y(char_speed,angle);
		}
	}
	else{
		if(rt_pressed){
			x_speed += acceleration * lengthdir_x(char_speed,angle)
			y_speed += acceleration * lengthdir_y(char_speed,angle)
		}
		else{
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
		x += x_speed
		y += y_speed
	}	
}
else{ //move_from_knockback_enabled is true
	if(burst_enabled == false){
		if(distance_r > deadzone and alarm_sounding){
			x -= lengthdir_x(char_speed,angle_r);
			y -= lengthdir_y(char_speed,angle_r);
		}
	}
	else{
		if(distance_r > deadzone and alarm_sounding){
			x_speed += acceleration * lengthdir_x(char_speed,angle_r)
			y_speed += acceleration * lengthdir_y(char_speed,angle_r)
		}
		else{
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
		
		x -= x_speed
		y -= y_speed
	}	
}


//fires laser
if(distance_r > deadzone and alarm_sounding){
	laser = instance_create_depth(x + laser_spawn_distance * lengthdir_x(char_speed,angle_r), y + laser_spawn_distance * lengthdir_y(char_speed,angle_r), -500, obj_test_laser)
	laser.image_angle = angle_r
	alarm[0] = firing_timer
}