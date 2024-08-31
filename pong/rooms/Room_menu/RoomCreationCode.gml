audio_stop_sound(Sound_music)
if(audio_is_playing(Sound_menu_music) == false){
	audio_play_sound(Sound_menu_music, 2, true)
}