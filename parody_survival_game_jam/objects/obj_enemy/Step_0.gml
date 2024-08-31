/// @description Move towards player

//check which player is closer
if(distance_to_object(obj_player) > distance_to_object(obj_player2)){
	closer_to_p1 = false
}
else{
	closer_to_p1 = true
}

//move towards closest player
if(closer_to_p1){
	move_towards_point(obj_player.x, obj_player.y, curr_speed)
}
else{
	move_towards_point(obj_player2.x, obj_player2.y, curr_speed)
}

//Kill Player
if(place_meeting(x, y, obj_player) or place_meeting(x, y, obj_player2)){
	global.lost = true
}
