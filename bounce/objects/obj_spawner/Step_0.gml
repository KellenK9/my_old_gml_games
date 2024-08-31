/// Spawn Stuff

if(alarm[0] == -1){
	alarm[0] = time_between_grass
}

if(alarm[1] == -1){
	alarm[1] = random_range(min_cloud_time, max_cloud_time)
}

if(alarm[2] == -1){
	alarm[2] = random_range(min_spike_time, max_spike_time)
}

double_spike_odds -= double_spike_odds_increase