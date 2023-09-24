/// @description Insert description here
// You can write your code in this editor

if obj_hole.image_index == 0 && !place_meeting(old_x,old_y, obj_hole) {
	audio_play_sound(snd_level_complete,0,false);
	room_goto_next();
}
