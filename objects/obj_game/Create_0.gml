/// @description Initialize global variables

// Sets the movement to use during puzzle rooms. By default we initialize to "room" mode
global.move_mode = "room";

// Sets the font to use for text display
global.font_main = fnt_gameboy;

// Set loop points for tracks in our OST where necessary
audio_sound_loop_start(snd_cry_for_help, 2.217);

// This object will be placed on the main menu screen.
// Play the title screen music
bg_music = audio_play_sound(snd_cry_for_help,0,true); 



