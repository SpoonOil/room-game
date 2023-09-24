/// @description Insert description here
// You can write your code in this editor

if can_move {
	speed = move_speed;	
} else {
	speed = 0;	
}

if animation_stage > 1 {
	// In this scenario, we've finished the animation process;
	instance_destroy();
}

if direction == 90 || direction == 270 {
	if abs(old_x - x) + abs(old_y - y) >= 72 {
		old_x = x;
		old_y = y;
		alarm[0] = hangtime;
		can_move = false;
		move_speed = -1*move_speed;
	}
} else if direction == 0 || direction == 180 {
	if abs(old_x - x) + abs(old_y - y) >= 80 {
		old_x = x;
		old_y = y;
		alarm[0] = hangtime;
		can_move = false;
		move_speed = -1*move_speed;
	}
	
}












