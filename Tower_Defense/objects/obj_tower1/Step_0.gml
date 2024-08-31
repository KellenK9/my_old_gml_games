/// @description Step

//sets holding to true if clicked
if(position_meeting(mouse_x,mouse_y,self) && mouse_check_button_pressed(mb_left)){
	holdingtower = true;
}

if(!mouse_check_button(mb_left) && !place_meeting(x,y,obj_sand)){
	holdingtower = false;
}

//move tower if holding it
if(holdingtower == true){
	x = mouse_x;
	y = mouse_y;
}

//move gun to tower
gun.x = x
gun.y = y