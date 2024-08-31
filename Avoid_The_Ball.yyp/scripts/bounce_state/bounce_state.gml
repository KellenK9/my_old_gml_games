/// bounce_state
function bounce_state() {

	//if dead
	if(global.dead == true)
	spd = 0;

	//get the speed variables
	len = spd;
	hspd = lengthdir_x(len, dir);
	vspd = lengthdir_y(len, dir);

	//horizontal collisions
	if(place_meeting(x+hspd, y, object_wall)){
		while(!place_meeting(x+sign(hspd), y, object_wall)){
			x += sign(hspd);
		}
		if(dir%360<180){
			dir = 180-(dir%360)
		}
		else{
			dir = 360-(dir%180)
		}
	
	}
	hspd = lengthdir_x(len, dir);
	vspd = lengthdir_y(len, dir);
	x += hspd;

	//vertical collisions
	if(place_meeting(x, y+vspd, object_wall) && !place_meeting(x+hspd, y, object_wall)){
		while(!place_meeting(x, y+sign(vspd), object_wall)){
			y += sign(vspd);
		}
		dir = 360 - dir;
	}
	hspd = lengthdir_x(len, dir);
	vspd = lengthdir_y(len, dir);
	y += vspd;

	//makes ball invisible when player is dead
	if(global.dead == true){
		visible = false;
	}


}
