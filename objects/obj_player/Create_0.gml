/// @description Insert description here
// You can write your code in this editor

collision_array = [obj_wall, obj_box, obj_water];
depth = -1;

// Concerning movement speed
move_speed = 1;
can_move = true;

// collecting sprites that this object will use
sprite_facing[3] = spr_player_down_facing;
sprite_facing[2] = spr_player_left_facing;
sprite_facing[1] = spr_player_up_facing;
sprite_facing[0] = spr_player_right_facing;

sprite_walking[3] = spr_player_down_walking;
sprite_walking[2] = spr_player_left_walking;
sprite_walking[1] = spr_player_up_walking;
sprite_walking[0] = spr_player_right_walking;

array_ind = 0;

// This just prevents errors from occuring in the end step code
old_x = x;
old_y = y;

level_beaten = false;

// For storing past states of the player
current_state = 0;
state = {
	xpos : x,
	ypos : y
}
scr_update_state(self, state);