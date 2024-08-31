/// @description Shakes screen

camera_set_view_pos(view_camera[0],8+camera_get_view_x(view_camera[0]),4+camera_get_view_y(view_camera[0]));
if(alarm[3]<0){
	alarm[3] = 2;
}