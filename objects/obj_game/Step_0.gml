/// @description Insert description here
// You can write your code in this editor

// Are there any textboxes on screen?
if instance_number(obj_textbox_parent) > 0 {
	global.move_mode = "text";	
} else if global.move_mode = "text"{
	global.move_mode = "room";
}

if keyboard_check_pressed(ord("Z")) {
	
	// Destroy any lingering "status" textboxes to avoid nasty overlap of any sort
	for(i = 0; i < instance_number(obj_textbox_quick); i++) {
		instance_destroy(instance_find(obj_textbox_quick, i));
	}
	
	if (global.move_mode == "room") {
		global.move_mode = "player";
		//text[0] = "moving player";
		//if room != rm_main_menu && room != rm_end {
		//	scr_create_text_quick(text);
		//}
	} else {
		global.move_mode = "room";
		//text[0] = "moving room";
		//if room != rm_main_menu && room != rm_end {
		//	scr_create_text_quick(text);
		//}
	}
}








