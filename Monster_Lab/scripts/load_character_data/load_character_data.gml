function load_character_data(head_id, torso_id, right_arm_id, left_arm_id, right_leg_id, left_leg_id){
	file = file_text_open_read(working_directory + "body_parts.txt")
	num = 0
	while (!file_text_eof(file))
    {
		str[num++] = file_text_readln(file)
    }
	file_text_close(file)
	for(line=0; line < array_length_1d(str); line++){
		temp_string = str[line]
		data_arr = split_string(temp_string, ",")
		if(data_arr[0] == head_id){
			global.head_name = data_arr[2]
			global.head_hp = data_arr[3]
			global.head_ability1 = data_arr[4]
			global.head_ability2 = data_arr[5]
			global.head_ability3 = data_arr[6]
		}
		if(data_arr[0] == torso_id){
			global.torso_name = data_arr[2]
			global.torso_hp = data_arr[3]
			global.torso_ability1 = data_arr[4]
			global.torso_ability2 = data_arr[5]
			global.torso_ability3 = data_arr[6]
		}
		if(data_arr[0] == right_arm_id){
			global.right_arm_name = data_arr[2]
			global.right_arm_hp = data_arr[3]
			global.right_arm_ability1 = data_arr[4]
			global.right_arm_ability2 = data_arr[5]
			global.right_arm_ability3 = data_arr[6]
		}
		if(data_arr[0] == left_arm_id){
			global.left_arm_name = data_arr[2]
			global.left_arm_hp = data_arr[3]
			global.left_arm_ability1 = data_arr[4]
			global.left_arm_ability2 = data_arr[5]
			global.left_arm_ability3 = data_arr[6]
		}
		if(data_arr[0] == right_leg_id){
			global.right_leg_name = data_arr[2]
			global.right_leg_hp = data_arr[3]
			global.right_leg_ability1 = data_arr[4]
			global.right_leg_ability2 = data_arr[5]
			global.right_leg_ability3 = data_arr[6]
		}
		if(data_arr[0] == left_leg_id){
			global.left_leg_name = data_arr[2]
			global.left_leg_hp = data_arr[3]
			global.left_leg_ability1 = data_arr[4]
			global.left_leg_ability2 = data_arr[5]
			global.left_leg_ability3 = data_arr[6]
		}
	}
	
	//Here we start loading from the abilities.txt file
	file1 = file_text_open_read(working_directory + "abilities.txt")
	num1 = 0
	while (!file_text_eof(file1))
    {
		arr1[num1++] = file_text_readln(file1)
    }
	file_text_close(file1)
	for(line1=0; line1 < array_length_1d(arr1); line1++){
		temp_string1 = arr1[line1]
		data_arr1 = split_string(temp_string1, ",")
		if(global.head_ability1 != 0){
			if(data_arr1[0] == global.head_ability1){
				global.head_ability1_name = data_arr1[1]
				global.head_ability1_parts_hit = data_arr1[2]
				global.head_ability1_min_damage = data_arr1[3]
				global.head_ability1_max_damage = data_arr1[4]
				global.head_ability1_cooldown = data_arr1[5]
				global.head_ability1_damage_healed = data_arr1[6]
				global.head_ability1_parts_healed = data_arr1[7]
				global.head_ability1_attack_passive = data_arr1[8]
			}
		}
		if(global.torso_ability1 != 0){
			if(data_arr1[0] == global.torso_ability1){
				global.torso_ability1_name = data_arr1[1]
				global.torso_ability1_parts_hit = data_arr1[2]
				global.torso_ability1_min_damage = data_arr1[3]
				global.torso_ability1_max_damage = data_arr1[4]
				global.torso_ability1_cooldown = data_arr1[5]
				global.torso_ability1_damage_healed = data_arr1[6]
				global.torso_ability1_parts_healed = data_arr1[7]
				global.torso_ability1_attack_passive = data_arr1[8]
			}
		}
		if(global.right_arm_ability1 != 0){
			if(data_arr1[0] == global.right_arm_ability1){
				global.right_arm_ability1_name = data_arr1[1]
				global.right_arm_ability1_parts_hit = data_arr1[2]
				global.right_arm_ability1_min_damage = data_arr1[3]
				global.right_arm_ability1_max_damage = data_arr1[4]
				global.right_arm_ability1_cooldown = data_arr1[5]
				global.right_arm_ability1_damage_healed = data_arr1[6]
				global.right_arm_ability1_parts_healed = data_arr1[7]
				global.right_arm_ability1_attack_passive = data_arr1[8]
			}
		}
		if(global.left_arm_ability1 != 0){
			if(data_arr1[0] == global.left_arm_ability1){
				global.left_arm_ability1_name = data_arr1[1]
				global.left_arm_ability1_parts_hit = data_arr1[2]
				global.left_arm_ability1_min_damage = data_arr1[3]
				global.left_arm_ability1_max_damage = data_arr1[4]
				global.left_arm_ability1_cooldown = data_arr1[5]
				global.left_arm_ability1_damage_healed = data_arr1[6]
				global.left_arm_ability1_parts_healed = data_arr1[7]
				global.left_arm_ability1_attack_passive = data_arr1[8]
			}
		}
		if(global.right_leg_ability1 != 0){
			if(data_arr1[0] == global.right_leg_ability1){
				global.right_leg_ability1_name = data_arr1[1]
				global.right_leg_ability1_parts_hit = data_arr1[2]
				global.right_leg_ability1_min_damage = data_arr1[3]
				global.right_leg_ability1_max_damage = data_arr1[4]
				global.right_leg_ability1_cooldown = data_arr1[5]
				global.right_leg_ability1_damage_healed = data_arr1[6]
				global.right_leg_ability1_parts_healed = data_arr1[7]
				global.right_leg_ability1_attack_passive = data_arr1[8]
			}
		}
		if(global.left_leg_ability1 != 0){
			if(data_arr1[0] == global.left_leg_ability1){
				global.left_leg_ability1_name = data_arr1[1]
				global.left_leg_ability1_parts_hit = data_arr1[2]
				global.left_leg_ability1_min_damage = data_arr1[3]
				global.left_leg_ability1_max_damage = data_arr1[4]
				global.left_leg_ability1_cooldown = data_arr1[5]
				global.left_leg_ability1_damage_healed = data_arr1[6]
				global.left_leg_ability1_parts_healed = data_arr1[7]
				global.left_leg_ability1_attack_passive = data_arr1[8]
			}
		}
		//end of ability1
		//start of ability2
		if(global.head_ability2 != 0){
			if(data_arr1[0] == global.head_ability2){
				global.head_ability2_name = data_arr1[1]
				global.head_ability2_parts_hit = data_arr1[2]
				global.head_ability2_min_damage = data_arr1[3]
				global.head_ability2_max_damage = data_arr1[4]
				global.head_ability2_cooldown = data_arr1[5]
				global.head_ability2_damage_healed = data_arr1[6]
				global.head_ability2_parts_healed = data_arr1[7]
				global.head_ability2_attack_passive = data_arr1[8]
			}
		}
		if(global.torso_ability2 != 0){
			if(data_arr1[0] == global.torso_ability2){
				global.torso_ability2_name = data_arr1[1]
				global.torso_ability2_parts_hit = data_arr1[2]
				global.torso_ability2_min_damage = data_arr1[3]
				global.torso_ability2_max_damage = data_arr1[4]
				global.torso_ability2_cooldown = data_arr1[5]
				global.torso_ability2_damage_healed = data_arr1[6]
				global.torso_ability2_parts_healed = data_arr1[7]
				global.torso_ability2_attack_passive = data_arr1[8]
			}
		}
		if(global.right_arm_ability2 != 0){
			if(data_arr1[0] == global.right_arm_ability2){
				global.right_arm_ability2_name = data_arr1[1]
				global.right_arm_ability2_parts_hit = data_arr1[2]
				global.right_arm_ability2_min_damage = data_arr1[3]
				global.right_arm_ability2_max_damage = data_arr1[4]
				global.right_arm_ability2_cooldown = data_arr1[5]
				global.right_arm_ability2_damage_healed = data_arr1[6]
				global.right_arm_ability2_parts_healed = data_arr1[7]
				global.right_arm_ability2_attack_passive = data_arr1[8]
			}
		}
		if(global.left_arm_ability2 != 0){
			if(data_arr1[0] == global.left_arm_ability2){
				global.left_arm_ability2_name = data_arr1[1]
				global.left_arm_ability2_parts_hit = data_arr1[2]
				global.left_arm_ability2_min_damage = data_arr1[3]
				global.left_arm_ability2_max_damage = data_arr1[4]
				global.left_arm_ability2_cooldown = data_arr1[5]
				global.left_arm_ability2_damage_healed = data_arr1[6]
				global.left_arm_ability2_parts_healed = data_arr1[7]
				global.left_arm_ability2_attack_passive = data_arr1[8]
			}
		}
		if(global.right_leg_ability2 != 0){
			if(data_arr1[0] == global.right_leg_ability2){
				global.right_leg_ability2_name = data_arr1[1]
				global.right_leg_ability2_parts_hit = data_arr1[2]
				global.right_leg_ability2_min_damage = data_arr1[3]
				global.right_leg_ability2_max_damage = data_arr1[4]
				global.right_leg_ability2_cooldown = data_arr1[5]
				global.right_leg_ability2_damage_healed = data_arr1[6]
				global.right_leg_ability2_parts_healed = data_arr1[7]
				global.right_leg_ability2_attack_passive = data_arr1[8]
			}
		}
		if(global.left_leg_ability2 != 0){
			if(data_arr1[0] == global.left_leg_ability2){
				global.left_leg_ability2_name = data_arr1[1]
				global.left_leg_ability2_parts_hit = data_arr1[2]
				global.left_leg_ability2_min_damage = data_arr1[3]
				global.left_leg_ability2_max_damage = data_arr1[4]
				global.left_leg_ability2_cooldown = data_arr1[5]
				global.left_leg_ability2_damage_healed = data_arr1[6]
				global.left_leg_ability2_parts_healed = data_arr1[7]
				global.left_leg_ability2_attack_passive = data_arr1[8]
			}
		}
		//end of abilities2
		//start of abilities3
		if(global.head_ability3 != 0){
			if(data_arr1[0] == global.head_ability3){
				global.head_ability3_name = data_arr1[1]
				global.head_ability3_parts_hit = data_arr1[2]
				global.head_ability3_min_damage = data_arr1[3]
				global.head_ability3_max_damage = data_arr1[4]
				global.head_ability3_cooldown = data_arr1[5]
				global.head_ability3_damage_healed = data_arr1[6]
				global.head_ability3_parts_healed = data_arr1[7]
				global.head_ability3_attack_passive = data_arr1[8]
			}
		}
		if(global.torso_ability3 != 0){
			if(data_arr1[0] == global.torso_ability3){
				global.torso_ability3_name = data_arr1[1]
				global.torso_ability3_parts_hit = data_arr1[2]
				global.torso_ability3_min_damage = data_arr1[3]
				global.torso_ability3_max_damage = data_arr1[4]
				global.torso_ability3_cooldown = data_arr1[5]
				global.torso_ability3_damage_healed = data_arr1[6]
				global.torso_ability3_parts_healed = data_arr1[7]
				global.torso_ability3_attack_passive = data_arr1[8]
			}
		}
		if(global.right_arm_ability3 != 0){
			if(data_arr1[0] == global.right_arm_ability3){
				global.right_arm_ability3_name = data_arr1[1]
				global.right_arm_ability3_parts_hit = data_arr1[2]
				global.right_arm_ability3_min_damage = data_arr1[3]
				global.right_arm_ability3_max_damage = data_arr1[4]
				global.right_arm_ability3_cooldown = data_arr1[5]
				global.right_arm_ability3_damage_healed = data_arr1[6]
				global.right_arm_ability3_parts_healed = data_arr1[7]
				global.right_arm_ability3_attack_passive = data_arr1[8]
			}
		}
		if(global.left_arm_ability3 != 0){
			if(data_arr1[0] == global.left_arm_ability3){
				global.left_arm_ability3_name = data_arr1[1]
				global.left_arm_ability3_parts_hit = data_arr1[2]
				global.left_arm_ability3_min_damage = data_arr1[3]
				global.left_arm_ability3_max_damage = data_arr1[4]
				global.left_arm_ability3_cooldown = data_arr1[5]
				global.left_arm_ability3_damage_healed = data_arr1[6]
				global.left_arm_ability3_parts_healed = data_arr1[7]
				global.left_arm_ability3_attack_passive = data_arr1[8]
			}
		}
		if(global.right_leg_ability3 != 0){
			if(data_arr1[0] == global.right_leg_ability3){
				global.right_leg_ability3_name = data_arr1[1]
				global.right_leg_ability3_parts_hit = data_arr1[2]
				global.right_leg_ability3_min_damage = data_arr1[3]
				global.right_leg_ability3_max_damage = data_arr1[4]
				global.right_leg_ability3_cooldown = data_arr1[5]
				global.right_leg_ability3_damage_healed = data_arr1[6]
				global.right_leg_ability3_parts_healed = data_arr1[7]
				global.right_leg_ability3_attack_passive = data_arr1[8]
			}
		}
		if(global.left_leg_ability3 != 0){
			if(data_arr1[0] == global.left_leg_ability3){
				global.left_leg_ability3_name = data_arr1[1]
				global.left_leg_ability3_parts_hit = data_arr1[2]
				global.left_leg_ability3_min_damage = data_arr1[3]
				global.left_leg_ability3_max_damage = data_arr1[4]
				global.left_leg_ability3_cooldown = data_arr1[5]
				global.left_leg_ability3_damage_healed = data_arr1[6]
				global.left_leg_ability3_parts_healed = data_arr1[7]
				global.left_leg_ability3_attack_passive = data_arr1[8]
			}
		}
	}
}