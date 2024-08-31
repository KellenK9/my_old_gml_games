/// @Spawn spikes

if(random(double_spike_odds) < 2){
	instance_create_depth(320 + 16, 180 - obj_grass.sprite_height - 16, 0, obj_spike)
}
instance_create_depth(320, 180 - obj_grass.sprite_height - 16, 0, obj_spike)