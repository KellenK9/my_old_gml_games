/// move_state
function state_move() {

	//bug:(fixed) occasionally jumps extremely high, probably given twice the vertical acceleration from a normal jump
	//bug: slides extremely slowly with no input after standing up from a crouch-slide
	//bug:(fixed) jumping near edge sometimes results in no jump but rather moving straight horizontally shortly

	//set direction facing
	if(xaxis>0){
		global.facingRight = true;
		haccel = 2;
	}
	if(xaxis<0){
		global.facingRight = false;
		haccel = -2;
	}
	if(xaxis==0){
		if(hspd>0)
			haccel = -1;
		if(hspd<0)
			haccel = 1;
		if(hspd==0)
			haccel = 0;
	}


	//slide if crouching
	if(global.crouching == true){
		if(hspd>0)
			haccel = -0.1
		if(hspd<0)
			haccel = 0.1;
		if(hspd < 0.1 && hspd > -0.1){
			haccel = 0;
			hspd = 0;
		}
	} //causes drifting after crouch sliding when not moving. crouching or moving left/right stops drift, jumping doesn't


	//set direction moving horizontally
	max_hspd = 6;
	hspd = hspd + haccel;
	if(hspd>max_hspd)
		hspd = max_hspd;
	if(hspd<-max_hspd)
		hspd = -max_hspd;
	
	//set sprite
	if(global.facingRight == true){ //facing right
		if(xaxis == 0 && global.crouching == false){
			sprite_index = spr_robot_idle_right;
		}
		else if(global.crouching == false){
			sprite_index = spr_robot_moving_right;
		}
		if(global.crouching == true){
			sprite_index = spr_robot_crouched_right;
		}
		image_speed = 1;
	}
	else{ //facing left
		if(xaxis == 0 && global.crouching == false){
			sprite_index = spr_robot_idle_left;
		}
		else if(global.crouching == false){
			sprite_index = spr_robot_moving_left;
		}
		if(global.crouching == true){
			sprite_index = spr_robot_crouched_left;
		}
		image_speed = 1;
	}


	//set vertical movement
	vspd = vspd; //positive is down
	vaccel = vaccel; //positive is down
	spacePressed = max(keyboard_check(vk_up), keyboard_check(ord("W")), 0);
	fastFalling = false;
	max_vspd = 20;
	leftmost_foot_point = 6;
	rightmost_foot_point = 6;
	if (global.facingRight == true){//sets foot area
		if(sprite_index == spr_robot_moving_right){
			leftmost_foot_point = 6;
			rightmost_foot_point = 17;
		}
		else{
			leftmost_foot_point = 11;
			rightmost_foot_point = 17;
		}
	}
	else{
		if(sprite_index == spr_robot_moving_left){
			leftmost_foot_point = 6;
			rightmost_foot_point = 17;
		}
		else{
			leftmost_foot_point = 6;
			rightmost_foot_point = 12;
		}
	}

	if(position_meeting(x+leftmost_foot_point, y+sprite_height+1, obj_solid_parent) || position_meeting(x+rightmost_foot_point, y+sprite_height+1, obj_solid_parent)){ //character is on ground, definition must be changed as its only using the top left coordinate
		global.jump_variation = 16;
		global.bootFlaring = false;
		global.hasDoubleJump = true;
		if(dkey!= 0)
			global.crouching = true;
		else if(!place_meeting(x,y-10,obj_solid_parent))
			global.crouching = false;
		if(spacePressed == 0)
		{
			vaccel = 0;
			vspd = 0;
		}
		else if(global.crouching == false){
			vaccel = -8;
			global.inFirstJump = true;
		}
	}
	else{
		if(dkey != 0)
			fastFalling = true;
		else
			global.crouching = false;
		if(fastFalling == true){
			vaccel = 2;
			global.bootFlaring = true;
		}
		else{
			vaccel = .5;
			global.bootFlaring = false;
		}
		if(global.jump_variation > 0 && spacePressed != 0){
			global.jump_variation = global.jump_variation - 1;
			vaccel = 0;
		}
		else{
			global.jump_variation = 0;
		}
		if(global.inFirstJump == true && spacePressed == 0){
			global.inFirstJump = false;
		}
		if(global.inFirstJump == false && spacePressed != 0 && global.hasDoubleJump == true && global.crouching == false){ //performs double jump
			vspd = 0;
			vaccel = -12;
			global.hasDoubleJump = false;
		}
	}

	//sets vertical speed
	vspd = vspd + vaccel;
	if(vspd > max_vspd)
		vspd = max_vspd;
	
	//when stuck under something crouched, moves slightly when jumping
	if(global.crouching == true && hspd == 0 && place_meeting(x, y+1, obj_solid_parent) && place_meeting(x,y-10,obj_solid_parent)){ //when at the edge sometimes loop fails to activate and you end up stuck
		if(spacePressed != 0){
			if(global.facingRight == true)
				hspd = 1;
			else
				hspd = -1;
		}
		else{
			if(!place_meeting(x+2,y-10,obj_solid_parent)){
				hspd = 1;
			}
			else if(!place_meeting(x-2,y-10,obj_solid_parent)){
				hspd = -1;
			}
		}	
	}

	//prevents leaving the room horizontally
	if(x+hspd < 0 || x+hspd+sprite_width > room_width){
		hspd = 0;
	}
	
	//changes camera speed when moving fast vertically
	global.camera_speed_change = max((vspd/max_vspd)/10,0);


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
