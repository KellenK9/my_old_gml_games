/// @description Spawn

//spawns corn
corn_width = 246
corn_height = 480
curr_corn = instance_create_depth(self.x+(sprite_width)-(corn_width/2),self.y+(sprite_height/2)-(corn_height/2),-500,obj_corn)

//randomizes corn size
scale = 0.6 + random(0.4)
if(scale > 0.9){
	scale = 1
}
else{
	scale = 0.5
}
curr_corn.image_xscale = scale
curr_corn.image_yscale = scale