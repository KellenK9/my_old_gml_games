/// @description Draw Text

draw_set_font(fnt_chiller)
draw_set_color(c_red)
draw_set_alpha(visibility)

randint = random_range(-text_shake_power, text_shake_power)
randint2 = random_range(-text_shake_power, text_shake_power)

x_text_location = 480 + randint
y_text_location = 200 + randint2

if(text_intro_on_screen){
	draw_text(x_text_location, y_text_location, "Fire and Ice")
}

text_shake_power += 0.1
visibility -= 0.01

draw_set_alpha(1)

if(global.lost){
	draw_text(540, 400, "You Lose!")
}

//Draw Score
draw_set_color(c_white)
draw_set_font(fnt_algerian)
draw_text(100, 900, "Score: " + string(global.score))
if(global.lost == false){
	global.score += 1
}