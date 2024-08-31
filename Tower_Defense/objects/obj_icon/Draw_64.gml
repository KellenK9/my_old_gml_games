/// @description Insert description here
// You can write your code in this editor

x = 888
y = 8;
if(global.gui_open == true){
	//draw_self();
	//draw_sprite_stretched(spr_tower1,0,888,8,64,64);
}

//if pressing first tower icon
if(position_meeting(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),obj_icon)){
	if(mouse_check_button_pressed(mb_left)){
		if(global.dollars > 49){
			global.dollars = global.dollars - 50;
			idd = instance_create_depth(mouse_x,mouse_y,-500, obj_tower1) //can't get this to only run once, kees creating 2 towers, they are created in the same frame, 2 at a time
			idd.holdingtower = true;
		}
	}
}