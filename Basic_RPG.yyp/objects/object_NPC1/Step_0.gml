/// @description Insert description here
// You can write your code in this editor
if(distance_to_object(object_character) < 12 && global.hasKey == false){
	global.dialogue = true;
	if(alarm[0]<0){
		alarm[0] = 15;
	}
}