/// @description Draw GUI

draw_set_font(font0)
draw_text(8,8,"Score: " + string(global.points))

//Draws 'Try Again' Button
button_width = 800
button_height = 300
left = (1920-button_width)/2
right = 1920 - left
top = (1080-button_height)/2
bottom = 1080 - top
if(global.dead == true){
	draw_rectangle_color(left,top,right,bottom,c_dkgray,c_dkgray,c_gray,c_gray,false)
	draw_text((1920-string_width("Try Again?"))/2, (1080-string_height("Try Again?"))/2, "Try Again?")
}