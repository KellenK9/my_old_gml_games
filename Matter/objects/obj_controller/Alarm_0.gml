/// @description Spawns Matter

min_spawn_distance = 10; //minimum spawn distance for matter from the player
max_spawn_distance = 20;

x_spawn = random(max_spawn_distance - min_spawn_distance) + min_spawn_distance
neg = choose(true, false)
if(neg == true){
	x_spawn = -1 * x_spawn
}
x_spawn = obj_character.x + x_spawn

y_spawn = random(max_spawn_distance - min_spawn_distance) + min_spawn_distance
neg = choose(true, false)
if(neg == true){
	y_spawn = -1 * y_spawn
}
y_spawn = obj_character.y + y_spawn

if(position_empty(x_spawn, y_spawn) && position_empty(x_spawn+1, y_spawn) && position_empty(x_spawn, y_spawn+1) && position_empty(x_spawn+1, y_spawn+1)){
	instance_create_depth(x_spawn, y_spawn, 0, obj_matter)
}