/// @description Every step

if(position_meeting(mouse_x, mouse_y, self) && global.glove_menu_open == false){
	image_index = 1
	if(mouse_check_button_pressed(mb_left)){
		//buy has been clicked once
		if(global.cash>=global.cost1){
			global.cash = global.cash - global.cost1;
			global.boxers += 1;
			global.cost1 = global.boxers * global.boxers;
		}
	}
}
else{
	image_index = 0
}