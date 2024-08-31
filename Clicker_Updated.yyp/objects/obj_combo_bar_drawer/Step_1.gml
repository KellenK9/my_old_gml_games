/// @description Update combo value

if(global.combo_meter > 0.009){
	global.combo_meter = global.combo_meter - (0.01*sqrt(global.combo_meter))
}

if(global.combo_meter > 80){
	global.multiplier = 5
}
else if(global.combo_meter > 60){
	global.multiplier = 4
}
else if (global.combo_meter > 40){
	global.multiplier = 3
}
else if (global.combo_meter > 20){
	global.multiplier = 2
}
else{
	global.multiplier = 1
}