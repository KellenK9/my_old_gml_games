/// @desc
#macro view view_camera[0]
camera_set_view_size(view,view_width,view_height);


camera_set_view_pos(view,0,global.scroll)

if(global.dead == false){
	global.scroll -= 0.5
}
