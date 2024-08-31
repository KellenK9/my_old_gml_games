/// @description Insert description here
// You can write your code in this editor

draw_self()

if(keyboard_check_pressed(vk_space) and y < ground_level - height_buffer and bounce_bool){
	draw_sprite(spr_hit, 0, x - (sprite_width/2), y - (sprite_height/2) - velocity)
	bounce_bool = false
}