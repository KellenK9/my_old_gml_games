/// @description Move Block/Cursor

shortest_distance = 1000
shortest_location = 0

for(var i=0; i < array_length(obj_controller.eligible_points_arr); i+=1){
	curr_distance = point_distance(
		obj_controller.eligible_points_arr[i][0],
		obj_controller.eligible_points_arr[i][1],
		mouse_x,
		mouse_y
	)
	if(curr_distance < shortest_distance){
		shortest_distance = curr_distance
		shortest_location = i
	}
}

x = obj_controller.eligible_points_arr[shortest_location][0]
y = obj_controller.eligible_points_arr[shortest_location][1]

if(shortest_distance > 8){
	visible = false
}
else{
	visible = true
}

self.depth = -self.y - 1