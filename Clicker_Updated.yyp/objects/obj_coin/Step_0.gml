/// @description Moves coin down and allows clicking

if(destroyed == false){
	self.y = self.y + 1
}

if(mouse_check_button_pressed(mb_left) && global.glove_menu_open == false){
	if(position_meeting(mouse_x, mouse_y, self)){
		global.cash += global.coin_value * 50
		self.image_alpha = 0
		destroyed = true
		explosion = true
		if(alarm[0] < 0){
			alarm[0] = 20
		}
	}
}

if(self.y > 10000 or global.closed == true){
	instance_destroy(self.id, true)
}
