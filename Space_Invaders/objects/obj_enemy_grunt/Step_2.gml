/// @description Move / AI

if(left == true){
	if(random(100) > 95){
		left = false
	}
}
else{
	if(random(100) > 95){
		left = true
	}
}
if(left == true){
	x -= 1
}
else{
	x += 1
}