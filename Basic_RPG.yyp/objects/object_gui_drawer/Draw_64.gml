/// @desc draws textbox and text
offset = 16

//draws bottom menu
draw_sprite(spr_gui_inventory,0,64,1080-128-32)
draw_sprite(spr_character_icon,0,128+16, 1080-128-16)
draw_set_font(font0)
draw_text(256, 1028-64-16-8, "Lil Johnny")
draw_text(256, 1028-16-16, "Class: Human")


//draws dialogue
if(global.dialogue == true){
	draw_sprite(sprite_text_box,0,192,672);
}
draw_set_font(font1)
if(quote == true){
	draw_text(192+offset, 672+offset, "Here's a key");
}