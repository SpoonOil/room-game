/// @description Insert description here
// You can write your code in this editor

// Determine what background music to play based on the room we are in
// If we need to play a different music track than what is currently playing, then stop the current track and play the new one
if room == rm_main_menu {
	new_bg = snd_cry_for_help;
} else {
	new_bg = snd_breakout;
}

if new_bg != asset_get_index(audio_get_name(bg_music)) {
	audio_stop_sound(bg_music);
	bg_music = audio_play_sound(new_bg,0,true); 
}
