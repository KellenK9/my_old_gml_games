/// @description Step

spr_width = 172

if(trump_health <= 0){
	instance_destroy(self.id)
}

if(place_meeting(self.x, self.y, obj_laser)){
	if(trump_health > 0){
		trump_health = trump_health - 1
	}
	var _list = ds_list_create()
	lasers = instance_place_list(self.x, self.y, obj_laser, _list, false)
	if(lasers > 1){
		for (var i = 0; i < lasers; ++i;)
        {
        instance_destroy(_list[| i]);
        }
    }
	ds_list_destroy(_list)
	image_blend = make_color_rgb(255, 0, 0)
}
else{
	image_blend = make_color_rgb(255, 255, 255)
}

if(mouth_open == true){
	image_index = 1
	
	//spawn Kirby's
	instance_create_depth(self.x, self.y + 150, -999, obj_kirby)
}
else{
	image_index = 0
}

if(alarm[0] < 0){
	alarm[0] = 240
}

//Movement
	//X
if(x_velocity > 5){
	x_velocity = x_velocity - 1
}
else if(x_velocity < -5){
	x_velocity = x_velocity + 1
}
else if(x > 1800){
	x_velocity = x_velocity - 1
}
else if(x < 1200){
	x_velocity = x_velocity + 1
}
else{
	randint = 2 - random(4)
	x_velocity = x_velocity + randint
}
	//Y
if(y_velocity > 5){
	y_velocity = y_velocity - 1
}
else if(y_velocity < -5){
	y_velocity = y_velocity + 1
}
else if(y > 900){
	y_velocity = y_velocity - 1
}
else if(y < 80){
	y_velocity = y_velocity + 1
}
else{
	randint = 2 - random(4)
	y_velocity = y_velocity + randint
}

self.x = self.x + x_velocity
self.y = self.y + y_velocity
