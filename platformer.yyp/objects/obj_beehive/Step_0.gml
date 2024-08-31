/// @desc every step
beeSpawnTimer += 1;
if(beeSpawnTimer % 120 == 0){
	instance_create_depth(x+(sprite_width/2)-6, y-12, -1000, obj_bee);
}