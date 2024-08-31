/// @description Step

//determine x
next_x = self.x - kirby_speed

next_y = self.y
//determine y
if(upward_velocity < -jump_threshold){
	jump = true
}
else if(jump == false){
	upward_velocity = upward_velocity - gravity_strength
}
if(jump == true){
	upward_velocity = jump_height
	jump = false
		//randomize jump_threshold
	random_coefficient = 1.3 - random(0.9)
	jump_threshold = jump_height * random_coefficient
}
next_y = next_y - upward_velocity

//move
self.x = next_x
self.y = next_y

if(self.x < -200){
	instance_destroy(self.id)
}

//get destroyed by laser
if(place_meeting(self.x, self.y, obj_laser)){
	global.points += 1
	audio_play_sound(sound_blast, 1, false)
	effect_create_above(ef_explosion, self.x, self.y, 1, c_red)
	instance_destroy(self.id)
}