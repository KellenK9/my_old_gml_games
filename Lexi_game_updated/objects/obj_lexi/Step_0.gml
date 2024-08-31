/// @description Step

//Inlude actions only alive Lexi can do in here
if(global.dead == false){

	//Gamepad input
	xaxis = 0
	yaxis = 0
	if (gamepad_is_connected(0)){
		xaxis = gamepad_axis_value(0, gp_axislh,)
		yaxis = gamepad_axis_value(0, gp_axislv,)
		a_held = gamepad_button_check(0, gp_face1)
		a_pressed = gamepad_button_check_pressed(0, gp_face1)
		b_held = gamepad_button_check(0, gp_face2)
		b_pressed = gamepad_button_check_pressed(0, gp_face2)
		rt_held = max(gamepad_button_check(0, gp_shoulderr), gamepad_button_check(0, gp_shoulderrb))
		rt_pressed = max(gamepad_button_check_pressed(0, gp_shoulderr), gamepad_button_check_pressed(0, gp_shoulderrb))
		lt_held = max(gamepad_button_check(0, gp_shoulderl), gamepad_button_check(0, gp_shoulderlb))
		lt_pressed = max(gamepad_button_check_pressed(0, gp_shoulderl), gamepad_button_check_pressed(0, gp_shoulderlb))
		
		if(xaxis > deadzone or xaxis < -deadzone){
			accelerationx = abs(xaxis)
		}
		else{
			accelerationx = acceleration
		}
		if(yaxis > deadzone or yaxis < -deadzone){
			accelerationy = abs(yaxis)
		}
		else{
			accelerationy = acceleration
		}
	}

	//movement
	if(keyboard_check(vk_left) or keyboard_check(ord("A")) or xaxis < -deadzone){
		if(mov_speed_horizontal > -max_speed){
			mov_speed_horizontal -= accelerationx
		}
	}
	else if(keyboard_check(vk_right) or keyboard_check(ord("D")) or xaxis > deadzone){
		if(mov_speed_horizontal < max_speed){
			mov_speed_horizontal += accelerationx
		}
	}
	else{
		if(mov_speed_horizontal > 0){
			mov_speed_horizontal -= deceleration
		}
		else if(mov_speed_horizontal < 0){
			mov_speed_horizontal += deceleration
		}
	}
	
	if(keyboard_check(vk_up) or keyboard_check(ord("W")) or yaxis < -deadzone){
		if(mov_speed_vertical > -max_speed){
			mov_speed_vertical -= accelerationy
		}
	}
	else if(keyboard_check(vk_down) or keyboard_check(ord("S")) or yaxis > deadzone){
		if(mov_speed_vertical < max_speed){
			mov_speed_vertical += accelerationy
		}
	}
	else{
		if(mov_speed_vertical > 0){
			mov_speed_vertical -= deceleration
		}
		else if(mov_speed_vertical < 0){
			mov_speed_vertical += deceleration
		}
	}
	
	//Shift to slow down
	if(keyboard_check(vk_lshift) or keyboard_check(vk_rshift) or b_held > 0 or lt_held > 0){
		max_speed = shift_max_speed
		deceleration = shift_deceleration
	}
	else{
		max_speed = 10 //10 is original max_speed
		deceleration = .1 //0.1 is original deceleration
	}
	
	//keep Lexi onscreen
	future_x = self.x + mov_speed_horizontal
	future_y = self.y + mov_speed_vertical
	if((future_x > 0 or mov_speed_horizontal > 0) and (future_x < 1920-sprite_width+12 or mov_speed_horizontal < 0)){
		self.x = future_x
	}
	if((future_y > 0 or mov_speed_vertical > 0) and (future_y < 1080-sprite_height or mov_speed_vertical < 0)){
		self.y = future_y
	}
	//end of movement section
	
	
	
	//fire laser
	if(room = level2 or room = level4 or room = level5){ //semi-auto fire
		if(keyboard_check_pressed(vk_space) or a_pressed > 0 or rt_pressed > 0){
			instance_create_depth(self.x + eye_offset_x1 - 24, self.y + eye_offset_y1 - 6, -999, obj_laser)
			instance_create_depth(self.x + eye_offset_x2 - 24, self.y + eye_offset_y2 - 6, -999, obj_laser)
			//instance_create_depth(self.x + eye_offset_x1, self.y + eye_offset_y1, -999, obj_laser)
			//instance_create_depth(self.x + eye_offset_x2, self.y + eye_offset_y2, -999, obj_laser)
			image_index = 1
			audio_play_sound(sound_laser1, 1, false)
		}
		else{
			image_index = 0
		}
	}
	else{ //fully auto fire
		if(keyboard_check(vk_space) or a_held > 0 or rt_held > 0){
			instance_create_depth(self.x + eye_offset_x1 - 24, self.y + eye_offset_y1 - 6, -999, obj_laser)
			instance_create_depth(self.x + eye_offset_x2 - 24, self.y + eye_offset_y2 - 6, -999, obj_laser)
			//instance_create_depth(self.x + eye_offset_x1, self.y + eye_offset_y1, -999, obj_laser)
			//instance_create_depth(self.x + eye_offset_x2, self.y + eye_offset_y2, -999, obj_laser)
			image_index = 1
			if(!audio_is_playing(sound_laser_continuous)){
				audio_play_sound(sound_laser_continuous, 1, false)
			}
		}
		else{
			image_index = 0
			if(audio_is_playing(sound_laser_continuous)){
				audio_stop_sound(sound_laser_continuous)
			}
		}
	}
	
	//flashing Lexi
	if(alarm[0] < 0){
		alarm[0] = 30
	}

}//end of actions that only living Lexi can do

//set Lexi color upon death
if(global.dead){
	self.image_blend = c_maroon
	if(alarm[1]<0){
		alarm[1] = 240
	}
}

//enemy collision
if(place_meeting(self.x, self.y, obj_enemy_parent)){
	global.take_damage = true
}

//Take damage
if(global.take_damage == true){
	global.dead = true
}