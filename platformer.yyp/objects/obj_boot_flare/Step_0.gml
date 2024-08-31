/// @desc every step
if(global.bootFlaring == true){
	//self.visible = true;
} // uncomment to add back in boot flare
else{
	self.visible = false;
}
x = obj_character.x + 6;
y = obj_character.y + obj_character.sprite_height;
if(global.facingRight = false){
	x = x - 3;
}
if(place_meeting(x,y, obj_parent_deadly_if_touched)){
	self.visible = false;
}