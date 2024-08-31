/// @description

//health arrays go [head, torso, right-arm, left-arm, right-leg, left-leg]
global.player_health = [100, 100, 100, 100, 100, 100]
global.opponent_health = [100, 100, 100, 100, 100, 100]
global.max_player_health = [100, 100, 100, 100, 100, 100]
global.max_opponent_health = [100, 100, 100, 100, 100, 100]
alarm[0] = 1

player_overlay_x = 0
player_overlay_y = 1080-384

opponent_overlay_x = 1920-384
opponent_overlay_y = 1080-384

player_x1 = [150, 168, 234, 48, 216, 72]
player_x2 = [player_x1[0] + 84, player_x1[1] + 48, player_x1[2] + 102, player_x1[3] + 102, player_x1[4] + 96, player_x1[5] + 96]
player_y1 = [player_overlay_y + 36, player_overlay_y + 144, player_overlay_y + 150, player_overlay_y + 150, player_overlay_y + 270, player_overlay_y + 270]
player_y2 = [player_y1[0] + 84, player_y1[1] + 126, player_y1[2] + 78, player_y1[3] + 78, player_y1[4] + 78, player_y1[5] + 78]

opponent_x1 = [opponent_overlay_x + 150, opponent_overlay_x + 168, opponent_overlay_x + 234, opponent_overlay_x + 48, opponent_overlay_x + 216, opponent_overlay_x + 72]
opponent_x2 = [opponent_x1[0] + 84, opponent_x1[1] + 48, opponent_x1[2] + 102, opponent_x1[3] + 102, opponent_x1[4] + 96, opponent_x1[5] + 96]
opponent_y1 = [opponent_overlay_y + 36, opponent_overlay_y + 144, opponent_overlay_y + 150, opponent_overlay_y + 150, opponent_overlay_y + 270, opponent_overlay_y + 270]
opponent_y2 = [opponent_y1[0] + 84, opponent_y1[1] + 126, opponent_y1[2] + 78, opponent_y1[3] + 78, opponent_y1[4] + 78, opponent_y1[5] + 78]

curr_room = 0 //arena is 0
curr_selected = 0 //0 is none, 1 is head, 2 is torso, 3 is right-arm, etc
curr_hover = 0 //same as above

body_part_name_x = 450
body_part_name_y = 850
body_part_hp_x = 450
body_part_hp_y = 900

ability_box_width = 250
ability_box_height = 200
ability_box_distance = 50
ability_box_name_offset_x = 20
ability_box_name_offset_y = 20
ability_box_text_spacing = 16

ability_box1_x1 = 600
ability_box1_x2 = ability_box1_x1 + ability_box_width
ability_box1_y1 = 840
ability_box1_y2 = ability_box1_y1 + ability_box_height
ability_box2_x1 = ability_box1_x2 + ability_box_distance
ability_box2_x2 = ability_box2_x1 + ability_box_width
ability_box2_y1 = ability_box1_y1
ability_box2_y2 = ability_box2_y1 + ability_box_height
ability_box3_x1 = ability_box2_x2 + ability_box_distance
ability_box3_x2 = ability_box3_x1 + ability_box_width
ability_box3_y1 = ability_box1_y1
ability_box3_y2 = ability_box3_y1 + ability_box_height

ability_box_color = c_ltgrey
ability_box_selected_color = c_yellow

ability_box1_name_x = ability_box1_x1 + ability_box_name_offset_x
ability_box1_name_y = ability_box1_y1 + ability_box_name_offset_y
ability_box1_damage_x = ability_box1_name_x
ability_box1_damage_y = ability_box1_name_y + ability_box_text_spacing
ability_box2_name_x = ability_box2_x1 + ability_box_name_offset_x
ability_box2_name_y = ability_box2_y1 + ability_box_name_offset_y
ability_box2_damage_x = ability_box2_name_x
ability_box2_damage_y = ability_box2_name_y + ability_box_text_spacing
ability_box3_name_x = ability_box3_x1 + ability_box_name_offset_x
ability_box3_name_y = ability_box3_y1 + ability_box_name_offset_y
ability_box3_damage_x = ability_box3_name_x
ability_box3_damage_y = ability_box3_name_y + ability_box_text_spacing

/*
button_head = instance_create_depth(player_overlay_x, player_overlay_y, 0, obj_button_head)
button_torso = instance_create_depth(player_overlay_x, player_overlay_y, 0, obj_button_torso)
button_left_arm = instance_create_depth(player_overlay_x, player_overlay_y, 0, obj_button_left_arm)
button_left_leg = instance_create_depth(player_overlay_x, player_overlay_y, 0, obj_button_left_leg)
button_right_arm = instance_create_depth(player_overlay_x, player_overlay_y, 0, obj_button_right_arm)
button_right_leg = instance_create_depth(player_overlay_x, player_overlay_y, 0, obj_button_right_leg)
*/
