//movement

if(jumping == false){
	if(place_meeting(obj_player.x + (obj_player.sprite_width/2), obj_player.y + obj_player.sprite_height + 1, obj_solid_parent)){
		on_ground = true
	}
	else{
		on_ground = false
	}
}
else{
	on_ground = false
}

if(keyboard_check_pressed(vk_space) or gamepad_button_check_pressed(0, gp_face1)){
	jumping = true
	on_ground = false
	y_accel = jump_height
}

if(on_ground == false){
	y_accel = y_accel - gravity_force
}
else{
	y_accel = 0
}

//adjust y speed based on y acceleration
y_speed = y_speed + y_accel

//adjust player position based on y_speed
self.y = self.y - y_speed
if(place_meeting(self.x, self.y, obj_solid_parent)){
	if(y_accel < 0){
		jumping = false
		on_ground = true
		y_speed = 0
	}
}