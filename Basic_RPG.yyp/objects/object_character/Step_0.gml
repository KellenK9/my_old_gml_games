/// @desc Every Step
get_input();
depth = -y;
script_execute(state);

if(global.enterDoor == true){
	state = enter_door;
}
else if(global.dialogue == true){
	state = State_nothing();
}
else{
	alarm[0] = 1;
}