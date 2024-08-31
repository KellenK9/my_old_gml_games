/// @description Initialize

global.player_health = 100

star_density = 0.001

num_stars = star_density * room_height * room_width

for(i = 0; i < num_stars; i++){
	generate_background()
}

//wave physics
/*
for(i = 0; i < room_width; i++){
	for(j = 0; j < room_height; j++){
		water_previous[i][j] = 0
		water_current[i][j] = 0
	}
}
*/