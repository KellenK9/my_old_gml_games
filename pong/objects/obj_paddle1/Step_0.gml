/// @description Move paddle

get_input()

if(yaxis1 > global.joystick_deadzone or yaxis1 < -global.joystick_deadzone){
	global.y_movement1 = yaxis1 * global.speed_multiplier
	y += global.y_movement1
}

//keep paddle on screen
if(y < 0){
	y = 0
	global.y_movement1 = 0
}
if(y + sprite_height > room_height){
	y = room_height - sprite_height
	global.y_movement1 = 0
}