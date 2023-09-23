/// @description Insert description here
// You can write your code in this editor

if (global.move_mode == "player") && can_move {
	if (keyboard_check(vk_right)) {
		direction = 0;
		speed = collision_check(x, y, direction, move_speed);
		array_ind = 0;
	}
	
	if (keyboard_check(vk_up)) {
		direction = 90;
		speed = collision_check(x, y, direction, move_speed);
		array_ind = 1;
	}
	
	if (keyboard_check(vk_left)) {
		direction = 180;
		speed = collision_check(x, y, direction, move_speed);
		array_ind = 2;
	}
	
	if (keyboard_check(vk_down)) {
		direction = 270;
		speed = collision_check(x,y, direction, move_speed);
		array_ind = 3;
	}
}

if speed > 0 && can_move {
	can_move = false;
	old_x = x;
	old_y = y;
}

if speed == 0 {
	sprite_index = sprite_facing[array_ind];
}
else {
	sprite_index = sprite_walking[array_ind];	
}
