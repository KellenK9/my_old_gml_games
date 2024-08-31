/// @description Step

if(alarm[0] < 0){
	alarm[0] = 60 - sqrt(global.coin_frequency) + random(360/sqrt(global.coin_frequency))
}