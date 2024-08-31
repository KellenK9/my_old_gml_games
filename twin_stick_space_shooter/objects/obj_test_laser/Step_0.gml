/// @description Step

x += lengthdir_x(l_speed,image_angle)
y += lengthdir_y(l_speed,image_angle)

//destroy laser if far away from character
if(distance_to_object(obj_test_character_rod) > dist_threshold){
	instance_destroy(self.id)
}