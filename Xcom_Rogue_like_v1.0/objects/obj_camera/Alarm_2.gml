/// @description Zoom out

//if(zoom = 2)
		//zoom = 1;
if(zoom = 5)
		zoom = 2;
		
alarm[0] = 2;

curr_x = curr_x+(view_width/2)
curr_y = curr_y+(view_height/2)

view_width=1920/zoom
view_height=1080/zoom

curr_x = curr_x-(view_width/2)
curr_y = curr_y-(view_height/2)

window_scale=zoom;

camera_set_view_size(view_camera[0], view_width, view_height)
camera_set_view_pos(view_camera[0], obj_character.x-(view_width/2)+(obj_character.sprite_width/2), obj_character.y-(view_height/2)+(obj_character.sprite_height/2))
