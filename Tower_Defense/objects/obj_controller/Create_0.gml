/// @description Initialize

global.live = 100;
global.dollars = 1000;
global.wave = 1;
global.gui_open = true;

//create GUI buttons that people can click on
instance_create_depth(888,8,0,obj_icon)
instance_create_depth(1920-128,8,0,obj_close_gui_button)