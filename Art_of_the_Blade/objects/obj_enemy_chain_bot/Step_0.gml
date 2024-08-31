/// @description Enemy Logic

get_input()

if(not attacking){
	if(moving_right){
		image_xscale = 1
		x += move_speed
		sprite_index = spr_chain_bot_walk
	}

	if(moving_left){
		image_xscale = -1
		x -= move_speed
		sprite_index = spr_chain_bot_walk
	}

	if((not moving_right) and (not moving_left)){
		sprite_index = spr_chain_bot_idle
	}

	if(charging){
		sprite_index = spr_chain_bot_charge
	}

	if (choose_to_attack){
		sprite_index = spr_chain_bot_charge_transition
		image_index = 0
		alarm[0] = charge_time
		charging = true
	}

	if(fully_charged){
		sprite_index = spr_chain_bot_attack
		image_index = 0
		fully_charged = false
		attacking = true
		alarm[1] = attack_time
	}
}