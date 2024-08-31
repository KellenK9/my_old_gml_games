/// @description Spawn Enemies

randnum = random_range(0, 100)
if(randnum > 50){
	if(randnum > 75){
		x_pos = -100
	}
	else{
		x_pos = 420
	}
	y_pos = random_range(-100, 280)
}
else{
	if(randnum < 25){
		y_pos = -100
	}
	else{
		y_pos = 280
	}
	x_pos = random_range(-100, 420)
}

instance_create_depth(x_pos, y_pos, 0, obj_enemy)