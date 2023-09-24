/// @description Insert description here
// You can write your code in this editor

up_key = keyboard_check_pressed(vk_up);
down_key = keyboard_check_pressed(vk_down);

key_val = down_key - up_key;

new_pos = pos + key_val;
new_pos = clamp(new_pos, 0, op_length - 1);

if new_pos != pos {
	audio_play_sound(snd_menu_scroll, 0, false);	
}

pos = new_pos;

if keyboard_check_pressed(ord("Z")) {
	if pos == 0 {
		// Start the game by progressing to the next room
		room_goto_next();
	}
	else if pos == 1 {
		game_end();
	}
}












