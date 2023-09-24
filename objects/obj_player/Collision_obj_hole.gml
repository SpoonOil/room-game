/// @description Insert description here
// You can write your code in this editor

if obj_hole.image_index == 0 && !place_meeting(old_x,old_y, obj_hole) && !level_beaten {
	audio_play_sound(snd_level_complete,0,false);
	// Play a transition....
	
	instance_create_depth(0,0,-16000,obj_transition_right);
	instance_create_depth(0,0,-16000,obj_transition_up);
	instance_create_depth(0,0,-16000,obj_transition_left);
	instance_create_depth(0,0,-16000,obj_transition_down);
	alarm[0] = 30;
	level_beaten = true;
	obj_game.levels_completed += 1;
}
