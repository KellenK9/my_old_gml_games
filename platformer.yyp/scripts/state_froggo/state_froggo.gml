/// state_froggo
function state_froggo() {


	//starts jump randomly
	if(1 > random(30) && tongue_out == false){
		if(jump = false && place_meeting(x, y+1, obj_solid_parent)){
			jump = true;
			jumping = true;
			if(random(2)>1){
				dir_facing_left = true;
			}
			else{
				dir_facing_left = false;
			}
		}
	}

	//chooses when to stick out tongue randomly
	if(1 > random(60) && jump == false && place_meeting(x, y+1, obj_solid_parent)){
		if(dir_facing_left == true && x != 0 && !place_meeting(x-16,y,obj_solid_parent))
			tongue_out = true;
		if(dir_facing_left == false && x <= room_width-48 && !place_meeting(x+16,y,obj_solid_parent))
			tongue_out = true;
	}
	//chooses when to retract tongue randomly
	if(1 > random(60) && tongue_out == true){
		tongue_out = false;
	}

	//sets sprite
	if(dir_facing_left == true){
		sprite_index = spr_froggo_left;
	}
	else{
		sprite_index = spr_froggo_right;
	}

	//sticks out tongue
	if(tongue_out == true){
		if(!instance_exists(tongue)){
			instance_activate_object(tongue);
		}
		if(dir_facing_left == true){
			tongue.x = x - 48;
			tongue.y = y + 24;
			tongue.sprite_index = spr_tongue_left;
		}
		else{
			tongue.sprite_index = spr_tongue_right;
			tongue.x = x + 48;
			tongue.y = y + 24;
		}
	}
	else{
		if(instance_exists(tongue)){
			instance_deactivate_object(tongue);
		}
	}

	//set vertical movement
	vspd = vspd; //positive is down
	vaccel = vaccel; //positive is down
	max_vspd = 12;
	if(place_meeting(x, y+1, obj_solid_parent)){ //character is on ground
		vaccel = 0;
		vspd = 0;
		hspd = 0;
		image_index = 0;
		if(jump == true){
			vaccel = -9;
		}
	}
	else{
		vaccel = .5;
		image_index = 1;
		if(jump == true){
			jump = false;
		}
		if(jumping == true){
			if(dir_facing_left == false){
				hspd = 4;
			}
			else{
				hspd = -4;
			}
		}
	}
	vspd = vspd + vaccel;
	if(vspd > max_vspd)
		vspd = max_vspd;

	//prevents leaving the room horizontally
	if(x+hspd < 0 || x+hspd+sprite_width > room_width){
		hspd = 0;
	}

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
