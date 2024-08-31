/// @description

//Currently not included when drawing abilities:
//global.head_ability1_cooldown
//global.head_ability1_damage_healed
//global.head_ability1_parts_healed
//global.head_ability1_attack_passive

//set font
draw_set_font(Font1)
draw_set_color(c_white)

//Draw GUI for player health bars
for(position=0; position<6; position++){
	draw_healthbar(player_x1[position], player_y1[position], player_x2[position], player_y2[position], 100*global.player_health[position]/global.max_player_health[position], c_dkgray, c_red, c_green, 3, true, false)
}
if(curr_hover == 0){
	draw_sprite_stretched(spr_body_overlay, curr_selected, player_overlay_x, player_overlay_y, 384, 384)
}
else{
	draw_sprite_stretched(spr_body_overlay, curr_hover, player_overlay_x, player_overlay_y, 384, 384)
}

//Draw GUI for opponent health bars
for(position=0; position<6; position++){
	draw_healthbar(opponent_x1[position], opponent_y1[position], opponent_x2[position], opponent_y2[position], 100*global.opponent_health[position]/global.max_opponent_health[position], c_dkgray, c_red, c_green, 3, true, false)
}
draw_sprite_stretched(spr_body_overlay, 7, opponent_overlay_x, opponent_overlay_y, 384, 384)

//Draw GUI background
draw_sprite(spr_gui_background, 0, 384, 1080-288)

//Draw body part data based on hover/select
if(curr_hover == 0){
	if(curr_selected == 1){
		draw_set_color(c_white)
		draw_text(body_part_name_x, body_part_name_y, global.head_name)
		draw_text(body_part_hp_x, body_part_hp_y, string(player_health[0]) + "/" + string(max_player_health[0]))
		draw_set_color(c_black)
		if(global.head_ability1 != 0){
			draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box1_name_x, ability_box1_name_y, global.head_ability1_name)
			draw_text(ability_box1_damage_x, ability_box1_damage_y, global.head_ability1_min_damage + " -" + global.head_ability1_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box1_x1 and mouse_x*global.window_scale < ability_box1_x2 and mouse_y*global.window_scale > ability_box1_y1 and mouse_y*global.window_scale < ability_box1_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.head_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.head_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.head_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.head_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.head_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.head_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.head_ability2 != 0){
			draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box2_name_x, ability_box2_name_y, global.head_ability2_name)
			draw_text(ability_box2_damage_x, ability_box2_damage_y, global.head_ability2_min_damage + " -" + global.head_ability2_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box2_x1 and mouse_x*global.window_scale < ability_box2_x2 and mouse_y*global.window_scale > ability_box2_y1 and mouse_y*global.window_scale < ability_box2_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.head_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.head_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.head_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.head_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.head_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.head_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.head_ability3 != 0){
			draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box3_name_x, ability_box3_name_y, global.head_ability3_name)
			draw_text(ability_box3_damage_x, ability_box3_damage_y, global.head_ability3_min_damage + " -" + global.head_ability3_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box3_x1 and mouse_x*global.window_scale < ability_box3_x2 and mouse_y*global.window_scale > ability_box3_y1 and mouse_y*global.window_scale < ability_box3_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.head_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.head_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.head_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.head_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.head_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.head_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
	}
	else if(curr_selected == 2){
		draw_set_color(c_white)
		draw_text(body_part_name_x, body_part_name_y, global.torso_name)
		draw_text(body_part_hp_x, body_part_hp_y, string(player_health[1]) + "/" + string(max_player_health[1]))
		draw_set_color(c_black)
		if(global.torso_ability1 != 0){
			draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box1_name_x, ability_box1_name_y, global.torso_ability1_name)
			draw_text(ability_box1_damage_x, ability_box1_damage_y, global.torso_ability1_min_damage + " -" + global.torso_ability1_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box1_x1 and mouse_x*global.window_scale < ability_box1_x2 and mouse_y*global.window_scale > ability_box1_y1 and mouse_y*global.window_scale < ability_box1_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.torso_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.torso_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.torso_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.torso_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.torso_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.torso_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.torso_ability2 != 0){
			draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box2_name_x, ability_box2_name_y, global.torso_ability2_name)
			draw_text(ability_box2_damage_x, ability_box2_damage_y, global.torso_ability2_min_damage + " -" + global.torso_ability2_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box2_x1 and mouse_x*global.window_scale < ability_box2_x2 and mouse_y*global.window_scale > ability_box2_y1 and mouse_y*global.window_scale < ability_box2_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.torso_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.torso_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.torso_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.torso_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.torso_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.torso_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.torso_ability3 != 0){
			draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box3_name_x, ability_box3_name_y, global.torso_ability3_name)
			draw_text(ability_box3_damage_x, ability_box3_damage_y, global.torso_ability3_min_damage + " -" + global.torso_ability3_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box3_x1 and mouse_x*global.window_scale < ability_box3_x2 and mouse_y*global.window_scale > ability_box3_y1 and mouse_y*global.window_scale < ability_box3_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.torso_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.torso_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.torso_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.torso_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.torso_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.torso_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
	}
	else if(curr_selected == 3){
		draw_set_color(c_white)
		draw_text(body_part_name_x, body_part_name_y, global.right_arm_name)
		draw_text(body_part_hp_x, body_part_hp_y, string(player_health[2]) + "/" + string(max_player_health[2]))
		draw_set_color(c_black)
		if(global.right_arm_ability1 != 0){
			draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box1_name_x, ability_box1_name_y, global.right_arm_ability1_name)
			draw_text(ability_box1_damage_x, ability_box1_damage_y, global.right_arm_ability1_min_damage + " -" + global.right_arm_ability1_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box1_x1 and mouse_x*global.window_scale < ability_box1_x2 and mouse_y*global.window_scale > ability_box1_y1 and mouse_y*global.window_scale < ability_box1_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.right_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.right_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.right_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.right_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.right_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.right_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.right_arm_ability2 != 0){
			draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box2_name_x, ability_box2_name_y, global.right_arm_ability2_name)
			draw_text(ability_box2_damage_x, ability_box2_damage_y, global.right_arm_ability2_min_damage + " -" + global.right_arm_ability2_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box2_x1 and mouse_x*global.window_scale < ability_box2_x2 and mouse_y*global.window_scale > ability_box2_y1 and mouse_y*global.window_scale < ability_box2_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.right_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.right_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.right_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.right_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.right_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.right_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.right_arm_ability3 != 0){
			draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box3_name_x, ability_box3_name_y, global.right_arm_ability3_name)
			draw_text(ability_box3_damage_x, ability_box3_damage_y, global.right_arm_ability3_min_damage + " -" + global.right_arm_ability3_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box3_x1 and mouse_x*global.window_scale < ability_box3_x2 and mouse_y*global.window_scale > ability_box3_y1 and mouse_y*global.window_scale < ability_box3_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.right_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.right_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.right_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.right_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.right_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.right_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
	}
	else if(curr_selected == 4){
		draw_set_color(c_white)
		draw_text(body_part_name_x, body_part_name_y, global.left_arm_name)
		draw_text(body_part_hp_x, body_part_hp_y, string(player_health[3]) + "/" + string(max_player_health[3]))
		draw_set_color(c_black)
		if(global.left_arm_ability1 != 0){
			draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box1_name_x, ability_box1_name_y, global.left_arm_ability1_name)
			draw_text(ability_box1_damage_x, ability_box1_damage_y, global.left_arm_ability1_min_damage + " -" + global.left_arm_ability1_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box1_x1 and mouse_x*global.window_scale < ability_box1_x2 and mouse_y*global.window_scale > ability_box1_y1 and mouse_y*global.window_scale < ability_box1_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.left_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.left_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.left_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.left_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.left_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.left_arm_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.left_arm_ability2 != 0){
			draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box2_name_x, ability_box2_name_y, global.left_arm_ability2_name)
			draw_text(ability_box2_damage_x, ability_box2_damage_y, global.left_arm_ability2_min_damage + " -" + global.left_arm_ability2_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box2_x1 and mouse_x*global.window_scale < ability_box2_x2 and mouse_y*global.window_scale > ability_box2_y1 and mouse_y*global.window_scale < ability_box2_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.left_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.left_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.left_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.left_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.left_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.left_arm_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.left_arm_ability3 != 0){
			draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box3_name_x, ability_box3_name_y, global.left_arm_ability3_name)
			draw_text(ability_box3_damage_x, ability_box3_damage_y, global.left_arm_ability3_min_damage + " -" + global.left_arm_ability3_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box3_x1 and mouse_x*global.window_scale < ability_box3_x2 and mouse_y*global.window_scale > ability_box3_y1 and mouse_y*global.window_scale < ability_box3_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.left_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.left_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.left_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.left_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.left_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.left_arm_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
	}
	else if(curr_selected == 5){
		draw_set_color(c_white)
		draw_text(body_part_name_x, body_part_name_y, global.right_leg_name)
		draw_text(body_part_hp_x, body_part_hp_y, string(player_health[4]) + "/" + string(max_player_health[4]))
		draw_set_color(c_black)
		if(global.right_leg_ability1 != 0){
			draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box1_name_x, ability_box1_name_y, global.right_leg_ability1_name)
			draw_text(ability_box1_damage_x, ability_box1_damage_y, global.right_leg_ability1_min_damage + " -" + global.right_leg_ability1_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box1_x1 and mouse_x*global.window_scale < ability_box1_x2 and mouse_y*global.window_scale > ability_box1_y1 and mouse_y*global.window_scale < ability_box1_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.right_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.right_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.right_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.right_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.right_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.right_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.right_leg_ability2 != 0){
			draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box2_name_x, ability_box2_name_y, global.right_leg_ability2_name)
			draw_text(ability_box2_damage_x, ability_box2_damage_y, global.right_leg_ability2_min_damage + " -" + global.right_leg_ability2_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box2_x1 and mouse_x*global.window_scale < ability_box2_x2 and mouse_y*global.window_scale > ability_box2_y1 and mouse_y*global.window_scale < ability_box2_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.right_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.right_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.right_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.right_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.right_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.right_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.right_leg_ability3 != 0){
			draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box3_name_x, ability_box3_name_y, global.right_leg_ability3_name)
			draw_text(ability_box3_damage_x, ability_box3_damage_y, global.right_leg_ability3_min_damage + " -" + global.right_leg_ability3_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box3_x1 and mouse_x*global.window_scale < ability_box3_x2 and mouse_y*global.window_scale > ability_box3_y1 and mouse_y*global.window_scale < ability_box3_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.right_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.right_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.right_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.right_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.right_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.right_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
	}
	else if(curr_selected == 6){
		draw_set_color(c_white)
		draw_text(body_part_name_x, body_part_name_y, global.left_leg_name)
		draw_text(body_part_hp_x, body_part_hp_y, string(player_health[5]) + "/" + string(max_player_health[5]))
		draw_set_color(c_black)
		if(global.left_leg_ability1 != 0){
			draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box1_name_x, ability_box1_name_y, global.left_leg_ability1_name)
			draw_text(ability_box1_damage_x, ability_box1_damage_y, global.left_leg_ability1_min_damage + " -" + global.left_leg_ability1_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box1_x1 and mouse_x*global.window_scale < ability_box1_x2 and mouse_y*global.window_scale > ability_box1_y1 and mouse_y*global.window_scale < ability_box1_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.left_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.left_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.left_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.left_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.left_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.left_leg_ability1_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.left_leg_ability2 != 0){
			draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box2_name_x, ability_box2_name_y, global.left_leg_ability2_name)
			draw_text(ability_box2_damage_x, ability_box2_damage_y, global.left_leg_ability2_min_damage + " -" + global.left_leg_ability2_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box2_x1 and mouse_x*global.window_scale < ability_box2_x2 and mouse_y*global.window_scale > ability_box2_y1 and mouse_y*global.window_scale < ability_box2_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.left_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.left_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.left_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.left_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.left_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.left_leg_ability2_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
		if(global.left_leg_ability3 != 0){
			draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
			draw_text(ability_box3_name_x, ability_box3_name_y, global.left_leg_ability3_name)
			draw_text(ability_box3_damage_x, ability_box3_damage_y, global.left_leg_ability3_min_damage + " -" + global.left_leg_ability3_max_damage + " damage")
			if(mouse_x*global.window_scale > ability_box3_x1 and mouse_x*global.window_scale < ability_box3_x2 and mouse_y*global.window_scale > ability_box3_y1 and mouse_y*global.window_scale < ability_box3_y2){ //if hovering over this ability box
				draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_selected_color, true)
				if(string_count("head", global.left_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 1, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("torso", global.left_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 2, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_arm", global.left_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 3, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_arm", global.left_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 4, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("right_leg", global.left_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 5, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
				if(string_count("left_leg", global.left_leg_ability3_parts_hit) > 0){
					draw_sprite_stretched(spr_parts_selected_overlay, 6, opponent_overlay_x, opponent_overlay_y, 384, 384)
				}
			}
		}
	}
}
else if(curr_hover == 1){
	draw_set_color(c_white)
	draw_text(body_part_name_x, body_part_name_y, global.head_name)
	draw_text(body_part_hp_x, body_part_hp_y, string(player_health[0]) + "/" + string(max_player_health[0]))
	draw_set_color(c_black)
	if(global.head_ability1 != 0){
		draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box1_name_x, ability_box1_name_y, global.head_ability1_name)
		draw_text(ability_box1_damage_x, ability_box1_damage_y, global.head_ability1_min_damage + " -" + global.head_ability1_max_damage + " damage")
	}
	if(global.head_ability2 != 0){
		draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box2_name_x, ability_box2_name_y, global.head_ability2_name)
		draw_text(ability_box2_damage_x, ability_box2_damage_y, global.head_ability2_min_damage + " -" + global.head_ability2_max_damage + " damage")
	}
	if(global.head_ability3 != 0){
		draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box3_name_x, ability_box3_name_y, global.head_ability3_name)
		draw_text(ability_box3_damage_x, ability_box3_damage_y, global.head_ability3_min_damage + " -" + global.head_ability3_max_damage + " damage")
	}
}
else if(curr_hover == 2){
	draw_set_color(c_white)
	draw_text(body_part_name_x, body_part_name_y, global.torso_name)
	draw_text(body_part_hp_x, body_part_hp_y, string(player_health[1]) + "/" + string(max_player_health[1]))
	draw_set_color(c_black)
	if(global.torso_ability1 != 0){
		draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box1_name_x, ability_box1_name_y, global.torso_ability1_name)
		draw_text(ability_box1_damage_x, ability_box1_damage_y, global.torso_ability1_min_damage + " -" + global.torso_ability1_max_damage + " damage")
	}
	if(global.torso_ability2 != 0){
		draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box2_name_x, ability_box2_name_y, global.torso_ability2_name)
		draw_text(ability_box2_damage_x, ability_box2_damage_y, global.torso_ability2_min_damage + " -" + global.torso_ability2_max_damage + " damage")
	}
	if(global.torso_ability3 != 0){
		draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box3_name_x, ability_box3_name_y, global.torso_ability3_name)
		draw_text(ability_box3_damage_x, ability_box3_damage_y, global.torso_ability3_min_damage + " -" + global.torso_ability3_max_damage + " damage")
	}
}
else if(curr_hover == 3){
	draw_set_color(c_white)
	draw_text(body_part_name_x, body_part_name_y, global.right_arm_name)
	draw_text(body_part_hp_x, body_part_hp_y, string(player_health[2]) + "/" + string(max_player_health[2]))
	draw_set_color(c_black)
	if(global.right_arm_ability1 != 0){
		draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box1_name_x, ability_box1_name_y, global.right_arm_ability1_name)
		draw_text(ability_box1_damage_x, ability_box1_damage_y, global.right_arm_ability1_min_damage + " -" + global.right_arm_ability1_max_damage + " damage")
	}
	if(global.right_arm_ability2 != 0){
		draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box2_name_x, ability_box2_name_y, global.right_arm_ability2_name)
		draw_text(ability_box2_damage_x, ability_box2_damage_y, global.right_arm_ability2_min_damage + " -" + global.right_arm_ability2_max_damage + " damage")
	}
	if(global.right_arm_ability3 != 0){
		draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box3_name_x, ability_box3_name_y, global.right_arm_ability3_name)
		draw_text(ability_box3_damage_x, ability_box3_damage_y, global.right_arm_ability3_min_damage + " -" + global.right_arm_ability3_max_damage + " damage")
	}
}
else if(curr_hover == 4){
	draw_set_color(c_white)
	draw_text(body_part_name_x, body_part_name_y, global.left_arm_name)
	draw_text(body_part_hp_x, body_part_hp_y, string(player_health[3]) + "/" + string(max_player_health[3]))
	draw_set_color(c_black)
	if(global.left_arm_ability1 != 0){
		draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box1_name_x, ability_box1_name_y, global.left_arm_ability1_name)
		draw_text(ability_box1_damage_x, ability_box1_damage_y, global.left_arm_ability1_min_damage + " -" + global.left_arm_ability1_max_damage + " damage")
	}
	if(global.left_arm_ability2 != 0){
		draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box2_name_x, ability_box2_name_y, global.left_arm_ability2_name)
		draw_text(ability_box2_damage_x, ability_box2_damage_y, global.left_arm_ability2_min_damage + " -" + global.left_arm_ability2_max_damage + " damage")
	}
	if(global.left_arm_ability3 != 0){
		draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box3_name_x, ability_box3_name_y, global.left_arm_ability3_name)
		draw_text(ability_box3_damage_x, ability_box3_damage_y, global.left_arm_ability3_min_damage + " -" + global.left_arm_ability3_max_damage + " damage")
	}
}
else if(curr_hover == 5){
	draw_set_color(c_white)
	draw_text(body_part_name_x, body_part_name_y, global.right_leg_name)
	draw_text(body_part_hp_x, body_part_hp_y, string(player_health[4]) + "/" + string(max_player_health[4]))
	draw_set_color(c_black)
	if(global.right_leg_ability1 != 0){
		draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box1_name_x, ability_box1_name_y, global.right_leg_ability1_name)
		draw_text(ability_box1_damage_x, ability_box1_damage_y, global.right_leg_ability1_min_damage + " -" + global.right_leg_ability1_max_damage + " damage")
	}
	if(global.right_leg_ability2 != 0){
		draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box2_name_x, ability_box2_name_y, global.right_leg_ability2_name)
		draw_text(ability_box2_damage_x, ability_box2_damage_y, global.right_leg_ability2_min_damage + " -" + global.right_leg_ability2_max_damage + " damage")
	}
	if(global.right_leg_ability3 != 0){
		draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box3_name_x, ability_box3_name_y, global.right_leg_ability3_name)
		draw_text(ability_box3_damage_x, ability_box3_damage_y, global.right_leg_ability3_min_damage + " -" + global.right_leg_ability3_max_damage + " damage")
	}
}
else if(curr_hover == 6){
	draw_set_color(c_white)
	draw_text(body_part_name_x, body_part_name_y, global.left_leg_name)
	draw_text(body_part_hp_x, body_part_hp_y, string(player_health[5]) + "/" + string(max_player_health[5]))
	draw_set_color(c_black)
	if(global.left_leg_ability1 != 0){
		draw_rectangle_color(ability_box1_x1, ability_box1_y1, ability_box1_x2, ability_box1_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box1_name_x, ability_box1_name_y, global.left_leg_ability1_name)
		draw_text(ability_box1_damage_x, ability_box1_damage_y, global.left_leg_ability1_min_damage + " -" + global.left_leg_ability1_max_damage + " damage")
	}
	if(global.left_leg_ability2 != 0){
		draw_rectangle_color(ability_box2_x1, ability_box2_y1, ability_box2_x2, ability_box2_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box2_name_x, ability_box2_name_y, global.left_leg_ability2_name)
		draw_text(ability_box2_damage_x, ability_box2_damage_y, global.left_leg_ability2_min_damage + " -" + global.left_leg_ability2_max_damage + " damage")
	}
	if(global.left_leg_ability3 != 0){
		draw_rectangle_color(ability_box3_x1, ability_box3_y1, ability_box3_x2, ability_box3_y2, ability_box_color, ability_box_color, ability_box_color, ability_box_color, false)
		draw_text(ability_box3_name_x, ability_box3_name_y, global.left_leg_ability3_name)
		draw_text(ability_box3_damage_x, ability_box3_damage_y, global.left_leg_ability3_min_damage + " -" + global.left_leg_ability3_max_damage + " damage")
	}
}
