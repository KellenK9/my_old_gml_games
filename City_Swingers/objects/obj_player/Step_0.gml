/// Step

//Make the rope do something
rope_does_nothing = false

//Change Speed due to Gravity
y_speed += gravity_acceleration

//Change location based on Speed
y += y_speed
x += x_speed

//Calculate variables
global.total_speed = sqrt(sqr(x_speed) + sqr(y_speed))
x_distance = closest_node.x - x
y_distance = y - closest_node.y
total_distance = sqrt(sqr(x_distance) + sqr(y_distance))

//Check if moving faster vertically than horizontally
if(abs(y_speed) > abs(x_speed)){
	falling_faster = true
}
else{
	falling_faster = false
}

//Check if there's a large difference between x and y speeds
if(abs(abs(y_speed) - abs(x_speed)) < speed_threshold){
	large_xy_speed_difference = false
}
else{
	large_xy_speed_difference = true
}

//Check if clockwise or counterclockwise
if(abs(x_distance) > distance_threshold){
	if(x_distance > 0){
		if(y_speed >= 0){
			clockwise = false
		}
		else{
			clockwise = true
		}
		if(x_speed < 0){
			if(y_speed > 0 and y_distance > 0){
				if(large_xy_speed_difference == false){
					rope_does_nothing = true
				}
				if(falling_faster){
					clockwise = false
				}
				else{
					clockwise = true
				}
			}
			if(y_speed < 0 and y_distance < 0){
				if(large_xy_speed_difference == false){
					rope_does_nothing = true
				}
				else{
					rope_does_nothing = false
				}
				if(falling_faster){
					clockwise = true
				}
				else{
					clockwise = false
				}
			}
		}
	}
	else{
		if(y_speed >= 0){
			clockwise = true
		}
		else{
			clockwise = false
		}
		if(x_speed > 0){
			if(y_speed > 0 and y_distance > 0){
				if(large_xy_speed_difference == false){
					rope_does_nothing = true
				}
				else{
					rope_does_nothing = false
				}
				if(falling_faster){
					clockwise = true
				}
				else{
					clockwise = false
				}
			}
			if(y_speed < 0 and y_distance < 0){
				if(large_xy_speed_difference == false){
					rope_does_nothing = true
				}
				else{
					rope_does_nothing = false
				}
				if(falling_faster){
					clockwise = false
				}
				else{
					clockwise = true
				}
			}
		}
	}
}

//Rope does nothing if directly horizontal or vertical to node
if(abs(x_distance) < distance_threshold){
	rope_does_nothing = true
}
if(abs(y_distance) < distance_threshold){
	rope_does_nothing = true
}

//Determine force of rope
x_force = y_distance / total_distance * global.total_speed
y_force = x_distance / total_distance * global.total_speed

//Change force if clockwise vs counterclockwise
if(clockwise){
	x_force = -x_force
	y_force = -y_force
}

//Check if moving toward node
if(y_speed < 0){ //if moving up
	if(y_distance > 0){ // if below node
		if(x_speed > 0){ //if moving right
			if(x_distance > 0){ // if to the left of node
				moving_toward_node = true
			}
			else{
				moving_toward_node = false
			}
		}
		else{ // if moving left
			if(x_distance < 0){ // if to the right of node
				moving_toward_node = true
			}
			else{
				moving_toward_node = false
			}
		}
	}
	else{
		moving_toward_node = false
	}
}
else{ // if moving down
	if(y_distance < 0){ // if above node
		if(x_speed > 0){ //if moving right
			if(x_distance > 0){ // if to the left of node
				moving_toward_node = true
			}
			else{
				moving_toward_node = false
			}
		}
		else{ // if moving left
			if(x_distance < 0){ // if to the right of node
				moving_toward_node = true
			}
			else{
				moving_toward_node = false
			}
		}
	}
	else{
		moving_toward_node = false
	}
}
if(moving_toward_node){
	rope_does_nothing = true
}

//Check if using rope
if(keyboard_check(vk_space)){
	space_pressed = true
	//Change speed from rope force
	if(rope_does_nothing == false){
		y_speed = y_force
		x_speed = x_force
	}
}
else{
	closest_node = instance_nearest(x, y, obj_node)
	space_pressed = false
}

//Highlight closest node
closest_node.image_index = 1
closest_node.image_alpha = 1

//Move to next room
if(keyboard_check_pressed(vk_enter)){
	room_goto_next()
}
