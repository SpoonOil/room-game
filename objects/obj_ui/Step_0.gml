/// @description Insert description here
// You can write your code in this editor

image_alpha = 1;

if room == rm_main_menu || room == rm_end {
	image_alpha = 0;
}

if global.move_mode == "room" {
	image_index = 1;
} else if global.move_mode == "player" {
	image_index = 0;	
} else {
	image_alpha = 0;	
}

if instance_number(obj_transition_parent) > 0 {
	image_alpha = 0;	
}











