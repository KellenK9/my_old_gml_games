/// @description Draw Glove Shop

dist = 88

if(global.glove_menu_open == true){
	draw_sprite(spr_glove_shop,0,480,270)
	
	//green
	if(global.cursor == 1 or point_in_rectangle(mouse_x, mouse_y, (480+dist)/4, (270+dist)/4, (480+dist+128)/4, (270+dist+128)/4)){
		draw_sprite(spr_glove_green_shop_icon,1,480+dist,270+dist)
		if(mouse_check_button_pressed(mb_left)){
			global.cursor = 1
		}
	}
	else{
		draw_sprite(spr_glove_green_shop_icon,0,480+dist,270+dist)
	}
	draw_text(480+dist,270+dist+128+16, "Owned")
	
	//blue
	if(global.cursor == 2 or point_in_rectangle(mouse_x, mouse_y, (480+dist+128+dist)/4, (270+dist)/4, (480+dist+128+128+dist)/4, (270+dist+128)/4)){
		draw_sprite(spr_glove_blue_shop_icon,1,480+dist+128+dist,270+dist)
		if(mouse_check_button_pressed(mb_left)){
			global.cursor = 2
		}
	}
	else{
		draw_sprite(spr_glove_blue_shop_icon,0,480+dist+128+dist,270+dist)
	}
	draw_text(480+dist+128+dist,270+dist+128+16, "Owned")
	
	//red
	if(global.cursor == 3 or point_in_rectangle(mouse_x, mouse_y, (480+dist+128+dist+128+dist)/4, (270+dist)/4, (480+dist+128+128+dist+128+dist)/4, (270+dist+128)/4)){
		draw_sprite(spr_glove_red_shop_icon,1,480+dist+128+dist+128+dist,270+dist)
		if(mouse_check_button_pressed(mb_left)){
			global.cursor = 3
		}
	}
	else{
		draw_sprite(spr_glove_red_shop_icon,0,480+dist+128+dist+128+dist,270+dist)
	}
	draw_text(480+dist+128+dist+128+dist,270+dist+128+16, "Owned")
	
	//purple
	if(global.cursor == 4 or point_in_rectangle(mouse_x, mouse_y, (480+dist+128+dist+128+dist+128+dist)/4, (270+dist)/4, (480+dist+128+128+dist+128+dist+128+dist)/4, (270+dist+128)/4)){
		draw_sprite(spr_glove_purple_shop_icon,1,480+dist+128+dist+128+dist+128+dist,270+dist)
		if(mouse_check_button_pressed(mb_left)){
			global.cursor = 4
		}
	}
	else{
		draw_sprite(spr_glove_purple_shop_icon,0,480+dist+128+dist+128+dist+128+dist,270+dist)
	}
	draw_text(480+dist+128+dist+128+dist+128+dist,270+dist+128+16, "Owned")
	
	//orange
	if(global.cursor == 5 or point_in_rectangle(mouse_x, mouse_y, (480+dist)/4, (270+dist+dist+dist+64)/4, (480+dist+128)/4, (270+dist+128+dist+dist+64)/4)){
		draw_sprite(spr_glove_orange_shop_icon,1,480+dist,270+dist+dist+dist+64)
		if(mouse_check_button_pressed(mb_left)){
			global.cursor = 5
		}
	}
	else{
		draw_sprite(spr_glove_orange_shop_icon,0,480+dist,270+dist+dist+dist+64)
	}
	draw_text(480+dist,270+dist+128+16+dist+dist+64, "Owned")
	
	//grey
	if(global.cursor == 6 or point_in_rectangle(mouse_x, mouse_y, (480+dist+128+dist)/4, (270+dist+dist+dist+64)/4, (480+dist+128+128+dist)/4, (270+dist+128+dist+dist+64)/4)){
		draw_sprite(spr_glove_grey_shop_icon,1,480+dist+128+dist,270+dist+dist+dist+64)
		if(mouse_check_button_pressed(mb_left)){
			global.cursor = 6
		}
	}
	else{
		draw_sprite(spr_glove_grey_shop_icon,0,480+dist+128+dist,270+dist+dist+dist+64)
	}
	draw_text(480+dist+128+dist,270+dist+128+16+dist+dist+64, "Owned")
	
	//yellow
	if(global.cursor == 7 or point_in_rectangle(mouse_x, mouse_y, (480+dist+128+dist+128+dist)/4, (270+dist+dist+dist+64)/4, (480+dist+128+128+dist+128+dist)/4, (270+dist+128+dist+dist+64)/4)){
		draw_sprite(spr_glove_yellow_shop_icon,1,480+dist+128+dist+128+dist,270+dist+dist+dist+64)
		if(mouse_check_button_pressed(mb_left)){
			global.cursor = 7
		}
	}
	else{
		draw_sprite(spr_glove_yellow_shop_icon,0,480+dist+128+dist+128+dist,270+dist+dist+dist+64)
	}
	draw_text(480+dist+128+dist+128+dist,270+dist+128+16+dist+dist+64, "Owned")
	
	//teal
	if(global.cursor ==8 or point_in_rectangle(mouse_x, mouse_y, (480+dist+128+dist+128+dist+128+dist)/4, (270+dist+dist+dist+64)/4, (480+dist+128+128+dist+128+dist+128+dist)/4, (270+dist+128+dist+dist+64)/4)){
		draw_sprite(spr_glove_teal_shop_icon,1,480+dist+128+dist+128+dist+128+dist,270+dist+dist+dist+64)
		if(mouse_check_button_pressed(mb_left)){
			global.cursor = 8
		}
	}
	else{
		draw_sprite(spr_glove_teal_shop_icon,0,480+dist+128+dist+128+dist+128+dist,270+dist+dist+dist+64)
	}
	draw_text(480+dist+128+dist+128+dist+128+dist,270+dist+128+16+dist+dist+64, "Owned")
}
