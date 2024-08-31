/// @description Control Character

//initialize variables
get_input()

if (gamepad_is_connected(0)){
	global.gamepad_connected = true
}else{
	global.gamepad_connected = false
}

if(instance_place(x, y+1, obj_parent_all_ground) and instance_place(x, y+8, obj_parent_all_ground)){
	touching_ground = true
	fall_speed = 0
}
else{
	touching_ground = false
}

//do stuff
if(not attacking){
	if(global.gamepad_connected){
		if(gamepad_button_check(0, gp_face3) and dashing_enabled){
			if(alarm[3] < 0){
				dashing = true
				alarm[3] = dash_length
				alarm[4] = dash_cooldown
			}
		}
		else{
			dashing = false
		}
		if(gamepad_button_check_released(0, gp_face3)){
			dashing_enabled = false
		}
	}
	if(dashing){
		move_speed = dash_speed
	}
	else{
		move_speed = normal_move_speed
	}
	
	if(xaxis1 > joystick_deadzone){
		image_xscale = 1
		if(instance_place(x + move_speed, y - global.height_animation_buffer, obj_parent_ground)){
			//don't move, next to wall
		}
		else{
			x += move_speed
		}
		sprite_index = spr_chain_bot_walk
	}

	if(xaxis1 < -joystick_deadzone){
		image_xscale = -1
		if(instance_place(x - move_speed, y - global.height_animation_buffer, obj_parent_ground)){
			//don't move, next to wall
		}
		else{
			x -= move_speed
		}
		sprite_index = spr_chain_bot_walk
	}

	if(xaxis1 > -joystick_deadzone and xaxis1 < joystick_deadzone){
		sprite_index = spr_chain_bot_idle
	}
	
	//walk up ramp
	while(place_meeting(x, y, obj_parent_slope_ground) and !place_meeting(x, y, obj_parent_ground)){
		y -= 1
	}

	if (global.gamepad_connected){
		if(gamepad_button_check(0, gp_face1)){
			charging = true
		}
		else{
			charging = false
		}
		if(gamepad_button_check(0, gp_face2)){
			if(touching_ground){
				jumping = true
				alarm[2] = max_jump_duration
			}
		}
		else{
			jumping = false
		}
	}

	if(charging){
		sprite_index = spr_chain_bot_charge
	}

	if (global.gamepad_connected){
		if(gamepad_button_check_pressed(0, gp_face1)){
			sprite_index = spr_chain_bot_charge_transition
			image_index = 0
			alarm[0] = charge_time
		}
		if(gamepad_button_check_released(0, gp_face1) and fully_charged){
			sprite_index = spr_chain_bot_attack
			image_index = 0
			fully_charged = false
			attacking = true
			alarm[1] = attack_time
		}
	}
}

if(jumping){
	curr_jump_speed = curr_jump_speed * jump_mulptiplier
	if(instance_place(x, y - curr_jump_speed, obj_parent_all_ground)){
		jumping = false
		for(var distance_to_ground = 1; distance_to_ground < curr_jump_speed; distance_to_ground += 1){
			if(!instance_place(x, y+distance_to_ground, obj_parent_all_ground)){
				y = y - 1
			}
			else{
				break;
			}
		}
	}
	else{
		y = y - curr_jump_speed
	}
}
else{
	curr_jump_speed = jump_speed
}

if(instance_place(x, y+1, obj_parent_all_ground) and instance_place(x, y+8, obj_parent_all_ground)){
	touching_ground = true
	fall_speed = 0
}
else{
	//if head glitched in block
	while(instance_place(x, y, obj_parent_all_ground) and !instance_place(x, y+8, obj_parent_all_ground)){
		y += 1
	}
	
	touching_ground = false
	if(not attacking){ //don't fall while attacking
		fall_speed += force_gravity
		if(instance_place(x, y+fall_speed, obj_parent_all_ground)){ //prevent fall_speed from glitching player through ground
			for(var distance_to_ground = 1; distance_to_ground < fall_speed; distance_to_ground += 1){
				if(!instance_place(x, y+distance_to_ground, obj_parent_all_ground)){
					y = y + 1
				}
				else{
					break;
				}
			}
		}else{
			y = y + fall_speed
		}
	}
}