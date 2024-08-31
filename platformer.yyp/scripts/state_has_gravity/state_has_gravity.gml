/// state_has_gravity
function state_has_gravity() {


	//set vertical movement
	vspd = vspd; //positive is down
	vaccel = vaccel; //positive is down
	max_vspd = 12;
	if(place_meeting(x, y+1, obj_solid_parent)){ //character is on ground
		vaccel = 0;
		vspd = 0;
	}
	else{
		vaccel = .5;
	}
	vspd = vspd + vaccel;
	if(vspd > max_vspd)
		vspd = max_vspd;



	//horizontal collisions
	if(place_meeting(x+hspd, y, obj_solid_parent)){
		while(!place_meeting(x+sign(hspd), y, obj_solid_parent)){
			x += sign(hspd);
		}
		hspd = 0;
	}
	x += hspd;

	//vertical collisions
	if(place_meeting(x, y+vspd, obj_solid_parent)){
		while(!place_meeting(x, y+sign(vspd), obj_solid_parent)){
			y += sign(vspd);
		}
		vspd = 0;
	}
	y += vspd;

	//prevent getting stuck in blocks
	counter_distance = 1;
	while(place_meeting(x,y,obj_solid_parent)){
		if(!place_meeting(x+counter_distance,y,obj_solid_parent))
			x = x + counter_distance;
		if(!place_meeting(x-counter_distance,y,obj_solid_parent))
			x = x - counter_distance;
		if(!place_meeting(x,y+counter_distance,obj_solid_parent))
			y = y + counter_distance;
		if(!place_meeting(x,y-counter_distance,obj_solid_parent))
			y = y - counter_distance;
		counter_distance += 1;
	}



}
