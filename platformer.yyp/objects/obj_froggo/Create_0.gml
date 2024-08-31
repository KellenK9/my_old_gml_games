/// @desc initialize
jump = false;
jumping = false;
dir_facing_left = true;
vspd = 0;
hspd = 0;
state = state_froggo;
tongue_out = true;

tongue = instance_create_layer(x-48,y+24,"Instances",obj_tongue);
