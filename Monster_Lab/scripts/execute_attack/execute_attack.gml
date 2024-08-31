function execute_attack(min_damage, max_damage, parts_attacked_string){
	if(string_count("head", parts_attacked_string) > 0){
		damage = irandom_range(real(min_damage), real(max_damage))
		global.opponent_health[0] = global.opponent_health[0] - damage
	}
	if(string_count("torso", parts_attacked_string) > 0){
		damage = irandom_range(real(min_damage), real(max_damage))
		global.opponent_health[1] = global.opponent_health[1] - damage
	}
	if(string_count("right_arm", parts_attacked_string) > 0){
		damage = irandom_range(real(min_damage), real(max_damage))
		global.opponent_health[2] = global.opponent_health[2] - damage
	}
	if(string_count("left_arm", parts_attacked_string) > 0){
		damage = irandom_range(real(min_damage), real(max_damage))
		global.opponent_health[3] = global.opponent_health[3] - damage
	}
	if(string_count("right_leg", parts_attacked_string) > 0){
		damage = irandom_range(real(min_damage), real(max_damage))
		global.opponent_health[4] = global.opponent_health[4] - damage
	}
	if(string_count("left_leg", parts_attacked_string) > 0){
		damage = irandom_range(real(min_damage), real(max_damage))
		global.opponent_health[5] = global.opponent_health[5] - damage
	}
	for(i=0; i<6; i++){
		if(global.opponent_health[i] < 0){
			global.opponent_health[i] = 0
		}
	}
}