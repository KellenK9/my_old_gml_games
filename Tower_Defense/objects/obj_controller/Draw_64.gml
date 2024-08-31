/// @description Draw the GUI

top_border = 16;
bottom_border = 92-top_border
health_bar_width = 232
left_health = 32
right_health = left_health + health_bar_width

if(global.gui_open == true){
	draw_sprite(spr_gui_closed,0,0,0)
	draw_healthbar(left_health,top_border,right_health,bottom_border,global.live,c_gray,c_red,c_teal,0,true,true);

	draw_set_font(font0)
	draw_set_halign(fa_center);
	draw_set_color(c_white)
	draw_text((left_health + (health_bar_width/2)),top_border,string(global.live) + "/100")
	draw_set_halign(fa_left);
	draw_text(296,top_border,"$" + string(global.dollars))
	draw_text(592,top_border,"Wave: " + string(global.wave))

	//draws sprites of buttons
	draw_sprite(spr_icon,0,888,top_border-8)
	draw_sprite_stretched(spr_tower1,0,888,top_border-8,64,64)
	draw_sprite(spr_close_gui_button,0,1920-128,8)

	draw_set_font(font1)
	draw_set_color(c_yellow)
	draw_set_halign(fa_center);
	draw_text(920,top_border+56,"$50")
}