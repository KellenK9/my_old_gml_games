/// @description Insert description here
// You can write your code in this editor

x -= move_speed

if(x + sprite_width < 0){
	instance_destroy(self)
}