/// @description Begin Step

if(place_meeting(self.x, self.y, obj_character)){
	touching_character = true
	state = move_state;
	if(abs(self.x - obj_character.x) > abs(self.y - obj_character.y)){
		//snap to the side of character
		if(self.x > obj_character.x){
			//we are to the right of character
			self.x = obj_character.x + 1
		}
		else{
			//we are to the left of character
			self.x = obj_character.x - 1
		}
	}
	else{
		//snap to the top or bottom of character
		if(self.y > obj_character.y){
			//we are at the bottom of character
			self.y = obj_character.y + 1
		}
		else{
			//we are at the top of character
			self.y = obj_character.y - 1
		}
	}
}

if(touching_character == true){
	state = move_state
	if(place_meeting(self.x, self.y, obj_matter)){
		inst_id = instance_place(self.x, self.y, obj_matter)
		inst_id.touching_character = true;
		if(abs(self.x - inst_id.x) > abs(self.y - inst_id.y)){
			//snap new matter to the side of this matter
			if(self.x > inst_id.x){
				//we are to the right of new matter
				inst_id.x = self.x - 1
			}
			else{
				//we are to the left of new matter
				inst_id.x = self.x + 1
			}
		}
		else{
			//snap new matter to the top or bottom of this matter
			if(self.y > inst_id.y){
				//we are at the bottom of new matter
				inst_id.y = self.y - 1
			}
			else{
				//we are at the top of new matter
				inst_id.y = self.y + 1
			}
		}
		inst_id.touching_character = true;
	}
}