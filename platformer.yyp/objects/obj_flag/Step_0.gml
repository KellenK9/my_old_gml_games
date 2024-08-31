/// @desc every step
if(place_meeting(x,y,obj_character)){
	if(room_exists(room_next(room))){
		room_goto_next();
	}
}