/// @description Draw Text

draw_set_font(fnt2)

num = global.cash
while(num > 1000){
	num = num/1000
}
if(num > 100){
	dec = 0
}
else if(num > 10){
	dec = 1
}
else{
	dec = 2
}

if(global.cash > 1000000){
	draw_text(32, 64, "Cash: " + string_format(round(global.cash/10000000000000)/100,3,dec) + "Q")
}
else if(global.cash > 1000000){
	draw_text(32, 64, "Cash: " + string_format(round(global.cash/10000000000)/100,3,dec) + "T")
}
else if(global.cash > 1000000){
	draw_text(32, 64, "Cash: " + string_format(round(global.cash/10000000)/100,3,dec) + "B")
}
else if(global.cash > 1000000){
	draw_text(32, 64, "Cash: " + string_format(round(global.cash/10000)/100,3,dec) + "M")
}
else if(global.cash > 1000){
	draw_text(32, 64, "Cash: " + string_format(round(global.cash/10)/100,3,dec) + "K")
}
else{
	draw_text(32, 64, "Cash: " + string(global.cash))
}