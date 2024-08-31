/// @description Move paddle

if(global.ai = false){
	get_input()
	if(yaxis2 > global.joystick_deadzone or yaxis2 < -global.joystick_deadzone){
		global.y_movement2 = yaxis2 * global.speed_multiplier
		y += global.y_movement2
	}
}
else{
	if(instance_exists(obj_ball)){
		if(global.ball_x_speed < 0){
			global.y_movement2 = 0
		}
		else{
			if(obj_ball.y > y + paddle_edge_offset){
				global.y_movement2 = global.ai_speed
			}
			if(obj_ball.y < y + sprite_height - paddle_edge_offset){
				global.y_movement2 = -global.ai_speed
			}
			if(obj_ball.y > y + paddle_edge_offset and obj_ball.y < y + sprite_height - paddle_edge_offset){
				global.y_movement2 = 0
			}
		}
		y += global.y_movement2
	}
}

//keep paddle on screen
if(y < 0){
	y = 0
	global.y_movement2 = 0
}
if(y + sprite_height > room_height){
	y = room_height - sprite_height
	global.y_movement2 = 0
}