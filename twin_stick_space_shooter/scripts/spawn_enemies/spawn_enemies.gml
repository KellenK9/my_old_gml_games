function spawn_enemies(){
	spawn_dist_from_player = 360
	spawn_x = random(room_width)
	spawn_y = random(room_height)
	while(abs(spawn_x - obj_test_character_rod.x) < spawn_dist_from_player){
		spawn_x = random(room_width)
	}
	while(abs(spawn_y - obj_test_character_rod.y) < spawn_dist_from_player){
		spawn_y = random(room_height)
	}
	
	instance_create_depth(spawn_x, spawn_y, -200, obj_ship1)
}