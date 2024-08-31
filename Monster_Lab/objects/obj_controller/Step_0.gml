/// @description

//Use for testing, drains health slowly
/*
for(i=0; i<6; i++){
	player_health[i] = player_health[i] - 0.2
}
*/


//Check if mouse is hovering over body part
if(position_meeting(mouse_x, mouse_y, obj_button_head)){
	curr_hover = 1
}
else if(position_meeting(mouse_x, mouse_y, obj_button_torso)){
	curr_hover = 2
}
else if(position_meeting(mouse_x, mouse_y, obj_button_right_arm)){
	curr_hover = 3
}
else if(position_meeting(mouse_x, mouse_y, obj_button_left_arm)){
	curr_hover = 4
}
else if(position_meeting(mouse_x, mouse_y, obj_button_right_leg)){
	curr_hover = 5
}
else if(position_meeting(mouse_x, mouse_y, obj_button_left_leg)){
	curr_hover = 6
}
else{
	curr_hover = 0
}

//Set selected when mouse is clicked
if(mouse_check_button_released(mb_any)){
	curr_selected = curr_hover
}

//Check if attack used
if(mouse_check_button_pressed(mb_any)){
	if(mouse_x*global.window_scale > ability_box1_x1 and mouse_x*global.window_scale < ability_box1_x2 and mouse_y*global.window_scale > ability_box1_y1 and mouse_y*global.window_scale < ability_box1_y2){ //if hovering over this ability box
		if(curr_selected == 1){
			if(global.head_ability1 != 0){
				if(string_count("attack", global.head_ability1_attack_passive) > 0){
					execute_attack(global.head_ability1_min_damage, global.head_ability1_max_damage, global.head_ability1_parts_hit)
				}
			}
		}
		else if(curr_selected == 2){
			if(global.torso_ability1 != 0){
				if(string_count("attack", global.torso_ability1_attack_passive) > 0){
					execute_attack(global.torso_ability1_min_damage, global.torso_ability1_max_damage, global.torso_ability1_parts_hit)
				}
			}
		}
		else if(curr_selected == 3){
			if(global.right_arm_ability1 != 0){
				if(string_count("attack", global.right_arm_ability1_attack_passive) > 0){
					execute_attack(global.right_arm_ability1_min_damage, global.right_arm_ability1_max_damage, global.right_arm_ability1_parts_hit)
				}
			}
		}
		else if(curr_selected == 4){
			if(global.left_arm_ability1 != 0){
				if(string_count("attack", global.left_arm_ability1_attack_passive) > 0){
					execute_attack(global.left_arm_ability1_min_damage, global.left_arm_ability1_max_damage, global.left_arm_ability1_parts_hit)
				}
			}
		}
		else if(curr_selected == 5){
			if(global.right_leg_ability1 != 0){
				if(string_count("attack", global.right_leg_ability1_attack_passive) > 0){
					execute_attack(global.right_leg_ability1_min_damage, global.right_leg_ability1_max_damage, global.right_leg_ability1_parts_hit)
				}
			}
		}
		else if(curr_selected == 6){
			if(global.left_leg_ability1 != 0){
				if(string_count("attack", global.left_leg_ability1_attack_passive) > 0){
					execute_attack(global.left_leg_ability1_min_damage, global.left_leg_ability1_max_damage, global.left_leg_ability1_parts_hit)
				}
			}
		}
	}
	if(mouse_x*global.window_scale > ability_box2_x1 and mouse_x*global.window_scale < ability_box2_x2 and mouse_y*global.window_scale > ability_box2_y1 and mouse_y*global.window_scale < ability_box2_y2){ //if hovering over this ability box
		if(curr_selected == 1){
			if(global.head_ability2 != 0){
				if(string_count("attack", global.head_ability2_attack_passive) > 0){
					execute_attack(global.head_ability2_min_damage, global.head_ability2_max_damage, global.head_ability2_parts_hit)
				}
			}
		}
		else if(curr_selected == 2){
			if(global.torso_ability2 != 0){
				if(string_count("attack", global.torso_ability2_attack_passive) > 0){
					execute_attack(global.torso_ability2_min_damage, global.torso_ability2_max_damage, global.torso_ability2_parts_hit)
				}
			}
		}
		else if(curr_selected == 3){
			if(global.right_arm_ability2 != 0){
				if(string_count("attack", global.right_arm_ability2_attack_passive) > 0){
					execute_attack(global.right_arm_ability2_min_damage, global.right_arm_ability2_max_damage, global.right_arm_ability2_parts_hit)
				}
			}
		}
		else if(curr_selected == 4){
			if(global.left_arm_ability2 != 0){
				if(string_count("attack", global.left_arm_ability2_attack_passive) > 0){
					execute_attack(global.left_arm_ability2_min_damage, global.left_arm_ability2_max_damage, global.left_arm_ability2_parts_hit)
				}
			}
		}
		else if(curr_selected == 5){
			if(global.right_leg_ability2 != 0){
				if(string_count("attack", global.right_leg_ability2_attack_passive) > 0){
					execute_attack(global.right_leg_ability2_min_damage, global.right_leg_ability2_max_damage, global.right_leg_ability2_parts_hit)
				}
			}
		}
		else if(curr_selected == 6){
			if(global.left_leg_ability2 != 0){
				if(string_count("attack", global.left_leg_ability2_attack_passive) > 0){
					execute_attack(global.left_leg_ability2_min_damage, global.left_leg_ability2_max_damage, global.left_leg_ability2_parts_hit)
				}
			}
		}
	}
	if(mouse_x*global.window_scale > ability_box3_x1 and mouse_x*global.window_scale < ability_box3_x2 and mouse_y*global.window_scale > ability_box3_y1 and mouse_y*global.window_scale < ability_box3_y2){ //if hovering over this ability box
		if(curr_selected == 1){
			if(global.head_ability3 != 0){
				if(string_count("attack", global.head_ability3_attack_passive) > 0){
					execute_attack(global.head_ability3_min_damage, global.head_ability3_max_damage, global.head_ability3_parts_hit)
				}
			}
		}
		else if(curr_selected == 2){
			if(global.torso_ability3 != 0){
				if(string_count("attack", global.torso_ability3_attack_passive) > 0){
					execute_attack(global.torso_ability3_min_damage, global.torso_ability3_max_damage, global.torso_ability3_parts_hit)
				}
			}
		}
		else if(curr_selected == 3){
			if(global.right_arm_ability3 != 0){
				if(string_count("attack", global.right_arm_ability3_attack_passive) > 0){
					execute_attack(global.right_arm_ability3_min_damage, global.right_arm_ability3_max_damage, global.right_arm_ability3_parts_hit)
				}
			}
		}
		else if(curr_selected == 4){
			if(global.left_arm_ability3 != 0){
				if(string_count("attack", global.left_arm_ability3_attack_passive) > 0){
					execute_attack(global.left_arm_ability3_min_damage, global.left_arm_ability3_max_damage, global.left_arm_ability3_parts_hit)
				}
			}
		}
		else if(curr_selected == 5){
			if(global.right_leg_ability3 != 0){
				if(string_count("attack", global.right_leg_ability3_attack_passive) > 0){
					execute_attack(global.right_leg_ability3_min_damage, global.right_leg_ability3_max_damage, global.right_leg_ability3_parts_hit)
				}
			}
		}
		else if(curr_selected == 6){
			if(global.left_leg_ability3 != 0){
				if(string_count("attack", global.left_leg_ability3_attack_passive) > 0){
					execute_attack(global.left_leg_ability3_min_damage, global.left_leg_ability3_max_damage, global.left_leg_ability3_parts_hit)
				}
			}
		}
	}
}
