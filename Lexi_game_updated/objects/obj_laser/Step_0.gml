/// @description Step

self.x = self.x + laser_speed

if(self.x > 3000){
	instance_destroy(self.id)
}

//destroy self if touching enemy
if(place_meeting(self.x, self.y, obj_enemy_parent)){
	//instance_destroy(self.id)
}