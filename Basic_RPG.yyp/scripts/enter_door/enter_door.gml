function enter_door() {
	//enter_door

	//set sprite
	if(global.inside == false){
		if(x-object_doormat.x>2){ //character too far right
			sprite_index = sprite_character1_left;
			image_speed = 2;
			x = x - 1;
		}
		if(x-object_doormat.x<2){ //character too far left
			sprite_index = sprite_character1_right;
			image_speed = 2
			x = x + 1;
		}

		if(x-object_doormat.x>1 && x-object_doormat.x<3){
			sprite_index = sprite_character1_backwards;
			image_speed = 2;
			y = y - 1;
			if(object_door.y - y > -2){
				sprite_index = sprite_character1_idle;
				image_speed = 0;
				global.enterDoor = false;
				global.inside = true;
				room_goto(inside_house);
			}
		}
	}
	else{
		if(x-object_house_exit.x>2){ //character too far right
			sprite_index = sprite_character1_left;
			image_speed = 2;
			x = x - 1;
		}
		if(x-object_house_exit.x<2){ //character too far left
			sprite_index = sprite_character1_right;
			image_speed = 2
			x = x + 1;
		}
		if(x-object_house_exit.x>1 && x-object_house_exit.x<3){
			sprite_index = sprite_character1_forward;
			image_speed = 2;
			y = y + 1;
			if(y > 196){
				sprite_index = sprite_character1_idle;
				image_speed = 0;
				global.enterDoor = false;
				global.inside = false;
				room_goto(rm_grass_parent);
			}
		}
	}


}
