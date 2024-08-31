/// @description Fire bullets

if(space_pressed){
	instance_create_depth(x+2, y, 0, obj_bullet1)
	instance_create_depth(x+14, y, 0, obj_bullet1)
	instance_create_depth(x+7, y+2, 0, obj_bullet2)
}