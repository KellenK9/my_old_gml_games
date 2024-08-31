/// @description Every step

if(alarm[0] < 0){
	alarm[0] = 60
}

if(mouse_check_button_pressed(mb_left) && global.glove_menu_open == false){
	if(position_meeting(mouse_x, mouse_y, self)){
		//bag has been punched once
		if(global.combo_meter < 99.02){
			global.combo_meter = global.combo_meter + 1
		}
		rotate_num = max_rotate;
		image_angle=0;
		global.cash += (global.hitprofit * global.multiplier);
		effect_create_above(ef_star, mouse_x, mouse_y, 6, c_orange);
		effect_create_above(ef_star, mouse_x, mouse_y, 6, c_orange);
		effect_create_above(ef_star, mouse_x, mouse_y, 6, c_orange);
		effect_create_above(ef_star, mouse_x, mouse_y, 6, c_orange);
		effect_create_above(ef_star, mouse_x, mouse_y, 5, c_orange);
		effect_create_above(ef_star, mouse_x, mouse_y, 5, c_orange);
		effect_create_above(ef_star, mouse_x, mouse_y, 3, c_yellow);
		effect_create_above(ef_star, mouse_x, mouse_y, 3, c_yellow);
		effect_create_above(ef_star, mouse_x, mouse_y, 3, c_yellow);
		effect_create_above(ef_star, mouse_x, mouse_y, 3, c_yellow);
		effect_create_above(ef_star, mouse_x, mouse_y, 3, c_yellow);
		effect_create_above(ef_star, mouse_x, mouse_y, 3, c_yellow);
	}
}

if(image_angle>0){
	if(rotate_num > 0){
		rotate_num = rotate_num - rotate_speed_up;
	}
	else{
		rotate_num = rotate_num - rotate_speed_down;
	}
}
else if(image_angle<0){
	if(rotate_num > 0){
		rotate_num = rotate_num + rotate_speed_down;
	}
	else{
		rotate_num = rotate_num + rotate_speed_up;
	}
}


if(image_angle <= 1 && image_angle >= -1 && rotate_num <= 1 && rotate_num >= -1){
	rotate_num = 0;
	image_angle = 0;
}


image_angle += rotate_num;