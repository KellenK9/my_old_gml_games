/// @description


give_starter_body_parts()
//Eventually these variables will be assigned by player in menus
//In menu, write to file with head_id and stat values
global.head_id = 1
global.torso_id = 2
global.left_arm_id = 4
global.right_arm_id = 3
global.left_leg_id = 6
global.right_leg_id = 5

//Execute script to assign global stat values by reading external file
load_character_data(global.head_id, global.torso_id, global.right_arm_id, global.left_arm_id, global.right_leg_id, global.left_leg_id)
