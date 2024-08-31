/// move_state
function move_state() {

	//if player dies
	if(global.dead == true){
		spd = 0;
	}

	//get direction
	dir = point_direction(0, 0, xaxis, yaxis)

	//get length
	if (xaxis == 0) && (yaxis == 0){
		len = 0;
	}else {
		len = spd;
	}

	//get the speed variables
	hspd = lengthdir_x(len, dir);
	vspd = lengthdir_y(len, dir);

	//horizontal collisions
	if(place_meeting(x+hspd, y, object_wall)){
		while(!place_meeting(x+sign(hspd), y, object_wall)){
			x += sign(hspd);
		}
		hspd = 0;
	}
	x += hspd;

	//vertical collisions
	if(place_meeting(x, y+vspd, object_wall)){
		while(!place_meeting(x, y+sign(vspd), object_wall)){
			y += sign(vspd);
		}
		vspd = 0;
	}
	y += vspd;

	//ball collisions
	if(place_meeting(x, y, object_ball)){
		global.dead = true;
		draw_sprite(sprite_game_over, image_index, 0, 0){depth = -500}
	}

	//makes player invisible when player is dead
	if(global.dead == true){
		visible = false;
	}


}
