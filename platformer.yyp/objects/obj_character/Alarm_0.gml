/// @desc gets hit & returns to start of room
global.live = global.live - 25;
x = obj_spawn_player.x;
y = obj_spawn_player.y;
if(instance_exists(obj_spear)){
	instance_deactivate_object(obj_spear);
}
if(instance_exists(obj_beehive)){
	obj_center_bees.x = obj_beehive.x;
	obj_center_bees.y = obj_beehive.y;
}
image_blend = make_color_rgb(255,255,255);
state = state_move;