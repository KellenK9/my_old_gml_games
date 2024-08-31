/// @desc Every Step
get_input();
depth = -y;
script_execute(state);

if(global.dead == true && (keyboard_check(vk_enter) || keyboard_check(vk_space))){
	room_restart();
}