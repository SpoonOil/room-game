/// @description Insert description here
// You can write your code in this editor

collision_array = [obj_wall, obj_box, obj_water];
depth = -1;

// When the player is first created, we are going to create a camera object which the game will follow
// The reason for doing this is so that we can implement a "free cam" feature for looking around
instance_create_layer(x,y, layer_get_id("Instances"), obj_camera);

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