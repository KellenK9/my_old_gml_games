///state_goblin
function state_goblin() {

	//bug: goblins occasionally don't create spears after starting in beginning of room

	//faces toward player if close or bucket if needing spear
	if(throwing == false){
		if(distance_to_object(obj_character) < goblin_sight_range && goblin_has_spear == true){
			if(obj_character.x > x){
				goblin_facing_left = false;
			}
			else{
				goblin_facing_left = true;
			}
		}
		else if(goblin_has_spear == false){
			bucket = instance_nearest(x,y, obj_bucket_of_spears);
			if(bucket.x > x){
				goblin_facing_left = false;
			}
			else{
				goblin_facing_left = true;
			}
		}
		else{ //switches direction facing randomly and occasionally
			if(place_meeting(x, y+1, obj_solid_parent)){
				if(1 > random(30)){
					if(goblin_facing_left == true && place_meeting(x+goblin_speed, y+1, obj_solid_parent)){
						goblin_facing_left = false;
					}
					if(goblin_facing_left == false && place_meeting(x-goblin_speed, y+1, obj_solid_parent)){
						goblin_facing_left = true;
					}
				}
			}
		}
	}


	//decides to start throwing
	if(throwing == false && walking == false && place_meeting(x, y+1, obj_solid_parent) && distance_to_object(obj_character) < goblin_sight_range){
		if(1 > random(60) && goblin_has_spear == true){
			throwing = true;
		}
	}

	//decides to start walking
	if(throwing == false && walking == false && place_meeting(x, y+1, obj_solid_parent)){
		if(1 > random(90)){
			walking = true;
			if(goblin_facing_left == true){
				sprite_index = spr_goblin_spearman_start_stop_walking_left;
			}
			else{
				sprite_index = spr_goblin_spearman_start_stop_walking_right;
			}
			goblin_start_walking = true;
		}
	}

	//stops walking if in the air
	if(!place_meeting(x, y+1, obj_solid_parent)){
		walking = false;
	}


	//stops walking if up to a ledge
	if(walking == true){
		if(goblin_facing_left == true){
			if(!place_meeting(x-12, y+1, obj_solid_parent)){
				walking = false;
				if(goblin_has_spear == false){
					sprite_index = spr_goblin_spearman_start_stop_walking_left;
				}
				else{
					sprite_index = spr_goblin_spearman_start_stop_walking_left_spear;
				}
			}
		}
		else{
			if(!place_meeting(x+12, y+1, obj_solid_parent)){
				walking = false;
				if(goblin_has_spear == false){
					sprite_index = spr_goblin_spearman_start_stop_walking_right;
				}
				else{
					sprite_index = spr_goblin_spearman_start_stop_walking_right_spear
				}
			}
		}
	}

	//stops walking randomly
	if(walking == true && 1 > random(240) && goblin_start_walking == false){
		if(goblin_facing_left == true){
			walking = false;
			if(goblin_has_spear == false){
				sprite_index = spr_goblin_spearman_start_stop_walking_left;
			}
			else{
				sprite_index = spr_goblin_spearman_start_stop_walking_left_spear;
			}
		}
		else{
			walking = false;
			if(goblin_has_spear == false){
				sprite_index = spr_goblin_spearman_start_stop_walking_right;
			}
			else{
				sprite_index = spr_goblin_spearman_start_stop_walking_right_spear;
			}
		}
	}

	//gives a spear if touching bucket
	if(place_meeting(x,y, obj_bucket_of_spears)){
		goblin_has_spear = true;
	}

	//sets sprite
	if(walking == false){
		if(throwing == false){
			if(goblin_facing_left == true){
				if(goblin_has_spear == false){
					sprite_index = spr_goblin_spearman_idle_left;
				}
				else{
					sprite_index = spr_goblin_spearman_idle_left_spear;
				}
			}
			else{
				if(goblin_has_spear == false){
					sprite_index = spr_goblin_spearman_idle_right;
				}
				else{
					sprite_index = spr_goblin_spearman_idle_right_spear;
				}
			}
		}
		else{
			if(goblin_facing_left == true){
				sprite_index = spr_goblin_spearman_throwing_left;
			}
			else{
				sprite_index = spr_goblin_spearman_throwing_right;
			}
		}
	}
	else{
		if(goblin_start_walking == true){
			goblin_start_walking = false;
		}
		else{
			if(goblin_facing_left == true){
				if(goblin_has_spear == false){
					sprite_index = spr_goblin_spearman_walking_left;
				}
				else{
					sprite_index = spr_goblin_spearman_walking_left_spear;
				}
			}
			else{
				if(goblin_has_spear == false){
					sprite_index = spr_goblin_spearman_walking_right;
				}
				else{
					sprite_index = spr_goblin_spearman_walking_right_spear;
				}
			}
		}
	}

	//walks
	if(walking == true){
		if(goblin_facing_left == true){
			x -= goblin_speed;
		}
		else{
			x += goblin_speed;
		}
	}

	//throws
	if(throwing == true){
		goblin_has_spear = false;
		if(image_index == 10){
			throwing = false;
		}
		if(image_index == 5){
			if(goblin_facing_left == true){
				spear = instance_create_layer(x-4,y+25,"Instances",obj_spear);
				spear.sprite_index = spr_spear_left;
			}
			else{
				spear = instance_create_layer(x+28,y+25,"Instances",obj_spear);
				spear.sprite_index = spr_spear_right;
			}
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
	}
	else{
		vaccel = .5;
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
