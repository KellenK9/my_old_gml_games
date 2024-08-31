/// @description Step

image_angle = point_direction(x, y, obj_test_character_rod.x, obj_test_character_rod.y)

x += lengthdir_x(ship_speed, image_angle)
y += lengthdir_y(ship_speed, image_angle)

if(place_meeting(x, y, obj_test_laser)){
	dead = true
}
if(dead){
	audio_play_sound(sound_explode, 0.5, false)
	effect_create_above(ef_explosion, x, y, expl_size, expl_color)
	instance_destroy(self.id)
}