/// @description Initialize global variables

// Sets the movement to use during puzzle rooms. 
// There are THREE modes of movement:
// room - the arrow keys move the room
// player - the arrow keys move the player
// text - the arrow keys move neither (for when text boxes are on screen)
global.move_mode = "text";

// Sets the font to use for text display
global.font_main = fnt_gameboy;

// Sets the maximum number of undo states that the game's objects will store
global.max_states = 10;

// Set loop points for tracks in our OST where necessary
audio_sound_loop_start(snd_cry_for_help, 2.217);

// This object will be placed on the main menu screen.
// Play the title screen music
bg_music = audio_play_sound(snd_cry_for_help,0,true); 

levels_completed = 0;



