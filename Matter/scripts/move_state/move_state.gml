/// move_state


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
if(y+vspd < 0 || y+vspd+sprite_height > room_height){ //prevents leaving the room vertically
	vspd = 0;
}


x += hspd;
y += vspd;

/*if(place_meeting(x+hspd,y+vspd,obj_matter)){
	inst_id = instance_place(x+hspd, y+vspd, obj_matter)
	inst_id.touching_character = true;
}