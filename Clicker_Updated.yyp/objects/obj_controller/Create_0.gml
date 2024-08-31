/// @description Initialize

//incorporate combo meter at some point
//incorporate levels at some point

//set mouse to glove
window_set_cursor(cr_none)
cursor_sprite = spr_glove;
image_speed = 0;

global.cash = 0; //the amount of starting cash for the players
global.hitprofit = 1; //cash gained from a single hit
global.boxers = 0; //Number of boxers the player has hired
global.coin_value = 1; //Value  of a coin when clicked *100
global.coin_frequency = 1; //Frequency of coins falling from the sky, higher number means more coins
