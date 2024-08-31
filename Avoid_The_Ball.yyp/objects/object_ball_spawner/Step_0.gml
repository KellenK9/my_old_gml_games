/// @desc Every Step
count = count + 1;
if(count%480==0 && global.dead == false){
	instance_create_depth(x,y,-y,object_ball)
}

//makes ball spawner invisible when player is dead
if(global.dead == true){
	visible = false;
}