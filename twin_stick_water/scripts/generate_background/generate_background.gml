function generate_background(){
	next_x = random(room_width)
	next_y = random(room_height)
	
	backgrounds = ["background_instances_top"]
	back_layer = backgrounds[random(array_length(backgrounds))]
	
	elements = [obj_wave1, obj_wave2]
	background_element = elements[random(array_length(elements))]
	
	instance_create_layer(next_x, next_y, layer_get_id(back_layer), background_element)
}