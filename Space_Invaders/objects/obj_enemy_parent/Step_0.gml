/// @description Step

if(place_meeting(x,y, obj_bullet_parent)){
	global.points += 50
	instance_destroy(id)
}