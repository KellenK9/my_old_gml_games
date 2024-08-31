/// @description Initialize

global.points = 0
global.dead = false

window_set_fullscreen(true)

text_disapear = false


//Play sound
//if(room == room_menu){
	audio_stop_all()
	audio_play_sound(sound_nintendogs, 80, true)
//}
/*
else{
	audio_stop_sound(sound_nintendogs)
	if(!audio_is_playing(sound_tractor) and !audio_is_playing(sound_stfu)){
		randomize()
		rand = random(0.5)
		if(rand > 0.25){
			audio_play_sound(sound_tractor, 80, true)
		}
		else{
			audio_play_sound(sound_stfu, 80, true)
		}
	}
}
*/