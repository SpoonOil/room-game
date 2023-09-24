/// @description Insert description here
// You can write your code in this editor
if direction == 0 {
	x = -160;
	y = 0;
} else if direction == 90 {
	x = 0;
	y = 144;
} else if direction == 180 {
	x = 160;
	y = 0;
} else if direction == 270 {
	x = 0;
	y = -144;
}

move_speed = 4;
hangtime = 30;

old_x = x;
old_y = y;

animation_stage = 0;

can_move = true;

depth = -16000;











