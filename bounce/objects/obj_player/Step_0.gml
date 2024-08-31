// Step

image_angle -= rotation_speed

//Calculating ball velocity
if(y + (sprite_height/2) >= ground_level){
	velocity = -velocity * ground_velocity_multiplier
}
else{
	velocity += gravity_force
}

//Bounce the ball
if(keyboard_check_pressed(vk_space) and velocity < 0 and y < ground_level - height_buffer - (sprite_height/2)){
	velocity = -velocity * bounce_velocity_multiplier
	if(velocity > 0){
		velocity += extra_bounce_force
	}
	else{
		velocity -= extra_bounce_force
	}
	audio_play_sound(sound_boing, 0, 0)
	bounce_bool = true
}
/*
else{
	if(keyboard_check_pressed(vk_space) and y < ground_level - height_buffer - (sprite_height/2)){
		//Bounce the ball when it's already going down
		velocity += bounce_strength
		audio_play_sound(sound_boing, 0, 0)
	}
}
*/

//Making the ball move
y += velocity;
if(y > ground_level){
	y = ground_level
}