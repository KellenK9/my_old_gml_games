/// move_state
function move_state() {

	//set sprite
	if(yaxis<0){
		sprite_index = sprite_character1_backwards;
		image_speed = 2;
		if(place_meeting(x,y,object_doormat)){ //starts to enter door
			global.enterDoor = true;
		}
	}
	if(yaxis>0){
		sprite_index = sprite_character1_forward;
		image_speed = 2;
		if(place_meeting(x,y,object_house_exit)){ //starts to exit door
			global.enterDoor = true;
		}
	}
	if(yaxis==0){
		if(xaxis>0){
			sprite_index = sprite_character1_right;
			image_speed = 2;
		}
		if(xaxis<0){
			sprite_index = sprite_character1_left;
			image_speed = 2;
		}
		if(xaxis==0){
			sprite_index = sprite_character1_idle;
			image_speed = 0;
		}
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
	if(x+hspd < 0 || x+hspd+sprite_width > room_width){ //prevents leaving the room horizontally
		hspd = 0;
	}
	if(y+vspd-sprite_height < 0 || y+vspd > room_height){ //prevents leaving the room vertically
		vspd = 0;
	}

	//horizontal collisions
	if(place_meeting(x+hspd, y, object_solid_parent)){
		while(!place_meeting(x+sign(hspd), y, object_solid_parent)){
			x += sign(hspd);
		}
		hspd = 0;
	}
	x += hspd;

	//vertical collisions
	if(place_meeting(x, y+vspd, object_solid_parent)){
		while(!place_meeting(x, y+sign(vspd), object_solid_parent)){
			y += sign(vspd);
		}
		vspd = 0;
	}
	y += vspd;


}
