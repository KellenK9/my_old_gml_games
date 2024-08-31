/// @desc Initialize
global.dead = false;

spd = 2;
hspd = 0;
vspd = 0;
len = 0;
dir = 0;

state = move_state;

window_set_size(320*4,240*4);
window_center();