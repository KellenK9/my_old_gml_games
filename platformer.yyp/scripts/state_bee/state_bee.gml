function state_bee() {
	numBees = instance_number(obj_bee);
	dir = 0;
	beeSeperation = 128;
	beeSpeed = 5;
	spinSpeed = spinSpeed + .05;

	for(i = 0; i < numBees; i+=1){
		bees[i] = instance_find(obj_bee, i);
	}

	for(j = 0; j < numBees; j+=1){ //gets direction
		if(bees[j] = id)
			dir = (360/numBees)*j + spinSpeed;
	}

	xGoal = obj_center_bees.x - sprite_width + (cos(dir)*beeSeperation);
	yGoal = obj_center_bees.y - sprite_height + (sin(dir)*beeSeperation);

	xDistanceToGoal = xGoal - x;
	yDistanceToGoal = yGoal - y;

	totalDistanceToGoal = sqrt(sqr(xDistanceToGoal) + sqr(yDistanceToGoal));

	if(totalDistanceToGoal != 0){
		x = x + (beeSpeed * xDistanceToGoal / totalDistanceToGoal);
		y = y + (beeSpeed * yDistanceToGoal / totalDistanceToGoal);
	}

	//sets sprite
	if(xDistanceToGoal > 0){
		sprite_index = spr_bee_right;
	}
	else{
		sprite_index = spr_bee_left;
	}

	if(place_meeting(x,y,obj_character)){
		global.live -= 5;
		instance_destroy(id);
		global.hurt = true;
	}



}
