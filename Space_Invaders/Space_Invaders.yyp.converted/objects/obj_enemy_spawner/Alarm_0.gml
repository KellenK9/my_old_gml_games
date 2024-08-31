/// @description Spawn enemy

x_spawn = irandom(room_width-8)

if(instance_exists(obj_character)){
	instance_create_depth(x_spawn, obj_character.y-200,0,obj_enemy_grunt)
}
