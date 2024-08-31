/// @desc Initialize

zoom = 5; //(5-close, 2-medium/far, 1-far)

view_width=1920/zoom
view_height=1080/zoom

window_scale=zoom;

right_speed = 0;
down_speed = 0;

window_set_size(view_width*window_scale,view_height*window_scale)
alarm[0]=1
alarm[1]=-1;
alarm[2]=-1;

surface_resize(application_surface,view_width*window_scale,view_height*window_scale)