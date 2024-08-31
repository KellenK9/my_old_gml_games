/// @description Step

//All this is for movement
y_dir_input = 0
x_dir_input = 0

if gamepad_is_connected(0){
	//x_dir_input += gp_axislh
	//y_dir_input += gp_axislv
}

if(keyboard_check(vk_right) or keyboard_check(ord("D"))){
	x_dir_input += 1
}
if(keyboard_check(vk_left) or keyboard_check(ord("A"))){
	x_dir_input -= 1
}
if(keyboard_check(vk_up) or keyboard_check(ord("W"))){
	y_dir_input += 1
}
if(keyboard_check(vk_down) or keyboard_check(ord("S"))){
	y_dir_input -= 1
}

y_move = y_dir_input + y_curr_drift
x_move = x_dir_input + x_curr_drift

x_curr_drift = drift_speed * x_move
y_curr_drift = drift_speed * y_move

next_X = x + (x_move * movement_speed)
next_y = y - (y_move * movement_speed) - 0.5

if(next_X < 0){
	next_X = 0
}
else if(next_X > room_width-sprite_width){
	next_X = room_width-sprite_width
}
x = next_X
if(next_y < global.scroll + top_bottom_buffer){
	next_y = global.scroll + top_bottom_buffer
}
else if(next_y > global.scroll + (1080/6) - sprite_height - top_bottom_buffer){
	next_y = global.scroll + (1080/6) - sprite_height - top_bottom_buffer
}
y = next_y


//Combat
space_pressed = keyboard_check(vk_space)

if(manual){ //manual fire
	if(keyboard_check_pressed(vk_space)){
		instance_create_depth(x+2, y, 0, obj_bullet1)
		instance_create_depth(x+14, y, 0, obj_bullet1)
		instance_create_depth(x+7, y+2, 0, obj_bullet2)
	}
}

if(minigun == true){ // automatic fire
	if(space_pressed and alarm[0] < 0){
		alarm[0] = 3
	}
}

if(chargeshot == true){ //charge shots
	if(space_pressed){
		if(charging == false){
			curr_shot = instance_create_depth(x+2, y, 0, obj_chargeball)
			charging = true
		}
		curr_shot.x = x+2
		curr_shot.y = y
	}
	else{
		charging = false
	}
	if(keyboard_check_released(vk_space)){
		curr_shot.released = true
		charging = false
	}
}


//collision with enemies
if(place_meeting(x,y,obj_enemy_parent)){
	global.dead = true
}
if(global.dead = true){
	effect_create_above(ef_explosion, x, y, 2, c_red)
	instance_destroy(id)
}

