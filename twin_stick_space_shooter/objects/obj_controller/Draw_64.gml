/// @description Draw GUI

minimap_offset = 64
settings_offset = 64
healthbar_width = 32
healthbar_offset = 16

player_circle_speed = 0.25

minimap_width = 480
minimap_height = 270

//draw minimap
draw_sprite(spr_minimap_frame, 0, minimap_offset, minimap_offset)

//draw healthbar
draw_healthbar(minimap_offset + healthbar_offset + minimap_width, minimap_offset, minimap_offset + healthbar_offset + minimap_width + healthbar_width, minimap_offset + minimap_height, global.player_health, c_gray, c_red, c_green, 3, true, true)

//draw settings button
draw_sprite_ext(spr_settings, 0, 1920 - settings_offset, settings_offset, 1, 1, 0, c_teal, 1)

//draw minimap blips
if(instance_exists(obj_test_character_rod)){
	player_x = obj_test_character_rod.x / room_width * minimap_width
	player_y = obj_test_character_rod.y / room_height * minimap_height
	draw_circle_color(minimap_offset + player_x, minimap_offset +player_y, 4, c_aqua, c_aqua, false)
	if(alarm[0] < 0){
		alarm[0] = 16/player_circle_speed
	}
	else{
		draw_circle(minimap_offset + player_x, minimap_offset + player_y, 16 - (alarm[0] * player_circle_speed), true)
	}
}
if(instance_exists(obj_enemy_parent)){
	for (i = 0; i < instance_number(obj_enemy_parent); i += 1){
	enemy = instance_find(obj_enemy_parent, i)
	enemy_x = enemy.x / room_width * minimap_width
	enemy_y = enemy.y / room_height * minimap_height
	draw_circle_color(minimap_offset + enemy_x, minimap_offset + enemy_y, 4, c_red, c_red, false)
   }
}