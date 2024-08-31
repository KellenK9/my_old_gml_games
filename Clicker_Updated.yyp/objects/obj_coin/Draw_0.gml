/// @description Draw

if(explosion == true){
	effect_create_above(ef_explosion, self.x+8, self.y+8, 0.1, c_orange)
	explosion = false
}
if(destroyed == false){
	draw_self()
}