/// @description Set off alarm

if(alarm[0] < 0){
	alarm[0] = time_between_spawn
	time_between_spawn -= spawn_acceleration
}