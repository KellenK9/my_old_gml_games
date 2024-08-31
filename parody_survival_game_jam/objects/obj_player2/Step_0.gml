/// @description Move

get_input()

if(xaxis2 > joystick_dead_zone or xaxis2 < -joystick_dead_zone){
	if(global.lost == false){
		x += xaxis2 * move_speed
	}
}
if(yaxis2 > joystick_dead_zone or yaxis2 < -joystick_dead_zone){
	if(global.lost == false){
		y += yaxis2 * move_speed
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