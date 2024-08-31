/// @description Draw GUI

text_width = 360
text_height = 240

if(global.dead == true){
	draw_set_font(font0)
	draw_set_color(c_red)
	draw_text(1920/2 - text_width, 1080/2 - text_height, "Game Over")
}

if(room == room_menu){
	draw_set_font(font2)
	draw_set_color(c_red)
	draw_text(760, 180, "Lexi")
	draw_set_font(font1)
	draw_text(744, 420, "'The Game'")
}
else{
	draw_set_font(font1)
	draw_set_color(c_red)
	draw_text(12, 12, "Score: " + string(global.points))
}

if(room == level1){
	draw_set_font(font1)
	draw_set_color(c_red)
	if(text_disapear == false){
		draw_text(1920/2 - text_width, 1080/2 - 240 - text_height, "Slaughter 50 Kirby's")
	}
	else{
		
	}
	if(alarm[0] < 0){
		alarm[0] = 240
	}
	
	if(global.points >= 50){
		draw_text(1920/2 - text_width + 160, 1080/2 - 240 - text_height, "You hit 50!")
		if(alarm[1]<0){
			alarm[1] = 120
		}
	}
}
if(room == level2){
	draw_set_font(font1)
	draw_set_color(c_red)
	if(text_disapear == false){
		draw_text(1920/2 - text_width, 1080/2 - 240 - text_height, "Pick off 20 Kirby's")
	}
	else{
		
	}
	if(alarm[0] < 0){
		alarm[0] = 240
	}
	
	if(global.points >= 20){
		draw_text(1920/2 - text_width + 160, 1080/2 - 240 - text_height, "You hit 20!")
		if(alarm[1]<0){
			alarm[1] = 120
		}
	}
}
if(room == level3){
	draw_set_font(font1)
	draw_set_color(c_red)
	if(text_disapear == false){
		draw_text(1920/2 - text_width, 1080/2 - 240 - text_height, "Slay 100 Kirby's")
	}
	else{
		
	}
	if(alarm[0] < 0){
		alarm[0] = 240
	}
	
	if(global.points >= 100){
		draw_text(1920/2 - text_width + 160, 1080/2 - 240 - text_height, "You hit 100!")
		if(alarm[1]<0){
			alarm[1] = 120
		}
	}
}
if(room == level4){
	draw_set_font(font1)
	draw_set_color(c_red)
	if(text_disapear == false){
		draw_text(1920/2 - text_width, 1080/2 - 240 - text_height, "Pick off 10 Kirby's")
	}
	else{
		
	}
	if(alarm[0] < 0){
		alarm[0] = 240
	}
	
	if(global.points >= 10){
		draw_text(1920/2 - text_width + 160, 1080/2 - 240 - text_height, "You hit 10!")
		if(alarm[1]<0){
			alarm[1] = 120
		}
	}
}
if(room == level5){
	draw_set_font(font1)
	draw_set_color(c_red)
	if(text_disapear == false){
		draw_text(1920/2 - text_width, 1080/2 - 240 - text_height, "Defeat the Donald")
	}
	else{
		
	}
	if(alarm[0] < 0){
		alarm[0] = 240
	}
	
	if(!instance_exists(obj_trump)){
		draw_text(1920/2 - text_width + 160, 1080/2 - 240 - text_height, "You won the election!")
		if(alarm[1]<0){
			alarm[1] = 120
		}
	}
}
if(room == level6){
	draw_set_font(font1)
	draw_set_color(c_red)
	if(text_disapear == false){
		draw_text(1920/2 - text_width, 1080/2 - 240 - text_height, "Take out every Kirby")
	}
	else{
		
	}
	if(alarm[0] < 0){
		alarm[0] = 240
	}
}
