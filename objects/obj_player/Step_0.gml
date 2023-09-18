/// @description Insert description here
// You can write your code in this editor

if (global.move_mode = "player") {
	if (keyboard_check_pressed(vk_right)) {
		if !(place_meeting(x+16, y, [obj_wall_parent, obj_square])) {
			direction = 0
			speed = 16;
		}
	}
	
	if (keyboard_check_pressed(vk_up)) {
		if !(place_meeting(x, y-16, [obj_wall_parent, obj_square])) {
			direction = 90
			speed = 16;
		}
	}
	
	if (keyboard_check_pressed(vk_left)) {
		if !(place_meeting(x-16, y, [obj_wall_parent, obj_square])) {
			direction = 180
			speed = 16;
		}
	}
	
	if (keyboard_check_pressed(vk_down)) {
		if !(place_meeting(x, y+16, [obj_wall_parent, obj_square])) {
			direction = 270
			speed = 16;
		}
	}
}




