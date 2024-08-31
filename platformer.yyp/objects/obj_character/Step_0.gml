/// @desc Every Step
get_input();
depth = -1000;
script_execute(state);

if(y>room_height+16){
	global.live = global.live - 25;
	x = obj_spawn_player.x;
	y = obj_spawn_player.y;
	if(instance_exists(obj_beehive)){
		obj_center_bees.x = obj_beehive.x;
		obj_center_bees.y = obj_beehive.y;
	}
}
if(place_meeting(x,y,obj_parent_deadly_if_touched) && obj_parent_deadly_if_touched.visible == true){
	if(alarm[0] < 0){
		alarm[0] = 15;
		global.hurt = true;
		state = state_cant_move;
		if(alarm[1] < 0){
			alarm[1] = 1;
		}
	}
}

if(global.live <= 0){
	global.gameOver = true;
}

if(global.gameOver == true){
	state = state_cant_move();
}