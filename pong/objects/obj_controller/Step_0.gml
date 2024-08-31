/// @description Steps

if(global.p1_wins == false and global.p2_wins == false){
	if(obj_ball.x < 0){
		global.p2_score += 1
		alarm[0] = 1
		audio_play_sound(Sound_point_scored, 10, false)
	}
	if(obj_ball.x > room_width){
		global.p1_score += 1
		alarm[0] = 1
		audio_play_sound(Sound_point_scored, 10, false)
	}
}

if(global.p1_score = score_to_win){
	global.p1_wins = true
	if(alarm[1] == -1){
		alarm[1] = 120
	}
}
if(global.p2_score = score_to_win){
	global.p2_wins = true
	if(alarm[1] == -1){
		alarm[1] = 120
	}
}