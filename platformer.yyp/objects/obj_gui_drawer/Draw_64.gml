/// @desc Draw GUI events
if(global.gameOver == true){
	draw_set_font(font_size_256)
	draw_text(256,384, "Game Over")
	if(alarm[0] < 0){
		alarm[0] = 60;
	}
}
if(restartable == true){
	draw_sprite_stretched(spr_restart_button, 0, 832, 672, 256, 64);
	if(keyboard_check(vk_enter)){
		room_restart();
	}
}
draw_healthbar(32, 32, 64, 128, global.live, c_ltgray, c_ltgray, c_red, 3, true, true);