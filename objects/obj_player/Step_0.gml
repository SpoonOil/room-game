/// @description Insert description here
// You can write your code in this editor

if (global.move_mode = "player") {
	
	if (keyboard_check_pressed(vk_right)) {
		direction = 0;
		speed = collision_check(self, direction);
	}
	
	if (keyboard_check_pressed(vk_up)) {
		direction = 90;
		speed = collision_check(self, direction);
	}
	
	if (keyboard_check_pressed(vk_left)) {
		direction = 180;
		speed = collision_check(self, direction);
	}
	
	if (keyboard_check_pressed(vk_down)) {
		direction = 270;
		speed = collision_check(self, direction);
	}
}




