/// @description Step

if(direction_up = true){
	self.y -= corn_speed
}
else{
	self.y += corn_speed
}

if(self.x > 2400 or self.x < -800 or self.y < -1000 or self.y > 2000){
	if(global.dead == false){
		//global.points += 1
	}
	instance_destroy(self.id)
}

//make corn gorw from lasers and turn red
if(place_meeting(self.x, self.y, obj_laser)){
	if(shade_coefficient < 100){
		shade_coefficient = shade_coefficient + 1
	}
	corn_x_size = image_xscale * 1.01
	corn_y_size = image_yscale * 1.01
	image_xscale = corn_x_size
	image_yscale = corn_y_size
	
	//destroy laser
	laser = instance_place(self.x, self.y, obj_laser)
	while(instance_exists(laser)){
		instance_destroy(laser.id)
		laser = instance_place(self.x, self.y, obj_laser)
	}

	//image_blend = make_color_hsv(0, shade_coefficient, 100)
}