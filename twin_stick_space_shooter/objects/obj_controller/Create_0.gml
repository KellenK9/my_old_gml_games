/// @description Initialize

global.player_health = 100

star_density = 0.001

num_stars = star_density * room_height * room_width

num_enemies = 10

for(i = 0; i < num_stars; i++){
	generate_background()
}