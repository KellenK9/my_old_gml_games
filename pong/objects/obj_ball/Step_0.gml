/// @description Steps

//check if ball will go through paddle
through_paddle1 = false
if(x > obj_paddle1.x + obj_paddle1.sprite_width and x + global.ball_x_speed < obj_paddle1.x){
	if(y > obj_paddle1.y + sprite_height and y < obj_paddle1.y + obj_paddle1.sprite_height){
		through_paddle1 = true
	}
}
through_paddle2 = false
if(x < obj_paddle2.x + obj_paddle2.sprite_width and x + global.ball_x_speed > obj_paddle2.x){
	if(y > obj_paddle2.y + sprite_height and y < obj_paddle2.y + obj_paddle2.sprite_height){
		through_paddle2 = true
	}
}

//Check for collision with paddle
if(x > obj_paddle1.x + obj_paddle1.sprite_width - global.buffer and x < obj_paddle2.x - global.buffer){
	if(position_meeting(x + global.ball_x_speed, y, obj_paddle1) or through_paddle1){
		global.ball_x_speed = -global.ball_x_speed
		x = obj_paddle1.x + obj_paddle1.sprite_width
		//increase ball speed when hit
		if(global.ball_x_speed > 0){
			global.ball_x_speed += x_speed_increase
		}
		else{
			global.ball_x_speed -= x_speed_increase
		}
		audio_play_sound(Sound_ball_bounce, 10, false)
	}
	else{
		if(place_meeting(x + (3*global.ball_x_speed), y, obj_paddle2) or through_paddle2){
			audio_play_sound(Sound_ball_bounce, 10, false)
			global.ball_x_speed = - global.ball_x_speed
			x = obj_paddle2.x - sprite_width
			//increase ball speed when hit
			if(global.ball_x_speed > 0){
				global.ball_x_speed += x_speed_increase
			}
			else{
				global.ball_x_speed -= x_speed_increase
			}
			}
			else{
				x += global.ball_x_speed
			}
	}
}
else{
	x += global.ball_x_speed
}

//keep ball from going above or below screen
if(y < 0 or y > room_height-1){
	y_speed = -y_speed
	audio_play_sound(Sound_ball_bounce, 10, false)
}
//keep ball from passing through paddle top or bottom - WIP
if(place_meeting(x, y + (4*y_speed), obj_paddle1) or place_meeting(x, y + (4*y_speed), obj_paddle2)){
	y_speed = -y_speed
	audio_play_sound(Sound_ball_bounce, 10, false)
}

y += y_speed