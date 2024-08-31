/// @description Move

get_input()

if(xaxis1 > joystick_dead_zone or xaxis1 < -joystick_dead_zone){
	if(global.lost == false){
		x += xaxis1 * move_speed
	}
}
if(yaxis1 > joystick_dead_zone or yaxis1 < -joystick_dead_zone){
	if(global.lost == false){
		y += yaxis1 * move_speed
	}
}

//Don't go past screen border
if(x > 320-sprite_width){
	x = 320-sprite_width
}
if(x < 0){
	x = 0
}
if(y > 180-sprite_height){
	y = 180-sprite_height
}
if (y < 0){
	y = 0
}

if(place_meeting(x, y, obj_player2)){
	global.lost = true
}