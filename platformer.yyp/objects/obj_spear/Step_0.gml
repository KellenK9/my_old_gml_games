/// @desc every step


//set vertical movement
vspd = vspd; //positive is down
vaccel = vaccel; //positive is down
max_vspd = 1;
vaccel = .01;
vspd = vspd + vaccel;
if(vspd > max_vspd){
	vspd = max_vspd;
}
y += vspd;
	
//moves horizontally
if(sprite_index == spr_spear_left){
	x -= 4;
}
else{
	x += 4;
}


//destroys if solid object
if(place_meeting(x,y,obj_solid_parent)){
	if(alarm[0] < 0){
		alarm[0] = 4;
	}
}